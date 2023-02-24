import { createModule, gql } from "graphql-modules";
import util from "util";
import expressJwt from "express-jwt";
import jwt from "jsonwebtoken";
import db from "@src/sql/execute-query";
import { Request, Response } from "express";
import { GraphQLResolveInfo } from "graphql";
import { isPositiveInteger } from "@src/utils/type-checkers";
import { sql } from "@schema/sql-query";
import { Console } from "console";
import { normalizePriceCurrency } from "@src/utils/currency/converter";
import { FullProductInput, ProductInput } from "@schema/types/indext";
import { AuthRequest } from "@root/types/express-custom";

import { simpleDecrypt } from "@src/encryption/message-hmac-private-key";
import cookieParser from "cookie-parser";

if (!process.env["JWT_SECRET"]) {
  throw new Error("No json web-token secret.");
}

export const managementLoginMiddleware = async (
  req: Request,
  res: Response
) => {
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
        const rows = await db.excuteQuery({
          query: "select * from managers where id=?",
          variables: [values.id],
        });
        let result: any = { success: true };
        const managerRow = rows && rows[0];
        if (managerRow && managerRow.id) {
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
          result = { ...result, manager };
          const token = jwt.sign({ ...values }, process.env["JWT_SECRET"]!);
          res.cookie("manager", token, {
            httpOnly: true,
            maxAge: 90 * 24 * 60 * 60 * 1000,
            // secure: true, //on HTTPS
            // domain: "localhost:4402", //set your domain
          });
          return res.json(result);
        };
      }
    }
    throw { message: "Authentification failed" };
  } catch (e: any) {
    console.error(e.stack || e.message);
    return res.status(403).json({ success: false, error: e.stack || e.message || e });
  }
};
export const managementSignoutMiddleware = async (
  req: Request,
  res: Response
) => {
  res.cookie("manager", "", {
    httpOnly: true,
    maxAge: 0,
    // secure: true, //on HTTPS
    // domain: "localhost:4402", //set your domain
  });
  return res.status(200).json({ success: true });
};
export const verifyManagementLoginMiddleware = async (
  req: Request,
  res: Response
) => {
  const managerToken = req.cookies["manager"] || "";
  if (!managerToken) {
    return res
      .status(401)
      .json({ success: false, error: "Manager Unauthorized" });
  }
  const manager = (req as AuthRequest).manager || null;
  if (!manager || !manager.id) {
    return res
      .status(401)
      .json({ success: false, error: "Manager Unauthorized" });
  } else {
    try {
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
          id: managerRow.id,
          friendlyName:
            managerRow.friendly_name || managerRow.email || managerRow.login,
          isManager: true,
          isAdmin: !!managerRow.is_admin,
          created: managerRow.created || null,
          updated: managerRow.updated || null,
        };
        return res.json({ success: true, manager });
      } else {
        res.cookie("manager", "", {
          httpOnly: true,
          maxAge: 0,
          // secure: true, //on HTTPS
          // domain: "localhost:4402", //set your domain
        });
        return res
          .status(401)
          .json({ success: false, error: "Manager Unauthorized" });
      }
    } catch (e: any) {
      const err = { message: e.message, stack: e.stack, ...e };
      console.error(err.stack || err.message);
      return res
        .status(500)
        .json({ success: false, error: err.stack || err.message });
    }
  }
};
export default managementLoginMiddleware;
