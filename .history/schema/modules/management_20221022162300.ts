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

const getExistingOrNewProductDraft = async (
  in_managerId: string | number,
  in_productId: string | number
) => {
  let draftProductId: string;
  let lastError: any;
  for (let i = 0; i < 3; i++) {
    try {
      const dbResult = await db.excuteQuery({
        query: "call existing_or_new_product_draft(?, ?);",
        variables: [in_managerId, in_productId],
      });
      draftProductId =
        dbResult[0] && dbResult[0][0] && dbResult[0][0].draftProductId;
      if (!draftProductId || typeof draftProductId !== "string") {
        throw new Error("No draftProductId string variable");
      } else {
        break;
      }
    } catch (e: any) {
      console.error()
      lastError = e;
    }
  }
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
        : ID
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
      type DraftProductResponse {
        : ID
        productId: ID
        title: String
        handle: String
        description: String
        descriptionHtml: String
        descriptionRawDraftContentState: String
        vendor: String
        price: Price
        category: ProductCategoryId
        manufacturerId: ID
        imagesConnection: UploadedImagesConnection
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
        saveProduct(productInput: FullProductInput!): SavedProductResponse
      }
      type Query {
        managementProducts(offset: Int, limit: Int): ProductConnection
        draftProduct(productId: ID, : ID): DraftProductResponse
        draftProductImages(
          productId: ID,
          : ID
        ): UploadedImagesResponse
      }
    `,
  ],
  resolvers: {
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
          let images;
          if (productId) {
            images = await db.excuteQuery({
              query: `select i.*, i.originalSrc as imgSrc, ip.orderNumber
                 from draft_product p
                 JOIN draft_image_to_product ip On p.=ip.
                 JOIN draft_image i On ip.draftImageId=i.draftImageId
            where p.managerId=$managerId And p.productId=$productId And p.=unhex($)
            order By ip.orderNumber`,
              variables,
            });
          } else {
            images = await db.excuteQuery({
              query: `select i.*, i.originalSrc as imgSrc, ip.orderNumber
                 from draft_product p
                 JOIN draft_image_to_product ip On p.=ip.
                 JOIN draft_image i On ip.draftImageId=i.draftImageId
            where p.managerId=$managerId And p.=unhex($)
            order By ip.orderNumber`,
              variables,
            });
          }
          if (productId) {
            images = await db.excuteQuery({
              query: `select i.*, i.originalSrc as imgSrc, ip.orderNumber
                 from product p
                 JOIN image_to_product ip On p.productId=ip.productId
                 JOIN image i On ip.imageId=i.imageId
            where p.productId=$productId
            order By ip.orderNumber`,
              variables,
            });
          }
          return (Array.isArray(images) ? images : []).filter(
            (elem) => !!(elem.imgSrc || elem.originalSrc)
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
    Query: {
      draftProduct: async (_, variables, context, info: GraphQLResolveInfo) => {
        //check if the context.manager is null
        if (!context.manager || !context.manager.id) {
          throw new Error("Manager Unauthorized");
        }
        try {
          const { productId } = variables;
          let products: Array<any> | undefined = undefined;
          products = await db.excuteQuery({
            query:
              "select * from draft_product_view where managerId=? and =unhex(?)",
            variables: [context.manager.id],
          });
          if (productId) {
            products = await db.excuteQuery({
              query:
                "select * from draft_product_view where managerId=? and productId=? Order By updatedAt Desc Limit 1",
              variables: [context.manager.id, productId],
            });
          } else {
            products = await db.excuteQuery({
              query:
                "select * from draft_product_view where managerId=? And productId Is Null Order By updatedAt Desc Limit 1",
              variables: [context.manager.id],
            });
          }
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
            amount: product.amount,
            currencyCode: product.currencyCode ?? "RUB",
            currencyCodeId: product.currencyCodeId || "1",
          };
          return product;
        } catch (e: any) {
          console.error(e.stack || e.message);
          debugger;
          throw e;
        }
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
        return variables;
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
          // if (!) {
          //   throw new Error(
          //     "No variable ! Should be string for ID."
          //   );
          // }
          try {
            const preDraft = await db.excuteQuery({
              query: `call existing_product_to_draft(?, ?)`,
              variables: [productId || null, context.manager.id || null],
            });
          } catch (e: any) {
            console.error(e.stack || e.message || e);
            debugger;
            throw e;
          }
          const removedImages: any[] = [];
          for (const image of images) {
            const res1 = await db.excuteQuery({
              query: `
            delete draft_image_to_product from draft_image_to_product 
              Inner Join draft_product dp On 
                  dp.=draft_image_to_product. And dp.managerId=$managerId
              INNER JOIN draft_image ON 
                  draft_image.originalSrc=$imgSrc And 
                  draft_image.draftImageId=draft_image_to_product.draftImageId
              Where draft_image.originalSrc=$imgSrc And draft_image_to_product.=unhex($)
          `,
              variables: {
                ...image,
                managerId: context.manager.id,
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
          return { removedImages };
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
          const res = await db.excuteQuery({
            query: "call product_Images_Update(?, ?, ?);",
            variables: [
              context.manager.id,
              productId || null,
              JSON.stringify(images),
            ],
          });
          return {};
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
          throw new Error("Manager Unauthorized");
        }
        try {
          const productInput: ProductInput = variables.productInput;
          let result: any = await db.excuteQuery({
            query: `call draft_save_product(?, ?, ?, ?, ?, ?, ?, ?)`,
            variables: [
              context.manager.id || null,
              productInput.productId || null,
              productInput.category.id || null,
              productInput.title || null,
              productInput.handle || null,
              productInput.manufacturerId || null,
              productInput.price?.amount || null,
              productInput.price?.currencyCodeId || "1",
            ],
          });
          result = result && result[0] && result[0][0];
          return {};
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
          let result: any = await db.excuteQuery({
            query: `call draft_save_product_description(?, ?, ?, ?, ?)`,
            variables: [
              context.manager.id || null,
              descriptionInput.productId || null,
              descriptionInput.description || null,
              descriptionInput.descriptionHtml || null,
              descriptionInput.descriptionRawDraftContentState || null,
            ],
          });
          result = result && result[0] && result[0][0];
          return { result };
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
          console.log(util.inspect(productInput));
          let result: any = await db.excuteQuery({
            query: `call save_product(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
            variables: [
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
          console.log(result);
          result = result && result[0] && result[0][0];
          console.log(result);
          return { productId: result?.productId || null };
        } catch (e: any) {
          console.error(e.stack || e.message);
          debugger;
          throw e;
        }
      },
    },
  },
});
