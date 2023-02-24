import { createModule, gql } from "graphql-modules";
import util from "util";
import db from "@src/sql/execute-query";
import { GraphQLResolveInfo } from "graphql";
import { isPositiveInteger } from "@src/utils/type-checkers";
import { sql } from "@schema/sql-query";
import { Console } from "console";
import { normalizePriceCurrency } from "@src/utils/currency/converter";
import { FullProductInput, ProductInput } from "@schema/types/indext";

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
      type Query {
        blogArticles(offset: Int, limit: Int): BlogArticlesConnection
        blogArticleByHandle(handle: String): BlogArticle
      }
    `,
  ],
  resolvers: {
    BlogArticlesConnection: {
      nodes: async (
        parent: { offset?: number; limit?: number },
        variables: { offset?: number; limit?: number },
        _ctx: any,
        info: GraphQLResolveInfo
      ) => {
        let offset = variables.offset || parent.offset || 0;
        let limit = variables.limit || parent.limit || 250;
        const articles: any = await db.excuteQuery({
          query: "select * from blog_article Where published=1 Limit ?,?",
          variables: [offset, limit],
        });
        return articles;
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
      Mutation: {},
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
        _: any,
        variables: any,
        _ctx: any,
        info: GraphQLResolveInfo
      ) => {
        return { ..._, ...variables };
      },
    },
  },
});
