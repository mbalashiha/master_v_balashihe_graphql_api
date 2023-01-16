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

if (!process.env["JWT_SECRET"]) {
  throw new Error("No json web-token secret.");
}
export const signInModule = createModule({
  id: "management-sign-in-module",
  dirname: __dirname,
  typeDefs: [
    gql`
      type TokenResponse {
        signedIn: Boolean
        error: String
      }
      type Mutation {
        signInManagement(value: String!): TokenResponse!
      }
    `,
  ],
  resolvers: {
    Query: {},
    Mutation: {
      signInManagement: async (
        parent: any,
        variables: { value: any; },
        context: GraphqlContext,
        info: GraphQLResolveInfo
      ) => {
        // if (context.user) {
        //   console.log(context.user);
        //   debugger;
        // }
        const { res } = context;
        try {
          const { value } = variables;
          const decoded =
            value && typeof value === "string" && simpleDecrypt(value);
          if (decoded) {
            const { login, password } = decoded;
            if (login && password) {
              const procRes = await db.excuteQuery({
                query: "call user_authenticate(?, ?);",
                variables: [login, password],
              });
              const values = procRes && procRes[0] && procRes[0][0];
              if (!values || !values.id) {
                return { error: "Authentification failed" };
              }
              const token = jwt.sign({ ...values }, process.env["JWT_SECRET"]!);
              res.cookie("manager", token, {
                httpOnly: true,
                maxAge: 90 * 24 * 60 * 60 * 1000,
                //secure: true, //on HTTPS
                //domain: 'example.com', //set your domain
              });
              return { signedIn: true };
            }
          }
          return { error: "Authentification failed" };
        } catch (e: any) {
          console.error(e.stack || e.message);
          throw e;
        }
      },
    },
  },
});
