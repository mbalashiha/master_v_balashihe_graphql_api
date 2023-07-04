import { createModule, gql } from "graphql-modules";
import util from "util";
import db from "@src/sql/execute-query";
import { GraphQLError, GraphQLResolveInfo } from "graphql";
import { fullTextSearch } from "@src/sql/full-text-search";

export const ManagementArticlesCardsModule = createModule({
  id: "management-article-cards-module",
  dirname: __dirname,
  typeDefs: [
    gql`
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
                `select id, imageId, Coalesce(displayingPageHandle, handle, title, id) as handle, absURL, displayingPageHandle, title, publishedAt, null as fragment, null as score 
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
            select id, imageId, Coalesce(displayingPageHandle, handle, title, id) as handle, absURL, displayingPageHandle, title, publishedAt, text as fragment,
                  MATCH (title,text) AGAINST ($search IN NATURAL LANGUAGE MODE) as score
              from blog_article_handle 
                WHERE MATCH (title,text) AGAINST ($search IN NATURAL LANGUAGE MODE)`,
              booleanModeQuery: `
            select id, imageId, Coalesce(displayingPageHandle, handle, title, id) as handle, absURL, displayingPageHandle, title, publishedAt, text as fragment,
                  MATCH (title,text) AGAINST ($search IN BOOLEAN MODE) as score
              from blog_article_handle 
                WHERE MATCH (title,text) AGAINST ($search IN BOOLEAN MODE)`,
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
