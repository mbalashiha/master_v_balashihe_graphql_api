import { createModule, gql } from "graphql-modules";
import util from "util";
import db from "@src/sql/execute-query";
import sanitizeHtml from "sanitize-html";
import { GraphQLError, GraphQLResolveInfo } from "graphql";
import { GraphqlContext } from "@root/types/express-custom";
import { Schema } from "@root/schema/types/schema";
import { selectArticle } from "./sql";
import { mysqlFormatDatetime } from "./draft";

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
        keyTextHtml: String
        unPublished: Boolean
        notSearchable: Boolean
        notInList: Boolean
        orderNumber: Int
        blogCategoryId: ID
        existingArticleId: ID
        renderHtml: String
        imageId: ID
        publishedAt: Date
        h2: String
        secondImageId: ID
        templateId: ID
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
        managementCheckArticle(title: String, handle: String): BlogArticle
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
          const result = await selectArticle({ managerId, articleId });
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
        // const { search } = variables;

        if (!context.manager || !context.manager.id) {
          throw new Error("Manager Unauthorized");
        }
        const rows = await db.excuteQuery({
          query: "select * from blog_article_handle",
          variables: [],
        });
        return rows;
      },
      managementCheckArticle: async (
        parent: void,
        variables: { title: string; handle: string },
        context: GraphqlContext,
        info: GraphQLResolveInfo
      ) => {
        const { title, handle } = variables;
        if (!context.manager || !context.manager.id) {
          throw new Error("Manager Unauthorized");
        }
        const rows = await db.excuteQuery({
          query:
            "select * from blog_article_handle where title=$title Or handle=$handle",
          variables: { title: title || null, handle: handle || null },
        });
        return (rows && rows[0]) || null;
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
            $notInList,
            $keyTextHtml,
            $publishedAt,
            $h2,
            $secondImageId,
            $templateId
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
              unPublished: article.unPublished ? 1 : null,
              notSearchable: article.notSearchable ? 1 : null,
              notInList: article.notInList ? 1 : null,
              keyTextHtml: article.keyTextHtml || null,
              publishedAt: mysqlFormatDatetime(article.publishedAt),
              h2: article.h2 || null,
              secondImageId: article.secondImageId || null,
              templateId: article.templateId || null,
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
          console.error(e.stack || e.message || e.stack || e);
          let errorMessage = e.message || e.stack || e;
          // const m = errorMessage.match(
          //   /ER_DUP_ENTRY\:\s+Duplicate entry\s+'([^\'\"]+)'/im
          // );
          // if (m && m[1]) {
          //   const duplicateTitle = m[1];
          //   errorMessage = `Статья и именем "${duplicateTitle}" уже существует. Перейти к редактированию существующей статьи?`;
          //   // await db.excuteQuery({query: "select id from blog_article_handle Where title=$title Or handle=$handle"})
          // }
          return {
            articleId,
            success: false,
            error: errorMessage,
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
