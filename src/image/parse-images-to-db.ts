import path from "path";
import fs from "fs/promises";
import { glob, globSync, globStream, globStreamSync, Glob } from "glob";
import sharp from "sharp";
import { saveToDb } from "./parse-images-save-to-db-query";
import { collectAllPublicImagesToDB } from "./collect-all-public-images";

const IMAGE_UPPER_SIZE_LIMIT = 300 * 1024;
const IMAGE_MAX_HEIGHT = 2160;
const ABNORMAL_IMAGE_SIZE_LIMIT = 256 * 1024 * 1024;
const WEBP_QUALITY_BOTTOM = 20;
const JPEG_QUALITY_BOTTOM = 20;
const PNG_QUALITY_BOTTOM = 3;
const MAX_IMAGE_QUALITY_STEP_SUBSTRUCT = 40;

export const parseImagesToDB = async () => {
  if (!process.env["SITE_PUBLIC_FOLDER"]) {
    throw new Error("No sitePublicFolder");
  }
  const SITE_PUBLIC_FOLDER = path.resolve(process.env["SITE_PUBLIC_FOLDER"]);

  // const useAsRandomFolder = path.join(SITE_PUBLIC_FOLDER, "images", "random");
  // const imagesAlt = await glob(SITE_PUBLIC_FOLDER + "/**/*.{webp,png,jpg,jpeg}");
  const imagesList = new Glob(
    SITE_PUBLIC_FOLDER + "/**/*.{webp,png,jpg,jpeg}",
    { stat: true, withFileTypes: true, nocase: true }
  );
  for await (const path of imagesList) {
    if (path.size) {
      if (
        path.size >= IMAGE_UPPER_SIZE_LIMIT &&
        path.size < ABNORMAL_IMAGE_SIZE_LIMIT
      ) {
        const imagePath = path.fullpath();
        let convertedImagePath = imagePath;
        try {
          let imageStream = sharp(imagePath);
          const meta = await imageStream.metadata();
          let needResize = Boolean(
            meta && meta.height && meta.height > IMAGE_MAX_HEIGHT
          );

          if (meta.height) {
            switch (meta.format) {
              case "jpeg":
              case "jpg":
                try {
                  let loopPathSize = path.size;
                  let currentQuality = 100;
                  let data: Buffer = Buffer.alloc(0);
                  while (
                    loopPathSize >= IMAGE_UPPER_SIZE_LIMIT &&
                    currentQuality >= 0
                  ) {
                    if (needResize) {
                      data = await imageStream
                        .resize({ height: IMAGE_MAX_HEIGHT })
                        .jpeg({ mozjpeg: true, quality: currentQuality })
                        .withMetadata()
                        .toBuffer();
                    } else {
                      data = await imageStream
                        .jpeg({ mozjpeg: true, quality: currentQuality })
                        .withMetadata()
                        .toBuffer();
                    }
                    loopPathSize = data.length;
                    if (loopPathSize >= IMAGE_UPPER_SIZE_LIMIT) {
                      let intFraction = Math.floor(
                        3 * (loopPathSize / IMAGE_UPPER_SIZE_LIMIT)
                      );
                      if (intFraction > MAX_IMAGE_QUALITY_STEP_SUBSTRUCT) {
                        intFraction = MAX_IMAGE_QUALITY_STEP_SUBSTRUCT;
                      }
                      if (currentQuality - intFraction < JPEG_QUALITY_BOTTOM) {
                        currentQuality -= 1;
                      } else {
                        currentQuality -= intFraction >= 1 ? intFraction : 1;
                      }
                    }
                    console.log(
                      "It is",
                      convertedImagePath,
                      "\n\thaving size:",
                      loopPathSize,
                      "with quality:",
                      currentQuality
                    );
                  }
                  if (currentQuality >= 0 && data.length > 1) {
                    await fs.writeFile(convertedImagePath, data);
                  }
                } catch (e: any) {
                  console.error(e.stack || e.message || e);
                }
                break;
              case "png":
                try {
                  let loopPathSize = path.size;
                  let currentQuality = 100;
                  let data: Buffer = Buffer.alloc(0);
                  convertedImagePath =
                    imagePath.replace(/\.png$/gim, "") + ".webp";
                  while (
                    loopPathSize >= IMAGE_UPPER_SIZE_LIMIT &&
                    currentQuality >= 0
                  ) {
                    if (needResize) {
                      data = await imageStream
                        .resize({ height: IMAGE_MAX_HEIGHT })
                        .webp({ quality: currentQuality })
                        .withMetadata()
                        .toBuffer();
                      imageStream = sharp(data);
                      needResize = false;
                    } else {
                      data = await imageStream
                        .webp({ quality: currentQuality })
                        .withMetadata()
                        .toBuffer();
                    }
                    loopPathSize = data.length;
                    if (loopPathSize >= IMAGE_UPPER_SIZE_LIMIT) {
                      let intFraction = Math.floor(
                        2 * (loopPathSize / IMAGE_UPPER_SIZE_LIMIT)
                      );
                      if (intFraction > MAX_IMAGE_QUALITY_STEP_SUBSTRUCT) {
                        intFraction = MAX_IMAGE_QUALITY_STEP_SUBSTRUCT;
                      }
                      if (currentQuality - intFraction < WEBP_QUALITY_BOTTOM) {
                        currentQuality -= 1;
                      } else {
                        currentQuality -= intFraction >= 1 ? intFraction : 1;
                      }
                    }
                    console.log(
                      "It is",
                      convertedImagePath,
                      "\n\thaving size:",
                      loopPathSize,
                      "with quality:",
                      currentQuality
                    );
                  }
                  if (currentQuality >= 0 && data.length > 1) {
                    await fs.writeFile(convertedImagePath, data);
                  }

                  loopPathSize = path.size;
                  currentQuality = 100;
                  data = Buffer.alloc(0);
                  while (
                    loopPathSize >= IMAGE_UPPER_SIZE_LIMIT &&
                    currentQuality >= 0
                  ) {
                    if (needResize) {
                      data = await imageStream
                        .resize({ height: IMAGE_MAX_HEIGHT })
                        .png({ quality: currentQuality, compressionLevel: 6 })
                        .withMetadata()
                        .toBuffer();
                      imageStream = sharp(data);
                      needResize = false;
                    } else {
                      data = await imageStream
                        .png({ quality: currentQuality, compressionLevel: 6 })
                        .withMetadata()
                        .toBuffer();
                    }
                    loopPathSize = data.length;
                    console.log(
                      "It is",
                      imagePath,
                      "\n\thaving size:",
                      loopPathSize,
                      "with quality:",
                      currentQuality
                    );
                    if (loopPathSize >= IMAGE_UPPER_SIZE_LIMIT) {
                      let intFraction = Math.floor(
                        10 * (loopPathSize / IMAGE_UPPER_SIZE_LIMIT)
                      );
                      if (intFraction > MAX_IMAGE_QUALITY_STEP_SUBSTRUCT) {
                        intFraction = MAX_IMAGE_QUALITY_STEP_SUBSTRUCT;
                      }
                      if (currentQuality - intFraction < PNG_QUALITY_BOTTOM) {
                        currentQuality -= 1;
                      } else {
                        currentQuality -= intFraction >= 1 ? intFraction : 1;
                      }
                    }
                  }
                  if (currentQuality < 1) {
                    currentQuality = 1;
                  }
                  if (currentQuality >= 0 && data.length > 1) {
                    await fs.writeFile(imagePath, data);
                  }
                } catch (e: any) {
                  console.error(e.stack || e.message || e);
                }
                break;
              case "webp":
                try {
                  let loopPathSize = path.size;
                  let currentQuality = 100;
                  let data: Buffer = Buffer.alloc(0);
                  while (
                    loopPathSize >= IMAGE_UPPER_SIZE_LIMIT &&
                    currentQuality >= 0
                  ) {
                    if (needResize) {
                      data = await imageStream
                        .resize({ height: IMAGE_MAX_HEIGHT })
                        .webp({ quality: currentQuality })
                        .withMetadata()
                        .toBuffer();
                      imageStream = sharp(data);
                      needResize = false;
                    } else {
                      data = await imageStream
                        .webp({ quality: currentQuality })
                        .withMetadata()
                        .toBuffer();
                    }
                    loopPathSize = data.length;
                    console.log(
                      "It is",
                      convertedImagePath,
                      "\n\thaving size:",
                      loopPathSize,
                      "with quality:",
                      currentQuality
                    );
                    if (loopPathSize >= IMAGE_UPPER_SIZE_LIMIT) {
                      let intFraction = Math.floor(
                        2 * (loopPathSize / IMAGE_UPPER_SIZE_LIMIT)
                      );
                      if (intFraction > MAX_IMAGE_QUALITY_STEP_SUBSTRUCT) {
                        intFraction = MAX_IMAGE_QUALITY_STEP_SUBSTRUCT;
                      }
                      if (currentQuality - intFraction < WEBP_QUALITY_BOTTOM) {
                        currentQuality -= 1;
                      } else {
                        currentQuality -= intFraction >= 1 ? intFraction : 1;
                      }
                    }
                  }
                  if (currentQuality >= 0 && data.length > 1) {
                    await fs.writeFile(convertedImagePath, data);
                  }
                } catch (e: any) {
                  console.error(e.stack || e.message || e);
                }
                break;
            }
          }
          await saveToDb(imagePath);
          if (convertedImagePath && convertedImagePath !== imagePath) {
            await saveToDb(convertedImagePath);
          }
        } catch (e: any) {
          console.error(e.stack || e.message || e);
        }
      }
    }
  }
  await collectAllPublicImagesToDB();
};
/*return;
  for (const image of imagesAlt) {
    const imageStream = sharp(image);
    const meta = await imageStream.metadata();
    if (meta.width && meta.height) {
      const imgSrc = image.substring(process.env["SITE_PUBLIC_FOLDER"].length);
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
  }*/
