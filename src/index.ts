global.projectRoot = __dirname;

import express from "express";
import { expressjwt } from "express-jwt";
import jwt from "jsonwebtoken";
import cors from "cors";
import { Request, Response } from "express";
import { graphqlHTTP } from "express-graphql";
import excuteQuery from "@src/db/execute-query";
import fsa from "fs/promises";
import fs from "fs";
import path from "path";
import { makeExecutableSchema } from "@graphql-tools/schema";
import { createApplication } from "graphql-modules";
import { baseModule } from "@modules/base";
import { managementModule } from "@modules/management";
const application = createApplication({
  modules: [baseModule, managementModule],
});
const execute = application.createExecution();
const schema = application.schema;
// The root provides a resolver function for each API endpoint
// const root = {
//   hello: () => {
//     return "Hello world!";
//   },
// };
interface AuthRequest extends Request {
  user?: string;
}
if (!process.env["JWT_SECRET"]) {
  throw new Error("No JWT_SECRET");
}
const app = express();
app.use(
  expressjwt({
    credentialsRequired: false,
    secret: process.env["JWT_SECRET"]!,
    algorithms: ["HS256"],
  })
);
app.use(
  "/graphql",
  cors(),
  graphqlHTTP((req, res, graphQLParams) => ({
    schema,
    customExecuteFn: execute,
    graphiql: true,
    context: {
      user: (req as AuthRequest).user,
    },
  }))
);

console.log("express index.js file is executed!");
// true if file is executed

app.listen(4402, "127.0.0.1", () => {
  console.log("Running a GraphQL API server at http://127.0.0.1:4402/graphql");
});
// } else {
//   console.log("express index.js file is NOT executed");
// }
export default app;
