import { createModule, gql } from "graphql-modules";
import util from "util";
import db from "@src/sql/execute-query";
import { GraphQLResolveInfo } from "graphql";
import { isPositiveInteger } from "@src/utils/type-checkers";
import { sql } from "@schema/sql-query";
import { Console } from "console";
import { normalizePriceCurrency } from "@src/utils/currency/converter";
import { FullProductInput, ProductInput } from "@schema/types/indext";
import { fullTextSearch } from "@src/sql/full-text-search";
import { Schema } from "@root/schema/types/schema";
const getFirst = async (notThisId: number | string) => {
  const rows = await db.excuteQuery({
    query: `SELECT 1 as itIsloop, id, title, handle FROM blog_article_handle WHERE id = (SELECT MIN(id) FROM blog_article) And id != $articleId`,
    variables: { articleId: notThisId },
  });
  return rows[0] || { itIsloop: 1, id: null, title: "", handle: "" };
};
const getLast = async (notThisId: number | string) => {
  const rows = await db.excuteQuery({
    query: `SELECT 1 as itIsloop, id, title, handle FROM blog_article_handle WHERE id = (SELECT MAX(id) FROM blog_article) And id != $articleId`,
    variables: { articleId: notThisId },
  });
  return rows[0] || { itIsloop: 1, id: null, title: "", handle: "" };
};
const getPrev = (id: number | string) =>
  db.excuteQuery({
    query: `SELECT null as itIsloop, id, title, handle FROM blog_article_handle WHERE id = (SELECT MAX(id) FROM blog_article WHERE id < $articleId)`,
    variables: { articleId: id },
  });
const getNext = (id: number | string) =>
  db.excuteQuery({
    query: `SELECT null as itIsloop, id, title, handle FROM blog_article_handle WHERE id = (SELECT MIN(id) FROM blog_article WHERE id > $articleId)`,
    variables: { articleId: id },
  });

