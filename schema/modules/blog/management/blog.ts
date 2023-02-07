import { createModule, gql } from "graphql-modules";
import util from "util";
import expressJwt from "express-jwt";
import jwt from "jsonwebtoken";
import db from "@src/db/execute-query";
import { GraphQLResolveInfo } from "graphql";
import { isPositiveInteger } from "@src/utils/type-checkers";
import { sql } from "@schema/sql-query";
import { Console } from "console";
import { normalizePriceCurrency } from "@src/utils/currency/converter";
import { FullProductInput, ProductInput } from "@schema/types/indext";
import { simpleDecrypt } from "@src/encryption/message-hmac-private-key";
import cookieParser from "cookie-parser";
import { GraphqlContext } from "@root/types/express-custom";

export const BlogManagementModule = createModule({
  id: "blog-management-module",
  dirname: __dirname,
  typeDefs: [
    gql`
      type Mutation {
        managementSearchArticles(search: String): [BlogArticle]!
      }
      type Query {
        managementGetArticles(search: String): [BlogArticle]!
      }
    `,
  ],
  resolvers: {
    Query: {
      managementGetArticles: async (
        parent: void,
        variables: { search: string },
        context: GraphqlContext,
        info: GraphQLResolveInfo
      ) => {
        const { search } = variables;

        if (!context.manager || !context.manager.id) {
          throw new Error("Manager Unauthorized");
        }
        const rows = await db.excuteQuery({
          query: "select * from managers where id=?",
          variables: [],
        });
      },
    },
    Mutation: {
      managementSearchArticles: async (
        parent: void,
        variables: { search: string },
        context: GraphqlContext,
        info: GraphQLResolveInfo
      ) => {
        const { search } = variables;

        if (!context.manager || !context.manager.id) {
          throw new Error("Manager Unauthorized");
        }
      },
    },
  },
});
