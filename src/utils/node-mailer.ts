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
async function mailContact() {
  // send mail with defined transport object
  const info = await transporter.sendMail({
    from: MAILER_USER, // sender address
    to: MAILER_USER, // list of receivers
    subject: "Hello ✔", // Subject line
    text: "Hello world?", // plain text body
    html: "<b>Hello world?</b>", // html body 
  });

  console.log("Message sent: %s", info.messageId);
  // Message sent: <b658f8ca-6296-ccf4-8306-87d57a0b4321@example.com>

  //
  // NOTE: You can go to https://forwardemail.net/my-account/emails to see your email delivery status and preview
  //       Or you can use the "preview-email" npm package to preview emails locally in browsers and iOS Simulator
  //       <https://github.com/forwardemail/preview-email>
  //
}

export default mailContact;