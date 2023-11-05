import { createModule, gql } from "graphql-modules";
import util from "util";
import db from "@src/sql/execute-query";
import { GraphQLError, GraphQLResolveInfo } from "graphql";
import { fullTextSearch } from "@src/sql/full-text-search";
import { Schema } from "@root/schema/types/schema";
import dateToISO from "@src/utils/date-to-iso";

export const ManagementArticlesCardsModule = createModule({
  id: "management-article-cards-module",
  dirname: __dirname,
  typeDefs: [
    gql`
      type ArticleCard {
        id: ID
        title: String!
        handle: String!
        absURL: String
        displayingPageHandle: String
        publishedAt: Date
        updatedAt: Date
        score: Float
        fragment: String
        image: Image
        imageId: ID
        secondImage: Image
        secondImageId: ID
        viewed: Int
        templateId: ID
        datePublished: String
        dateModified: String
        description: String
      }
      type ManagementArticlesCards {
        search: String
        nodes(offset: Int, limit: Int): [ArticleCard]!
      }
      type Query {
        managementArticlesCards(
          search: String
          offset: Int
          limit: Int
        ): ManagementArticlesCards!
      }
    `,
  ],
  resolvers: {
    ArticleCard: {
      datePublished: async (
        parent: Schema.BlogArticle,
        variables: any,
        _ctx: any,
        info: GraphQLResolveInfo
      ) => {
        return parent.publishedAt
          ? dateToISO(parent.publishedAt)
          : dateToISO(parent.createdAt);
      },
      dateModified: async (
        parent: Schema.BlogArticle,
        variables: any,
        _ctx: any,
        info: GraphQLResolveInfo
      ) => {
        const existingImageId = parent.secondImageId || parent.imageId;
        return existingImageId
          ? dateToISO(new Date())
          : parent.updatedAt
          ? dateToISO(parent.updatedAt)
          : dateToISO(parent.createdAt);
      },
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
        if (!parent.imageId) {
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
    },
    ManagementArticlesCards: {
      search: async (
        parent: { search?: string; offset?: number; limit?: number },
        variables: { search?: string; offset?: number; limit?: number },
        _ctx: any,
        info: GraphQLResolveInfo
      ) => {
        let search = variables.search || parent.search || "";
        return search;
      },
      nodes: async (
        parent: { search?: string; offset?: number; limit?: number },
        variables: { search?: string; offset?: number; limit?: number },
        _ctx: any,
        info: GraphQLResolveInfo
      ) => {
        try {
          let search = variables.search || parent.search || "";
          const offset = variables.offset || parent.offset || 0;
          const limit = variables.limit || parent.limit || null;
          if (!search) {
            const offsetLimitString = limit
              ? ` LIMIT $limit OFFSET $offset`
              : ``;
            const articles = await db.excuteQuery({
              query:
                `select 
                  id, imageId, secondImageId, viewed, Coalesce(displayingPageHandle, handle, title, id) as handle, h2,
                  absURL, displayingPageHandle, title, publishedAt, updatedAt, description, 
                  null as fragment, null as score,
                viewed
                    from blog_article_handle 
                    Order By createdAt Desc, updatedAt Desc ` +
                offsetLimitString,
              variables: { offset, limit },
            });
            return articles;
          } else {
            return await fullTextSearch({
              search,
              offset,
              limit,
              naturalLanguageModeQuery: `
            select
                  id, imageId, secondImageId, viewed, Coalesce(displayingPageHandle, handle, title, id) as handle, h2, 
                  absURL, displayingPageHandle, title, publishedAt, updatedAt, description,
                  text as fragment,
                  MATCH (title,text,h2) AGAINST ($search IN NATURAL LANGUAGE MODE) as score
              from blog_article_handle 
                WHERE MATCH (title,text,h2) AGAINST ($search IN NATURAL LANGUAGE MODE)`,
              booleanModeQuery: `
            select
                  id, imageId, secondImageId, viewed, Coalesce(displayingPageHandle, handle, title, id) as handle, h2, 
                  absURL, displayingPageHandle, title, publishedAt, updatedAt, description, 
                  text as fragment,
                  MATCH (title,text,h2) AGAINST ($search IN BOOLEAN MODE) as score
              from blog_article_handle 
                WHERE MATCH (title,text,h2) AGAINST ($search IN BOOLEAN MODE)`,
            });
          }
        } catch (e: any) {
          console.error(e.stack || e.message || e);
          debugger;
          throw e;
        }
      },
    },
    Query: {
      managementArticlesCards: async (
        parent: any,
        variables: any,
        context: { manager: { id: string | number } },
        info: GraphQLResolveInfo
      ) => {
        if (!context.manager || !context.manager.id) {
          throw new GraphQLError("Manager Unauthorized");
        }
        const managerId = context.manager.id;
        return { ...parent, ...variables, managerId };
      },
    },
  },
});