function onlyUnique(value: any, index: any, self: string | any[]) {
  return self.indexOf(value) === index;
}
export const blogArticlesModule = createModule({
  id: "blog-articles-module",
  dirname: __dirname,
  typeDefs: [
    gql`
      type CategoryId {
        id: ID
      }
      type ArticleCard {
        id: ID
        title: String!
        handle: String!
        createdAt: Date!
        score: Float
        fragment: String
      }
      type NavigationItem {
        id: ID
        title: String!
        handle: String
        itIsloop: Boolean
      }
      type BlogArticleNavigation {
        prev: NavigationItem!
        next: NavigationItem!
        nearestSiblings: [NavigationItem]
      }
      type BlogArticle {
        id: ID
        title: String
        handle: String
        absURL: String
        text: String
        textHtml: String
        textRawDraftContentState: String
        renderHtml: String
        autoHandleSlug: String
        orderNumber: Int
        blogCategoryId: ID
        category: CategoryId
        createdAt: Date
        updatedAt: Date
        publishedAt: Date
        breadcrumbs: [Breadcrumb]
        navigation: BlogArticleNavigation
        imageId: ID
        image: Image
        unPublished: Boolean
        notSearchable: Boolean
        notInList: Boolean
      }
      type BlogArticlesConnection {
        pageInfo: PageInfo
        nodes(offset: Int, limit: Int): [BlogArticle]
      }
      type ArticlesCardsConnection {
        nodes: [ArticleCard]!
      }
      type PathHandle {
        handle: String!
      }
      type PathHandlesRespose {
        nodes: [PathHandle]!
      }
      type Query {
        blogArticles(
          search: String
          offset: Int
          limit: Int
        ): BlogArticlesConnection
        articlesPathes: PathHandlesRespose!
        articlesCards(
          search: String
          offset: Int
          limit: Int
        ): ArticlesCardsConnection!
        articleByHandle(handle: String): BlogArticle
      }
    `,
  ],
  resolvers: {
    PathHandlesRespose: {
      nodes: async (
        parent: void,
        variables: void,
        _ctx: any,
        info: GraphQLResolveInfo
      ) => {
        try {
          const articles: any = await db.excuteQuery({
            query: "select handle from blog_article_handle",
          });
          return articles;
        } catch (e: any) {
          console.error(e.stack || e.message || e);
          debugger;
          throw e;
        }
      },
    },
    BlogArticlesConnection: {
      nodes: async (
        parent: { search?: string; offset?: number; limit?: number },
        variables: { offset?: number; limit?: number },
        _ctx: any,
        info: GraphQLResolveInfo
      ) => {
        let search = parent.search || "";
        let offset = variables.offset || parent.offset || 0;
        let limit = variables.limit || parent.limit || 250;
        const articles: any = await db.excuteQuery({
          query:
            "select * from blog_article Order By createdAt Desc, updatedAt Desc",
          variables: [offset, limit],
        });
        return articles;
      },
    },
    ArticlesCardsConnection: {
      nodes: async (
        parent: { search?: string; offset?: number; limit?: number },
        variables: { offset?: number; limit?: number },
        _ctx: any,
        info: GraphQLResolveInfo
      ) => {
        try {
          let search = parent.search || "";
          const offset = variables.offset || parent.offset || 0;
          const limit = variables.limit || parent.limit || 250;
          if (!search) {
            const articles: any = await db.excuteQuery({
              query: `select id, handle, title, createdAt, null as fragment, null as score 
                  from blog_article_handle   
                    Where notInList is NULL And unPublished is NULL
                    Order By createdAt Desc, updatedAt Desc`,
              variables: [offset, limit],
            });
            return articles;
          } else {
            return await fullTextSearch({
              search,
              naturalLanguageModeQuery: `
            select id, handle, title, createdAt, text as fragment,
                  MATCH (title,text) AGAINST ($search IN NATURAL LANGUAGE MODE) as score
              from blog_article_handle 
                WHERE 
                  unPublished is NULL And notSearchable is NULL And 
                  MATCH (title,text) AGAINST ($search IN NATURAL LANGUAGE MODE)`,
              booleanModeQuery: `
            select id, handle, title, createdAt, text as fragment,
                  MATCH (title,text) AGAINST ($search IN BOOLEAN MODE) as score
              from blog_article_handle  
                WHERE 
                  unPublished is NULL And notSearchable is NULL And 
                  MATCH (title,text) AGAINST ($search IN BOOLEAN MODE)`,
            });
          }
        } catch (e: any) {
          console.error(e.stack || e.message || e);
          debugger;
          throw e;
        }
      },
    },
    BlogArticleNavigation: {},
    BlogArticle: {
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
      navigation: async (
        parent: { id: number | string },
        variables: any,
        _ctx: any,
        info: GraphQLResolveInfo
      ) => {
        const articleId = parent.id;
        if (!articleId) {
          throw new Error("Why is no parent article id for navigation node!");
        }
        try {
          const articlesBeforeList: any[] = [];
          const articlesAfterList: any[] = [];
          const prevRows = await getPrev(articleId);
          const nextRows = await getNext(articleId);
          let prev = prevRows[0] || null;
          let next = nextRows[0] || null;
          let loopPrev = prev;
          let loopNext = next;
          if (loopPrev) {
            articlesBeforeList.push(prev);
          }
          if (loopNext) {
            articlesAfterList.push(next);
          }
          const maximumSidebarItemsLength = 10;
          while (
            (loopNext || loopPrev) &&
            articlesBeforeList.length + articlesAfterList.length <
              maximumSidebarItemsLength
          ) {
            if (loopNext) {
              const rows = await getNext(loopNext.id);
              loopNext = rows[0];
              if (loopNext) {
                articlesAfterList.push(loopNext);
              }
            }
            if (
              articlesBeforeList.length + articlesAfterList.length <
                maximumSidebarItemsLength &&
              loopPrev
            ) {
              const rows = await getPrev(loopPrev.id);
              loopPrev = rows[0];
              if (loopPrev) {
                articlesBeforeList.unshift(loopPrev);
              }
            }
          }
          const nearestSiblings = [
            ...articlesBeforeList,
            { ...parent, handle: "" },
            ...articlesAfterList,
          ];
          if (!prev) {
            prev = await getLast(parent.id);
          }
          if (!next) {
            next = await getFirst(parent.id);
          }
          next.itIsloop = Boolean(next.itIsloop);
          prev.itIsloop = Boolean(prev.itIsloop);
          nearestSiblings.forEach((elem: any) => {
            elem.itIsloop = Boolean(elem.itIsloop);
          });
          const navigation = { next, prev, nearestSiblings };
          return navigation;
        } catch (e: any) {
          console.error(e.stack || e.message || e);
          debugger;
          throw e;
        }
      },
      breadcrumbs: async (
        parent: { productId: any },
        variables: any,
        _ctx: any,
        info: GraphQLResolveInfo
      ) => {
        // if (!parent.productId) {
        //   throw new Error("Product breadcrumbs: no parent.productId");
        // }
        // try {
        //   const rows: any = await db.excuteQuery({
        //     query: `select p.*, cb.breadcrumbs, cb.uri_pathes from product p
        //     Left Join product_category_breadcrumbs cb On cb.id=p.product_category_id
        //       Where p.productId = $productId`,
        //     variables: parent,
        //   });
        //   const product = rows[0];
        //   const names = (product.breadcrumbs || "").split("/");
        //   const handles = (product.uri_pathes || "").split(";");
        //   const breadcrumbs: Array<{
        //     name: string;
        //     handle: string;
        //     type?: string;
        //   }> = [];
        //   for (let i = 0; i < names.length; i++) {
        //     if (!names[i] || !handles[i]) {
        //       throw new Error(
        //         "Incorrect breadcrumbs with names[i]: " +
        //           typeof names[i] +
        //           " and handles[i]: " +
        //           typeof handles[i]
        //       );
        //     }
        //     breadcrumbs.push({
        //       name: names[i],
        //       handle: handles[i],
        //       type: "product_category",
        //     });
        //   }
        //   breadcrumbs.push({
        //     name: product.title,
        //     handle: product.handle,
        //     type: "product",
        //   });
        //   return breadcrumbs;
        // } catch (e: any) {
        //   console.error(e.stack || e.message || e);
        //   debugger;
        //   throw e;
        // }
      },
      BlogCategory: {
        articlesCount: async (
          parent: { productsCount: any },
          variables: any,
          _ctx: any,
          info: GraphQLResolveInfo
        ) => {
          try {
            return parent.productsCount;
          } catch (e: any) {
            console.error(e.stack || e.message);
            throw e;
          }
        },
        breadcrumbs: async (
          parent: { breadcrumbs: any; uri_pathes: any },
          variables: any,
          _ctx: any,
          info: GraphQLResolveInfo
        ) => {
          try {
            const names = (parent.breadcrumbs || "").split("/");
            const handles = (parent.uri_pathes || "").split(";");
            const breadcrumbs: Array<{ name: string; handle: string }> = [];
            for (let i = 0; i < names.length; i++) {
              if (!names[i] || !handles[i]) {
                throw new Error(
                  "Incorrect breadcrumbs with names[i]: " +
                    typeof names[i] +
                    " and handles[i]: " +
                    typeof handles[i]
                );
              }
              breadcrumbs.push({ name: names[i], handle: handles[i] });
            }
            return breadcrumbs;
          } catch (e: any) {
            console.error(e.stack || e.message);
            throw e;
          }
        },
      },
      Query: {
        blogCategories: async (
          _: any,
          variables: any,
          _ctx: any,
          info: GraphQLResolveInfo
        ) => {
          return { ..._, ...variables };
        },
        articles: async (
          _: any,
          variables: any,
          _ctx: any,
          info: GraphQLResolveInfo
        ) => {
          return { ...variables };
        },
      },
    },
    Query: {
      blogArticles: async (
        parent: any,
        variables: any,
        _ctx: any,
        info: GraphQLResolveInfo
      ) => {
        return { ...parent, ...variables };
      },
      articlesPathes: async (
        parent: any,
        variables: any,
        _ctx: any,
        info: GraphQLResolveInfo
      ) => {
        return { ...parent, ...variables };
      },
      articlesCards: async (
        parent: any,
        variables: any,
        _ctx: any,
        info: GraphQLResolveInfo
      ) => {
        return { ...parent, ...variables };
      },
      articleByHandle: async (
        parent: any,
        variables: { handle: string },
        _ctx: any,
        info: GraphQLResolveInfo
      ) => {
        try {
          let rows = await db.query(
            `select * from blog_article_handle where handle=?`,
            [variables.handle]
          );
          let result = rows && rows[0];
          return { ...parent, ...variables, ...result };
        } catch (e: any) {
          console.error(e.stack || e.message || e);
          debugger;
          throw e;
        }
      },
    },
  },
});
