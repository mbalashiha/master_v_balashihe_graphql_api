import fetch from "cross-fetch";
import { glob } from "glob";
import path from "path";
import fsa from "fs/promises";

export async function getYaIndexNowKey(): Promise<string> {
  if (process.env.YANDEX_INDEX_NOW_KEY) {
    return process.env.YANDEX_INDEX_NOW_KEY;
  }
  const yaIndexFiles = await glob("yandex-index-now-*.txt", {
    cwd: path.join(process.env["NEXTJS_ROOT_FOLDER"] || "", "public"),
    stat: true,
    withFileTypes: true,
    nocase: true,
  });
  process.env.YANDEX_INDEX_NOW_KEY = "";
  for (const file of yaIndexFiles) {
    try {
      process.env.YANDEX_INDEX_NOW_KEY += await fsa.readFile(file.fullpath(), {
        encoding: "utf-8",
      });
    } catch (e: any) {
      console.error(e.message || e);
      debugger;
    }
  }
  return process.env.YANDEX_INDEX_NOW_KEY || "";
}
