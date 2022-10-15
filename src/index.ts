global.projectRoot = __dirname;

process.on("uncaughtException", function (err) {
  console.error("\n\nUncaught exception: ", err);
});
process.on(
  "unhandledRejection",
  (reason: Error | any, promise: Promise<any>) => {
    console.error("\n\nUnhandled Rejection at:", promise, "reason:", reason);
    // Application specific logging, throwing an error, or other logic here
  }
);
import express from "express";
import bodyParser from "body-parser";
import { expressjwt } from "express-jwt";
import jwt from "jsonwebtoken";
import cors from "cors";
import { Request, Response } from "express";
import { graphqlHTTP } from "express-graphql";
import cookieParser from "cookie-parser";
import excuteQuery from "@src/db/execute-query";
import fsa from "fs/promises";
import fs from "fs";
import path from "path";
import { makeExecutableSchema } from "@graphql-tools/schema";
import { createApplication } from "graphql-modules";
import { baseModule } from "@modules/base";
import { managementModule } from "@modules/management";
import { signInModule } from "@modules/management/sign-in";
import loginMiddleware from "./login-middleware";
import { nextTick } from "process";
import managementLoginMiddleware, { managementSignoutMiddleware } from "./management-login-middleware";
import { verifyManagementLoginMiddleware } from "./management-login-middleware";
import { AuthRequest } from "@root/types/express-custom";

const application = createApplication({
  modules: [baseModule, signInModule, managementModule],
});
const execute = application.createExecution();
const schema = application.schema;
// The root provides a resolver function for each API endpoint
// const root = {
//   hello: () => {
//     return "Hello world!";
//   },
// };
if (!process.env["JWT_SECRET"]) {
  throw new Error("No JWT_SECRET");
}
const corsOptions = {
  origin: "http://localhost:3000", //change with your own client URL
  credentials: true,
};
const app = express();
app.use(cors(corsOptions));
// app.use(
//   expressjwt({
//     credentialsRequired: false,
//     secret: process.env["JWT_SECRET"]!,
//     algorithms: ["HS256"],
//   })
// );
app.use(cookieParser());
const verifyCookieToken = (cookieTokenName: string) => (req, res, next) => {
  const token = req.cookies[cookieTokenName] || "";
  if (token) {
    try {
      (req as any)[cookieTokenName] = jwt.verify(
        token,
        process.env["JWT_SECRET"]!
      );
      res.cookie(cookieTokenName, token, {
        httpOnly: true,
        maxAge: 90 * 24 * 60 * 60 * 1000,
        /// secure: true, //on HTTPS
        /// domain: "localhost:4402", //set your domain
      });
    } catch (e) {
      console.error("Authentication token is invalid, please log in");
      res.cookie(cookieTokenName, "", {
        httpOnly: true,
        maxAge: 0,
        // secure: true, //on HTTPS
        // domain: "localhost:4402", //set your domain
      });
    }
  }
  return next();
};
app.use(verifyCookieToken("manager"));
app.use(verifyCookieToken("client"));

const rawBodySaver = (req, res, buf, encoding) => {
  if (buf && buf.length) {
    req.rawBody = buf.toString(encoding || "utf8");
  }
};
// app.post(
//   "/login",
//   bodyParser.raw({ verify: rawBodySaver, type: "*/*" }),
//   loginMiddleware
// );
app.post(
  "/management/login",
  bodyParser.raw({ verify: rawBodySaver, type: "*/*" }),
  managementLoginMiddleware
);
app.get("/management/verify-login", verifyManagementLoginMiddleware);
app.get(
  "/management/sign-out",
  managementSignoutMiddleware
);
app.use(
  "/graphql",
  graphqlHTTP((req, res, graphQLParams) => {
    return {
      schema,
      customExecuteFn: execute,
      graphiql: true,
      context: {
        res,
        manager: (req as AuthRequest).manager || null,
        client: (req as AuthRequest).client || null,
      },
    };
  })
);

console.log("express index.js file is executed!");
// true if file is executed

app.listen(4402, "localhost", () => {
  console.log("Running a GraphQL API server at http://localhost:4402/graphql");
});
// } else {
//   console.log("express index.js file is NOT executed");
// }
export default app;
