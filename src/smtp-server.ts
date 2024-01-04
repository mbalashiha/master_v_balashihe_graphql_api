import fs from "fs";
import fsa from "fs/promises";
import path from "path";
import fse from "fs-extra";
import {
  SMTPServer,
  SMTPServerAddress,
  SMTPServerDataStream,
  SMTPServerSession,
} from "smtp-server";
import { MailParser } from "mailparser";
import mailContact from "./utils/node-mailer";

const emailsFolder = path.resolve("/var/log/emails");

export function startSMTPserver(): any {
  let key: string | Buffer | (string | Buffer)[] | undefined = undefined;
  let cert: string | Buffer | (string | Buffer)[] | undefined = undefined;
  try {
    key =
      fs.readFileSync("/home/safeuser/certs/smtp.mbalashiha.ru/privkey.pem") ||
      undefined;
    cert =
      fs.readFileSync("/home/safeuser/certs/smtp.mbalashiha.ru/cert.pem") ||
      undefined;
    // console.l//og("---> cert and priv key for SMTP server loaded correctly.");
  } catch (e: any) {
    console.error(e.message || e);
  }
  try {
    const smtp = new SMTPServer({
      secure: false,
      key,
      cert,
      onRcptTo,
      onData,
      authOptional: true,
    });
    try {
      fse.mkdirpSync(emailsFolder);
    } catch (e: any) {
      console.error(e.message || e);
    }
    return smtp;
  } catch (e: any) {
    console.error(e.message || e);
  }
}

// Валидация получателя. Для каждого адреса функция вызывается отдельно.
function onRcptTo(
  { address }: SMTPServerAddress,
  session: SMTPServerSession,
  callback: (err?: Error | null | undefined) => void
): void {
  if (address.startsWith("noreply@")) {
    callback(new Error(`Address ${address} is not allowed receiver`));
  } else {
    callback();
  }
}

// Обработка данных письма
function onData(
  stream: SMTPServerDataStream,
  session: SMTPServerSession,
  callback: (err?: Error | null | undefined) => void
): void {
  const parser = new MailParser();
  stream.pipe(parser);
  parser.on("error", callback);
  parser.on("end", async (mail) => {
    // mail body
    try {
      await fsa.writeFile(
        path.join(
          emailsFolder,
          new Date().toISOString().replaceAll(/[^\d]+/gim, "_") +
            (mail.messageId || "") +
            ".json"
        ),
        JSON.stringify(mail, null, 2)
      );
    } catch (e: any) {
      console.error(e.message || e);
    }
    try {
      await mailContact({
        subject: `FWD: ${mail.subject || ""} (${mail.messageId || ""})`,
        html: !mail.html
          ? undefined
          : `${mail.html} \r\n<br>---------<br>\r\n${JSON.stringify(
              mail,
              null,
              2
            )}`,
        text: !mail.text
          ? ""
          : `${mail.text} \r\n---------\r\n${JSON.stringify(mail, null, 2)}`,
      });
    } catch (e: any) {
      console.error(e.message || e);
    }
    callback();
  });
}
