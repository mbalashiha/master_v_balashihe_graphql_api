import path from "path";
import fs from "fs/promises";
import { glob, globSync, globStream, globStreamSync, Glob } from "glob";
import db from "@src/sql/execute-query";

import { getImgAbsolutePath, saveToDb } from "./parse-images-save-to-db-query";

const ABNORMAL_IMAGE_SIZE_LIMIT = 256 * 1024 * 1024;

export const collectAllPublicImagesToDB = async () => {
  if (!process.env["SITE_PUBLIC_FOLDER"]) {
    throw new Error("No sitePublicFolder");
  }
  const SITE_PUBLIC_FOLDER = path.resolve(process.env["SITE_PUBLIC_FOLDER"]);

  // const useAsRandomFolder = path.join(SITE_PUBLIC_FOLDER, "images", "random");
  // const imagesAlt = await glob(SITE_PUBLIC_FOLDER + "/**/*.{webp,png,jpg,jpeg}");
  const imagesList = new Glob(
    SITE_PUBLIC_FOLDER + "/**/*.{ico,svg,gif,webp,png,jpg,jpeg}",
    { stat: true, withFileTypes: true, nocase: true }
  );
  const receivedPathes = new Set<string>();
  for await (const path of imagesList) {
    if (path.size) {
      if (path.size > 1 && path.size < ABNORMAL_IMAGE_SIZE_LIMIT) {
        const imagePath = path.fullpath();
        receivedPathes.add(imagePath);
        await saveToDb(imagePath);
      }
    }
  }
  try {
    const imagesRows = await db.query(`select imgSrc from image`);
    for (const irow of imagesRows) {
      const imgSrc = irow && irow.imgSrc;
      if (!imgSrc || !receivedPathes.has(getImgAbsolutePath(imgSrc))) {
        console.error("No existing:", imgSrc);
        try {
          console.log(
            `db row with imgSrc ${imgSrc}\n`,
            "delete success:",
            await db.query(`delete from image where imgSrc=$imgSrc`, { imgSrc })
          );
        } catch (e: any) {
          console.error(e.stack || e.message || e);
        }
      }
    }
  } catch (e: any) {
    console.error(e.stack || e.message || e);
  }
};
