import { createModule, gql } from "graphql-modules";
import util from "util";
import graphqlFields from "graphql-fields";
import expressJwt from "express-jwt";
import jwt from "jsonwebtoken";
import db from "@src/db/execute-query";
import { GraphQLError, GraphQLResolveInfo } from "graphql";
import { isPositiveInteger } from "@src/utils/type-checkers";
import { sql } from "@schema/sql-query";
import { Console } from "console";
import { normalizePriceCurrency } from "@src/utils/currency/converter";
import { FullProductInput, ProductInput } from "@schema/types/indext";

const getMysqlProcedureLastSelectedRow = (dbResult: any) => {
  return (
    (dbResult &&
      dbResult[dbResult.length - 2] &&
      dbResult[dbResult.length - 2][0]) ||
    {}
  );
};

const getExistingOrNewProductDraft = async (
  in_managerId: string | number,
  in_productId: string | number | null
): Promise<{ draftProductId: string }> => {
  let draftProductId: string = "";
  let lastError: any;
  if (!in_managerId) {
    throw new Error(
      "Manager database id should be presented for product draft."
    );
  }
  for (let i = 0; i < 3 && !draftProductId; i++) {
    try {
      const dbResult = await db.excuteQuery({
        query: "call existing_or_new_product_draft(?, ?);",
        variables: [in_managerId || null, in_productId || null],
      });
      draftProductId =
        getMysqlProcedureLastSelectedRow(dbResult).draftProductId;
      if (!draftProductId || typeof draftProductId !== "string") {
        throw new Error("No draftProductId string variable");
      } else {
        break;
      }
    } catch (e: any) {
      console.error((e && (e.stack || e.message)) || e);
      lastError = e;
      debugger;
    }
  }
  if (lastError) {
    throw lastError;
  }
  return { draftProductId };
};
function onlyUnique(value, index, self) {
  return self.indexOf(value) === index;
}

