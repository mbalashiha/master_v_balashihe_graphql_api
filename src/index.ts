import path from "path";
import fs from "fs";
import fse from "fs-extra";
const LISTENING_PORT = process.env["LISTENING_PORT"];
if (!LISTENING_PORT) {
  throw new Error("LISTENING_PORT enviroment variable has not been set.");
}
const SITE_FOLDER_NAME = process.env["SITE_FOLDER_NAME"] || "";
if (!SITE_FOLDER_NAME) {
  throw new Error("SITE_FOLDER_NAME enviroment variable has not been set.");
}
if (process.env["NODE_ENV"] === "production") {
  console.log("Running in production enviroment.");
  process.chdir(__dirname);
}
(() => {
  let siteFolder: string = "";
  try {
    let subRoot = __dirname;
    while (!siteFolder) {
      // console.log("testing folder:", subRoot);
      const testFolder = path.join(subRoot, SITE_FOLDER_NAME);
      if (fse.existsSync(testFolder) && fs.statSync(testFolder).isDirectory()) {
        siteFolder = testFolder;
        break;
      } else {
        const newSubFolder = path.resolve(path.join(subRoot, ".."));
        if (newSubFolder === subRoot) {
          break;
        } else {
          subRoot = newSubFolder;
        }
      }
    }
    if (siteFolder) {
      const sitePublicFolder = path.join(siteFolder, "public");
      const imageUploadFolder = path.join(sitePublicFolder, "image", "upload");
      process.env["sitePublicFolder"] = sitePublicFolder;
      process.env["imageUploadFolder"] = imageUploadFolder;
      fse.mkdirpSync(imageUploadFolder);
    }
  } catch (e: any) {
    console.error(e.stack || e.message || e);
  } finally {
    if (!siteFolder) {
      console.error(
        "Fatal error: Site folder (root folder for nginx server) cound not be found. Existing with error code 1."
      );
      console.error();
      process.exit(1);
    }
  }
})();

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
import { managementModule } from "@modules/management";
import { blogArticlesModule } from "@modules/blog";
import { signInModule } from "@modules/management/sign-in";
import managementLoginMiddleware, {
  managementSignoutMiddleware,
} from "./management-login-middleware";
import { verifyManagementLoginMiddleware } from "./management-login-middleware";
import { AuthRequest } from "@root/types/express-custom";
import { IncomingMessage, OutgoingMessage, ServerResponse } from "http";
import { spawnMysqldump } from "./sql/mysqldump";
import { BlogManagementModule } from "@root/schema/modules/blog/management/article-input";
import { BlogArticleDraftModule } from "@root/schema/modules/blog/management/draft";
import { ManagementArticlesCardsModule } from "@root/schema/modules/blog/management/article-cards";
import { checkIfAuthenticated } from "./check-if-authenticated";
import uploadResponseHandler, { uploadMiddleware } from "./multer-image-upload";

const corsOptions = {
  origin: "http://localhost:3000", //change with your own client URL
  credentials: true,
};

const application = createApplication({
  modules: [
    baseModule,
    signInModule,
    managementModule,
    blogArticlesModule,
    BlogManagementModule,
    BlogArticleDraftModule,
    ManagementArticlesCardsModule,
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
//   console.log(req);
//   debugger;
//   next();
// });
app.use(cors(corsOptions));
// app.use(
//   expressjwt({
//     credentialsRequired: false,
//     secret: process.env["JWT_SECRET"]!,
//     algorithms: ["HS256"],
//   })
// );
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
app.listen(parseInt(LISTENING_PORT), () => {
  console.log(
    `Running a GraphQL API server at http://localhost:${LISTENING_PORT}/graphql/api`
  );
  setTimeout(() => spawnMysqldump(), 10 * 1000);
});
// } else {
//   console.log("express index.js file is NOT executed");
// }
export default app;
