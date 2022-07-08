global.projectRoot = __dirname;

import express from "express";
import cors from "cors";
import { Request, Response } from "express";
import { graphqlHTTP } from "express-graphql";
import excuteQuery from "@src/db/execute-query";
import fsa from "fs/promises";
import fs from "fs";
import path from "path";
import resolvers from "@root/schema/resolvers";
import { makeExecutableSchema } from "@graphql-tools/schema";
import db from "@src/db/execute-query";
// Construct a schema, using GraphQL schema language
const executableSchema = makeExecutableSchema({
  typeDefs: fs.readFileSync(
    path.resolve(__dirname, "..", "schema/schema.graphql"),
    "utf-8"
  ),
  resolvers,
});

// The root provides a resolver function for each API endpoint
// const root = {
//   hello: () => {
//     return "Hello world!";
//   },
// };

const app = express();
app.use(
  "/graphql",
  cors(),
  graphqlHTTP({
    schema: executableSchema,
    graphiql: true,
  })
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
