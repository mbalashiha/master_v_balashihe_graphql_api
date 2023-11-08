import { createModule, gql } from "graphql-modules";
import util from "util";
import db from "@src/sql/execute-query";
import { GraphQLResolveInfo } from "graphql";
import { isPositiveInteger } from "@src/utils/type-checkers";
import { sql } from "@schema/sql-query";
import { Console } from "console";
import { normalizePriceCurrency } from "@src/utils/currency/converter";
import { FullProductInput, ProductInput } from "@schema/types/indext";

function onlyUnique(value: any, index: any, self: string | any[]) {
  return self.indexOf(value) === index;
}
export const baseModule = createModule({
  id: "base-module",
  dirname: __dirname,
  typeDefs: [
    gql`
      scalar Date
      type Image {
        imageId: ID
        imgSrc: String
        title: String
        height: Int
        width: Int
        orderNumber: Int
        originalWidth: Int
        originalHeight: Int
        pathOfOriginal: String
        createdAt: String
        updatedAt: String
        altText: String
      }
      type Pagination {
        startCursor: Int
        endCursor: Int
        hasNextPage: Boolean
        hasPreviousPage: Boolean
      }
      type Price {
        amount: Float
        currencyCode: String
        currencyCodeId: ID
      }
      input PriceInput {
        amount: Float
        currencyCode: String
        currencyCodeId: ID
      }
      type ImageConnection {
        nodes: [Image]
      }
      type UserError {
        field: String
        message: String
      }
      input ImageInput {
        imgSrc: String
        title: String
        width: Int
        height: Int
        format: String
        orderNumber: Int
        originalWidth: Int
        originalHeight: Int
        pathOfOriginal: String
        altText: String
      }
      type CurrencyCode {
        currencyCodeId: ID!
        currencyCode: String!
        symbolCode: String
      }
      type Breadcrumb {
        name: String!
        handle: String!
        type: String
      }
      type Query {
        hello: String
      }
    `,
  ],
  resolvers: {
    Image: {
      createdAt: async (
        parent: any,
        variables: any,
        _ctx: any,
        info: GraphQLResolveInfo
      ) => {
        if (parent.createdAt) {
          return new Date(parent.createdAt).toISOString();
        }
      },
      updatedAt: async (
        parent: any,
        variables: any,
        _ctx: any,
        info: GraphQLResolveInfo
      ) => {
        if (parent.updatedAt) {
          return new Date(parent.updatedAt).toISOString();
        }
      },
    },
    Mutation: {},
    Query: {
      hello: () => {
        return "Hello world!";
      },
    },
  },
});
