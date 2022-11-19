import { createModule, gql } from "graphql-modules";
import util from "util";
import graphqlFields from "graphql-fields";
import db from "@src/db/execute-query";
import { GraphQLResolveInfo } from "graphql";
import { isPositiveInteger } from "@src/utils/type-checkers";
import { sql } from "@schema/sql-query";
import { Console } from "console";
import { normalizePriceCurrency } from "@src/utils/currency/converter";
import { FullProductInput, ProductInput } from "@schema/types/indext";

function onlyUnique(value, index, self) {
  return self.indexOf(value) === index;
}
export const baseModule = createModule({
  id: "base-module",
  dirname: __dirname,
  typeDefs: [
    gql`
      scalar Date
      type PageInfo {
        hasNextPage: Boolean
        hasPreviousPage: Boolean
      }
      type Pagination {
        startCursor: Int
        endCursor: Int
        hasNextPage: Boolean
        hasPreviousPage: Boolean
      }
      type Price {
        amount: Float
        currencyCode: String
        currencyCodeId: ID
      }
      input PriceInput {
        amount: Float
        currencyCode: String
        currencyCodeId: ID
      }
      type Image {
        imageId: ID
        imgSrc: String
        altText: String
        height: Int
        width: Int
        orderNumber: Int
        originalWidth: Int
        originalHeight: Int
        pathOfOriginal: String
        createdAt: String
        updatedAt: String
        products: [Product]
      }
      type Value {
        label: String
        isDefault: Boolean
        hexColors: [String]
      }
      type ProductOption {
        optionId: Int
        name: String
        values: [String]
      }
      type ImageConnection {
        nodes: [Image]
      }
      type Product {
        productId: ID!
        title: String
        handle: String
        description: String
        descriptionHtml: String
        published: Boolean
        orderNumber: Int
        vendor: String
        price: Price
        category: ProductCategoryId
        image: Image
        images(limit: Int): ImageConnection
        createdAt: Date
        updatedAt: Date
        publishedAt: Date
        breadcrumbs: [Breadcrumb]
      }
      input ProductInput {
        productId: ID
        title: String
        handle: String
        vendor: String
        manufacturerId: ID
        price: PriceInput
        published: Boolean
        orderNumber: Int
        category: ProductCategoryIdInput
      }
      input ProductDescriptionInput {
        productId: ID
        description: String!
        descriptionHtml: String!
      }
      input ImagesInfoInput {
        draftProductId: ID
        productId: ID
        images: [ImageInput]!
      }
      input FullProductInput {
        productId: ID
        title: String!
        handle: String!
        vendor: String
        manufacturerId: ID
        price: PriceInput!
        category: ProductCategoryIdInput
        description: String!
        descriptionHtml: String!
        images: [ImageInput]!
        published: Boolean
        orderNumber: Int
      }
      type CheckoutUserError {
        field: String
        message: String
      }
      type UserError {
        field: String
        message: String
      }
      type LineItem {
        checkoutId: ID!
        variantId: ID!
        quantity: Int
        title: String
        product: ProductConnection
        image: Image
      }
      type LineItemConnection {
        pageInfo: PageInfo
        nodes: [LineItem]
      }
      type Checkout {
        checkoutId: ID!
        webUrl: String
        subtotalPrice: Price
        totalTax: Price
        totalPrice: Price
        completedAt: String
        createdAt: String
        taxesIncluded: Boolean
        lineItems(offset: Int = 0, limit: Int = 250): LineItemConnection
      }
      type CheckoutConnection {
        checkout: Checkout
      }
      type ProductConnection {
        userErrors: [UserError]
        nodes(offset: Int = 0, limit: Int = 250): [Product]
      }
      input CheckoutLineItemInput {
        productId: ID
        quantity: Int!
      }
      input CheckoutCreateInput {
        checkoutId: ID = null
        lineItems: [CheckoutLineItemInput!]!
      }
      type CheckoutResponse {
        checkoutUserErrors: [CheckoutUserError]
        checkoutConnection: CheckoutConnection
      }
      input ImageInput {
        imgSrc: String
        width: Int
        height: Int
        format: String
        orderNumber: Int
        originalWidth: Int
        originalHeight: Int
        pathOfOriginal: String
        altText: String
      }
      input ProductCategoryInput {
        id: ID
        name: String
        parentId: String
        productsCount: Int
      }
      input SlugInput {
        name: String!
        slug: String!
      }
      input CreateCategoryInput {
        parentCategory: ProductCategoryInput
        slugs: [SlugInput!]!
      }
      type CurrencyCode {
        currencyCodeId: ID!
        currencyCode: String!
        symbolCode: String
      }
      type Breadcrumb {
        name: String!
        handle: String!
        type: String
      }
      type ProductCategory {
        id: ID!
        name: String!
        slug: String
        parentId: String
        productsCount: Int
        breadcrumbs: [Breadcrumb]
      }
      type CurrencyCodesResponse {
        nodes: [CurrencyCode!]!
      }
      type ProductsCategoriesResponse {
        userErrors: [UserError]
        createdCategory: ProductCategory
        categoriesConnection: ProductsCategoriesConnection
      }
      type RemovedCategoryResponse {
        userErrors: [UserError]
        categoriesConnection: ProductsCategoriesConnection
      }
      type ProductsCategoriesConnection {
        nodes: [ProductCategory!]!
      }
      type ProductCategoryId {
        id: ID
      }
      input ProductCategoryIdInput {
        id: ID
      }
      type SaveDraftProductPayload {
        userErrors: [UserError]
        draftProductId: ID!
      }
      type SavedImages {
        imgSrc: String!
        imageId: ID!
      }
      type SavedProductResponse {
        userErrors: [UserError]
        productId: ID!
        images: [SavedImages]
      }
      type Mutation {
        checkoutLineItemsAdd(input: CheckoutCreateInput): CheckoutResponse
        checkoutLineItemsUpdate(input: CheckoutCreateInput): CheckoutResponse
        checkoutLineItemsRemove(
          checkoutId: ID!
          lineItemIds: [ID]
        ): CheckoutResponse
      }
      type Query {
        products(offset: Int, limit: Int): ProductConnection
        productByHandle(handle: String): Product
        hello: String
        checkout(id: ID!): CheckoutConnection
        priceCurrencyCodes: CurrencyCodesResponse
        productsCategories: ProductsCategoriesConnection
      }
    `,
  ],
  resolvers: {
    PageInfo: {
      // pagination: (_, variables, _ctx, info: GraphQLResolveInfo) => {
      //   log(variables, _ctx, info);
      // },
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
        let offset = parseInt(variables.offset || parent.offset || 0);
        let limit = parseInt(variables.limit || parent.limit || 250);
        const products: any = await db.excuteQuery({
          query: "select * from product_list Where published=1 Limit ?,?",
          variables: [offset, limit],
        });
        return products;
      },
    },
    Product: {
      breadcrumbs: async (
        parent,
        variables,
        _ctx,
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
      price: async (parent, variables, _ctx, info: GraphQLResolveInfo) => {
        try {
          let price = parent.price;
          if (typeof price === "string") {
            price = JSON.parse(price);
          }
          if (!price) {
            throw new Error("No price field");
          }
          price.currencyCode = price.currencyCode || "RUB";
          price.currencyCodeId = price.currencyCodeId || 1;
          return price;
        } catch (e: any) {
          console.error(e.stack || e.message);
          throw e;
        }
      },
      image: async (parent, variables, _ctx, info: GraphQLResolveInfo) => {
        try {
          if (parent.image && typeof parent.image === "string") {
            parent.image = JSON.parse(parent.image);
          }
          if (parent.image && parent.image.imgSrc) {
            return parent.image;
          } else {
            return null;
          }
        } catch (e: any) {
          console.error(e.stack || e.message);
          throw e;
        }
      },
      images: async (parent, variables, _ctx, info: GraphQLResolveInfo) => {
        try {
          if (parent.images && typeof parent.images === "string") {
            parent.images = JSON.parse(parent.images);
          }
          const nodes = parent.images || [];
          return { nodes };
        } catch (e: any) {
          console.error(e.stack || e.message);
          throw e;
        }
      },
      vendor: async (parent, variables, _ctx, info: GraphQLResolveInfo) => {
        try {
          return parent.vendor || null;
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
      breadcrumbs: async (
        parent,
        variables,
        _ctx,
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
          query: "select * from product_view where handle=?",
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
  },
});