export const managementModule = createModule({
  id: "management-module",
  dirname: __dirname,
  typeDefs: [
    gql`
      type UploadedImagesConnection {
        images: UploadedImagesNodes
      }
      type UploadedImagesResponse {
        userErrors: [UserError]
        imagesConnection: UploadedImagesConnection
      }
      type RemovedImagesResponse {
        userErrors: [UserError]
        removedImages: [ImageInfo]
        imagesConnection: UploadedImagesConnection
      }
      type UploadedImagesNodes {
        nodes: [ImageInfo]
      }
      type ExistingProductResponse {
        productId: ID
        title: String
        handle: String
        description: String
        descriptionHtml: String
        descriptionRawDraftContentState: String
        vendor: String
        price: Price
        category: ProductCategoryId
        published: Boolean
        manufacturerId: ID
        imagesConnection: UploadedImagesConnection
      }
      type DraftProductResponse {
        productId: ID
        title: String
        handle: String
        description: String
        descriptionHtml: String
        descriptionRawDraftContentState: String
        vendor: String
        price: Price
        category: ProductCategoryId
        published: Boolean
        manufacturerId: ID
        imagesConnection: UploadedImagesConnection
        existingProduct: ExistingProductResponse
      }
      type ExistingProductConnection {
        userErrors: [UserError]
        response: ExistingProductResponse
      }
      type DraftProductConnection {
        userErrors: [UserError]
        response: DraftProductResponse
      }
      type HandleExistsResponse {
        exists: Boolean
      }
      type Mutation {
        productImagesUpdate(
          imagesInput: ImagesInfoInput!
        ): UploadedImagesResponse
        removeProductImage(imagesInput: ImagesInfoInput!): RemovedImagesResponse
        createProductCategory(
          categoryInput: CreateCategoryInput!
        ): ProductsCategoriesResponse
        removeProductCategory(categoryId: ID): ProductsCategoriesResponse
        saveProductDraft(productInput: ProductInput!): SaveDraftProductPayload
        saveProductDraftDescription(
          descriptionInput: ProductDescriptionInput!
        ): SaveDraftProductPayload
        saveProduct(productInput: FullProductInput!): ExistingProductConnection
      }
      type Query {
        productHandleExists(
          handle: String!
          productId: ID
        ): HandleExistsResponse
        managementProducts(offset: Int, limit: Int): ProductConnection
        draftProduct(productId: ID): DraftProductConnection
        draftProductImages(productId: ID): UploadedImagesResponse
      }
    `,
  ],
  resolvers: {
    ExistingProductConnection: {
      response: async (
        parent,
        variables,
        context,
        info: GraphQLResolveInfo
      ) => {
        variables = { ...parent, ...variables };
        if (!context.manager || !context.manager.id) {
          debugger;
          throw new Error("Manager Unauthorized");
        }
        try {
          const { productId } = variables;
          const { draftProductId } = await getExistingOrNewProductDraft(
            context.manager.id,
            productId
          );
          let products: Array<any> | undefined = undefined;
          products = await db.excuteQuery({
            query:
              "select * from draft_product_view where managerId=? and draftProductId=?",
            variables: [context.manager.id, draftProductId],
          });
          if (productId && (!products || !products[0])) {
            products = await db.excuteQuery({
              query: "select * from product_view where productId=?",
              variables: [productId],
            });
          }
          const product = (products && products[0]) || {
            productId: productId || null,
          };
          if (
            product.descriptionRawDraftContentState &&
            typeof product.descriptionRawDraftContentState === "object"
          ) {
            product.descriptionRawDraftContentState = JSON.stringify(
              product.descriptionRawDraftContentState
            );
          }
          product.price = {
            amount: product.amount || null,
            currencyCode: product.currencyCode ?? "RUB",
            currencyCodeId: product.currencyCodeId || "1",
          };
          if (
            product &&
            product.descriptionRawDraftContentState &&
            typeof product.descriptionRawDraftContentState === "object"
          ) {
            product.descriptionRawDraftContentState = JSON.stringify(
              product.descriptionRawDraftContentState
            );
          }
          return { draftProductId, ...product };
        } catch (e: any) {
          console.error(e.stack || e.message);
          debugger;
          throw e;
        }
      },
    },
    DraftProductConnection: {
      response: async (
        parent,
        variables,
        context,
        info: GraphQLResolveInfo
      ) => {
        variables = { ...parent, ...variables };
        if (!context.manager || !context.manager.id) {
          debugger;
          throw new Error("Manager Unauthorized");
        }
        try {
          const { productId } = variables;
          const { draftProductId } = await getExistingOrNewProductDraft(
            context.manager.id,
            productId
          );
          let products: Array<any> | undefined = undefined;
          products = await db.excuteQuery({
            query:
              "select * from draft_product_view where managerId=? and draftProductId=?",
            variables: [context.manager.id, draftProductId],
          });
          if (productId && (!products || !products[0])) {
            products = await db.excuteQuery({
              query: "select * from product_view where productId=?",
              variables: [productId],
            });
          }
          const product = (products && products[0]) || {
            productId: productId || null,
          };
          if (
            product.descriptionRawDraftContentState &&
            typeof product.descriptionRawDraftContentState === "object"
          ) {
            product.descriptionRawDraftContentState = JSON.stringify(
              product.descriptionRawDraftContentState
            );
          }
          product.price = {
            amount: product.amount || null,
            currencyCode: product.currencyCode ?? "RUB",
            currencyCodeId: product.currencyCodeId || "1",
          };
          if (
            product &&
            product.descriptionRawDraftContentState &&
            typeof product.descriptionRawDraftContentState === "object"
          ) {
            product.descriptionRawDraftContentState = JSON.stringify(
              product.descriptionRawDraftContentState
            );
          }
          return { draftProductId, ...product };
        } catch (e: any) {
          console.error(e.stack || e.message);
          debugger;
          throw e;
        }
      },
    },
    UploadedImagesNodes: {
      nodes: async (parent, variables, context, info: GraphQLResolveInfo) => {
        if (!context.manager || !context.manager.id) {
          throw new GraphQLError("Manager Unauthorized");
        }
        try {
          variables = {
            ...parent,
            managerId: context.manager.id,
            ...variables,
          };
          const { productId } = variables;
          if (!variables.draftProductId) {
            const { productId } = variables;
            const { draftProductId } = await getExistingOrNewProductDraft(
              context.manager.id,
              productId
            );
            variables.draftProductId = draftProductId;
          }
          if (!variables.draftProductId) {
            throw new Error(
              "resolvers: UploadedImagesNodes: No variables.draftProductId parameter!"
            );
          }
          const images = await db.excuteQuery({
            query: `select i.*, i.originalSrc as imgSrc, i.existingImageId as imageId, ip.orderNumber
                 from draft_product p
                 JOIN draft_image_to_product ip On p.draftProductId=ip.draftProductId
                 JOIN draft_image i On ip.draftImageId=i.draftImageId
            where p.managerId=$managerId And p.draftProductId=unhex($draftProductId)
            order By ip.orderNumber`,
            variables,
          });
          return (Array.isArray(images) ? images : []).filter(
            (elem) => !!elem.imgSrc
          );
        } catch (e: any) {
          console.error(e.stack || e.message);
          debugger;
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
        context,
        info: GraphQLResolveInfo
      ) => {
        if (!context.manager || !context.manager.id) {
          throw new Error("Manager Unauthorized");
        }
        try {
          variables = {
            ...parent,
            ...variables,
            managerId: context.manager.id,
          };
          return variables;
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
    ExistingProductResponse: {
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
    DraftProductResponse: {
      existingProduct: async (
        parent,
        variables,
        _ctx,
        info: GraphQLResolveInfo
      ) => {
        try {
          variables = { ...parent, ...variables };
          const { productId } = variables;
          let products: Array<any> | null = null;
          if (productId) {
            products = await db.excuteQuery({
              query: "select * from product_view where productId=?",
              variables: [productId],
            });
          }
          const product = (products && products[0]) || null;
          if (
            product &&
            product.descriptionRawDraftContentState &&
            typeof product.descriptionRawDraftContentState === "object"
          ) {
            product.descriptionRawDraftContentState = JSON.stringify(
              product.descriptionRawDraftContentState
            );
          }
          return product;
        } catch (e: any) {
          console.error(e.stack || e.message);
          debugger;
          throw e;
        }
      },
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
    Query: {
      productHandleExists: async (
        parent,
        variables,
        context,
        info: GraphQLResolveInfo
      ) => {
        const { productId, handle } = variables;
        if (!handle) {
          throw new Error("No handle to check.");
        }
        let rows;
        let exists = false;
        if (productId) {
          rows = await db.excuteQuery({
            query: `select 1 from product where productId != $productId and handle=$handle`,
            variables,
          });
        } else {
          rows = await db.excuteQuery({
            query: `select 1 from product where handle=$handle`,
            variables,
          });
        }
        exists = !!(rows && rows.length);
        return { exists };
      },
      draftProduct: async (
        parent,
        variables,
        context,
        info: GraphQLResolveInfo
      ) => {
        //check if the context.manager is null
        return { ...parent, ...variables };
      },
      managementProducts: async (
        _,
        variables,
        context,
        info: GraphQLResolveInfo
      ) => {
        if (!context.manager || !context.manager.id) {
          throw new GraphQLError("Manager Unauthorized");
        }
        return { ...variables };
      },
      draftProductImages: async (
        _,
        variables,
        context,
        info: GraphQLResolveInfo
      ) => {
        if (!context.manager || !context.manager.id) {
          throw new GraphQLError("Manager Unauthorized");
        }
        const { productId } = variables;
        const { draftProductId } = await getExistingOrNewProductDraft(
          context.manager.id,
          productId
        );
        return { ...variables, draftProductId };
      },
    },
    Mutation: {
      createProductCategory: async (
        parent,
        variables,
        context,
        info: GraphQLResolveInfo
      ) => {
        if (!context.manager || !context.manager.id) {
          throw new GraphQLError("Manager Unauthorized");
        }
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
                  variables: {
                    name,
                    slug: (last_slug || "") + slug,
                    parent_id,
                  },
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
        context,
        info: GraphQLResolveInfo
      ) => {
        if (!context.manager || !context.manager.id) {
          throw new Error("Manager Unauthorized");
        }
        try {
          let {
            imagesInput: { productId, images },
          } = variables;
          if (!Array.isArray(images) || images.length <= 0) {
            throw new Error(
              "No variable images! Should be array of images input."
            );
          }
          const { draftProductId } = await getExistingOrNewProductDraft(
            context.manager.id,
            productId
          );
          const removedImages: any[] = [];
          for (const image of images) {
            const res1 = await db.excuteQuery({
              query: `
            delete draft_image_to_product from draft_image_to_product 
              Inner Join draft_product dp On 
                  dp.draftProductId=draft_image_to_product.draftProductId And dp.managerId=$managerId
              INNER JOIN draft_image ON 
                  draft_image.originalSrc=$imgSrc And 
                  draft_image.draftImageId=draft_image_to_product.draftImageId
              Where draft_image.originalSrc=$imgSrc And draft_image_to_product.draftProductId=unhex($draftProductId)
          `,
              variables: {
                ...image,
                managerId: context.manager.id,
                draftProductId,
              },
            });
            const res2: Array<any> = await db.excuteQuery({
              query: `
            delete draft_image from draft_image 
              Where 
                  draft_image.originalSrc=$imgSrc And
                  draft_image.draftImageId Not IN (select draftImageId from draft_image_to_product)
          `,
              variables: {
                ...image,
                managerId: context.manager.id,
              },
            });
            if (res2[0] && res2[0].affectedRows) {
              removedImages.push(image);
            }
          }
          return { draftProductId, removedImages };
        } catch (e: any) {
          console.error(e.stack || e.message);
          debugger;
          throw e;
        }
      },
      productImagesUpdate: async (
        parent,
        variables,
        context,
        info: GraphQLResolveInfo
      ) => {
        if (!context.manager || !context.manager.id) {
          throw new Error("Manager Unauthorized");
        }
        try {
          const {
            imagesInput: { productId, images },
          } = variables;
          if (!Array.isArray(images) || images.length <= 0) {
            throw new Error(
              "No variable images! Should be array of images input."
            );
          }
          const { draftProductId } = await getExistingOrNewProductDraft(
            context.manager.id,
            productId
          );
          const res = await db.excuteQuery({
            query: "call product_Images_Update(?, ?, ?, ?);",
            variables: [
              draftProductId,
              context.manager.id,
              productId || null,
              JSON.stringify(images),
            ],
          });
          return { draftProductId, productId };
        } catch (e: any) {
          console.error(e.stack || e.message);
          debugger;
          throw e;
        }
      },
      removeProductCategory: async (
        parent,
        variables,
        context,
        info: GraphQLResolveInfo
      ) => {
        if (!context.manager || !context.manager.id) {
          throw new Error("Manager Unauthorized");
        }
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
        context,
        info: GraphQLResolveInfo
      ) => {
        if (!context.manager || !context.manager.id) {
          debugger;
          throw new Error("Manager Unauthorized");
        }
        try {
          const productInput: ProductInput = variables.productInput;
          const { productId, published } = productInput;
          const { draftProductId } = await getExistingOrNewProductDraft(
            context.manager.id,
            productId
          );
          let result: any = await db.excuteQuery({
            query: `call draft_save_product(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
            variables: [
              draftProductId,
              context.manager.id || null,
              productInput.productId || null,
              productInput.category.id || null,
              productInput.title || null,
              productInput.handle || null,
              productInput.manufacturerId || null,
              productInput.price?.amount || null,
              productInput.price?.currencyCodeId || "1",
              published ? 1 : null,
            ],
          });
          result = result && result[0] && result[0][0];
          return { draftProductId, productId };
        } catch (e: any) {
          console.error(e.stack || e.message);
          debugger;
          throw e;
        }
      },
      saveProductDraftDescription: async (
        parent,
        variables,
        context,
        info: GraphQLResolveInfo
      ) => {
        if (!context.manager || !context.manager.id) {
          throw new Error("Manager Unauthorized");
        }
        try {
          const descriptionInput: ProductInput = variables.descriptionInput;
          const { productId } = descriptionInput;
          const { draftProductId } = await getExistingOrNewProductDraft(
            context.manager.id,
            productId
          );
          let result: any = await db.excuteQuery({
            query: `call draft_save_product_description(?, ?, ?, ?, ?, ?)`,
            variables: [
              draftProductId,
              context.manager.id || null,
              descriptionInput.productId || null,
              descriptionInput.description || null,
              descriptionInput.descriptionHtml || null,
              descriptionInput.descriptionRawDraftContentState || null,
            ],
          });
          result = result && result[0] && result[0][0];
          return { draftProductId, result };
        } catch (e: any) {
          console.error(e.stack || e.message);
          debugger;
          throw e;
        }
      },
      saveProduct: async (
        parent,
        variables,
        context,
        info: GraphQLResolveInfo
      ) => {
        if (!context.manager || !context.manager.id) {
          throw new Error("Manager Unauthorized");
        }
        try {
          const productInput: FullProductInput = variables.productInput;
          if (!productInput.handle) {
            throw new Error(`Table Column 'handle' cannot be null`);
          }
          const { productId } = productInput;
          const { draftProductId } = await getExistingOrNewProductDraft(
            context.manager.id,
            productId
          );
          // console.log(util.inspect(productInput));
          let result: any = await db.excuteQuery({
            query: `call save_product(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
            variables: [
              draftProductId,
              context.manager.id || null,
              productInput.productId || null,
              productInput.category.id || null,
              productInput.title || null,
              productInput.handle || null,
              productInput.manufacturerId || null,
              productInput.price.amount || null,
              productInput.price.currencyCodeId || null,
              productInput.description || null,
              productInput.descriptionHtml || null,
              productInput.descriptionRawDraftContentState || null,
              JSON.stringify(productInput.images || []),
            ],
          });
          result = result && result[0] && result[0][0];
          console.log(result);
          return { draftProductId, productId: result?.productId || null };
        } catch (e: any) {
          console.error(e.stack || e.message);
          debugger;
          throw e;
        }
      },
    },
  },
});