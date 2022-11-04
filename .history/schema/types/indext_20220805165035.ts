export interface ImageInfoInput {
  imgSrc: string;
  width: number;
  height: number;
  format: string;
  orderNumber: number;
}
export interface PriceInput {
  amount: number;
  currencyCode: string;
  currencyCodeId: string;
}
export interface ProductInput {
  draftProductId: string | null;
  productId: string | null;
  title: string | null;
  handle: string | null;
  description: string | null;
  descriptionHtml: string | null;
  descriptionRawDraftContentState: string | null;
  vendor: string | null;
  manufacturerId: string | null;
  price: PriceInput;
  category: ProductCategoryIdInput;
}
export interface ProductCategoryIdInput {
  id: string;
}
export interface FullProductInput extends ProductInput {
  images: ImageInfoInput[];
}