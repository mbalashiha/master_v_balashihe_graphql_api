import util from "util";
import graphqlFields from "graphql-fields";
import db from "@src/db/execute-query";
const resolvers = {
  Node: {
    __resolveType(obj, ctx, info) {
      return obj.__typename; // GraphQLError is thrown
    },
  },
  Checkout: {
    lineItems: (args, context, info) => {},
  },
  Product: {
    images: (args, context, info) => {},
    variants: (args, context, info) => {},
  },
  Mutation: {
    checkoutLineItemsRemove: async ({ checkoutId, lineItemIds }) => {},
    checkoutLineItemsUpdate: async ({ checkoutId, lineItems }) => {},
    checkoutLineItemsAdd: async ({ checkoutId, lineItems }) => {},
    checkoutCreate: async () => {},
  },
  Root: {
    node: async ({ id }) => {},
    hello: () => {
      return "Hello world!";
    },
    productByHandle: async (variables, req, ...rest) => {
      let { handle } = variables;
    },
    products: async ({ limit, offset }, req, context) => {
      offset = parseInt(offset || 0);
      limit = parseInt(limit || 250);
      const fields = graphqlFields(context);
      console.log(util.inspect(fields));
      const products: any = await db.excuteQuery({
        query: "select * from product Limit ?,?",
        variables: [offset, limit],
      });
      let pageInfo;
      if (fields.pageInfo) {
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
      }
      return { pageInfo, products };
    },
  },
};

export default resolvers;
