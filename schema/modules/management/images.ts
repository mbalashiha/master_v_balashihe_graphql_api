import { createModule, gql } from "graphql-modules";
import util from "util";
import db from "@src/sql/execute-query";
import { GraphQLError, GraphQLResolveInfo } from "graphql";
import { isPositiveInteger } from "@src/utils/type-checkers";
import { Schema } from "@root/schema/types/schema";
import { inputAdornmentClasses } from "@mui/material";

export const imagesModule = createModule({
  id: "images-module",
  dirname: __dirname,
  typeDefs: [
    gql`
      input ImageInput {
        imageId: ID
        imgSrc: String
        title: String
        width: Int
        height: Int
        format: String
        orderNumber: Int
        originalWidth: Int
        originalHeight: Int
        pathOfOriginal: String
        altText: String
      }
      input ImageArrayInput {
        existingArticleId: ID
        images: [ImageInput]!
      }
      type UpdatedImagesResponse {
        existingArticleId: ID
        images: [Image]
      }
      type Mutation {
        updateImageMetadata(input: ImageArrayInput): UpdatedImagesResponse
      }
      type Query {
        images(offset: Int, limit: Int): Image
      }
    `,
  ],
  resolvers: {
    Mutation: {
      updateImageMetadata: async (
        _: any,
        variables: { input: Schema.ImageArrayInput },
        context: { manager: { id: string | number } },
        info: GraphQLResolveInfo
      ) => {
        if (!context.manager || !context.manager.id) {
          throw new GraphQLError("Manager Unauthorized");
        }
        try {
          const { existingArticleId, images } = variables.input;
          const returningImages = [];
          for (const image of images) {
            const { imageId, imgSrc, title, altText } = image;
            let rows: any[] | undefined;
            if (imageId) {
              rows = await db.query(
                `select imageId, title, altText from image where imageId=$imageId`,
                {
                  imageId,
                }
              );
            } else if (imgSrc) {
              rows = await db.query(
                `select imageId, title, altText from image where imgSrc=$imgSrc`,
                {
                  imageId,
                }
              );
            }
            const existing = rows && rows[0];
            if (existing) {
              if (
                (existing.title || null) != (title || null) ||
                (existing.altText || null) != (altText || null)
              ) {
                await db.query(
                  `update image set title=$title, altText=$altText where imageId=$imageId`,
                  {
                    imageId: existing.imageId,
                    title: title || null,
                    altText: altText || null,
                  }
                );
              }
              const rows = await db.query(
                `select * from image where imageId=$imageId`,
                {
                  imageId: existing.imageId,
                }
              );
              if (rows && rows[0]) {
                returningImages.push(rows[0]);
              }
            }
          }
          return { existingArticleId, images: returningImages };
        } catch (e: any) {
          console.error(e.stack || e.message);
          throw e;
        }
      },
    },
    Query: {
      images: () => {
        return "Hello world!";
      },
    },
  },
});
