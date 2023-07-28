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
    const { timestamp, promo, telephoneDigits } = decoded;
    let procRow;
    if (ip && timestamp && decoded["Телефон"]) {
      delete decoded.timestamp;
      delete decoded.promo;
      delete decoded.telephoneDigits;
      delete decoded.submitError;
      delete decoded.privacyChecked;
      const keys = Array.from(Object.keys(decoded)).sort();
      const valuesText = keys.map((key) => decoded[key] || "").join(";");
      const fromProc = await db.excuteQuery({
        query: "call contact_email(?, ?, ?);",
        variables: [ip, timestamp, valuesText],
      });
      // console.l//og('login result:', util.inspect(procRes));
      procRow = fromProc && fromProc[0] && fromProc[0][0];
      if (!procRow) {
        const obj: any = {};
        obj["Имя клиента"] = decoded["Имя клиента"];
        delete decoded["Имя клиента"];
        obj["Телефон"] = decoded["Телефон"];
        delete decoded["Телефон"];
        const clientDate = new Date(timestamp);
        const localeDate = clientDate.toLocaleString("ru-RU");
        let htmlTemplate = `${localeDate}<br><p>\r\n`;
        Object.entries(obj).forEach(
          ([key, value]) =>
            (htmlTemplate += `\r\n<b>${key}</b>: <strong>${String(
              typeof value === "undefined" || value === null ? "" : value
            )}</strong><br>`)
        );
        htmlTemplate += "\r\n</p>";
        Object.entries(decoded).forEach(
          ([key, value]) =>
            value &&
            (htmlTemplate += `\r\n${key}: <b>${String(
              typeof value === "undefined" || value === null ? "" : value
            )}</b><br>`)
        );
        const emailText = htmlTemplate.replace(/<[^>]*>/g, "");
        try {
          await mailContact({
            subject: Array.isArray(ip) ? ip.join(", ") : ip,
            html: htmlTemplate,
            text: emailText,
          });
          await db.excuteQuery({
            query: "call contact_email_save_keys(?, ?, ?);",
            variables: [ip, timestamp, valuesText],
          });
        } catch (e) {
          try {
            await db.excuteQuery({
              query: `INSERT INTO failed_contact_emails(ip, timestamp, textBody) 
                    VALUES(?, FROM_UNIXTIME(? * 0.001), ?)
                    ON DUPLICATE KEY UPDATE counts=Coalesce(counts,1)+1;`,
              variables: [ip, timestamp, emailText],
            });
          } catch (e: any) {
            console.error(e);
          }
          throw e;
        }
      } else {
        throw new Error(
          procRow && procRow.error
            ? procRow.error
            : procRow
            ? util.inspect(procRow)
            : util.inspect(fromProc)
        );
      }
    } else {
      throw new Error("No correct ip and timestamp or form values");
    }
    return res.type("json").send({ success: true, ...procRow });
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
export default sendContactForm;