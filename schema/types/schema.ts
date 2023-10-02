export namespace Schema {
  export type ID = String | number;
  export type Int = number;
  export type Float = number;
  type Boolean = boolean;
  type String = string;
  export interface ArticleDraftInput {
    id: ID;
    title: String;
    handle: String;
    absURL: String;
    autoHandleSlug: String;
    orderNumber: Int;
    blogCategoryId: ID;
    existingArticleId: ID;
    imageId: ID;
    unPublished: Boolean;
    notSearchable: Boolean;
    notInList: Boolean;
    publishedAt: Date | String | null;
    h2: String | null;
    secondImageId: ID | null;
    templateId: ID | null;
  }
  export interface ArticleTextDraftInput {
    id: ID;
    text: String;
    textHtml: String;
    textRawDraftContentState: String;
    existingArticleId: ID;
  }
  export interface ArticleKeyTextDraftInput {
    id: ID;
    keyTextHtml: String;
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
    id: ID;
    title: string;
    handle: string;
    absURL: string;
    text: string;
    textHtml: string;
    textRawDraftContentState: string | null;
    orderNumber: number;
    blogCategoryId: ID;
    category: CategoryId;
    createdAt: Date;
    updatedAt: Date;
    publishedAt: Date;
    breadcrumbs: Breadcrumb[];
    imageId: ID;
    image: Image;
    randomImage?: Image;
    unPublished: Boolean;
    notSearchable: Boolean;
    notInList: Boolean;
    h2: String | null;
    secondImageId: ID | null;
    viewed: number;
    templateId: ID | null;
  }
  export interface ArticleInput {
    existingArticleId: ID;
    id: ID;
    title: String;
    handle: String;
    autoHandleSlug: String;
    absURL: String;
    text: String;
    textHtml: String;
    textRawDraftContentState: String;
    keyTextHtml: String;
    renderHtml: String;
    orderNumber: Int;
    blogCategoryId: ID;
    imageId: ID | null;
    unPublished: Boolean;
    notSearchable: Boolean;
    notInList: Boolean;
    publishedAt: Date | String;
    h2: String | null;
    secondImageId: ID | null;
    templateId: ID | null;
  }
  export interface ArticleDraft {
    draftArticleId: ID;
    title: string;
    handle: string;
    autoHandleSlug: string;
    text: string;
    textHtml: string;
    textRawDraftContentState: string | null;
    imageId: ID | null;
    orderNumber: number;
    blogCategoryId: ID;
    category: CategoryId;
    createdAt: Date;
    updatedAt: Date;
    publishedAt: Date;
    existingArticleId: ID | null;
    existingArticle: BlogArticle | null;
    unPublished: Boolean;
    notSearchable: Boolean;
    notInList: Boolean;
    h2: String | null;
    secondImageId: ID | null;
    templateId: ID | null;
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
