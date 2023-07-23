process.env.NODE_ENV = "production";
const path = require("path");
const webpack = require("webpack");
const nodeExternals = require("webpack-node-externals");
const { merge } = require("webpack-merge");
const resolveTsconfigPathsToAlias = require("./resolve-tsconfig-path-to-webpack-alias");
const config = require("./webpack.config");

module.exports = {
  ...config,
  devtool: false,
  mode: "production",
  watch: false,
  output: {
    path: path.resolve(__dirname),
    filename: "production-build.js",
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
              configFile: "tsconfig.prod.json",
            },
          },
        ],
      },
    ],
  },
  plugins: [
    new Dotenv({
      path: path.resolve(__dirname, ".env"),
    }),
    new Dotenv({
      path: path.resolve(__dirname, ".env.local"),
    }),
    new Dotenv({
      path: path.resolve(__dirname, `.env.${process.env.NODE_ENV}`),
    }),
  ],
};
