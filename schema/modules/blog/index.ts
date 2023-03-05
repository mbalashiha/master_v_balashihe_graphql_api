import { createModule, gql } from "graphql-modules";
import util from "util";
import db from "@src/sql/execute-query";
import { GraphQLResolveInfo } from "graphql";
import { isPositiveInteger } from "@src/utils/type-checkers";
import { sql } from "@schema/sql-query";
import { Console } from "console";
import { normalizePriceCurrency } from "@src/utils/currency/converter";
import { FullProductInput, ProductInput } from "@schema/types/indext";
const onlyLettersRegexp = new RegExp("[^\\p{L}\\d]+", "gimu");
const keepOnlyLetters = (search: string): string => {
  onlyLettersRegexp.lastIndex = 0;
  return search.replaceAll(onlyLettersRegexp, " ");
};
const oneSearchWordReg = (search: string): RegExp[] => {
  try {
    const lett = keepOnlyLetters(search)
      .split(" ")
      .filter((el) => Boolean(el.length))
      .map((el) => new RegExp(el, "imu"));
    return lett;
  } catch (e: any) {
    console.error(e.stack || e.message || e);
    return [];
  }
};
const normalizeNumber = (val: number, max: number, min: number): number =>
  (val - min) / (max - min);

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
      type BlogArticle {
        id: ID
        title: String
        handle: String
        text: String
        textHtml: String
        textRawDraftContentState: String
        autoHandleSlug: String
        published: Boolean
        orderNumber: Int
        blogCategoryId: ID
        category: CategoryId
        createdAt: Date
        updatedAt: Date
        publishedAt: Date
        breadcrumbs: [Breadcrumb]
      }
      type BlogArticlesConnection {
        pageInfo: PageInfo
        nodes(offset: Int, limit: Int): [BlogArticle]
      }
      type ArticleCard {
        title: String!
        handle: String!
        createdAt: Date!
        score: Float
        fragment: String
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
        blogArticleByHandle(handle: String): BlogArticle
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
        const articles: any = await db.excuteQuery({
          query: "select handle from blog_article",
        });
        return articles;
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
          const originalSearchParam = search;
          const offset = variables.offset || parent.offset || 0;
          const limit = variables.limit || parent.limit || 250;
          if (!search) {
            const articles: any = await db.excuteQuery({
              query:
                "select handle, title, createdAt, null as fragment, null as score from blog_article Order By createdAt Desc, updatedAt Desc",
              variables: [offset, limit],
            });
            return articles;
          } else {
            const isBooleanMode =
              /^\-[^-]+/im.test(search) ||
              / \-[^-]+/im.test(search) ||
              search.includes("*") ||
              search.includes("+");
            const resultArray = [];
            if (!isBooleanMode) {
              const articles: any = await db.excuteQuery({
                query: `
            select handle, title, createdAt, text as fragment,
                  MATCH (title,text) AGAINST ($search IN NATURAL LANGUAGE MODE) as score
              from blog_article 
                WHERE MATCH (title,text) AGAINST ($search IN NATURAL LANGUAGE MODE)`,
                variables: { search },
              });
              resultArray.push(...articles);
            } else {
              try {
                const articles: any = await db.excuteQuery({
                  query: `
            select handle, title, createdAt, text as fragment,
                  MATCH (title,text) AGAINST ($search IN BOOLEAN MODE) as score
              from blog_article 
                WHERE MATCH (title,text) AGAINST ($search IN BOOLEAN MODE)`,
                  variables: { search },
                });
                resultArray.push(...articles);
              } catch (e: any) {}
            }
            if (!isBooleanMode && resultArray.length <= 4) {
              search = keepOnlyLetters(search);
              let searchAttempt = search
                .split(/[\s]+/gim)
                .filter((str) => Boolean(str.length))
                .map((str) => `+${str}*`)
                .join(" ");
              const articles: any = await db.excuteQuery({
                query: `
            select handle, title, createdAt, text as fragment,
                  MATCH (title,text) AGAINST ($search IN BOOLEAN MODE) as score
              from blog_article 
                WHERE MATCH (title,text) AGAINST ($search IN BOOLEAN MODE)`,
                variables: { search: searchAttempt },
              });
              resultArray.push(...articles);
            }
            if (!isBooleanMode && resultArray.length <= 4) {
              let searchAttempt = search
                .split(/[\s]+/gim)
                .filter((str) => Boolean(str.length))
                .map((str) => `${str}*`)
                .join(" ");
              const articles: any = await db.excuteQuery({
                query: `
            select handle, title, createdAt, text as fragment,
                  MATCH (title,text) AGAINST ($search IN BOOLEAN MODE) as score
              from blog_article 
                WHERE MATCH (title,text) AGAINST ($search IN BOOLEAN MODE)`,
                variables: { search: searchAttempt },
              });
              resultArray.push(...articles);
            }
            if (isBooleanMode && resultArray.length <= 0) {
              try {
                const articles: any = await db.excuteQuery({
                  query: `
            select handle, title, createdAt, text as fragment,
                  MATCH (title,text) AGAINST ($search IN NATURAL LANGUAGE MODE) as score
              from blog_article 
                WHERE MATCH (title,text) AGAINST ($search IN NATURAL LANGUAGE MODE)`,
                  variables: { search: originalSearchParam },
                });
                resultArray.push(...articles);
              } catch (e: any) {}
            }
            const scoreArray = resultArray
              .map((elem: { score: number }) => {
                if (elem) {
                  return elem.score;
                } else {
                  return undefined as any as number;
                }
              })
              .filter((score: any) => typeof score === "number");
            const min = Math.min(...scoreArray);
            const max = Math.max(...scoreArray);
            console.log("min:", min, "max:", max);
            const searchWords: RegExp[] = resultArray.length
              ? oneSearchWordReg(search)
              : [];
            resultArray.forEach(
              (elem: { score: number; fragment: string | null }) => {
                if (typeof elem.score === "number") {
                  const before = elem.score;
                  elem.score = normalizeNumber(elem.score, max, min);
                  if (Number.isNaN(elem.score)) {
                    elem.score = before;
                  }
                  elem.score = Math.round(elem.score * 1000) / 1000;
                }
                if (elem.fragment) {
                  elem.fragment = elem.fragment.replace(/\s+/gim, " ");
                  let matched = false;
                  for (const r of searchWords) {
                    const index = elem.fragment.search(r);
                    if (index >= 0) {
                      elem.fragment = elem.fragment
                        .substring(index)
                        .substring(0, 236);
                      elem.fragment = elem.fragment.substring(
                        0,
                        elem.fragment.lastIndexOf(" ")
                      );
                      matched = true;
                      break;
                    }
                  }
                  if (!matched) {
                    elem.fragment = null;
                  }
                }
              }
            );
            const tempMap = new Map<string, any>();
            for (const el of resultArray) {
              const fromMap = tempMap.get(el.title);
              if (!fromMap || fromMap.score < el.score) {
                tempMap.set(el.title, el);
              }
            }
            return Array.from(tempMap.values());
          }
        } catch (e: any) {
          console.error(e.stack || e.message || e);
          debugger;
          throw e;
        }
      },
    },
    BlogArticle: {
      breadcrumbs: async (
        parent: { productId: any },
        variables: any,
        _ctx: any,
        info: GraphQLResolveInfo
      ) => {
        if (!parent.productId) {
          throw new Error("Product breadcrumbs: no parent.productId");
        }
        try {
          const rows: any = await db.excuteQuery({
            query: `select p.*, cb.breadcrumbs, cb.uri_pathes from product p
            Left Join product_category_breadcrumbs cb On cb.id=p.product_category_id
              Where p.productId = $productId`,
            variables: parent,
          });
          const product = rows[0];
          const names = (product.breadcrumbs || "").split("/");
          const handles = (product.uri_pathes || "").split(";");
          const breadcrumbs: Array<{
            name: string;
            handle: string;
            type?: string;
          }> = [];
          for (let i = 0; i < names.length; i++) {
            if (!names[i] || !handles[i]) {
              throw new Error(
                "Incorrect breadcrumbs with names[i]: " +
                  typeof names[i] +
                  " and handles[i]: " +
                  typeof handles[i]
              );
            }
            breadcrumbs.push({
              name: names[i],
              handle: handles[i],
              type: "product_category",
            });
          }
          breadcrumbs.push({
            name: product.title,
            handle: product.handle,
            type: "product",
          });
          return breadcrumbs;
        } catch (e: any) {
          console.error(e.stack || e.message || e);
          debugger;
          throw e;
        }
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
        blogArticleByHandle: async (
          _: any,
          variables: { handle: any },
          _ctx: any,
          info: GraphQLResolveInfo
        ) => {
          const { handle } = variables;
          const products: any = await db.excuteQuery({
            query: "select * from product_view where handle=?",
            variables: [handle],
          });
          return products[0];
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
        let rows = await db.query(`select * from blog_article where handle=?`, [
          variables.handle,
        ]);
        let result = rows && rows[0];
        return { ...parent, ...variables, ...result };
      },
    },
  },
});
