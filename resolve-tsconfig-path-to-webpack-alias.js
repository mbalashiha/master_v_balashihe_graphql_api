const { resolve } = require("path");
const fs = require("fs");
const Hjson = require("hjson");
/**
 * Resolve tsconfig.json paths to Webpack aliases
 * @param  {string} tsconfigPath           - Path to tsconfig
 * @param  {string} webpackConfigBasePath  - Path from tsconfig to Webpack config to create absolute aliases
 * @return {object}                        - Webpack alias config
 */
function resolveTsconfigPathsToAlias({
  tsconfigPath = "./tsconfig.json",
  webpackConfigBasePath = __dirname,
} = {}) {
  const { paths = {} } =
    Hjson.parse(fs.readFileSync(tsconfigPath, "utf8")).compilerOptions || {};

  const aliases = {};

  Object.keys(paths).forEach((item) => {
    const key = item.replace("/*", "");
    const value = resolve(
      webpackConfigBasePath,
      paths[item][0].replace("/*", "").replace("*", "")
    );

    aliases[key] = value;
  });

  return aliases;
}

module.exports = resolveTsconfigPathsToAlias;
