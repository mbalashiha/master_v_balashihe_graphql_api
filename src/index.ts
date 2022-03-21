import express from "express";
import { Request, Response } from "express";
import { graphqlHTTP } from "express-graphql";
import { typeDefsSchema } from "@src/type-defs";
import excuteQuery from "@src/db/execute-query";
// Construct a schema, using GraphQL schema language
// const schema = buildSchema(`
//   type Query {
//     hello: String
//   }
// `);

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
    schema: typeDefsSchema,
    rootValue: null,
    graphiql: true,
  })
);

console.log("express index.js file is executed!");
// true if file is executed

app.listen(4402, "127.0.0.1", () => {
  console.log("Running a GraphQL API server at http://127.0.0.1:4402/graphql");
  setTimeout(async () => {
    const result = await excuteQuery({ query: "select * from product" });
    console.log(result);
  }, 1500);
});  
// } else {
//   console.log("express index.js file is NOT executed");
// }
export default app;
