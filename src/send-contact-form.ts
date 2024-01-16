import { createModule, gql } from "graphql-modules";
import util from "util";
import expressJwt from "express-jwt";
import jwt from "jsonwebtoken";
import { db } from "@src/sql";
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
  let diagnostic: { ip: string; timestamp: any; emailText: string } = {} as any;
  try {
    const ip: string = req.headers["x-forwarded-for"]
      ? typeof req.headers["x-forwarded-for"] === "string"
        ? req.headers["x-forwarded-for"]
        : req.headers["x-forwarded-for"][0]
      : req.socket.remoteAddress
      ? req.socket.remoteAddress
      : "";
    diagnostic.ip = ip;
    const value = (req as any).rawBody || req.body.toString("utf8");
    const decoded =
      (value && typeof value === "string" && simpleDecrypt(value)) || {};
    for (const [key, value] of Object.entries(decoded)) {
      if (typeof value === "string") {
        decoded[key] = value.trim();
      }
    }
    if (decoded.telephoneDigits && decoded.telephoneDigits.length < 2) {
      delete decoded.telephoneDigits;
    }
    // console.l//og("decoded:", decoded);
    const { timestamp, promo } = decoded;
    diagnostic.timestamp = timestamp;
    let procRow;
    if (
      ip &&
      timestamp &&
      (decoded.telephoneDigits || decoded["Email клиента"])
    ) {
      if (!decoded.telephoneDigits) {
        delete decoded["Телефон"];
      }
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
        if (decoded["Телефон"]) {
          obj["Телефон"] = decoded["Телефон"];
        }
        delete decoded["Телефон"];
        if (decoded["Email клиента"]) {
          obj["Email клиента"] = decoded["Email клиента"];
        }
        delete decoded["Email клиента"];
        const clientDate = new Date(timestamp);
        const localeDate = clientDate.toLocaleString("ru-RU");
        let htmlTemplate = `${localeDate}<br><p>  \r\n`;
        Object.entries(obj).forEach(
          ([key, value]) =>
            (htmlTemplate += `  \r\n<b>${key}</b>: <strong>${String(
              typeof value === "undefined" || value === null ? "" : value
            )}</strong><br>`)
        );
        htmlTemplate += "  \r\n</p>";
        Object.entries(decoded).forEach(
          ([key, value]) =>
            value &&
            (htmlTemplate += `  \r\n${key}: <b>${String(
              typeof value === "undefined" || value === null ? "" : value
            )}</b><br>`)
        );
        const emailText = htmlTemplate.replace(/<[^>]*>/g, "");
        diagnostic.emailText = emailText;
        const response = await mailContact({
          subject: `${ip} (${promo || "Посетитель оставил данные"})`,
          html: htmlTemplate,
          text: emailText,
        });
        await db.excuteQuery({
          query: "call contact_email_save_keys(?, ?, ?, ?);",
          variables: [ip, timestamp, valuesText, response],
        });
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
    try {
      await db.excuteQuery({
        query: `INSERT INTO failed_contact_emails(ip, timestamp, textBody, error) 
                    VALUES(INET6_ATON(?), FROM_UNIXTIME(? * 0.001), ?, ?)
                    ON DUPLICATE KEY UPDATE counts=Coalesce(counts,1)+1;`,
        variables: [
          diagnostic.ip || req.socket.remoteAddress || "",
          diagnostic.timestamp || new Date().getTime(),
          diagnostic.emailText || "",
          e.message || e.stack || util.inspect(e),
        ],
      });
    } catch (e: any) {
      debugger;
      console.error(e);
    }
    return res.status(503).json({
      statusCode: 503,
      success: false,
      error: e.message || e.stack || util.inspect(e),
    });
  }
};
export default sendContactForm;
