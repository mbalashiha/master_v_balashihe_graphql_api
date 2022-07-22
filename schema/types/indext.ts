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
  vendor: string | null;
  manufacturerId: string | null;
  price: PriceInput;
  category: ProductCategoryIdInput;
}

export interface ProductCategoryIdInput {
  id: string;
}
