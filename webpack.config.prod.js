const { merge } = require("webpack-merge");
const path = require("path");
const nodeExternals = require("webpack-node-externals");
const WebpackShellPluginNext = require("webpack-shell-plugin-next");

const NODE_ENV = "production";
const common = require("./webpack.config.js");

module.exports = merge(common, {
  mode: "production",
  watch: false,
  module: {
    rules: [
      {
        test: /\.ts$/,
        enforce: "pre",
        loader: "ts-loader",
        options: {
          configFile: "tsconfig.prod.json",
        },
      },
    ],
  },
  plugins: [
    new WebpackShellPluginNext({
      onBuildEnd: {
        scripts: [],
        blocking: false,
        parallel: true,
      },
    }),
  ],
});
