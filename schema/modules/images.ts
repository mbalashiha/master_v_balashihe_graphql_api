import { createModule, gql } from "graphql-modules";
import util from "util";
import db from "@src/sql/execute-query";
import { GraphQLResolveInfo } from "graphql";
import { isPositiveInteger } from "@src/utils/type-checkers";
import { sql } from "@schema/sql-query";
import { Console } from "console";
import { normalizePriceCurrency } from "@src/utils/currency/converter";
import { FullProductInput, ProductInput } from "@schema/types/indext";

export const imagesQueryModule = createModule({
  id: "images-query-module",
  dirname: __dirname,
  typeDefs: [
    gql`
      type Query {
        getTickerImages: [Image]
      }
    `,
  ],
  resolvers: {
    Mutation: {},
    Query: {
      getTickerImages: async (
        parent: any,
        variables: any,
        _ctx: any,
        info: GraphQLResolveInfo
      ) => {
        return await db.query(
          "select * from image where imgSrc Like '%/ticker/%' ORDER BY RAND()"
        );
      },
    },
  },
});
