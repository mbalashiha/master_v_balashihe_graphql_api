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
        test: /\.tsx?$/,
        exclude: /node_modules/,
        use: [
          {
            loader: "ts-loader",
            options: {
              compilerOptions: { noEmit: false },
            },
          },
        ],
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
