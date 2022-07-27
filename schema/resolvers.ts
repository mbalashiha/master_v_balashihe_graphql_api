import util from "util";
import graphqlFields from "graphql-fields";
import db from "@src/db/execute-query";
import { GraphQLResolveInfo } from "graphql";
import { isPositiveInteger } from "@src/utils/type-checkers";
import { sql } from "./sql-query";
import { Console } from "console";
import { normalizePriceCurrency } from "@src/utils/currency/converter";
import { ProductInput } from "./types/indext";

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
        const price = normalizePriceCurrency(rows[0]);
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
        const price = normalizePriceCurrency(nodes[0]);
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
          if (checkoutResult.subtotalPrice) {
            checkoutResult.subtotalPrice = normalizePriceCurrency(
              checkoutResult.subtotalPrice
            );
          }
          if (checkoutResult.totalPrice) {
            checkoutResult.totalPrice = normalizePriceCurrency(
              checkoutResult.totalPrice
            );
          }
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
        parent.totalPrice = normalizePriceCurrency(parent.totalPrice);
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
          const checkoutResult = lineItems;
          if (checkoutResult) {
            if (checkoutResult.subtotalPrice) {
              checkoutResult.subtotalPrice = normalizePriceCurrency(
                checkoutResult.subtotalPrice
              );
            }
            if (checkoutResult.totalPrice) {
              checkoutResult.totalPrice = normalizePriceCurrency(
                checkoutResult.totalPrice
              );
            }
          }
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
  UploadedImagesNodes: {
    nodes: async (parent, variables, _ctx, info: GraphQLResolveInfo) => {
      try {
        variables = { ...parent, ...variables };
        const { draftProductId, productId } = variables;
        let images;
        if (draftProductId) {
          images = await db.excuteQuery({
            query: `select i.*, i.originalSrc as imgSrc, ip.orderNumber
                 from draft_product p
                 Left JOIN draft_image_to_product ip On p.draftProductId=ip.draftProductId
                 Inner JOIN draft_image i On ip.draftImageId=i.draftImageId
            where p.draftProductId=unhex($draftProductId)
            order By ip.orderNumber`,
            variables: parent,
          });
        } else if (productId) {
          images = await db.excuteQuery({
            query: `select i.*, i.originalSrc as imgSrc, ip.orderNumber
                 from product p
                 Left JOIN image_to_product ip On p.productId=ip.productId
                 Inner JOIN image i On ip.imageId=i.imageId
            where p.productId=$productId
            order By ip.orderNumber`,
            variables: parent,
          });
        } else {
          images = [];
        }
        return images;
      } catch (e: any) {
        console.error(e.stack || e.message);
        throw e;
      }
    },
  },
  UploadedImagesConnection: {
    images: async (parent, variables, _ctx, info: GraphQLResolveInfo) => {
      try {
        return { ...parent, ...variables };
      } catch (e: any) {
        console.error(e.stack || e.message);
        throw e;
      }
    },
  },
  UploadedImagesResponse: {
    imagesConnection: async (
      parent,
      variables,
      _ctx,
      info: GraphQLResolveInfo
    ) => {
      try {
        return { ...parent, ...variables };
      } catch (e: any) {
        console.error(e.stack || e.message);
        throw e;
      }
    },
  },
  RemovedImagesResponse: {
    imagesConnection: async (
      parent,
      variables,
      _ctx,
      info: GraphQLResolveInfo
    ) => {
      try {
        return { ...parent, ...variables };
      } catch (e: any) {
        console.error(e.stack || e.message);
        throw e;
      }
    },
    removedImages: async (
      parent,
      variables,
      _ctx,
      info: GraphQLResolveInfo
    ) => {
      try {
        return parent.removedImages;
      } catch (e: any) {
        console.error(e.stack || e.message);
        throw e;
      }
    },
  },
  DraftProductResponse: {
    imagesConnection: async (
      parent,
      variables,
      _ctx,
      info: GraphQLResolveInfo
    ) => {
      try {
        return { ...parent, ...variables };
      } catch (e: any) {
        console.error(e.stack || e.message);
        throw e;
      }
    },
    category: async (parent, variables, _ctx, info: GraphQLResolveInfo) => {
      try {
        if (parent.category && parent.category.id) {
          return parent.category;
        } else if (parent.product_category_id) {
          return { id: parent.product_category_id };
        } else {
          return { id: null };
        }
      } catch (e: any) {
        console.error(e.stack || e.message);
        throw e;
      }
    },
  },
  ProductCategory: {
    productsCount: async (
      parent,
      variables,
      _ctx,
      info: GraphQLResolveInfo
    ) => {
      try {
        return parent.productsCount;
      } catch (e: any) {
        console.error(e.stack || e.message);
        throw e;
      }
    },
    breadcrumbs: async (parent, variables, _ctx, info: GraphQLResolveInfo) => {
      try {
        return (parent.breadcrumbs || "").split("/");
      } catch (e: any) {
        console.error(e.stack || e.message);
        throw e;
      }
    },
  },
  RemovedCategoryResponse: {
    categoriesConnection: async (
      parent,
      variables,
      _ctx,
      info: GraphQLResolveInfo
    ) => {
      try {
        return { ...parent, ...variables };
      } catch (e: any) {
        console.error(e.stack || e.message);
        throw e;
      }
    },
  },
  ProductsCategoriesResponse: {
    categoriesConnection: async (
      parent,
      variables,
      _ctx,
      info: GraphQLResolveInfo
    ) => {
      try {
        return { ...parent, ...variables };
      } catch (e: any) {
        console.error(e.stack || e.message);
        throw e;
      }
    },
  },
  ProductsCategoriesConnection: {
    nodes: async (parent, variables, _ctx, info: GraphQLResolveInfo) => {
      try {
        const nodes = await db.excuteQuery({
          query: `select *
            from product_category_breadcrumbs`,
        });
        return nodes;
      } catch (e: any) {
        console.error(e.stack || e.message);
        throw e;
      }
    },
  },
  Mutation: {
    createProductCategory: async (
      parent,
      variables,
      _ctx,
      info: GraphQLResolveInfo
    ) => {
      try {
        const {
          categoryInput: { parentCategory, slugs },
        } = variables;
        if (!Array.isArray(slugs) || slugs.length <= 0) {
          throw new Error(
            "No New Category slugs array! Should be array of slugs input."
          );
        }
        let parent_id: string | null = null;
        let parent_slug: string = "";
        let last_slug: string | null = null;
        if (parentCategory && parentCategory.id) {
          const rows1 = await db.excuteQuery<
            Array<{ product_category_id: string; category_slug: string }>
          >({
            query: `select product_category_id, category_slug from product_category where product_category_id=$id`,
            variables: { id: parentCategory.id },
          });
          parent_id = (rows1[0] && rows1[0].product_category_id) || null;
          if (parent_id && rows1[0] && rows1[0].category_slug) {
            parent_slug = rows1[0].category_slug;
            last_slug = parent_slug + "/";
          }
        }
        for (const { name, slug } of slugs) {
          if (name && slug) {
            let current_slug: string;
            const rows1 = await db.excuteQuery<
              Array<{
                parent_id: string;
                product_category_id: string;
                category_slug: string;
              }>
            >({
              query: `select parent_id, product_category_id, category_slug from product_category 
                  where 
                  IF($parent_id is NULL, parent_id Is Null, parent_id=$parent_id)
                  And category_name=$name`,
              variables: { parent_id, name },
            });
            if (rows1[0] && rows1[0].product_category_id) {
              current_slug = rows1[0].category_slug;
              parent_id = rows1[0].product_category_id;
            } else {
              const [insertRes] = await db.excuteQuery<
                Array<{ insertId: string; affectedRows: number }>
              >({
                query: `insert into product_category(category_name, category_slug, parent_id)
                  Values($name, $slug, $parent_id)`,
                variables: { name, slug: (last_slug || "") + slug, parent_id },
              });
              parent_id = insertRes.insertId;
              current_slug = slug;
            }
            if (!parent_id || !current_slug) {
              throw new Error("wtf??");
            }
            last_slug = last_slug || "";
            last_slug += current_slug + "/";
          }
        }
        const [createdCategory] = await db.excuteQuery({
          query: `
          select 
              product_category_id as id, 
              category_name as name, 
              category_slug as slug,
              parent_id as parentId
            from product_category
            where product_category_id=$id `,
          variables: { id: parent_id },
        });
        const nodes = await db.excuteQuery({
          query: `select 
              product_category_id as id, 
              category_name as name, 
              category_slug as slug, 
              parent_id as parentId 
            from product_category`,
        });
        return { createdCategory, nodes };
      } catch (e: any) {
        console.error(e.stack || e.message);
        debugger;
        throw e;
      }
    },
    removeProductImage: async (
      parent,
      variables,
      _ctx,
      info: GraphQLResolveInfo
    ) => {
      try {
        variables.draftProductId = variables.draftProductId || null;
        if (!Array.isArray(variables.images) || variables.images.length <= 0) {
          throw new Error(
            "No variable images! Should be array of images input."
          );
        }
        if (!variables.draftProductId) {
          throw new Error(
            "No variable draftProductId! Should be string for ID."
          );
        }
        const removedImages: any[] = [];
        for (const image of variables.images) {
          image.draftProductId = variables.draftProductId;
          const res1 = await db.excuteQuery({
            query: `
            delete draft_image_to_product from draft_image_to_product 
              INNER JOIN draft_image ON 
                  draft_image.originalSrc=$imgSrc And 
                  draft_image.draftImageId=draft_image_to_product.draftImageId
              Where draft_image.originalSrc=$imgSrc And draft_image_to_product.draftProductId=unhex($draftProductId)
          `,
            variables: image,
          });
          const res2: Array<any> = await db.excuteQuery({
            query: `
            delete draft_image from draft_image 
              Where 
                  draft_image.originalSrc=$imgSrc And
                  draft_image.draftImageId Not IN (select draftImageId from draft_image_to_product)
          `,
            variables: image,
          });
          if (res2[0] && res2[0].affectedRows) {
            removedImages.push(image);
          }
        }
        return { removedImages, draftProductId: variables.draftProductId };
      } catch (e: any) {
        console.error(e.stack || e.message);
        debugger;
        throw e;
      }
    },
    productImagesUpdate: async (
      parent,
      variables,
      _ctx,
      info: GraphQLResolveInfo
    ) => {
      try {
        variables.draftProductId = variables.draftProductId || null;
        if (!Array.isArray(variables.images) || variables.images.length <= 0) {
          throw new Error(
            "No variable images! Should be array of images input."
          );
        }
        variables.images = JSON.stringify(variables.images);
        const res = await db.excuteQuery({
          query: "call product_Images_Update($draftProductId, $images);",
          variables,
        });
        return { draftProductId: res[0][0].draftProductId };
      } catch (e: any) {
        console.error(e.stack || e.message);
        throw e;
      }
    },
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
    ) => {
      try {
        const input = variables.input || variables || {};
        const { checkoutId, lineItems } = input;
        for (const item of lineItems) {
          const { variantId, quantity } = item;
          if (variantId && typeof quantity === "number") {
            await db.excuteQuery({
              query: `update checkout_line_item
              Set quantity=$quantity
            where checkoutId=unhex($checkoutId) and variantId=($variantId)`,
              variables: { checkoutId, variantId, quantity },
            });
          }
        }
        return { checkoutId };
      } catch (e: any) {
        console.error(e.stack || e.message);
        throw e;
      }
    },
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
    removeProductCategory: async (
      parent,
      variables,
      _ctx,
      info: GraphQLResolveInfo
    ) => {
      try {
        const deleteResult = await db.excuteQuery({
          query: `delete from product_category where product_category_id=$categoryId`,
          variables,
        });
        return deleteResult;
      } catch (e: any) {
        console.error(e.stack || e.message);
        debugger;
        throw e;
      }
    },
    saveProductDraft: async (
      parent,
      variables,
      _ctx,
      info: GraphQLResolveInfo
    ) => {
      try {
        const productInput: ProductInput = variables.productInput;
        console.log();
        console.log(util.inspect(productInput));
        console.log();
        console.log();
        let result: any = await db.excuteQuery({
          query: `call draft_save_product(?, ?, ?, ?, ?, ?, ?, ?)`,
          variables: [
            productInput.draftProductId || null,
            productInput.productId || null,
            productInput.category.id || null,
            productInput.title || null,
            productInput.handle || null,
            productInput.manufacturerId || null,
            productInput.price.amount,
            productInput.price.currencyCodeId || "1",
          ],
        });
        console.log(result);
        result = result && result[0] && result[0][0];
        return { draftProductId: result?.draftProductId };
      } catch (e: any) {
        console.error(e.stack || e.message);
        debugger;
        throw e;
      }
    },
    saveProductDraftDescription: async (
      parent,
      variables,
      _ctx,
      info: GraphQLResolveInfo
    ) => {
      try {
        const descriptionInput: ProductInput = variables.descriptionInput;
        let result: any = await db.excuteQuery({
          query: `call draft_save_product_description(?, ?, ?, ?, ?)`,
          variables: [
            descriptionInput.draftProductId || null,
            descriptionInput.productId || null,
            descriptionInput.description || null,
            descriptionInput.descriptionHtml || null,
            descriptionInput.descriptionRawDraftContentState || null,
          ],
        });
        console.log(result);
        result = result && result[0] && result[0][0];
        debugger;
        return { draftProductId: result?.draftProductId || null };
      } catch (e: any) {
        console.error(e.stack || e.message);
        debugger;
        throw e;
      }
    },
    saveProduct: async (parent, variables, _ctx, info: GraphQLResolveInfo) => {
      try {
        const productInput: ProductInput = variables.productInput;
        console.log(util.inspect(productInput));
        debugger;
        return productInput;
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
    productsCategories: async (
      _,
      variables,
      _ctx,
      info: GraphQLResolveInfo
    ) => {
      return { ..._, ...variables };
    },
    priceCurrencyCodes: async (
      _,
      variables,
      _ctx,
      info: GraphQLResolveInfo
    ) => {
      const codes = await db.excuteQuery({
        query: "select * from price_currency_code",
      });
      return { nodes: codes };
    },
    productByHandle: async (_, variables, _ctx, info: GraphQLResolveInfo) => {
      const { handle } = variables;
      const products: any = await db.excuteQuery({
        query: "select * from product where handle=?",
        variables: [handle],
      });
      return products[0];
    },
    draftProduct: async (_, variables, _ctx, info: GraphQLResolveInfo) => {
      try {
        const { draftProductId, productId } = variables;
        let products: Array<any> | undefined = undefined;
        if (draftProductId) {
          products = await db.excuteQuery({
            query:
              "select * from draft_product_view where draftProductId=unhex(?)",
            variables: [draftProductId],
          });
        }
        if (productId && (!products || !products[0])) {
          products = await db.excuteQuery({
            query: "select * from product_view where productId=?",
            variables: [productId],
          });
        }
        const product = (products && products[0]) || {
          draftProductId: draftProductId || null,
        };
        if (product && product.id) {
          product.draftProductId = product.id;
        }
        if (
          product.descriptionRawDraftContentState &&
          typeof product.descriptionRawDraftContentState === "object"
        ) {
          product.descriptionRawDraftContentState = JSON.stringify(
            product.descriptionRawDraftContentState
          );
        }
        product.price = {
          amount: product.amount,
          currencyCode: product.currencyCode ?? "RUB",
          currencyCodeId: product.currencyCodeId || "1",
        };
        debugger;
        return product;
      } catch (e: any) {
        console.error(e.stack || e.message);
        debugger;
        throw e;
      }
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
    draftProductImages: async (
      _,
      variables,
      _ctx,
      info: GraphQLResolveInfo
    ) => {
      return { ...variables };
    },
  },
};

export default resolvers;
