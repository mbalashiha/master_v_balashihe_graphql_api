import express from "express";
import * as prettier from "prettier";

export default async function prettierReact(
  req: express.Request,
  res: express.Response
) {
  try {
    const value: {
      textContent: string;
      language: string;
    } = req.body; //(req as any).rawBody || req.body.toString("utf8");
    const { language } = value;
    let parser: string = "";
    switch (language) {
      case "tsx":
      case "jsx":
        parser = "babel";
        break;
      case "markup":
        parser = "html";
        break;
      default:
        parser = "babel";
        break;
    }
    const newTextContent = await prettier.format(value.textContent.trim(), {
      semi: true,
      parser,
    });
    return res.json({
      textContent: newTextContent
        .trim()
        .replace(/^;\</im, "<")
        .replace(/\>;$/im, ">"),
      language: value.language,
    });
  } catch (e: any) {
    console.error(e.message || e);
    debugger;
    throw e;
  }
}
