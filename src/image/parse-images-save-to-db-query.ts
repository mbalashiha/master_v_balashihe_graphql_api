import path from "path";
import fs from "fs/promises";
import { glob, globSync, globStream, globStreamSync, Glob } from "glob";
import sharp from "sharp";
import db from "@src/sql/execute-query";

export const getImgSrcUri = (imagePath: string): string =>
  imagePath.substring((process.env["SITE_PUBLIC_FOLDER"] || "").length);
export const getImgAbsolutePath = (imgSrc: string): string =>
  path.resolve((process.env["SITE_PUBLIC_FOLDER"] || "") + imgSrc);

export const saveToDb = async (imagePath: string): Promise<boolean> => {
  if (!process.env["SITE_PUBLIC_FOLDER"]) {
    throw new Error("No sitePublicFolder");
  }
  try {
    const imageStream = sharp(imagePath);
    const meta = await imageStream.metadata();
    if (meta.width && meta.height) {
      const imgSrc = getImgSrcUri(imagePath);
      const useAsRandom = imgSrc.includes(path.sep + "random" + path.sep)
        ? 1
        : null;   
      let rows = await db.query(
        `select 1 from image where 
                  image.imgSrc = $imgSrc And
                  image.useAsRandom = $useAsRandom And 
                  image.width = $width And 
                  image.height = $height`,
        {
          imgSrc,
          width: meta.width,
          height: meta.height,
          useAsRandom,
        }
      );
      if (rows.length <= 0) {
        let insertRowDataPacket: any = await db.query(
          `insert into image(useAsRandom, imgSrc, width, height, originalWidth, originalHeight) values($useAsRandom, $imgSrc, $width, $height, $width, $height)
                ON DUPLICATE KEY UPDATE
                  image.useAsRandom = VALUES(image.useAsRandom),
                  image.width = VALUES(image.width),
                  image.height = VALUES(image.height),
                  image.originalWidth = VALUES(image.originalWidth),
                  image.originalHeight = VALUES(image.originalHeight)`,
          {
            imgSrc,
            width: meta.width,
            height: meta.height,
            useAsRandom,
          }
        );
      } else {
        // console.l//og("No need to save again: same image" + "\n");
      }
      return true;
    } else {
      console.error(
        imagePath + "\n",
        "No image width or height!",
        new Date().toISOString() + ":",
        "processed"
      );
      return false;
    }
  } catch (e: any) {
    // console.error(imagePath + "\n", e.stack || e.message || e);
    return false;
  }
};
