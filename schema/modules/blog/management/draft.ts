import { createModule, gql } from "graphql-modules";
import util from "util";
import db from "@src/db/execute-query";
import { GraphQLError, GraphQLResolveInfo } from "graphql";
import { Schema } from "@root/schema/types/schema";
import { selectArticleDraft } from "./sql";
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
        text: String
        textHtml: String
        textRawDraftContentState: String
        published: Boolean
        orderNumber: Int
        blogCategoryId: ID
        category: CategoryId
        createdAt: Date
        updatedAt: Date
        publishedAt: Date
        existingArticleId: ID
        existingArticle: BlogArticle
      }
      input ArticleDraftInput {
        id: ID
        title: String
        handle: String
        autoHandleSlug: String
        published: Boolean
        orderNumber: Int
        blogCategoryId: ID
        existingArticleId: ID
      }
      input ArticleTextDraftInput {
        id: ID
        text: String
        textHtml: String
        textRawDraftContentState: String
        existingArticleId: ID
      }
      type ArticleDraftResponse {
        message: String
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
        ctx: void,
        info: GraphQLResolveInfo
      ) => {
        const { id, managerId, articleId, draftArticleId, existingArticleId } =
          parent;
        return await selectArticleDraft({
          draftArticleId: id || draftArticleId,
          managerId,
          articleId: articleId || existingArticleId,
        });
      },
    },
    ArticleDraft: {
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
          if (parent.existingArticleId) {
            rows = await db.excuteQuery({
              query: "select * from blog_article Where id=?",
              variables: [parent.existingArticleId],
            });
          }
          return (rows && rows[0]) || null;
        } catch (e: any) {
          console.error(e);
          debugger;
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
            $published,
            $orderNumber
            );`,
            variables: {
              managerId: context.manager.id,
              existingArticleId: articleDraft.existingArticleId || null,
              title: articleDraft.title || null,
              handle: articleDraft.handle || null,
              autoHandleSlug: articleDraft.autoHandleSlug || null,
              blogCategoryId: articleDraft.blogCategoryId || null,
              published: articleDraft.published ? 1 : null,
              orderNumber: articleDraft.orderNumber || null,
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
          debugger;
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
        try {
          const { articleTextDraft } = variables;
          if (articleTextDraft.text && !articleTextDraft.textHtml) {
            throw new Error("Has text but no textHtml. Impossible!");
          }
          const sqlResult = await db.excuteQuery({
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
          const row = (sqlResult[0] && sqlResult[0][0]) || {};
          if (!row.message) {
            throw new Error("No message from sql procedure!");
          }
          return {
            managerId: context.manager.id,
            id: row.draftArticleId,
            articleId: articleTextDraft.existingArticleId || null,
            existingArticleId: articleTextDraft.existingArticleId || null,
            ...row,
          };
        } catch (e: any) {
          console.error(e.stack || e.message);
          debugger;
          throw e;
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
        const result = await selectArticleDraft({ managerId, articleId });
        return result;
      },
    },
  },
});
