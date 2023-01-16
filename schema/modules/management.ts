import { createModule, gql } from "graphql-modules";
import util from "util";
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
        variables: [
          (in_managerId && parseInt(in_managerId as any)) || null,
          (in_productId && parseInt(in_productId as any)) || null,
        ],
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
function onlyUnique(value: any, index: any, self: string | any[]) {
  return self.indexOf(value) === index;
}

export const managementModule = createModule({
  id: "management-module",
  dirname: __dirname,
  typeDefs: [
    gql`
      type ManagementProductConnection {
        userErrors: [UserError]
        nodes(offset: Int = 0, limit: Int = 250): [Product]
      }
      type UploadedImagesConnection {
        images: UploadedImagesNodes
      }
      type UploadedImagesResponse {
        userErrors: [UserError]
        imagesConnection: UploadedImagesConnection
      }
      type RemovedImagesResponse {
        userErrors: [UserError]
        removedImages: [Image]
        imagesConnection: UploadedImagesConnection
      }
      type UploadedImagesNodes {
        nodes: [Image]
      }
      type DraftProductResponse {
        draftProductId: ID
        productId: ID
        title: String
        handle: String
        description: String
        descriptionHtml: String
        vendor: String
        price: Price
        category: ProductCategoryId
        published: Boolean
        orderNumber: Int
        manufacturerId: ID
        imagesConnection: UploadedImagesConnection
        existingProduct: DraftProductResponse
      }
      type ExistingProductConnection {
        userErrors: [UserError]
        response: DraftProductResponse
      }
      type DraftProductConnection {
        userErrors: [UserError]
        response: DraftProductResponse
      }
      type HandleExistsResponse {
        exists: Boolean
      }
      input ProductIdListInput {
        idList: [ID!]!
      }
      type Mutation {
        deleteProducts(
          productIdList: ProductIdListInput!
        ): ManagementProductConnection
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
        saveProductDescription(
          descriptionInput: ProductDescriptionInput!
        ): SaveProductDescriptionPayload
        saveProduct(productInput: FullProductInput!): ExistingProductConnection
      }
      type Query {
        productHandleExists(
          handle: String!
          productId: ID
        ): HandleExistsResponse
        managementProducts(offset: Int, limit: Int): ManagementProductConnection
        draftProduct(productId: ID): DraftProductConnection
        draftProductImages(productId: ID): UploadedImagesResponse
      }
    `,
  ],
  resolvers: {
    ManagementProductConnection: {
      nodes: async (parent: { offset: any; limit: any; }, variables: { offset: any; limit: any; }, _ctx: any, info: GraphQLResolveInfo) => {
        try {
          let offset = parseInt(variables.offset || parent.offset || 0);
          let limit = parseInt(variables.limit || parent.limit || 250);
          const products: any = await db.excuteQuery({
            query: "select * from product_list Limit ?,?",
            variables: [offset, limit],
          });
          return products;
        } catch (e: any) {
          console.error(e.stack || e.message || e);
          debugger;
          throw e;
        }
      },
    },
    ExistingProductConnection: {
      response: async (
        parent: any,
        variables: { productId: any; },
        context: any,
        info: GraphQLResolveInfo
      ) => {
        variables = { ...parent, ...variables };
        try {
          const { productId } = variables;
          let products: Array<any> | undefined = undefined;
          if (productId) {
            products = await db.excuteQuery({
              query: "select * from product_view where productId=?",
              variables: [productId],
            });
          }
          const product = (products && products[0]) || {
            productId: productId || null,
          };
          product.price = {
            amount: product.amount || null,
            currencyCode: product.currencyCode ?? "RUB",
            currencyCodeId: product.currencyCodeId || "1",
          };
          product.draftProductId = null;
          return product;
        } catch (e: any) {
          console.error(e.stack || e.message);
          debugger;
          throw e;
        }
      },
    },
    DraftProductConnection: {
      response: async (
        parent: any,
        variables: { productId: any; },
        context: { manager: { id: any; }; },
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
          product.price = {
            amount: product.amount || null,
            currencyCode: product.currencyCode ?? "RUB",
            currencyCodeId: product.currencyCodeId || "1",
          };
          return { draftProductId, ...product };
        } catch (e: any) {
          console.error(e.stack || e.message);
          debugger;
          throw e;
        }
      },
    },
    UploadedImagesNodes: {
      nodes: async (parent: any, variables: { productId: any; draftProductId: any; }, context: { manager: { id: any; }; }, info: GraphQLResolveInfo) => {
        if (!context.manager || !context.manager.id) {
          throw new GraphQLError("Manager Unauthorized");
        }
        try {
          variables = {
            ...parent,
            managerId: context.manager.id,
            ...variables,
          };
          const { productId, draftProductId } = variables;
          let images;
          if (draftProductId) {
            images = await db.excuteQuery({
              query: `select i.*, i.imgSrc as imgSrc, i.existingImageId as imageId, ip.orderNumber
                 from draft_product p
                 JOIN draft_image_to_product ip On p.draftProductId=ip.draftProductId
                 JOIN draft_image i On ip.draftImageId=i.draftImageId
            where p.managerId=$managerId And p.draftProductId=unhex($draftProductId)
            order By ip.orderNumber`,
              variables,
            });
          } else if (productId) {
            images = await db.excuteQuery({
              query: `select i.*, i.imgSrc as imgSrc, i.imageId, i.imageId as existingImageId, ip.orderNumber
                 from product p
                 JOIN image_to_product ip On p.productId=ip.productId
                 JOIN image i On ip.imageId=i.imageId
            where p.productId=$productId
            order By ip.orderNumber`,
              variables,
            });
          }
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
      images: async (parent: any, variables: any, _ctx: any, info: GraphQLResolveInfo) => {
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
        parent: any,
        variables: any,
        context: { manager: { id: any; }; },
        info: GraphQLResolveInfo
      ) => {
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
        parent: any,
        variables: any,
        _ctx: any,
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
        parent: { removedImages: any; },
        variables: any,
        _ctx: any,
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
      existingProduct: async (
        parent: any,
        variables: { productId: any; },
        _ctx: any,
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
          if (product) {
            product.draftProductId = null;
            return product;
          } else return null;
        } catch (e: any) {
          console.error(e.stack || e.message);
          debugger;
          throw e;
        }
      },
      imagesConnection: async (
        parent: any,
        variables: any,
        _ctx: any,
        info: GraphQLResolveInfo
      ) => {
        try {
          return { ...parent, ...variables };
        } catch (e: any) {
          console.error(e.stack || e.message);
          debugger;
          throw e;
        }
      },
      category: async (parent: { category: { id: any; }; product_category_id: any; }, variables: any, _ctx: any, info: GraphQLResolveInfo) => {
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
        parent: any,
        variables: { productId: any; handle: any; },
        context: any,
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
        parent: any,
        variables: { productId: any; },
        context: { manager: { id: string | number; }; },
        info: GraphQLResolveInfo
      ) => {
        if (!context.manager || !context.manager.id) {
          throw new GraphQLError("Manager Unauthorized");
        }
        try {
          const { productId } = variables;
          const { draftProductId } = await getExistingOrNewProductDraft(
            context.manager.id,
            productId
          );
          //check if the context.manager is null
          return { ...parent, ...variables, draftProductId };
        } catch (e: any) {
          console.error(e.stack || e.message || e);
          debugger;
          throw e;
        }
      },
      managementProducts: async (
        _: any,
        variables: any,
        context: { manager: { id: any; }; },
        info: GraphQLResolveInfo
      ) => {
        if (!context.manager || !context.manager.id) {
          throw new GraphQLError("Manager Unauthorized");
        }
        return { ...variables };
      },
      draftProductImages: async (
        _: any,
        variables: { productId: any; },
        context: { manager: { id: string | number; }; },
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
      deleteProducts: async (
        parent: any,
        variables: { productIdList: any; },
        context: { manager: { id: any; }; },
        info: GraphQLResolveInfo
      ) => {
        if (!context.manager || !context.manager.id) {
          throw new Error("Manager Unauthorized");
        }
        try {
          const { productIdList } = variables;
          const idList: Array<string> = productIdList.idList;
          if (!Array.isArray(idList)) {
            throw new Error(
              "id list argument should be an array of products id strings."
            );
          }
          for (const productId of idList) {
            if (productId) {
              debugger;
              await db.excuteQuery({
                query: `call delete_product_with_backup(?)`,
                variables: [productId],
              });
            }
          }
          return { ...variables };
        } catch (e: any) {
          console.error(e.stack || e.message);
          debugger;
          throw e;
        }
      },
      createProductCategory: async (
        parent: any,
        variables: { categoryInput: { parentCategory: any; slugs: any; }; },
        context: { manager: { id: any; }; },
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
        parent: any,
        variables: { imagesInput: { productId: any; images: any; }; },
        context: { manager: { id: string | number; }; },
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
                  draft_image.imgSrc=$imgSrc And 
                  draft_image.draftImageId=draft_image_to_product.draftImageId
              Where draft_image.imgSrc=$imgSrc And draft_image_to_product.draftProductId=unhex($draftProductId)
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
                  draft_image.imgSrc=$imgSrc And
                  draft_image.draftImageId Not IN (select draftImageId from draft_image_to_product)
          `,
              variables: {
                ...image,
                managerId: context.manager.id,
              },
            });
            /** const res3: Array<any> = await db.excuteQuery({
              query: `
            delete image from image 
              Where 
                  image.imgSrc=$im//////gSrc And
                  image.imageId Not IN (select imageId from image_to_product)
          `,
              variables: {
                ...image,
                managerId: context.manager.id,
              },
            }); **/
            const rows1 = await db.excuteQuery({
              query: `select im.* from image im Where im.imgSrc=$imgSrc And im.imageId In (select imageId from image_to_product)`,
              variables: image,
            });
            const rows2 = await db.excuteQuery({
              query: `
                select dim.* from draft_image dim Where 
                    dim.imgSrc=$imgSrc And dim.draftImageId In (select draftImageId from draft_image_to_product)`,
              variables: image,
            });
            if (!rows1.length && !rows2.length) {
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
        parent: any,
        variables: { imagesInput: { productId: any; images: any; }; },
        context: { manager: { id: any; }; },
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
        parent: any,
        variables: any,
        context: { manager: { id: any; }; },
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
        parent: any,
        variables: { productInput: ProductInput; },
        context: { manager: { id: string | number; }; },
        info: GraphQLResolveInfo
      ) => {
        if (!context.manager || !context.manager.id) {
          debugger;
          throw new Error("Manager Unauthorized");
        }
        try {
          const productInput: ProductInput = variables.productInput;
          const { productId, published, orderNumber } = productInput;
          const { draftProductId } = await getExistingOrNewProductDraft(
            context.manager.id,
            productId
          );
          let result: any = await db.excuteQuery({
            query: `call draft_save_product(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
            variables: [
              draftProductId,
              context.manager.id || null,
              (productId && parseInt(productId)) || null,
              productInput.category.id || null,
              productInput.title || "",
              productInput.handle || "",
              productInput.manufacturerId || null,
              productInput.price?.amount || null,
              productInput.price?.currencyCodeId || "1",
              published ? 1 : 0,
              orderNumber || null,
            ],
          });
          result = result && result[0] && result[0][0];
          return { draftProductId, productId };
        } catch (e: any) {
          console.error(e.stack || e.message);
          throw e;
        }
      },
      saveProductDraftDescription: async (
        parent: any,
        variables: { descriptionInput: ProductInput; },
        context: { manager: { id: string | number; }; },
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
              (productId && parseInt(productId)) || null,
              descriptionInput.description || "",
              descriptionInput.descriptionHtml || "",
              null,
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
        parent: any,
        variables: { productInput: FullProductInput; },
        context: { manager: { id: string | number; }; },
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
          if (!productInput.title) {
            throw new Error(`Table Column 'title' cannot be null`);
          }
          const { productId, orderNumber } = productInput;
          const { draftProductId } = await getExistingOrNewProductDraft(
            context.manager.id,
            productId
          );
          // console.log(util.inspect(productInput));
          let result: any = await db.excuteQuery({
            query: `call save_product(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
            variables: [
              draftProductId,
              context.manager.id || null,
              (productId && parseInt(productId)) || null,
              productInput.category.id || null,
              productInput.title || "",
              productInput.handle || "",
              productInput.manufacturerId || null,
              productInput.price.amount || null,
              productInput.price.currencyCodeId || null,
              productInput.description || "",
              productInput.descriptionHtml || "",
              null,
              JSON.stringify(productInput.images || []),
              productInput.published ? 1 : 0,
              orderNumber || null,
            ],
          });
          result = result && result[0] && result[0][0];
          console.log(result);
          return { draftProductId, productId: result?.productId || null };
        } catch (e: any) {
          console.error(e.stack || e.message);
          throw e;
        }
      },
    },
  },
});
