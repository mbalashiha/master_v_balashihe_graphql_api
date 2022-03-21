const { merge } = require("webpack-merge");
const path = require("path");
const webpack = require('webpack')
const nodeExternals = require("webpack-node-externals");
const WebpackShellPluginNext = require("webpack-shell-plugin-next");
const Dotenv = require("dotenv-webpack");

const NODE_ENV = "development";
module.exports = {
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
    alias: {
      "@src": path.resolve(__dirname, "src"),
      "@root": path.resolve(__dirname, "./"),
    },
  },
  module: {
    rules: [
      {
        test: /\.tsx?$/,
        use: ["ts-loader"],
        exclude: /node_modules/,
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
};
