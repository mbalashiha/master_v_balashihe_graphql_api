import util from "util";
import graphqlFields from "graphql-fields";
import db from "@src/db/execute-query";
import { GraphQLResolveInfo } from "graphql";
import { isPositiveInteger } from "@src/util/type-checkers";
import { sql } from "./sql-query";
import { Console } from "console";
function onlyUnique(value, index, self) {
  return self.indexOf(value) === index;
}
const resolvers = {
  PageInfo: {
    // pagination: (_, variables, _ctx, info: GraphQLResolveInfo) => {
    //   log(variables, _ctx, info);
    // },
  },
  ProductVariant: {
    title: async (parent, variables, _ctx, info: GraphQLResolveInfo) => {
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
      select Upper(GROUP_CONCAT(v.value Separator ' / ')) as title from product_option po
          Inner Join product_option_name_value v On po.valueId=v.valueId
          where po.optionId In $1
      `,
          variables: [optionsIds],
        });
        const title = rows[0] && rows[0].title;
        return title;
      } catch (e: any) {
        console.error(e.stack || e.message);
        throw e;
      }
    },
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
      select po.optionId, n.name as optionName, v.value as optionValue from product_option po
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
    product: async (parent, variables, _ctx, info: GraphQLResolveInfo) => {
      try {
        return parent;
      } catch (e: any) {
        console.error(e.stack || e.message);
        throw e;
      }
    },
    price: async (parent, variables, _ctx, info: GraphQLResolveInfo) => {
      try {
        const rows = await db.excuteQuery({
          query: `
      select coalesce(v.price, v.compareAtPrice) as amount, cc.currencyCode from product_variant v
          LEFT Join price_currency_code cc On cc.currencyCodeId=v.currencyCodeId
          where v.variantId=$variantId
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
    node: async (parent, variables, _ctx, info: GraphQLResolveInfo) => {
      // console.log(variables);
      variables.productId =
        variables.productId || parent.productId || variables.id;
      const products: any = await db.excuteQuery({
        query: "select * from product Where productId=$productId",
        variables,
      });
      return products[0];
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
      select pv.variantId, pv.sku, 
            JSON_Object('amount', pv.price, 'currencyCode', c.currencyCode) as price, 
            JSON_Object('amount', pv.compareAtPrice, 'currencyCode', c.currencyCode) as compareAtPrice,
            i.imageId as imageId,
            IF(i.imageId is not Null, Json_Object(
              'imageId', i.imageId,
              'originalSrc', i.originalSrc,
              'width', i.width,
              'height', i.height,
              'altText', i.altText,
              'format', i.format
            ), Null) as image,
            pv.createdAt, pv.updatedAt,
            pv.option_id_1, pv.option_id_2, pv.option_id_3, pv.option_id_4, pv.option_id_5, pv.option_id_6, pv.option_id_7, pv.option_id_8
        from product_variant pv
          Left Join price_currency_code c On c.currencyCodeId=pv.currencyCodeId
          Left Join image i On i.imageId=pv.imageId
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
  CheckoutResponse: {
    checkoutConnection: async (
      parent,
      variables,
      _ctx,
      info: GraphQLResolveInfo
    ) => {
      return { ...parent, ...variables };
    },
  },
  CheckoutConnection: {
    checkout: async (parent, variables, _ctx, info: GraphQLResolveInfo) => {
      try {
        variables = { ...parent, ...variables };
        const checkoutRows: any = await db.excuteQuery({
          query: sql.cart.getCheckoutQuery,
          variables,
        });
        if (checkoutRows.length !== 1) {
          console.log("variables:", variables);
          console.error(
            "checkout result rows from mysql is not 1: checkoutRows.length: " +
              checkoutRows.length.toString()
          );
        }
        const checkoutResult = checkoutRows[0] || null;
        if (checkoutResult && checkoutResult.webUrl) {
          checkoutResult.checkoutId = checkoutResult.webUrl;
        }
        return checkoutResult;
      } catch (e: any) {
        console.error(e.stack || e.message);
        throw e;
      }
    },
  },
  Checkout: {
    totalPrice: async (parent, variables, _ctx, info: GraphQLResolveInfo) => {
      try {
        if (typeof parent.totalPrice === "string") {
          parent.totalPrice = JSON.parse(parent.totalPrice);
        }
        if (
          !parent.totalPrice ||
          typeof parent.totalPrice.amount === "undefined"
        ) {
          throw new Error("No checkout total price!");
        }
        return parent.totalPrice;
      } catch (e: any) {
        console.error(e.stack || e.message);
        throw e;
      }
    },
    lineItems: async (parent, variables, _ctx, info: GraphQLResolveInfo) => {
      const obj = { ...parent, ...variables };
      if (obj.lineItemsJson && typeof obj.lineItemsJson === "string") {
        obj.lineItems = JSON.parse(obj.lineItemsJson);
      } else if (obj.lineItemsJson && Array.isArray(obj.lineItemsJson)) {
        obj.lineItems = obj.lineItemsJson;
      }
      if (!Array.isArray(obj.lineItems)) {
        throw new Error("No obj.lineItems!");
      }
      return obj;
    },
  },
  LineItemConnection: {
    nodes: async (parent, variables, _ctx, info: GraphQLResolveInfo) => {
      variables.offset = variables.offset || 0;
      variables.limit = variables.limit || 250;
      parent = { ...parent, ...variables };
      let lineItems;
      if (Array.isArray(parent.lineItems)) {
        lineItems = parent.lineItems;
      } else {
        try {
          variables.checkoutId =
            parent.checkoutId ||
            variables.checkoutId ||
            variables.id ||
            parent.id;
          const { checkoutIdBuffer } = { ...parent, ...variables } as any;
          if (!checkoutIdBuffer) {
            throw new Error("No checkoutIdBuffer for LineItemConnection!");
          }
          lineItems = await db.excuteQuery({
            query: sql.cart.getCheckoutQuery,
            variables,
          });
        } catch (e: any) {
          console.error(e.stack || e.message);
          throw e;
        }
      }
      const sliced = lineItems.slice(
        parent.offset,
        parent.offset + parent.limit
      );
      sliced.forEach((element) => {
        element.checkoutId = parent.checkoutId || variables.checkoutId;
        if (typeof element.image === "string") {
          element.image = JSON.parse(element.image);
        }
      });
      return sliced;
    },
  },
  LineItem: {
    unityPrice: async (parent, variables, _ctx, info: GraphQLResolveInfo) => {
      try {
        if (
          parent.unityPrice &&
          typeof parent.unityPrice.amount !== "undefined"
        ) {
          return parent.unityPrice;
        }
        const nodes: any = await db.excuteQuery({
          query: `select 
          
          JSON_OBJECT(
                'amount', Coalesce( v.price, v.compareAtPrice, 0 ) * i.quantity,  'currencyCode', cc.currencyCode
             ) as unityPrice
        FROM checkout_line_item i
          LEFT JOIN product_variant v ON v.variantId=i.variantId
          Left Join price_currency_code cc On v.currencyCodeId=cc.currencyCodeId
          Where i.checkoutId=unhex($checkoutId) And i.variantId=$variantId`,
          variables: parent,
        });
        const unityPrice = nodes[0] && nodes[0].unityPrice;
        return unityPrice;
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
                 Join product p on p.productId=v.productId
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
          query: `select Coalesce(p.title, v.sku) title 
                 from product_variant v
                 Inner Join product p On v.productId=p.productId
            where v.variantId=$variantId
            Group By p.productId`,
          variables: parent,
        });
        return nodes[0] && nodes[0].title;
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
    ) => {
      try {
        const { checkoutId, lineItemIds } = variables;
        for (const variantId of variables.lineItemIds) {
          if (variantId) {
            await db.excuteQuery({
              query: `delete from checkout_line_item
            where checkoutId=unhex($checkoutId) and variantId=($variantId)`,
              variables: { checkoutId, variantId },
            });
          }
        }
        return { checkoutId };
      } catch (e: any) {
        console.error(e.stack || e.message);
        throw e;
      }
    },
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
      const input = variables.input || variables || {};
      let checkoutId = input.checkoutId || null;
      const lineItems = Array.isArray(input.lineItems)
        ? input.lineItems
        : input.lineItems
        ? [input.lineItems]
        : [];
      try {
        if (
          lineItems &&
          lineItems[0] &&
          lineItems[0].variantId &&
          lineItems[0].quantity
        ) {
          const checkoutResult: any = await db.excuteQuery({
            query: "call checkout_LineItems_Add(?, ?)",
            variables: [checkoutId, JSON.stringify(lineItems)],
          });
          checkoutId = checkoutResult[0][0].checkoutId;
          console.log(checkoutId);
          console.log();
          return { checkoutId };
        }
      } catch (e: any) {
        console.error(e.stack || e.message);
        throw e;
      }
    },
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
      if (variables.id && !variables.checkoutId) {
        variables.checkoutId = variables.id;
      }
      return { ...variables };
    },
  },
};

export default resolvers;
