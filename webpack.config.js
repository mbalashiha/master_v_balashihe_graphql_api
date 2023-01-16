const { merge } = require("webpack-merge");
const path = require("path");
const webpack = require("webpack");
const nodeExternals = require("webpack-node-externals");
const WebpackShellPluginNext = require("webpack-shell-plugin-next");
const TerserPlugin = require("terser-webpack-plugin");
const Dotenv = require("dotenv-webpack");
const resolveTsconfigPathsToAlias = require("./resolve-tsconfig-path-to-webpack-alias");
const NODE_ENV = "development";
module.exports = {
  devServer: {
    historyApiFallback: true,
  },
  entry: "./src/index.ts",
  devtool: false,
  mode: "development",
  target: "node",
  output: {
    path: path.resolve(__dirname, "build"),
    filename: "index.js",
  },
  resolve: {
    extensions: [".ts", ".js"],
    alias: { ...resolveTsconfigPathsToAlias() },
  },
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
  externals: [nodeExternals()],
  plugins: [
    new WebpackShellPluginNext({
      onBuildEnd: {
        scripts: ["yarn run:dev"],
        blocking: false,
        parallel: true,
      },
    }),
    new Dotenv({
      path: path.resolve(__dirname, "./.env.local"), // load this now instead of the ones in '.env'
    }),
    new webpack.SourceMapDevToolPlugin({
      filename: "[file].map",
      fallbackModuleFilenameTemplate: "[absolute-resource-path]",
      moduleFilenameTemplate: "[absolute-resource-path]",
    }),
  ],
  watch: true,
  watchOptions: {
    ignored: ["build/**", "/build", "/build/**", "*.cache.json"],
  },
  optimization: {},
};
