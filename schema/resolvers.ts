import util from "util";
import graphqlFields from "graphql-fields";
import db from "@src/db/execute-query";
import { GraphQLResolveInfo } from "graphql";
const resolvers = {
  Checkout: {
    lineItems: (_, variables, _ctx, info: GraphQLResolveInfo) => {},
  },
  PageInfo: {
    pagination: (_, variables, _ctx, info: GraphQLResolveInfo) => {
      console.log(variables, _ctx, info);
    },
  },
  Product: {
    images: async (parent, variables, _ctx, info: GraphQLResolveInfo) => {
      try {
        const rows = await db.excuteQuery({
          query: `
      select i2p.productId, i.imageId, i.originalSrc, i.width, i.height, i.altText, i.format 
        from image_to_product i2p 
          inner join image i on i.imageId=i2p.imageId
          where i2p.productId=$[productId]
      `,
          variables: parent,
        });
        console.log(rows);
        console.log(variables, _ctx, info);
        return rows;
      } catch (e) {
        throw e;
      }
    },
    variants: (_, variables, _ctx, info: GraphQLResolveInfo) => {},
  },
  Mutation: {
    checkoutLineItemsRemove: async ({ checkoutId, lineItemIds }) => {},
    checkoutLineItemsUpdate: async ({ checkoutId, lineItems }) => {},
    checkoutLineItemsAdd: async ({ checkoutId, lineItems }) => {},
    checkoutCreate: async () => {},
  },
  Query: {
    hello: () => {
      return "Hello world!";
    },
    productByHandle: async (_, variables, _ctx, info: GraphQLResolveInfo) => {
      let { handle } = variables;
    },
    products: async (_, { limit, offset }, _ctx, info: GraphQLResolveInfo) => {
      const query = info.fieldNodes.find(
        (field) => field.name.value === info.fieldName
      );

      offset = parseInt(offset || 0);
      limit = parseInt(limit || 250);
      const products: any = await db.excuteQuery({
        query: "select * from product Limit ?,?",
        variables: [offset, limit],
      });
      let pageInfo = {};
      /*if (fields.pageInfo) {
        const q: any = await db.excuteQuery({
          query: "select count(*) as totalRecords from product",
          variables: [offset, limit],
        });
        const { totalRecords } = q[0];
        const hasNextPage = offset + limit < totalRecords;
        pageInfo = {
          startCursor: products[0].productId,
          endCursor: products[products.length - 1].productId,
          hasNextPage,
          hasPreviousPage: offset > 0,
        };
      }*/
      return { nodes: products };
    },
  },
};

export default resolvers;
