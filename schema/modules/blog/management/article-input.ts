import { createModule, gql } from "graphql-modules";
import util from "util";
import expressJwt from "express-jwt";
import jwt from "jsonwebtoken";
import db from "@src/db/execute-query";
import { GraphQLResolveInfo } from "graphql";
import { isPositiveInteger } from "@src/utils/type-checkers";
import { sql } from "@schema/sql-query";
import { Console } from "console";
import { normalizePriceCurrency } from "@src/utils/currency/converter";
import { FullProductInput, ProductInput } from "@schema/types/indext";
import { simpleDecrypt } from "@src/encryption/message-hmac-private-key";
import cookieParser from "cookie-parser";
import { GraphqlContext } from "@root/types/express-custom";
import { Schema } from "@root/schema/types/schema";

export const BlogManagementModule = createModule({
  id: "blog-article-input-module",
  dirname: __dirname,
  typeDefs: [
    gql`
      input ArticleInput {
        id: ID
        title: String
        handle: String
        autoHandleSlug: String
        text: String
        textHtml: String
        textRawDraftContentState: String
        published: Boolean
        orderNumber: Int
        blogCategoryId: ID
        existingArticleId: ID
      }
      type SavedArticleResponse {
        error: String
        message: String
        success: Boolean!
      }
      type Mutation {
        managementSearchArticles(search: String): [BlogArticle]!
        saveArticle(article: ArticleInput!): SavedArticleResponse!
      }
      type Query {
        managementGetArticles(search: String): [BlogArticle]!
      }
    `,
  ],
  resolvers: {
    Query: {
      managementGetArticles: async (
        parent: void,
        variables: { search: string },
        context: GraphqlContext,
        info: GraphQLResolveInfo
      ) => {
        const { search } = variables;

        if (!context.manager || !context.manager.id) {
          throw new Error("Manager Unauthorized");
        }
        const rows = await db.excuteQuery({
          query: "select * from managers where id=?",
          variables: [],
        });
      },
    },
    Mutation: {
      saveArticle: async (
        parent: void,
        variables: { article: Schema.ArticleInput },
        context: GraphqlContext,
        info: GraphQLResolveInfo
      ) => {
        if (!context.manager || !context.manager.id) {
          throw new Error("Manager Unauthorized");
        }
        const { article } = variables;
        try {
          const sqlResult = await db.excuteQuery({
            query: `call blog_save_article(
            $managerId,
            $existingArticleId,
            $title,
            $handle,
            $autoHandleSlug,
            $blogCategoryId,
            $published,
            $orderNumber,
            $text,
            $textHtml,
            $textRawDraftContentState
            );`,
            variables: {
              managerId: context.manager.id,
              existingArticleId: article.existingArticleId || null,
              title: article.title || null,
              handle: article.handle || null,
              autoHandleSlug: article.autoHandleSlug || null,
              blogCategoryId: article.blogCategoryId || null,
              published: article.published ? 1 : null,
              orderNumber: article.orderNumber || null,
              text: article.text || null,
              textHtml: article.textHtml || null,
              textRawDraftContentState:
                article.textRawDraftContentState || null,
            },
          });
          const row: {
            success?: boolean;
            message?: string;
            articleId?: string | number;
          } = (sqlResult[0] && sqlResult[0][0]) || {};
          if (!row.message) {
            throw new Error("No message from sql procedure!");
          }
          return {
            ...row,
            success: Boolean(row.success),
          };
        } catch (e: any) {
          console.error(e.stack || e.message);
          return { success: false, error: e.stack || e.message || e };
        }
      },
      managementSearchArticles: async (
        parent: void,
        variables: { search: string },
        context: GraphqlContext,
        info: GraphQLResolveInfo
      ) => {
        const { search } = variables;

        if (!context.manager || !context.manager.id) {
          throw new Error("Manager Unauthorized");
        }
      },
    },
  },
});
