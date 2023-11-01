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
    const newTextContent = await prettier.format(value.textContent.trim(), {
      semi: true,
      parser: "babel",
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
