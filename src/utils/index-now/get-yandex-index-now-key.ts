import fetch from "cross-fetch";
import { glob } from "glob";
import path from "path";
import fsa from "fs/promises";
import fse from "fs-extra";
import { v4 as uuid } from "uuid";

function getApiKeyPrefix(requestApiUrl: string) {
  const suffix = requestApiUrl
    .replace(/^\w+:\/\/((www\.)|(api\.))?/im, "")
    .replace("/indexnow", "")
    .replace(/^\/+|\/+$/gim, "")
    .replace(/\.[\w\-]+$/im, "")
    .replace(/[\.\/\?\&\s\\:]+/gim, "-");
  return `idxnow-${suffix}`;
}
export async function getYaIndexNowKey(requestApiUrl: string): Promise<string> {
  if (!requestApiUrl) {
    throw new Error("No request api url parameter.");
  }
  const fullProcessEnvName = `INDEX_NOW_API_KEY_${requestApiUrl}`;
  const tempRefOfEnv: string = process.env[fullProcessEnvName] || "";
  if (tempRefOfEnv) {
    return tempRefOfEnv;
  }
  if (!process.env["NEXTJS_ROOT_FOLDER"]) {
    throw new Error('No process.env["NEXTJS_ROOT_FOLDER"] variable!');
  }
  process.env[fullProcessEnvName] = "";
  const cwd = path.join(process.env["NEXTJS_ROOT_FOLDER"] || "", "public");
  const apiKeyFilePrefix = getApiKeyPrefix(requestApiUrl);
  for (let i = 0; i < 4; i++) {
    try {
      const yaIndexFiles = await glob(`${apiKeyFilePrefix}*.txt`, {
        cwd,
        withFileTypes: true,
        nocase: true,
      });
      for (const file of yaIndexFiles) {
        try {
          const fullpath = file.fullpath();
          if (!process.env[fullProcessEnvName]) {
            process.env[fullProcessEnvName] += await fsa.readFile(fullpath, {
              encoding: "utf-8",
            });
          } else {
            await fse.move(
              fullpath,
              path.join(
                path.dirname(fullpath),
                `deleted_${path.basename(fullpath)}`
              )
            );
          }
        } catch (e: any) {
          console.error(e.message || e);
          debugger;
        }
      }
      if (!process.env[fullProcessEnvName]) {
        const newUuid = uuid().replaceAll("-", "");
        const newFilepath = path.join(cwd, `${apiKeyFilePrefix}${newUuid}.txt`);
        await fsa.writeFile(newFilepath, newUuid);
      } else {
        break;
      }
    } catch (e: any) {
      console.error(e.message || e);
      debugger;
    }
  }
  return process.env[fullProcessEnvName] || "";
}
