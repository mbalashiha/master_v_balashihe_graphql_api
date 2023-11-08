import path from "path";
import fs from "fs";
import fse from "fs-extra";
import initUploadDirs from "./utils/init-upload-dirs";
initUploadDirs();

const LISTENING_PORT = process.env["LISTENING_PORT"];
if (!LISTENING_PORT) {
  throw new Error("LISTENING_PORT enviroment variable has not been set.");
}
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
import jwt from "jsonwebtoken";
import cors from "cors";
import { Request, Response } from "express";
import { graphqlHTTP } from "express-graphql";
import cookieParser from "cookie-parser";
import excuteQuery from "@src/sql/execute-query";
import { createApplication } from "graphql-modules";
import { baseModule } from "@modules/base";
import { blogArticlesModule } from "@modules/blog";
import { signInModule } from "@modules/management/sign-in";
import managementLoginMiddleware, {
  managementSignoutMiddleware,
} from "./management-login-middleware";
import { verifyManagementLoginMiddleware } from "./management-login-middleware";
import { AuthRequest } from "@root/types/express-custom";
import { IncomingMessage, OutgoingMessage, ServerResponse } from "http";
import { BlogManagementModule } from "@root/schema/modules/blog/management/article-input";
import { BlogArticleDraftModule } from "@root/schema/modules/blog/management/draft";
import { ManagementArticlesCardsModule } from "@root/schema/modules/blog/management/article-cards";
import { checkIfAuthenticated } from "./check-if-authenticated";
import uploadResponseHandler, { uploadMiddleware } from "./multer-image-upload";
import sendContactForm from "./send-contact-form";
import pageViewCount from "./page-view-count";
import { BlogArticleTemplatesModule } from "@root/schema/modules/blog/management/article-templates";
import { parseImagesToDB } from "./image/parse-images-to-db";
import prettierReact from "./utils/prettier-react";
import { imagesModule } from "@root/schema/modules/management/images";

/**const corsOptions = {
  origin: "http://localhost:3000", //change with your own client URL
  credentials: true,
};**/

const application = createApplication({
  modules: [
    baseModule,
    imagesModule,
    signInModule,
    ManagementArticlesCardsModule,
    BlogArticleTemplatesModule,
    blogArticlesModule,
    BlogManagementModule,
    BlogArticleDraftModule,
  ],
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
const app = express();
// app.use((req, res, next) => {
//   console.l//og(req);
//   debugger;
//   next();
// });
/**if (process.env.NODE_ENV !== "production") {
  app.use(cors(corsOptions));
}**/
// app.use(
//   expressjwt({
//     credentialsRequired: false,
//     secret: process.env["JWT_SECRET"]!,
//     algorithms: ["HS256"],
//   })
// );
const rawBodySaver: any = (
  req: IncomingMessage & { rawBody?: string },
  res: OutgoingMessage,
  buf: string | Buffer,
  encoding: BufferEncoding
) => {
  if (buf && buf.length) {
    req.rawBody = buf.toString(encoding || "utf8");
  }
};
app.post(
  "/site/page-view-count",
  bodyParser.raw({ verify: rawBodySaver as any, type: "*/*" }),
  pageViewCount
);
app.post(
  "/site/contact",
  bodyParser.raw({ verify: rawBodySaver as any, type: "*/*" }),
  sendContactForm
);
app.post(
  "/site/contact-request",
  bodyParser.raw({ verify: rawBodySaver as any, type: "*/*" }),
  sendContactForm
);
app.get("/rest/api/test", (req, res) => res.send("Tesk Ok."));
app.use(cookieParser());
const verifyCookieToken =
  (cookieTokenName: string) =>
  (
    req: IncomingMessage & { cookies: { [x: string]: string } },
    res: OutgoingMessage & {
      cookie: (
        arg0: string,
        arg1: string,
        arg2: { httpOnly: boolean; maxAge: number }
      ) => void;
    },
    next: () => any
  ) => {
    const token = req.cookies[cookieTokenName] || "";
    (req as any).responseObject = res;
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

// app.post(
//   "/rest/api/login",
//   bodyParser.raw({ verify: rawBodySaver, type: "*/*" }),
//   loginMiddleware
// );
app.post(
  "/rest/api/management/login",
  bodyParser.raw({ verify: rawBodySaver as any, type: "*/*" }),
  managementLoginMiddleware
);
app.post(
  "/rest/api/management/upload/image",
  checkIfAuthenticated,
  uploadMiddleware,
  uploadResponseHandler
);
app.get("/rest/api/management/verify-login", verifyManagementLoginMiddleware);
app.get("/rest/api/management/sign-out", managementSignoutMiddleware);

app.post(
  "/rest/api/management/prettier-react",
  checkIfAuthenticated,
  bodyParser.json(),
  prettierReact
);
app.post(
  "/rest/api/management/upload/image",
  checkIfAuthenticated,
  uploadMiddleware,
  uploadResponseHandler
);
app.use(
  "/graphql/api",
  graphqlHTTP((req, res, graphQLParams) => {
    return {
      schema,
      customExecuteFn: execute,
      graphiql: true,
      context: {
        res: (req as AuthRequest).responseObject,
        tokens: {
          managerToken: (req as AuthRequest).cookies["manager"] || null,
          clientToken: (req as AuthRequest).cookies["client"] || null,
        },
        manager: (req as AuthRequest).manager || null,
        client: (req as AuthRequest).client || null,
      },
    };
  })
);
app.listen(parseInt(LISTENING_PORT), "127.0.0.1", () => {
  setTimeout(() => parseImagesToDB(), 15000);
  //   `Running a GraphQL API server at http://localhost:${LISTENING_PORT}/graphql/api`
});
export default app;
