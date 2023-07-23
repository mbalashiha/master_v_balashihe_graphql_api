process.env.NODE_ENV = "development";
const Dotenv = require("dotenv-webpack");
const path = require("path");
const webpack = require("webpack");
const nodeExternals = require("webpack-node-externals");
const WebpackShellPluginNext = require("webpack-shell-plugin-next");
const resolveTsconfigPathsToAlias = require("./resolve-tsconfig-path-to-webpack-alias");

module.exports = {
  devServer: {
    historyApiFallback: true,
  },
  entry: "./src/index.ts",
  devtool: "source-map",
  mode: "development",
  target: "node",
  node: {
    // Need this when working with express, otherwise the build fails
    __dirname: false, // if you don't put this is, __dirname
    __filename: false, // and __filename return blank or /
  },
  output: {
    path: path.resolve(__dirname, "build"),
    filename: "index.js",
  },
  resolve: {
    extensions: [".ts", ".js", ".tsx", ".jsx", ".json"],
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
              configFile: "tsconfig.json",
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
    // new webpack.DefinePlugin({
    //   "process.env": JSON.stringify(enviroment),
    // }),
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
  watch: true,
  watchOptions: {
    ignored: [
      "/build",
      "/build/**",
      "*.cache.json",
      "/production/master_v_balashihe_graphql_api",
      "/production/master_v_balashihe_graphql_api/**",
      "/production-build.js",
    ],
  },
};
