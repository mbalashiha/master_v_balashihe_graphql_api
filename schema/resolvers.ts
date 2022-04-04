import util from "util";
import graphqlFields from "graphql-fields";
import db from "@src/db/execute-query";
import { GraphQLResolveInfo } from "graphql";
function onlyUnique(value, index, self) {
  return self.indexOf(value) === index;
}
const resolvers = {
  PageInfo: {
    // pagination: (_, variables, _ctx, info: GraphQLResolveInfo) => {
    //   log(variables, _ctx, info);
    // },
  },
  Variant: {
    selectedOptions: async (
      parent,
      variables,
      _ctx,
      info: GraphQLResolveInfo
    ) => {
      try {
        const optionsIds: Array<any> = [];
        for (const key of Object.keys(parent)) {
          if (key.startsWith("option_id")) {
            if (parent[key] !== null) {
              optionsIds.push(parent[key] as any);
            }
          }
        }
        const rows = await db.excuteQuery({
          query: `
      select po.optionId, n.name, v.value from product_option po
          Inner Join product_option_name n On po.nameId=n.nameId
          Inner Join product_option_name_value v On po.valueId=v.valueId
          where po.optionId In $1
      `,
          variables: [optionsIds],
        });
        return rows;
      } catch (e: any) {
        console.error(e.stack || e.message);
        throw e;
      }
    },
    image: async (parent, variables, _ctx, info: GraphQLResolveInfo) => {
      try {
        const rows = await db.excuteQuery({
          query: `
      select * from image im
          where im.imageId=$imageId
      `,
          variables: parent,
        });
        return rows[0];
      } catch (e: any) {
        console.error(e.stack || e.message);
        throw e;
      }
    },
  },
  Image: {
    products: async (parent, variables, _ctx, info: GraphQLResolveInfo) => {
      try {
        const rows = await db.excuteQuery({
          query: `
      select * from image_to_product imp
          inner join product p On p.productId=imp.productId
          where imageId=$[imageId]
      `,
          variables: parent,
        });
        return rows;
      } catch (e) {
        throw e;
      }
    },
  },
  ProductConnection: {
    nodes: async (parent, variables, _ctx, info: GraphQLResolveInfo) => {
      // console.log(variables);
      let offset = parseInt(variables.offset || parent.offset || 0);
      let limit = parseInt(variables.limit || parent.limit || 250);
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
      return products;
    },
  },
  Product: {
    price: async (parent, variables, _ctx, info: GraphQLResolveInfo) => {
      try {
        const nodes = await db.excuteQuery({
          query: `
      select Min(Coalesce(pv.price, pv.compareAtPrice)) as amount, Min(cc.currencyCode) as currencyCode
        from product_variant pv 
          Left Join price_currency_code cc On cc.currencyCodeId=pv.currencyCodeId
          where pv.productId=$[productId]
          Group by pv.productId
      `,
          variables: parent,
        });
        return nodes[0];
      } catch (e: any) {
        console.error(e.stack || e.message);
        throw e;
      }
    },
    image: async (parent, variables, _ctx, info: GraphQLResolveInfo) => {
      try {
        parent.imagesLimit = (variables && variables.limit) || 250;
        const nodes = await db.excuteQuery({
          query: `
      select i2p.productId, i.imageId, i.originalSrc, i.width, i.height, i.altText, i.format 
        from image_to_product i2p 
          inner join image i on i.imageId=i2p.imageId
          where i2p.productId=$[productId]
          Order by i2p.orderNumber ASC
          Limit 1
      `,
          variables: parent,
        });
        return nodes[0];
      } catch (e: any) {
        console.error(e.stack || e.message);
        throw e;
      }
    },
    images: async (parent, variables, _ctx, info: GraphQLResolveInfo) => {
      try {
        parent.imagesLimit = (variables && variables.limit) || 250;
        const nodes = await db.excuteQuery({
          query: `
      select i2p.productId, i.imageId, i.originalSrc, i.width, i.height, i.altText, i.format 
        from image_to_product i2p 
          inner join image i on i.imageId=i2p.imageId
          where i2p.productId=$[productId]
          Order by i2p.orderNumber ASC
          Limit $imagesLimit
      `,
          variables: parent,
        });
        return { nodes };
      } catch (e: any) {
        console.error(e.stack || e.message);
        throw e;
      }
    },
    options: async (parent, variables, _ctx, info: GraphQLResolveInfo) => {
      try {
        const options = await db.excuteQuery({
          query: `
      select Distinct n.name, po.optionId, JSON_ARRAYAGG(v.value) as 'values'
        from product_variant pv   
          Inner Join product_option po On po.optionId In (
                pv.option_id_1, pv.option_id_2, pv.option_id_3, pv.option_id_4, pv.option_id_5, pv.option_id_6, pv.option_id_7, pv.option_id_8
          )
          Inner Join product_option_name n On po.nameId=n.nameId
          Inner Join product_option_name_value v On po.valueId=v.valueId
          where pv.productId=$[productId] And po.optionId Is Not Null
            Group By n.nameId
            Order By Coalesce(pv.price, pv.compareAtPrice) ASC
      `,
          variables: parent,
        });
        for (const opt of options) {
          if (typeof opt.values === "string") {
            try {
              opt.values = JSON.parse(opt.values);
            } catch (e) {
              opt.values = opt.values.split(/[\[\]\,\"]+/gim);
            }
          }
          opt.values = opt.values
            .filter((el) => {
              if (typeof el === "string" && !el.length) {
                return false;
              } else {
                return true;
              }
            })
            .map((el) => {
              if (typeof el !== "string" || (el.length && el.length !== 1)) {
                return el;
              } else {
                return el.toLocaleUpperCase();
              }
            })
            .filter(onlyUnique);
        }
        return options;
      } catch (e: any) {
        console.error(e.stack || e.message);
        throw e;
      }
    },
    variants: async (parent, variables, _ctx, info: GraphQLResolveInfo) => {
      try {
        const nodes = await db.excuteQuery({
          query: `
      select pv.variantId, pv.sku, pv.sku as title, 
            JSON_Object('amount', pv.price, 'currencyCode', c.currencyCode) as price, 
            JSON_Object('amount', pv.compareAtPrice, 'currencyCode', c.currencyCode) as compareAtPrice,
            pv.imageId,
            pv.createdAt, pv.updatedAt,
            pv.option_id_1, pv.option_id_2, pv.option_id_3, pv.option_id_4, pv.option_id_5, pv.option_id_6, pv.option_id_7, pv.option_id_8
        from product_variant pv
          Left Join price_currency_code c On c.currencyCodeId=pv.currencyCodeId
          where pv.productId=$[productId]
      `,
          variables: parent,
        });
        return { nodes };
      } catch (e: any) {
        console.error(e.stack || e.message);
        throw e;
      }
    },
    priceRange: async (parent, variables, _ctx, info: GraphQLResolveInfo) => {
      try {
        const nodes = await db.excuteQuery({
          query: `
      select Min(pv.price) minVariantAmount, Max(pv.price) maxVariantAmount,
            c.currencyCode
        from product_variant pv
          Left Join price_currency_code c On c.currencyCodeId=pv.currencyCodeId
          where pv.productId=$[productId]
          Group By pv.productId
      `,
          variables: parent,
        });
        return nodes[0];
      } catch (e: any) {
        console.error(e.stack || e.message);
        throw e;
      }
    },
    vendor: async (parent, variables, _ctx, info: GraphQLResolveInfo) => {
      try {
        const nodes = await db.excuteQuery({
          query: `
      select manufacturerName as vendor
        from product p
          Join manufacturer m On m.manufacturerId=p.manufacturerId
          where p.productId=$[productId]
      `,
          variables: parent,
        });
        return nodes[0] && nodes[0].vendor;
      } catch (e: any) {
        console.error(e.stack || e.message);
        throw e;
      }
    },
  },
  CheckoutConnection: {
    checkout: async (parent, variables, _ctx, info: GraphQLResolveInfo) => {
      try {
        variables.checkoutId =
          parent.id ||
          parent.checkoutId ||
          variables.checkoutId ||
          variables.id;
        const checkoutRows: any = await db.excuteQuery({
          query: "select * from checkout where checkoutId=$checkoutId",
          variables: variables,
        });
        return checkoutRows[0];
      } catch (e: any) {
        console.error(e.stack || e.message);
        throw e;
      }
    },
  },
  Checkout: {
    totalPrice: async (parent, variables, _ctx, info: GraphQLResolveInfo) => {
      try {
        const totalPriceRows: any = await db.excuteQuery({
          query: `select SUM(Coalesce(v.price, 0)) as amount, c.currencyCode
                   from checkout_line_item i
                 Left Join product_variant v on i.variantId=v.variantId
                 Left Join price_currency_code c On v.currencyCodeId=c.currencyCodeId
         where i.checkoutId=$checkoutId`,
          variables: parent,
        });
        return totalPriceRows[0];
      } catch (e: any) {
        console.error(e.stack || e.message);
        throw e;
      }
    },
    lineItems: async (parent, variables, _ctx, info: GraphQLResolveInfo) => {
      return { ...parent, ...variables };
    },
  },
  LineItemConnection: {
    nodes: async (parent, variables, _ctx, info: GraphQLResolveInfo) => {
      try {
        variables.checkoutId = variables.checkoutId || variables.id;
        const offset = variables.offset || parent.offset || 0;
        const limit = variables.limit || parent.limit || 250;
        const nodes: any = await db.excuteQuery({
          query: `select * from checkout_line_item 
            where checkoutId=?
            Limit ?,?`,
          variables: [parent.checkoutId, offset, limit],
        });
        return nodes;
      } catch (e: any) {
        console.error(e.stack || e.message);
        throw e;
      }
    },
  },
  LineItem: {
    unityPrice: async (parent, variables, _ctx, info: GraphQLResolveInfo) => {
      try {
        const nodes: any = await db.excuteQuery({
          query: `select (i.quantity * Coalesce(v.price, v.compareAtPrice, 0)) as unityPrice
                 from checkout_line_item i
                Left Join product_variant v On i.variantId=v.variantId
            where i.checkoutId=$checkoutId And i.variantId=$variantId`,
          variables: parent,
        });
        return nodes[0];
      } catch (e: any) {
        console.error(e.stack || e.message);
        throw e;
      }
    },
    variant: async (parent, variables, _ctx, info: GraphQLResolveInfo) => {
      try {
        const nodes: any = await db.excuteQuery({
          query: `select *
                 from product_variant
            where variantId=$variantId`,
          variables: parent,
        });
        return nodes[0];
      } catch (e: any) {
        console.error(e.stack || e.message);
        throw e;
      }
    },
    product: async (parent, variables, _ctx, info: GraphQLResolveInfo) => {
      try {
        const nodes: any = await db.excuteQuery({
          query: `select p.* 
                 from product_variant v
                 Inner Join product p On v.productId=p.productId
            where v.variantId=$variantId`,
          variables: parent,
        });
        return nodes[0];
      } catch (e: any) {
        console.error(e.stack || e.message);
        throw e;
      }
    },
    title: async (parent, variables, _ctx, info: GraphQLResolveInfo) => {
      try {
        const nodes: any = await db.excuteQuery({
          query: `select Coalsect(v.title, p.title) title 
                 from product_variant v
                 Inner Join product p On v.productId=p.productId
            where v.variantId=$variantId
            Group By p.productId`,
          variables: parent,
        });
        return nodes[0];
      } catch (e: any) {
        console.error(e.stack || e.message);
        throw e;
      }
    },
  },
  Mutation: {
    checkoutLineItemsRemove: async (
      _,
      variables,
      _ctx,
      info: GraphQLResolveInfo
    ) => {},
    checkoutLineItemsUpdate: async (
      _,
      variables,
      _ctx,
      info: GraphQLResolveInfo
    ) => {},
    checkoutLineItemsAdd: async (
      _,
      variables,
      _ctx,
      info: GraphQLResolveInfo
    ) => {
      console.log(_, variables);
    },
    checkoutCreate: async (_, variables, _ctx, info: GraphQLResolveInfo) => {},
  },
  Query: {
    hello: () => {
      return "Hello world!";
    },
    productByHandle: async (_, variables, _ctx, info: GraphQLResolveInfo) => {
      const { handle } = variables;
      const products: any = await db.excuteQuery({
        query: "select * from product where handle=?",
        variables: [handle],
      });
      return products[0];
    },
    products: async (_, variables, _ctx, info: GraphQLResolveInfo) => {
      return { ...variables };
    },
    checkout: async (_, variables, _ctx, info: GraphQLResolveInfo) => {
      return { ...variables };
    },
  },
};

export default resolvers;
