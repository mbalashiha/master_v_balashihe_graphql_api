export default function getnextJsPagePath(filename: string) {
  if (filename) {
    filename = filename.replace(/\/\[[^\]]*\]\.js$/i, "");
    filename = filename.replace(/\/index\.js$/i, "");
    const pIndex = filename.lastIndexOf("/pages/");
    const debugPart =
      pIndex >= 0 ? filename.substring(pIndex + "/pages/".length) : filename;
    filename = debugPart;
    return filename;
  } else {
    return "";
  }
}
