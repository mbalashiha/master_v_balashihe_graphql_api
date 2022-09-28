import { createModule, gql } from "graphql-modules";
import util from "util";
import graphqlFields from "graphql-fields";
import expressJwt from "express-jwt";
import jwt from "jsonwebtoken";
import db from "@src/db/execute-query";
import { Request, Response } from "express";
import { GraphQLResolveInfo } from "graphql";
import { isPositiveInteger } from "@src/utils/type-checkers";
import { sql } from "@schema/sql-query";
import { Console } from "console";
import { normalizePriceCurrency } from "@src/utils/currency/converter";
import { FullProductInput, ProductInput } from "@schema/types/indext";
import { simpleDecrypt } from "@src/encryption/message-hmac-private-key";
import cookieParser from "cookie-parser";
import { AuthRequest } from "@root/types/express-custom";

if (!process.env["JWT_SECRET"]) {
  throw new Error("No json web-token secret.");
}

const loginMiddleware = async (req: Request, res: Response) => {
  try {
    const value = (req as any).rawBody || req.body.toString("utf8");
    const decoded = value && typeof value === "string" && simpleDecrypt(value);
    if (decoded) {
      const { login, password } = decoded;
      if (login && password) {
        const procRes = await db.excuteQuery({
          query: "call user_authenticate(?, ?);",
          variables: [login, password],
        });
        const values = procRes && procRes[0] && procRes[0][0];
        if (!values || !values.id) {
          throw { message: "Authentification failed" };
        }
        const token = jwt.sign({ ...values }, process.env["JWT_SECRET"]!);
        res.cookie("manager", token, {
          httpOnly: true,
          maxAge: 90 * 24 * 60 * 60 * 1000,
          // secure: true, //on HTTPS
          // domain: "localhost:4402", //set your domain
        });
        return res.json({
          success: true,
        });
      }
    }
    throw { message: "Authentification failed" };
  } catch (e: any) {
    console.error(e.stack || e.message);
    return res.json({ success: false, error: e.stack || e.message || e });
  }
};
export default loginMiddleware;
