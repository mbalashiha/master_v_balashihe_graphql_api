import util from "util";
import nodemailer from "nodemailer";

export const MAILER_USER = process.env.MAILER_USER;
export const transporter = nodemailer.createTransport({
  host: "smtp.mail.ru",
  port: 465,
  secure: true,
  auth: {
    user: MAILER_USER,
    pass: process.env.MAILER_PASS,
  },
});

// async..await is not allowed in global scope, must use a wrapper
interface Props {
  from?: string;
  to?: string; // list of receivers
  subject: string; // Subject line
  text: string; // plain text body
  html?: string; // html body
}
function mailContact({
  from = MAILER_USER,
  to = ((MAILER_USER as any) || 0) + 1,
  subject,
  text,
  html,
}: Props) {
  return new Promise(async (resolve, reject) => {
    let timeoutId = setTimeout(() => reject("timeout 2000ms exited."), 2000);
    try {
      // send mail with defined transport object
      console.log("sending email...");
      const info = await transporter.sendMail({
        from, // sender address
        to, // list of receivers
        subject, // Subject line
        text, // plain text body
        html: html || undefined, // html body
      });
      if (info.response && info.response.startsWith("250 OK")) {
        console.log("sending email success!", info);
        return resolve(info);
      } else {
        throw new Error(util.inspect(info));
      }
      // Message sent: <b658f8ca-6296-ccf4-8306-87d57a0b4321@example.com>

      //
      // NOTE: You can go to https://forwardemail.net/my-account/emails to see your email delivery status and preview
      //       Or you can use the "preview-email" npm package to preview emails locally in browsers and iOS Simulator
      //       <https://github.com/forwardemail/preview-email>
      //
    } catch (e: any) {
      reject(e);
    } finally {
      clearTimeout(timeoutId);
    }
  });
}
export default mailContact;
