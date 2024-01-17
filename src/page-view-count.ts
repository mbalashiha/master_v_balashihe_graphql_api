import { db } from "@src/sql";
import { Request, Response } from "express";
import { simpleDecrypt } from "@src/encryption/message-hmac-private-key";

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
        query: `call save_article_viewed(?, ?, ?, ?);`,
        variables: [
          ip,
          timestamp,
          articleId,
          process.env.OWNER_IP_ADDRESS || "",
        ],
      });
    } else {
      throw new Error("No correct ip and timestamp or form values");
    }
    const rows = await db.query(
      "select id as articleId, viewed from blog_article where id=$articleId",
      { articleId }
    );
    const info = rows && rows[0];
    return res.type("json").send({ ...info });
  } catch (e: any) {
    e = e || {};
    console.error(e.stack || e.message);
    debugger;
    return res.status(403).json({
      statusCode: 403,
      success: false,
      error: e.message || e.stack || e,
    });
  }
};
export default pageViewCount;
