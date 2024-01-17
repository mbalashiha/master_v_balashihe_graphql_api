import path from "path";
import fs from "fs/promises";
import fse from "fs-extra";
import { glob, globSync, globStream, globStreamSync, Glob, Path } from "glob";
import sharp from "sharp";
import slugify from "slugify";
import { saveToDb } from "./parse-images-save-to-db-query";
import { collectAllPublicImagesToDB } from "./collect-all-public-images";
import executeTasksConcurrently from "@src/execute-tasks-concurrently";

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
  let convertedImagePath: string = /\.webp$/im.test(imagePath)
    ? imagePath
    : imagePath.replace(/\.[\w]+$/im, "") + ".webp";
  let loopPathSize = originalSize;
  let currentQuality = 100;
  let data: Buffer = Buffer.alloc(0);
  try {
    if (
      convertedImagePath !== imagePath &&
      (await fse.pathExists(convertedImagePath))
    ) {
      let format: string = meta.format || "";
      if (!format) {
        const m = imagePath.match(/\.([\w]+)$/im);
        if (m && m[1]) {
          format = m[1];
        } else {
          format = "unknown";
        }
      }
      convertedImagePath =
        imagePath.replace(/\.[\w]+$/im, "") + `-from-${format}.webp`;
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
    return { convertedImagePath, currentQuality, data };
  } catch (e: any) {
    console.error(e.stack || e.message || e);
    return { convertedImagePath, currentQuality, data };
  }
}
async function convertJpeg(
  imageStream: sharp.Sharp,
  meta: sharp.Metadata,
  imagePath: string,
  needResize: boolean,
  originalSize: number
) {
  {
    let convertedImagePath = imagePath;
    let loopPathSize = originalSize;
    let currentQuality = 100;
    let data: Buffer = Buffer.alloc(0);
    try {
      while (loopPathSize >= IMAGE_UPPER_SIZE_LIMIT && currentQuality > 0) {
        if (needResize) {
          data = await imageStream
            .resize({ height: IMAGE_MAX_HEIGHT })
            .jpeg({ mozjpeg: true, quality: currentQuality })
            .withMetadata()
            .toBuffer();
          imageStream = sharp(data);
          needResize = false;
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
      return { convertedImagePath, currentQuality, data };
    } catch (e: any) {
      console.error(e.stack || e.message || e);
      return { convertedImagePath, currentQuality, data };
    }
  }
}
async function convertPng(
  imageStream: sharp.Sharp,
  meta: sharp.Metadata,
  imagePath: string,
  needResize: boolean,
  originalSize: number
) {
  {
    let convertedImagePath = imagePath;
    let loopPathSize = originalSize;
    let currentQuality = 100;
    let data: Buffer = Buffer.alloc(0);
    try {
      while (loopPathSize >= IMAGE_UPPER_SIZE_LIMIT && currentQuality > 0) {
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
      return { convertedImagePath, currentQuality, data };
    } catch (e: any) {
      console.error(e.stack || e.message || e);
      return { convertedImagePath, currentQuality, data };
    }
  }
}
async function saveFileIfPossible({
  convertedImagePath,
  currentQuality,
  data,
}: {
  convertedImagePath: string;
  currentQuality: number;
  data: Buffer;
}) {
  try {
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
          const resultJpeg = await Promise.all([
            convertToWebp(
              imageStream,
              meta,
              imagePath,
              needResize,
              originalSize
            ),
            convertJpeg(imageStream, meta, imagePath, needResize, originalSize),
          ]);
          for (const elem of resultJpeg) {
            if (elem.convertedImagePath !== imagePath) {
              convertedImagePath = elem.convertedImagePath;
            }
            await saveFileIfPossible(elem);
          }
          break;
        case "png":
          const resultPng = await Promise.all([
            convertToWebp(
              imageStream,
              meta,
              imagePath,
              needResize,
              originalSize
            ),
            convertPng(imageStream, meta, imagePath, needResize, originalSize),
          ]);
          for (const elem of resultPng) {
            if (elem.convertedImagePath !== imagePath) {
              convertedImagePath = elem.convertedImagePath;
            }
            await saveFileIfPossible(elem);
          }
          break;
        case "webp":
          try {
            const oneResultWebp = await convertToWebp(
              imageStream,
              meta,
              imagePath,
              needResize,
              originalSize
            );
            if (oneResultWebp.convertedImagePath !== imagePath) {
              convertedImagePath = oneResultWebp.convertedImagePath;
            }
            await saveFileIfPossible(oneResultWebp);
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
    SITE_PUBLIC_FOLDER + "/**/*.{webp,png,jpg,jpeg,jfif}",
    { stat: true, withFileTypes: true, nocase: true }
  );
  const list: Array<() => Promise<any>> = [];
  for await (const path of imagesList) {
    const imagePath = await getFinalPath(path);
    if (path.size) {
      if (
        path.size >= IMAGE_UPPER_SIZE_LIMIT &&
        path.size < ABNORMAL_IMAGE_SIZE_LIMIT
      ) {
        list.push(() => processImage(imagePath, path.size));
      }
    }
  }
  await executeTasksConcurrently(list);
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
