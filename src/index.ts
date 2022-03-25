import express from "express";
import { Request, Response } from "express";
import { graphqlHTTP } from "express-graphql";
import excuteQuery from "@src/db/execute-query";
import fsa from "fs/promises";
import fs from "fs";
import path from "path";
import db from "@src/db/execute-query";
import { buildSchema } from "graphql";
import resolvers from "@root/schema/resolvers";
// Construct a schema, using GraphQL schema language
const buildedSchema = buildSchema(
  fs.readFileSync(
    path.resolve(__dirname, "..", "schema/schema.graphql"),
    "utf-8"
  )
);     

// The root provides a resolver function for each API endpoint
// const root = {
//   hello: () => {
//     return "Hello world!";
//   },
// };

const app = express();
app.use(
  "/graphql",
  graphqlHTTP({
    schema: buildedSchema,
    rootValue: resolvers.Root,
    graphiql: true,
  })
);

console.log("express index.js file is executed!");
// true if file is executed

app.listen(4402, "127.0.0.1", () => {
  console.log("Running a GraphQL API server at http://127.0.0.1:4402/graphql");
  /*setTimeout(async () => {
    const result = await excuteQuery({ query: "select * from product" });
    const text = await fsa.readFile(
      path.resolve("original/data/index.json"),
      "utf-8"
    );
    const parsed = JSON.parse(text);
    try {
      for (const product of parsed.products) {
        const queryRes = await db
          .transaction()
          .query(`call import_product_from_json(?)`, [JSON.stringify(product)])
          .rollback((e) => {
            console.error("rollback error:", e);
          })
          .commit();
        console.log(queryRes);
      }
    } catch (e) {
      console.error(e);
    }
  }, 1500);*/
});
// } else {
//   console.log("express index.js file is NOT executed");
// }
export default app;
