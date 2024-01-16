import { createModule, gql } from "graphql-modules";
import util from "util";
import { db } from "@src/sql";
import { GraphQLResolveInfo } from "graphql";

export const imagesQueryModule = createModule({
  id: "images-query-module",
  dirname: __dirname,
  typeDefs: [
    gql`
      type Query {
        getTickerImages: [Image]
      }
    `,
  ],
  resolvers: {
    Mutation: {},
    Query: {
      getTickerImages: async (
        parent: any,
        variables: any,
        _ctx: any,
        info: GraphQLResolveInfo
      ) => {
        return await db.query(
          `
          SELECT i.* FROM image i
            Left JOIN image i2 ON 
                SUBSTRING_INDEX(i.imgSrc, '.', -1) != 'webp' AND 
                i2.imageId != i.imageId And 
                i2.imgSrc = Concat(SUBSTRING(i.imgSrc, 1, LENGTH(i.imgSrc)-Length(SUBSTRING_INDEX(i.imgSrc, '.', -1))), 'webp')
            WHERE i.imgSrc Like '%/ticker/%' And i2.imageId IS NULL ORDER BY RAND()
          `
        );
      },
    },
  },
});
