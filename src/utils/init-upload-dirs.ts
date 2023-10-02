import path from "path";
import fs from "fs";
import fse from "fs-extra";

const SITE_FOLDER_NAME = process.env["SITE_FOLDER_NAME"] || "";
if (!SITE_FOLDER_NAME) {
  throw new Error("SITE_FOLDER_NAME enviroment variable has not been set.");
}
if (process.env["NODE_ENV"] === "production") {
  // console.l//og("Running in production enviroment.");
  process.chdir(__dirname);
}
const initUploadDirs = () => {
  let siteFolder: string = "";
  try {
    let subRoot = __dirname;
    while (!siteFolder) {
      // console.l//og("testing folder:", subRoot);
      const testFolder = path.join(subRoot, SITE_FOLDER_NAME);
      if (fse.existsSync(testFolder) && fs.statSync(testFolder).isDirectory()) {
        siteFolder = testFolder;
        break;
      } else {
        const newSubFolder = path.resolve(path.join(subRoot, ".."));
        if (newSubFolder === subRoot) {
          break;
        } else {
          subRoot = newSubFolder;
        }
      }
    }
    if (siteFolder) {
      const sitePublicFolder = path.join(siteFolder, "public");
      const imageUploadFolder = path.join(sitePublicFolder, "image", "upload");
      process.env["SITE_PUBLIC_FOLDER"] = sitePublicFolder;
      process.env["imageUploadFolder"] = imageUploadFolder;
      fse.mkdirpSync(imageUploadFolder);
    }
  } catch (e: any) {
    console.error(e.stack || e.message || e);
  } finally {
    if (!siteFolder) {
      console.error(
        "Fatal error: Site folder (root folder for nginx server) cound not be found. Existing with error code 1."
      );
      console.error();
      process.exit(1);
    }
  }
};

export default initUploadDirs;
