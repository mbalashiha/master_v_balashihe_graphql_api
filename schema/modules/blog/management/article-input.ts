import { createModule, gql } from "graphql-modules";
import util from "util";
import db from "@src/sql/execute-query";
import sanitizeHtml from "sanitize-html";
import { GraphQLError, GraphQLResolveInfo } from "graphql";
import { GraphqlContext } from "@root/types/express-custom";
import { Schema } from "@root/schema/types/schema";
import { selectArticleDraft } from "./sql";

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
        absURL: String
        text: String
        textHtml: String
        textRawDraftContentState: String
        unPublished: Boolean
        notSearchable: Boolean
        notInList: Boolean
        orderNumber: Int
        blogCategoryId: ID
        existingArticleId: ID
        renderHtml: String
        imageId: ID
      }
      type DeleteArticleResponse {
        error: String
        message: String
        success: Boolean!
        articleList: ManagementArticlesCards!
      }
      type SavedArticleResponse {
        error: String
        message: String
        success: Boolean!
        articleId: ID
        articleDraft: ArticleDraft!
      }
      type Mutation {
        managementSearchArticles(search: String): [BlogArticle]!
        saveArticle(article: ArticleInput!): SavedArticleResponse!
        deleteArticle(id: ID!, search: String): DeleteArticleResponse!
      }
      type Query {
        managementGetArticles(search: String): [BlogArticle]!
      }
    `,
  ],
  resolvers: {
    SavedArticleResponse: {
      articleDraft: async (
        parent: { articleId?: string },
        variables: void,
        context: { manager: { id: string | number } },
        info: GraphQLResolveInfo
      ) => {
        try {
          const { articleId } = parent;
          if (!context.manager || !context.manager.id) {
            throw new GraphQLError("Manager Unauthorized");
          }
          const managerId = context.manager.id;
          const result = await selectArticleDraft({ managerId, articleId });
          return result;
        } catch (e: any) {
          console.error(e.stack || e.message || e);
          debugger;
          throw e;
        }
      },
    },
    DeleteArticleResponse: {
      articleList: async (
        parent: void,
        variables: void,
        context: GraphqlContext,
        info: GraphQLResolveInfo
      ) => {
        if (!context.manager || !context.manager.id) {
          throw new Error("Manager Unauthorized");
        }
        const rows = await db.excuteQuery({
          query: "select * from blog_article",
          variables: [],
        });
        return rows;
      },
    },
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
          query: "select * from blog_article",
          variables: [],
        });
        return rows;
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
        const articleId = article.existingArticleId || null;

        try {
          article.text = (article.text || "").trim();
          if (article.text && !article.textHtml) {
            throw new Error("Has text but no textHtml. Impossible!");
          }
          const { renderHtml, imageId } = article;
          if ((renderHtml || "").trim().length < 6) {
            throw new Error("No correct renderHtml for article.");
          }
          let sqlResult = await db.excuteQuery({
            query: `call blog_save_article(
            $managerId,
            $existingArticleId,
            $title,
            $handle,
            $autoHandleSlug,
            $absURL,
            $blogCategoryId,
            $orderNumber,
            $text,
            $textHtml,
            $textRawDraftContentState,
            $renderHtml,
            $imageId,
            $unPublished,
            $notSearchable,
            $notInList
            );`,
            variables: {
              managerId: context.manager.id,
              existingArticleId: article.existingArticleId || null,
              title:
                (article.title || "").trim().replace(/\s+/gim, " ") || null,
              handle: article.handle || null,
              autoHandleSlug: article.autoHandleSlug || null,
              absURL: article.absURL || null,
              blogCategoryId: article.blogCategoryId || null,
              orderNumber: article.orderNumber || null,
              text: (article.text || "").replace(/\s+/gim, " ") || null,
              textHtml: article.textHtml || null,
              textRawDraftContentState:
                article.textRawDraftContentState || null,
              renderHtml: renderHtml || null,
              imageId: imageId || null,
              unPublished: article.unPublished || null,
              notSearchable: article.notSearchable || null,
              notInList: article.notInList || null,
            },
          });
          if (!sqlResult) {
            throw new Error("sql procedure result is undefined!");
          }
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
          console.log(article);
          console.error(e.stack || e.message);
          debugger;
          return {
            articleId,
            success: false,
            error: e.stack || e.message || e,
          };
        }
      },
      deleteArticle: async (
        parent: void,
        variables: { id: string | number; search?: string },
        context: GraphqlContext,
        info: GraphQLResolveInfo
      ) => {
        if (!context.manager || !context.manager.id) {
          throw new Error("Manager Unauthorized");
        }
        const { id } = variables;
        const search = variables.search || "";
        try {
          const sqlResult = await db.excuteQuery({
            query: `delete from blog_article where id=$id`,
            variables: {
              id,
            },
          });
          return {
            search,
            success: true,
            message: "article deleted",
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
