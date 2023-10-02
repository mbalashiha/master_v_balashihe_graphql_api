import path from "path";
import { glob, globSync, globStream, globStreamSync, Glob } from "glob";
import sharp from "sharp";
import db from "@src/sql/execute-query";
export const parseImagesToRandom = async () => {
  if (!process.env["SITE_PUBLIC_FOLDER"]) {
    throw new Error("No sitePublicFolder");
  }
  const useAsRandomFolder = path.join(
    process.env["SITE_PUBLIC_FOLDER"],
    "images",
    "random"
  );
  const imagesAlt = await glob(useAsRandomFolder + "/*.{webp,png,jpg,jpeg}");

  for (const image of imagesAlt) {
    const imageStream = sharp(image);
    const meta = await imageStream.metadata();
    if (meta.width && meta.height) {
      const imgSrc = image.substring(
        process.env["SITE_PUBLIC_FOLDER"].length
      );
      let insertRowDataPacket: any = await db.query(
        `insert into image(useAsRandom, imgSrc, width, height, originalWidth, originalHeight) values(1, $imgSrc, $width, $height, $width, $height)
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
        }
      );
    }
  }
};
