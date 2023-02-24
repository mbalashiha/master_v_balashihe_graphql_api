import { createModule, gql } from "graphql-modules";
import util from "util";
import expressJwt from "express-jwt";
import jwt from "jsonwebtoken";
import db from "@src/sql/execute-query";
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
      type Manager {
        id: ID
        friendlyName: String
        isManager: Boolean
        isAdmin: Boolean
        created: Date
        updated: Date
      }
      type ManagerTokenInfoResponse {
        success: Boolean
        error: String
        manager: Manager
      }
      type Mutation {
        signInManagement(value: String!): TokenResponse!
      }
      type Query {
        verifyManagementToken: ManagerTokenInfoResponse!
      }
    `,
  ],
  resolvers: {
    Query: {
      verifyManagementToken: async (
        parent: void,
        variables: void,
        context: GraphqlContext,
        info: GraphQLResolveInfo
      ) => {
        const {
          manager,
          tokens: { managerToken },
          res,
        } = context;
        // res.cookie("counter", ((counter || 0) + 1).toString(), {
        //   httpOnly: true,
        //   maxAge: 90 * 24 * 60 * 60 * 1000,
        //   // secure: true, //on HTTPS
        //   // domain: "localhost:4402", //set your domain
        // });
        if (!managerToken) {
          return {
            success: false,
            error: "No manager auth token. Authentification failed",
          };
        }
        if (!manager || !manager.id) {
          return {
            success: false,
            error: "No manager ID. Authentification failed",
          };
        }
        const rows = await db.excuteQuery({
          query: "select * from managers where id=?",
          variables: [manager.id],
        });
        const managerRow = rows && rows[0];
        if (managerRow && managerRow.id == manager.id) {
          res.cookie("manager", managerToken, {
            httpOnly: true,
            maxAge: 90 * 24 * 60 * 60 * 1000,
            // secure: true, //on HTTPS
            // domain: "localhost:4402", //set your domain
          });
          delete managerRow.password;
          const manager = {
            id: managerRow.id || null,
            friendlyName:
              managerRow.friendly_name ||
              managerRow.email ||
              managerRow.login ||
              null,
            isManager: true,
            isAdmin: !!managerRow.is_admin,
            created: managerRow.created || null,
            updated: managerRow.updated || null,
          };
          return {
            success: true,
            manager,
          };
        } else {
          res.cookie("manager", "", {
            httpOnly: true,
            maxAge: 0,
            // secure: true, //on HTTPS
            // domain: "localhost:4402", //set your domain
          });
          return {
            success: false,
            error: "No database entry for manager. Manager Unauthorized",
          };
        }
      },
    },
    Mutation: {
      signInManagement: async (
        parent: any,
        variables: { value: any },
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
