import { createModule, gql } from "graphql-modules";
import util from "util";
import db from "@src/sql/execute-query";
import { GraphQLError, GraphQLResolveInfo } from "graphql";
import { GraphqlContext } from "@root/types/express-custom";
import { Schema } from "@root/schema/types/schema";
import { selectArticle } from "./sql";
import { mysqlFormatDatetime } from "./draft";
import fetch from "cross-fetch";
import { glob } from "glob";
import path from "path";
import fsa from "fs/promises";
import { postIndexNow } from "@src/utils/index-now/post-index-now";
import { getYaIndexNowKey } from "@src/utils/index-now/get-yandex-index-now-key";

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
        description: String
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
        saveArticle(
          article: ArticleInput!
          hostOrigin: String!
        ): SavedArticleResponse!
        deleteArticle(
          id: ID!
          search: String
          hostOrigin: String!
        ): DeleteArticleResponse!
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
        variables: { article: Schema.ArticleInput; hostOrigin: string },
        context: GraphqlContext,
        info: GraphQLResolveInfo
      ) => {
        if (!context.manager || !context.manager.id) {
          throw new Error("Manager Unauthorized");
        }
        const { article, hostOrigin } = variables;
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
            $templateId,
            $description
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
              description: article.description || null,
            },
          });
          if (!sqlResult) {
            throw new Error("sql procedure result is undefined!");
          }
          const selectRow: {
            success?: boolean;
            message?: string;
            articleId?: string | number;
            articleHandle?: string;
            categoryHandle?: string;
            articleAbsUrl?: string;
            categoryAbsUrl?: string;
          } = (sqlResult[0] && sqlResult[0][0]) || {};
          if (!selectRow.message) {
            throw new Error("No message from sql procedure!");
          }
          const handlesToRevalidate = [];
          if (selectRow.articleHandle) {
            handlesToRevalidate.push(selectRow.articleHandle);
          }
          if (selectRow.categoryHandle) {
            handlesToRevalidate.push(selectRow.categoryHandle);
          }
          if (selectRow.articleAbsUrl) {
            handlesToRevalidate.push(selectRow.articleAbsUrl);
          }
          if (selectRow.categoryAbsUrl) {
            handlesToRevalidate.push(selectRow.categoryAbsUrl);
          }
          if (
            handlesToRevalidate.length &&
            hostOrigin &&
            process.env.REVALIDATE_API_URL
          ) {
            const apiUrl = `${hostOrigin}${process.env.REVALIDATE_API_URL}`;
            const postBody = {
              handlesToRevalidate,
              secret: process.env.MY_SECRET_TOKEN || "",
            };
            try {
              const fresp = await fetch(apiUrl, {
                method: "POST",
                headers: {
                  "Content-Type": "application/json; charset=utf-8",
                },
                body: JSON.stringify(postBody),
              });
              const indexNowKey = await getYaIndexNowKey();
              const indexNowResult = await postIndexNow({
                apiUrl: `https://yandex.com/indexnow`,
                indexNowKey,
                urlList: handlesToRevalidate,
              });
              // console.l//og(indexNowResult);
              // debugger;
              // const json = await fresp.json();
              // console.log(json);
              // debugger;
            } catch (e: any) {
              console.error(e.message || e);
              debugger;
            }
          }
          return {
            ...selectRow,
            success: Boolean(selectRow.success),
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
        variables: { id: string | number; search?: string; hostOrigin: string },
        context: GraphqlContext,
        info: GraphQLResolveInfo
      ) => {
        if (!context.manager || !context.manager.id) {
          throw new Error("Manager Unauthorized");
        }
        const { id, hostOrigin } = variables;
        const search = variables.search || "";
        try {
          const selectResult = await db.query(
            `SELECT a.id AS articleId, 
				CONCAT('/',ph.handle) AS articleHandle,
				CONCAT('/',ch.handle) AS categoryHandle,
				CONCAT('/',aph.handle) AS articleAbsUrl,
				CONCAT('/',ach.handle) AS categoryAbsUrl
			 FROM blog_article a
			  LEFT JOIN page_handle ph ON ph.id=a.handleId
			  LEFT JOIN page_handle aph ON aph.id=a.absURLid
			  LEFT JOIN blog_category bc ON bc.blogCategoryId=a.blogCategoryId
			  LEFT JOIN page_handle ch ON ch.id=bc.handleId 
			  LEFT JOIN page_handle ach ON ach.id=bc.absURLid
			   WHERE a.id=$id`,
            {
              id,
            }
          );
          const handlesToRevalidate: string[] = [];
          const selectRow = selectResult && selectResult[0];
          if (selectRow) {
            if (selectRow.articleHandle) {
              handlesToRevalidate.push(selectRow.articleHandle);
            }
            if (selectRow.categoryHandle) {
              handlesToRevalidate.push(selectRow.categoryHandle);
            }
            if (selectRow.articleAbsUrl) {
              handlesToRevalidate.push(selectRow.articleAbsUrl);
            }
            if (selectRow.categoryAbsUrl) {
              handlesToRevalidate.push(selectRow.categoryAbsUrl);
            }
          }
          const sqlResult = await db.excuteQuery({
            query: `delete from blog_article where id=$id`,
            variables: {
              id,
            },
          });
          if (
            handlesToRevalidate.length &&
            hostOrigin &&
            process.env.REVALIDATE_API_URL
          ) {
            const apiUrl = `${hostOrigin}${process.env.REVALIDATE_API_URL}`;
            const postBody = {
              handlesToRevalidate,
              secret: process.env.MY_SECRET_TOKEN || "",
            };
            try {
              const fresp = await fetch(apiUrl, {
                method: "POST",
                headers: {
                  "Content-Type": "application/json; charset=utf-8",
                },
                body: JSON.stringify(postBody),
              });
              const indexNowKey = await getYaIndexNowKey();
              const indexNowResult = await postIndexNow({
                apiUrl: `https://yandex.com/indexnow`,
                indexNowKey,
                urlList: handlesToRevalidate,
              });
              console.log(indexNowResult);
              debugger;
              // const json = await fresp.json();
              // console.log(json);
              // debugger;
            } catch (e: any) {
              console.error(e.message || e);
              debugger;
            }
          }
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
