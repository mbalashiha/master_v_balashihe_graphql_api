import path from "path";
import fse from "fs-extra";
import express from "express";
import fs from "fs/promises";
import multer from "multer";
import delay from "delay";
import util from "util";
export interface UploadedFileUriObject {
  absolutePathOfOriginal: string;
  absoluteFinalPath: string;
  db: {
    imgSrc: string;
    pathOfOriginal: string;
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
  const sitePublicFolder = process.env["sitePublicFolder"] || "";
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
    debugger;
    // Uploads is the Upload_folder_name
    const fieldname = file.fieldname
      .replace(/[.]{2,}/gim, ".")
      .replace(/[\/\\][.]/gim, "/")
      .replace(/[\/\\\_\-\!]+/gim, "-")
      .replace(/^[\-]+/im, "");
    const absolutePathOfOriginal: string = path.join(
      originalsFolder,
      fieldname
    );
    const absoluteFinalPath: string = path.join(finalFolder, fieldname);
    const originalUriFilepath: string =
      "/" + ["image", "upload", "originals", fieldname].join("/");
    const finalUriFilepath: string =
      "/" + ["image", "upload", "webp", fieldname].join("/");
    const imgSrc: string = finalUriFilepath;
    const filePathObject: UploadedFileUriObject = {
      absolutePathOfOriginal,
      absoluteFinalPath,
      db: {
        imgSrc,
        pathOfOriginal: originalUriFilepath,
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
const maxSize = 10 * 1000 * 1000;

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
  const { fullFilepathes } = req;
  const result: Array<any> = [];
  let lastError: any = null;
  for (let i = 0; i < fullFilepathes.length; i++) {
    for (let attempt = 0; attempt < 3; attempt++) {
      try {
        const obj = fullFilepathes[i];
        const imgSrc = obj.db.imgSrc;
        const filepath = obj.absolutePathOfOriginal;
        if (imgSrc && filepath) {
          const {
            outputInfo,
            originalMeta,
            originalHeight,
            originalWidth,
            width,
            height,
          } = {} as any; //await convertUploadedImageFile(pathOfOriginal, draftPath);
          result.push({
            imgSrc: obj.db.imgSrc,
            width,
            height,
            originalWidth,
            originalHeight,
            pathOfOriginal: obj.db.pathOfOriginal,
          });
          lastError = null;
        }
        break;
      } catch (e: any) {
        lastError = e;
        console.error(e);
        if (e) {
          console.error(e.stack || e.message || e);
        }
        console.error();
        await delay(100);
      }
    }
  }
  if (lastError) {
    return res.status(500).json({
      error:
        lastError.stack ||
        lastError.message ||
        JSON.stringify(lastError, null, 2),
      success: false,
    });
  } else {
    return res.json({ success: true, images: result });
  }
} as any;
export default uploadResponseHandler;
