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
import mailContact from "./utils/node-mailer";

// mailContact().catch(console.error);
export const pageViewCount = async (req: Request, res: Response) => {
  try {
    const ip: string = req.headers["x-forwarded-for"]
      ? typeof req.headers["x-forwarded-for"] === "string"
        ? req.headers["x-forwarded-for"]
        : req.headers["x-forwarded-for"][0]
      : req.socket.remoteAddress
      ? req.socket.remoteAddress
      : "";
    const value = (req as any).rawBody || req.body.toString("utf8");
    const decoded =
      (value && typeof value === "string" && simpleDecrypt(value)) || {};
    // console.l//og("decoded:", decoded);
    const { timestamp, articleId } = decoded;
    if (ip && timestamp && articleId) {
      await db.excuteQuery({
        query: `INSERT INTO article_statistic(ip, timestamp, articleId) 
                    VALUES(INET6_ATON(?), FROM_UNIXTIME(? * 0.001), ?)
                    ON DUPLICATE KEY UPDATE duplicate=Coalesce(duplicate,1)+1;`,
        variables: [ip, timestamp, articleId],
      });
    } else {
      throw new Error("No correct ip and timestamp or form values");
    }
    return res.type("json").send({});
  } catch (e: any) {
    e = e || {};
    console.error(e.stack || e.message);
    return res.status(403).json({
      statusCode: 403,
      success: false,
      error: e.message || e.stack || e,
    });
  }
};
export default pageViewCount;
