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
export const sendContactForm = async (req: Request, res: Response) => {
  try {
    const ip = req.headers["x-forwarded-for"] || req.socket.remoteAddress;
    const value = (req as any).rawBody || req.body.toString("utf8");
    const decoded =
      (value && typeof value === "string" && simpleDecrypt(value)) || {};
    console.log("decoded:", decoded);
    const { timestamp, promo } = decoded;
    let procRow;
    if (ip && timestamp) {
      delete decoded.timestamp;
      delete decoded.promo;
      const keys = Array.from(Object.keys(decoded)).sort();
      const valuesText = keys.map((key) => decoded[key] || "").join(";");
      const frowProc = await db.excuteQuery({
        query: "call contact_email(?, ?, ?);",
        variables: [ip, timestamp, valuesText],
      });
      // console.l//og('login result:', util.inspect(procRes));
      procRow = frowProc && frowProc[0] && frowProc[0][0];
      if (!procRow) {
        console.log(valuesText);
        debugger;
      } else {
        console.log(procRow);
        debugger;
      }
    }
    return res.type("json").send({ ...procRow });
  } catch (e: any) {
    console.error(e.stack || e.message);
    debugger;
    return res
      .status(403)
      .json({ success: false, error: e.stack || e.message || e });
  }
};
export default sendContactForm;
