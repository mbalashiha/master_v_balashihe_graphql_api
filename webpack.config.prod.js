// const { merge } = require("webpack-merge");
const path = require("path");
const webpack = require("webpack");
const nodeExternals = require("webpack-node-externals");
const Dotenv = require("dotenv-webpack");
const resolveTsconfigPathsToAlias = require("./resolve-tsconfig-path-to-webpack-alias");

module.exports = {
  entry: "./src/index.ts",
  devtool: false,
  mode: "production",
  target: "node",
  node: {
    // Need this when working with express, otherwise the build fails
    __dirname: false, // if you don't put this is, __dirname
    __filename: false, // and __filename return blank or /
  },
  output: {
    path: path.resolve(__dirname, "production"),
    filename: "index.js",
  },
  resolve: {
    extensions: [".ts", ".js", ".tsx", ".jsx"],
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
            options: { configFile: "./tsconfig.prod.json" },
          },
        ],
      },
    ],
  },
  externals: [nodeExternals()],
  plugins: [
    new Dotenv({
      path: path.resolve(__dirname, "./.env.local"), // load this now instead of the ones in '.env'
    }),
  ],
};
