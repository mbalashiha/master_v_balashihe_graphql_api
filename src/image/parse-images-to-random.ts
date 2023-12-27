import path from "path";
import { glob, globSync, globStream, globStreamSync, Glob } from "glob";
import { saveToDb } from "./parse-images-save-to-db-query";

export const parseImagesToRandom = async () => {
  if (!process.env["SITE_PUBLIC_FOLDER"]) {
    throw new Error("No sitePublicFolder");
  }
  const SITE_PUBLIC_FOLDER = path.resolve(process.env["SITE_PUBLIC_FOLDER"]);
  const useAsRandomFolder = path.join(SITE_PUBLIC_FOLDER, "images", "random");
  const imagesAlt = await glob(useAsRandomFolder + "/*.{webp,png,jpg,jpeg,jfif}", {
    nocase: true,
  });
  for (const image of imagesAlt) {
    await saveToDb(image);
  }
};
