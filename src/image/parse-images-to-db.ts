import path from "path";
import fs from "fs/promises";
import fse from "fs-extra";
import { glob, globSync, globStream, globStreamSync, Glob, Path } from "glob";
import sharp from "sharp";
import slugify from "slugify";
import { saveToDb } from "./parse-images-save-to-db-query";
import { collectAllPublicImagesToDB } from "./collect-all-public-images";

const IMAGE_UPPER_SIZE_LIMIT = 300 * 1024;
const IMAGE_MAX_HEIGHT = 2160;
const ABNORMAL_IMAGE_SIZE_LIMIT = 256 * 1024 * 1024;
const WEBP_QUALITY_BOTTOM = 30;
const JPEG_QUALITY_BOTTOM = 30;
const PNG_QUALITY_BOTTOM = 3;
const MAX_IMAGE_QUALITY_STEP_SUBSTRUCT = 40;

function getExtensionAndBasename(inFilepath: string) {
  const dotLastindex = inFilepath.lastIndexOf(".");
  let extension =
    dotLastindex < 0 ? "" : inFilepath.substring(inFilepath.lastIndexOf("."));
  let withoutExtension =
    dotLastindex < 0
      ? inFilepath
      : inFilepath.substring(0, inFilepath.lastIndexOf("."));
  let lcExtension = extension.toLowerCase();
  return { extension, withoutExtension, lcExtension };
}
// const getExtensionRegexp = () => /\.[^\.\/\\]+$/;

async function convertToWebp(
  imageStream: sharp.Sharp,
  meta: sharp.Metadata,
  imagePath: string,
  needResize: boolean,
  originalSize: number
) {
  let convertedImagePath: string;
  try {
    let loopPathSize = originalSize;
    let currentQuality = 100;
    let data: Buffer = Buffer.alloc(0);
    convertedImagePath = /\.webp$/im.test(imagePath)
      ? imagePath
      : imagePath.replace(/\.[\w]+$/im, "") + ".webp";
    if (
      convertedImagePath !== imagePath &&
      (await fse.pathExists(convertedImagePath))
    ) {
      convertedImagePath =
        imagePath.replace(/\.[\w]+$/im, "") +
        `-from-${meta.format || "unknown"}.webp`;
    }
    while (loopPathSize >= IMAGE_UPPER_SIZE_LIMIT && currentQuality > 0) {
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
    if (currentQuality > 0 && data.length > 1) {
      await fs.writeFile(convertedImagePath, data);
      console.log(
        "\tsaved",
        convertedImagePath.split(path.sep).pop(),
        "\n\t  size of file is:",
        data.length,
        "\n\t  with quality:",
        currentQuality
      );
    }
    return { convertedImagePath };
  } catch (e: any) {
    console.error(e.stack || e.message || e);
    return null;
  }
}

export async function processImage(imagePath: string, originalSize?: number) {
  let convertedImagePath = imagePath;
  try {
    let imageStream = sharp(imagePath);
    const meta = await imageStream.metadata();
    let needResize = Boolean(
      meta && meta.height && meta.height > IMAGE_MAX_HEIGHT
    );
    if (!originalSize) {
      const stat = await fs.stat(imagePath);
      originalSize = stat.size;
    }
    if (meta.height) {
      switch (meta.format) {
        case "jpeg":
        case "jpg":
          await convertToWebp(
            imageStream,
            meta,
            imagePath,
            needResize,
            originalSize
          );
          try {
            let loopPathSize = originalSize;
            let currentQuality = 100;
            let data: Buffer = Buffer.alloc(0);
            while (
              loopPathSize >= IMAGE_UPPER_SIZE_LIMIT &&
              currentQuality > 0
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
            if (currentQuality > 0 && data.length > 1) {
              await fs.writeFile(convertedImagePath, data);
              console.log(
                "\tsaved",
                convertedImagePath.split(path.sep).pop(),
                "\n\t  size of file is:",
                data.length,
                "\n\t  with quality:",
                currentQuality
              );
            }
          } catch (e: any) {
            console.error(e.stack || e.message || e);
          }
          break;
        case "png":
          await convertToWebp(
            imageStream,
            meta,
            imagePath,
            needResize,
            originalSize
          );
          try {
            let loopPathSize = originalSize;
            let currentQuality = 100;
            let data: Buffer = Buffer.alloc(0);
            while (
              loopPathSize >= IMAGE_UPPER_SIZE_LIMIT &&
              currentQuality > 0
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
            if (currentQuality > 0 && data.length > 1) {
              await fs.writeFile(imagePath, data);
              console.log(
                "\tsaved",
                imagePath.split(path.sep).pop(),
                "\n\t  size of file is:",
                data.length,
                "\n\t  with quality:",
                currentQuality
              );
            }
          } catch (e: any) {
            console.error(e.stack || e.message || e);
          }
          break;
        case "webp":
          try {
            await convertToWebp(
              imageStream,
              meta,
              imagePath,
              needResize,
              originalSize
            );
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
async function getFinalPath(inPath: Path): Promise<string> {
  let tempImagePath = inPath.fullpath();
  const baseName = tempImagePath.substring(
    tempImagePath.lastIndexOf(path.sep) + 1
  );
  const baseDir = tempImagePath.substring(
    0,
    tempImagePath.lastIndexOf(path.sep)
  );
  const transl = slugify(baseName);
  if (transl && transl != baseName) {
    const { extension, withoutExtension, lcExtension } =
      getExtensionAndBasename(transl);
    let renamingToFullpath = path.join(
      baseDir,
      `${withoutExtension}${lcExtension}`
    );
    try {
      if (!(await fse.exists(renamingToFullpath))) {
        await fse.rename(inPath.fullpath(), renamingToFullpath);
      } else {
        renamingToFullpath = path.join(
          baseDir,
          `${withoutExtension}_slugified${lcExtension}`
        );
        await fse.rename(inPath.fullpath(), renamingToFullpath);
      }
      tempImagePath = renamingToFullpath;
      return tempImagePath;
    } catch (e: any) {
      console.error(e.message || e);
    }
  }
  const { extension, withoutExtension, lcExtension } =
    getExtensionAndBasename(tempImagePath);
  if (lcExtension !== extension) {
    let renamingToFullpath = `${withoutExtension}${lcExtension}`;
    try {
      if (!(await fse.exists(renamingToFullpath))) {
        await fse.rename(inPath.fullpath(), renamingToFullpath);
      } else {
        renamingToFullpath = `${withoutExtension}_loweredcase_ext${lcExtension}`;
        await fse.rename(inPath.fullpath(), renamingToFullpath);
      }
      tempImagePath = renamingToFullpath;
    } catch (e: any) {
      console.error(e.message || e);
    }
  }
  return tempImagePath;
}
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
    const imagePath = await getFinalPath(path);
    if (path.size) {
      if (
        path.size >= IMAGE_UPPER_SIZE_LIMIT &&
        path.size < ABNORMAL_IMAGE_SIZE_LIMIT
      ) {
        await processImage(imagePath, path.size);
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
