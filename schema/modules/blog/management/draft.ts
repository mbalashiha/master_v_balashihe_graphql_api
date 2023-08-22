import { createModule, gql } from "graphql-modules";
import util from "util";
import db from "@src/sql/execute-query";
import { GraphQLError, GraphQLResolveInfo } from "graphql";
import { Schema } from "@root/schema/types/schema";
import { selectArticle } from "./sql";
import { ID } from "graphql-modules/shared/types";
export const mysqlFormatDatetime = (
  inDate: string | Date | null
): string | null => {
  if (inDate) {
    if (typeof inDate === "string") {
      inDate = new Date(inDate);
    }
    const timezoneOffset = inDate.getTimezoneOffset() * 60000;
    inDate = new Date(inDate.getTime() - timezoneOffset);
    let dt = inDate.toISOString().replace("T", " ").slice(0, 19);
    return dt;
  }
  return null;
};
export const BlogArticleDraftModule = createModule({
  id: "blog-article-draft-module",
  dirname: __dirname,
  typeDefs: [
    gql`
      type ArticleDraft {
        id: ID
        title: String
        handle: String
        autoHandleSlug: String
        absURL: String
        text: String
        textHtml: String
        textRawDraftContentState: String
        keyTextHtml: String
        h2: String
        orderNumber: Int
        blogCategoryId: ID
        category: CategoryId
        createdAt: Date
        updatedAt: Date
        publishedAt: Date
        existingArticleId: ID
        existingArticle: BlogArticle
        unPublished: Boolean
        notSearchable: Boolean
        notInList: Boolean
        imageId: ID
        image: Image
        secondImageId: ID
        secondImage: Image
        templateId: ID
        viewed: Int
      }
      input ArticleDraftInput {
        id: ID
        title: String
        handle: String
        autoHandleSlug: String
        absURL: String
        orderNumber: Int
        blogCategoryId: ID
        existingArticleId: ID
        imageId: ID
        secondImageId: ID
        unPublished: Boolean
        notSearchable: Boolean
        notInList: Boolean
        publishedAt: Date
        h2: String
        templateId: ID!
      }
      input ArticleTextDraftInput {
        id: ID
        text: String
        textHtml: String
        textRawDraftContentState: String
        existingArticleId: ID
      }
      input ArticleKeyTextDraftInput {
        id: ID
        keyTextHtml: String
        existingArticleId: ID
      }
      type ArticleDraftResponse {
        error: String
        message: String
        success: Boolean!
        updatedDraft: ArticleDraft
      }
      type Query {
        articleDraft(articleId: ID): ArticleDraft
      }
      type Mutation {
        saveArticleDraft(articleDraft: ArticleDraftInput): ArticleDraftResponse
        saveArticleTextDraft(
          articleTextDraft: ArticleTextDraftInput
        ): ArticleDraftResponse
        saveArticleKeyTextDraft(
          articleKeyText: ArticleKeyTextDraftInput!
        ): ArticleDraftResponse
        deleteArticleDraft(id: ID!): ArticleDraftResponse
      }
    `,
  ],
  resolvers: {
    ArticleDraftResponse: {
      updatedDraft: async (
        parent: {
          id?: string;
          managerId: string | number;
          articleId?: string | number;
          existingArticleId?: string | number;
          draftArticleId: string;
        },
        variables: void,
        context: { manager: { id: string | number } },
        info: GraphQLResolveInfo
      ) => {
        if (!context.manager || !context.manager.id) {
          throw new GraphQLError("Manager Unauthorized");
        }
        const { id, managerId, articleId, draftArticleId, existingArticleId } =
          parent;
        return await selectArticle({
          draftArticleId: id || draftArticleId,
          managerId: context.manager.id,
          articleId: articleId || existingArticleId,
        });
      },
    },
    ArticleDraft: {
      image: async (
        parent: Schema.BlogArticle,
        variables: any,
        _ctx: any,
        info: GraphQLResolveInfo
      ) => {
        if (!parent.imageId) {
          return null;
        }
        const rows = await db.excuteQuery({
          query: `select * from image where imageId=$imageId`,
          variables: parent,
        });
        if (rows && rows[0] && rows[0].imgSrc) {
          return rows[0];
        } else {
          return null;
        }
      },
      secondImage: async (
        parent: Schema.BlogArticle,
        variables: any,
        _ctx: any,
        info: GraphQLResolveInfo
      ) => {
        if (!parent.secondImageId) {
          return null;
        }
        const rows = await db.excuteQuery({
          query: `select * from image where imageId=$secondImageId`,
          variables: parent,
        });
        if (rows && rows[0] && rows[0].imgSrc) {
          return rows[0];
        } else {
          return null;
        }
      },
      category: async (
        parent: Schema.ArticleDraft,
        variables: void,
        _ctx: any,
        info: GraphQLResolveInfo
      ) => {
        return { id: parent.blogCategoryId || null };
      },
      existingArticle: async (
        parent: Schema.ArticleDraft,
        variables: void,
        _ctx: any,
        info: GraphQLResolveInfo
      ) => {
        let rows;
        try {
          if (parent.existingArticle) {
            return parent.existingArticle;
          }
          if (parent.existingArticleId) {
            rows = await db.excuteQuery({
              query: "select * from blog_article_handle Where id=?",
              variables: [parent.existingArticleId],
            });
          }
          return (rows && rows[0]) || null;
        } catch (e: any) {
          console.error(e);
          // debugger;
          throw e;
        }
      },
    },
    Mutation: {
      saveArticleDraft: async (
        parent: void,
        variables: { articleDraft: Schema.ArticleDraftInput },
        context: { manager: { id: string | number } },
        info: GraphQLResolveInfo
      ) => {
        if (!context.manager || !context.manager.id) {
          throw new GraphQLError("Manager Unauthorized");
        }
        try {
          const { articleDraft } = variables;
          const sqlResult = await db.excuteQuery({
            query: `call blog_article_save_draft(
            $managerId,
            $existingArticleId,
            $title,
            $handle,
            $autoHandleSlug,
            $blogCategoryId,
            $orderNumber,
            $imageId,            
            $unPublished,
            $notSearchable,
            $notInList,
            $absURL,
            $publishedAt,
            $h2,
            $secondImageId,
            $templateId
            );`,
            variables: {
              managerId: context.manager.id,
              existingArticleId: articleDraft.existingArticleId || null,
              title:
                (articleDraft.title || "").trim().replace(/\s+/gim, " ") ||
                null,
              handle: articleDraft.handle || null,
              autoHandleSlug: articleDraft.autoHandleSlug || null,
              blogCategoryId: articleDraft.blogCategoryId || null,
              orderNumber: articleDraft.orderNumber || null,
              imageId: articleDraft.imageId || null,
              unPublished: articleDraft.unPublished ? 1 : null,
              notSearchable: articleDraft.notSearchable ? 1 : null,
              notInList: articleDraft.notInList ? 1 : null,
              absURL: articleDraft.absURL || null,
              publishedAt: mysqlFormatDatetime(articleDraft.publishedAt),
              h2: articleDraft.h2 || null,
              secondImageId: articleDraft.secondImageId || null,
              templateId: articleDraft.templateId || null,
            },
          });
          const row = (sqlResult[0] && sqlResult[0][0]) || {};
          if (!row.message) {
            throw new Error("No message from sql procedure!");
          }
          return {
            managerId: context.manager.id,
            id: row.draftArticleId,
            articleId: articleDraft.existingArticleId || null,
            existingArticleId: articleDraft.existingArticleId || null,
            ...row,
          };
        } catch (e: any) {
          console.error(e.stack || e.message);
          throw e;
        }
      },
      saveArticleTextDraft: async (
        parent: void,
        variables: { articleTextDraft: Schema.ArticleTextDraftInput },
        context: { manager: { id: string | number } },
        info: GraphQLResolveInfo
      ) => {
        if (!context.manager || !context.manager.id) {
          throw new GraphQLError("Manager Unauthorized");
        }
        const { articleTextDraft } = variables;
        try {
          const { articleTextDraft } = variables;
          articleTextDraft.text = (articleTextDraft.text || "").trim();
          if (articleTextDraft.text && !articleTextDraft.textHtml) {
            throw new Error("Has text but no textHtml. Impossible!");
          }
          let sqlResult = await db.excuteQuery({
            query: `call blog_article_text_save_draft(
              $managerId,
              $existingArticleId,
              $text,
              $textHtml,
              $textRawDraftContentState
            );`,
            variables: {
              managerId: context.manager.id,
              existingArticleId: articleTextDraft.existingArticleId || null,
              text: articleTextDraft.text || null,
              textHtml: articleTextDraft.textHtml || null,
              textRawDraftContentState:
                articleTextDraft.textRawDraftContentState || null,
            },
          });
          if (!sqlResult) {
            throw new Error("sql procedure result is undefined!");
          }
          const row = (sqlResult[0] && sqlResult[0][0]) || {};
          let success = true;
          let error = row.error || null;
          let message = row.message || null;
          if (!message) {
            message = "No message from sql procedure!";
            if (!error) {
              error = message;
            }
          }
          return {
            success,
            error,
            message,
            managerId: context.manager.id,
            id: row.draftArticleId,
            articleId: articleTextDraft.existingArticleId || null,
            existingArticleId: articleTextDraft.existingArticleId || null,
            ...row,
          };
        } catch (e: any) {
          console.error(articleTextDraft);
          console.error(e.stack || e.message);
          // debugger;
          throw e;
        }
      },
      saveArticleKeyTextDraft: async (
        parent: void,
        variables: { articleKeyText: Schema.ArticleKeyTextDraftInput },
        context: { manager: { id: string | number } },
        info: GraphQLResolveInfo
      ) => {
        if (!context.manager || !context.manager.id) {
          throw new GraphQLError("Manager Unauthorized");
        }
        const { articleKeyText } = variables;
        try {
          let sqlResult = await db.excuteQuery({
            query: `call blog_article_keyTextHtml_save_draft(
              $managerId,
              $existingArticleId,
              $keyTextHtml
            );`,
            variables: {
              managerId: context.manager.id,
              existingArticleId: articleKeyText.existingArticleId || null,
              keyTextHtml: articleKeyText.keyTextHtml || null,
            },
          });
          if (!sqlResult) {
            throw new Error("sql procedure result is undefined!");
          }
          const row = (sqlResult[0] && sqlResult[0][0]) || {};
          let success = true;
          let error = row.error || null;
          let message = row.message || null;
          if (!message) {
            message = "No message from sql procedure!";
            if (!error) {
              error = message;
            }
          }
          return {
            success,
            error,
            message,
            managerId: context.manager.id,
            id: row.draftArticleId,
            articleId: articleKeyText.existingArticleId || null,
            existingArticleId: articleKeyText.existingArticleId || null,
            ...row,
          };
        } catch (e: any) {
          console.error(articleKeyText);
          console.error(e.stack || e.message);
          // debugger;
          throw e;
        }
      },
      deleteArticleDraft: async (
        parent: void,
        variables: { id: ID },
        context: { manager: { id: string | number } },
        info: GraphQLResolveInfo
      ) => {
        if (!context.manager || !context.manager.id) {
          throw new GraphQLError("Manager Unauthorized");
        }
        const { id } = variables;
        try {
          const rows = await db.query(
            "select * from draft_blog_article where draftArticleId=unhex($id)",
            { id }
          );
          const draft = rows && rows[0];
          let success = true;
          let error = null;
          let message = null;
          if (draft) {
            const rows = await db.query(
              "delete from draft_blog_article where draftArticleId=unhex($id)",
              { id }
            );
          } else {
            success = false;
            error = "Recieved unexisting draft id!";
            message = error;
          }
          return {
            success,
            error,
            message,
            managerId: context.manager.id,
            id: null,
            articleId: draft.existingArticleId || null,
            existingArticleId: draft.existingArticleId || null,
          };
        } catch (e: any) {
          console.error(id);
          console.error(e.stack || e.message);
          let error = e.stack || e.message || e;
          return { success: false, error, message: error };
        }
      },
    },
    Query: {
      articleDraft: async (
        parent: void,
        variables: { articleId?: string },
        context: { manager: { id: string | number } },
        info: GraphQLResolveInfo
      ) => {
        const { articleId } = variables;
        if (!context.manager || !context.manager.id) {
          throw new GraphQLError("Manager Unauthorized");
        }
        const managerId = context.manager.id;
        const result = await selectArticle({ managerId, articleId });
        return result;
      },
    },
  },
});
