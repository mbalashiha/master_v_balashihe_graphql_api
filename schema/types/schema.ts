export namespace Schema {
  export type ID = String | number;
  export type Int = number;
  export type Float = number;
  type String = string;
  export interface ArticleDraftInput {
    id: ID;
    title: String;
    handle: String;
    autoHandleSlug: String;
    published: Boolean;
    orderNumber: Int;
    blogCategoryId: ID;
    existingArticleId: ID;
  }
  export interface ArticleTextDraftInput {
    id: ID;
    text: String;
    textHtml: String;
    textRawDraftContentState: String;
    existingArticleId: ID;
  }
  export interface Image {
    imageId: ID;
    imgSrc: string;
    altText: string;
    height: number;
    width: number;
    orderNumber?: number;
    originalWidth: number;
    originalHeight: number;
    pathOfOriginal: string;
    createdAt: string;
    updatedAt: string;
  }
  export interface ImageConnection {
    nodes: Image[];
  }
  export interface Breadcrumb {
    name: string;
    handle: string;
    type: string;
  }
  export interface CategoryId {
    id: ID;
  }
  export interface BlogArticle {
    articleId: ID;
    title: string;
    handle: string;
    text: string;
    textHtml: string;
    textRawDraftContentState: string | null;
    published: boolean;
    orderNumber: number;
    blogCategoryId: ID;
    category: CategoryId;
    createdAt: Date;
    updatedAt: Date;
    publishedAt: Date;
    breadcrumbs: Breadcrumb[];
  }
  export interface ArticleDraft {
    draftArticleId: ID;
    title: string;
    handle: string;
    autoHandleSlug: string;
    text: string;
    textHtml: string;
    textRawDraftContentState: string | null;
    published: boolean;
    orderNumber: number;
    blogCategoryId: ID;
    category: CategoryId;
    createdAt: Date;
    updatedAt: Date;
    publishedAt: Date;
    existingArticleId: ID | null;
    existingArticle: BlogArticle | null;
  }
  export interface BlogArticlesConnection {
    nodes: BlogArticle[];
  }
  export namespace QueryResponse {
    export interface BlogArticles {
      blogArticles: BlogArticlesConnection;
    }
    export interface ArticleDraftResponse {
      articleDraft: ArticleDraft;
    }
    export interface Manager {
      id: ID;
      friendlyName: String;
      isManager: Boolean;
      isAdmin: Boolean;
      created: Date;
      updated: Date;
    }
    export interface VerifyManagementTokenResponse {
      verifyManagementToken: {
        success: Boolean;
        error: string | null;
        manager: Manager;
      };
    }
  }
}
