import path from "path";
import fse from "fs-extra";
import express from "express";
import fs from "fs/promises";
import multer from "multer";
import delay from "delay";
import util from "util";
import sharp from "sharp";
import { db } from "./sql";
import { processImage } from "./image/parse-images-to-db";
export interface UploadedFileUriObject {
  absolutePathOfOriginal: string;
  absoluteFinalPath: string;
  db: {
    imgSrc: string;
    pathOfOriginal: string;
    fieldname: string;
  };
}
type EnhRequest = express.Request & {
  fullFilepathes: Array<UploadedFileUriObject>;
};
type EnhResponse = express.Response;
let imageUploadFolder: string = "";
let originalsFolder: string = "";
let finalFolder: string = "";

process.nextTick(() => {
  const sitePublicFolder = process.env["SITE_PUBLIC_FOLDER"] || "";
  if (!sitePublicFolder) {
    throw new Error("No site static resources public http folder!");
  }
  imageUploadFolder = process.env["imageUploadFolder"] || "";
  if (!imageUploadFolder) {
    throw new Error("No site static resources images storing http folder!");
  }
  originalsFolder = path.join(imageUploadFolder, "originals");
  try {
    fse.mkdirpSync(originalsFolder);
  } catch (e: any) {
    console.error(e.stack || e.message || e);
  }
  finalFolder = path.join(imageUploadFolder, "webp");
  try {
    fse.mkdirpSync(finalFolder);
  } catch (e: any) {
    console.error(e.stack || e.message || e);
  }
});

const storage = multer.diskStorage({
  destination: function (
    req: EnhRequest,
    file: Express.Multer.File,
    cb: (error: Error | null, destination: string) => void
  ): void {
    // Uploads is the Upload_folder_name
    fse.mkdirp(originalsFolder);
    fse.mkdirp(finalFolder);
    const originalFieldname = file.fieldname;
    const fieldname = file.fieldname
      .replace(/[.]{2,}/gim, ".")
      .replace(/[\/\\][.]/gim, "/")
      .replace(/[\/\\\_\-\!]+/gim, "-")
      .replace(/^[\-]+/im, "");
    const absolutePathOfOriginal: string = path.join(
      originalsFolder,
      fieldname
    );
    const webpFieldName = fieldname.replace(/\.[^\.]+$/, "") + ".webp";
    const absoluteFinalPath: string = path.join(finalFolder, webpFieldName);
    const originalUriFilepath: string =
      "/" + ["image", "upload", "originals", fieldname].join("/");
    const finalUriFilepath: string =
      "/" + ["image", "upload", "webp", webpFieldName].join("/");
    const imgSrc: string = finalUriFilepath;
    const filePathObject: UploadedFileUriObject = {
      absolutePathOfOriginal,
      absoluteFinalPath,
      db: {
        imgSrc,
        pathOfOriginal: originalUriFilepath,
        fieldname: originalFieldname,
      },
    };
    req.fullFilepathes = Array.isArray(req.fullFilepathes)
      ? req.fullFilepathes
      : [];
    req.fullFilepathes.push(filePathObject);
    file.fieldname = fieldname;
    cb(null, originalsFolder);
  } as any,
  filename: function (
    req: express.Request,
    file: Express.Multer.File,
    cb: (error: Error | null, filename: string) => void
  ): void {
    try {
      cb(null, file.fieldname);
    } catch (e) {
      console.error(e);
      debugger;
      throw e;
    }
  },
});

// Define the maximum size for uploading
// picture i.e. 1 MB. it is optional
const maxSize = 128 * 1000 * 1000;

export const uploadMiddleware = multer({
  storage: storage,
  limits: { fileSize: maxSize },
  fileFilter: function (
    req: express.Request,
    file: Express.Multer.File,
    cb: multer.FileFilterCallback
  ): void {
    return cb(null, true);
  },
}).any();
export const uploadResponseHandler = async function (
  req: EnhRequest,
  res: EnhResponse,
  next: Function
) {
  const newImageAbsolutePathes: Array<string> = [];
  try {
    const { fullFilepathes } = req;
    const result: Array<{
      imgSrc: string;
      width: number;
      height: number;
      imageId: string | number;
      fieldname: string;
    }> = [];
    let lastError: string | null = null;
    for (let i = 0; i < fullFilepathes.length; i++) {
      try {
        const obj = fullFilepathes[i];
        const fieldname = obj.db.fieldname;
        const imgSrc = obj.db.imgSrc;
        const filepath = obj.absolutePathOfOriginal;
        const absoluteFinalPath = obj.absoluteFinalPath;
        let data: sharp.OutputInfo | undefined = undefined;
        try {
          const imageStream = sharp(filepath);
          data = await imageStream
            .toFormat("webp", { quality: 95 })
            .toFile(absoluteFinalPath);
        } catch (e: any) {
          if (e) {
            lastError = e.stack || e.message || e;
            console.error(e.stack || e.message || e);
          }
        } finally {
          try {
            await fse.remove(filepath);
          } catch {
            newImageAbsolutePathes.push(filepath);
          }
        }
        if (data && data.width && data.height) {
          newImageAbsolutePathes.push(absoluteFinalPath);
          let imageId: string | number | null = null;
          const { width, height } = data;
          lastError = null;
          try {
            let insertRowDataPacket: any = await db.query(
              `insert into image(imgSrc, width, height, originalWidth, originalHeight) values($imgSrc, $width, $height, $width, $height)
                ON DUPLICATE KEY UPDATE
                  image.width = VALUES(image.width),
                  image.height = VALUES(image.height),
                  image.originalWidth = VALUES(image.originalWidth),
                  image.originalHeight = VALUES(image.originalHeight)`,
              { imgSrc, width, height }
            );
            insertRowDataPacket =
              (insertRowDataPacket && insertRowDataPacket[0]) ||
              insertRowDataPacket;
            if (insertRowDataPacket && insertRowDataPacket.insertId) {
              imageId = insertRowDataPacket.insertId;
            } else {
              const rows = await db.excuteQuery({
                query: `select imageId from image where imgSrc=$imgSrc`,
                variables: {
                  imgSrc,
                },
              });
              imageId = (rows && rows[0] && rows[0].imageId) || null;
            }
          } catch (e: any) {
            if (e) {
              lastError = e.stack || e.message || e;
              console.error(e.stack || e.message || e);
            }
          }
          if (imageId) {
            result.push({ fieldname, imgSrc, width, height, imageId });
          }
        }
      } catch (e: any) {
        if (e) {
          lastError = e.stack || e.message || e;
          console.error(e.stack || e.message || e);
        }
        console.error();
      }
    }
    const resultJson = {
      success: lastError || result.length <= 0 ? false : true,
      error: lastError || null,
      images: result,
    };
    return res.json(resultJson);
  } finally {
    (async () => {
      for (const imagePath of newImageAbsolutePathes) {
        try {
          await processImage(imagePath);
        } catch (e: any) {
          console.error(e.message || e.stack || e);
        }
      }
    })();
  }
} as any;
export default uploadResponseHandler;
