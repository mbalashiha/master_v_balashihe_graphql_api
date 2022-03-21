import { DEF_CHECKOUT } from "@src/data/default-data";
import { buildSchema } from "graphql";
export const typeDefsSchema = buildSchema(`
  type PageInfo {
    startCursor: String
    endCursor: String
    hasNextPage: Boolean
    hasPreviousPage: Boolean
  }

  type MoneyV2 {
    amount: Int
    currencyCode: String
  }

  type PriceRange {
    value: Int
    minVariantPrice: MoneyV2
    maxVariantPrice: MoneyV2
  }

  type ImageEdge {
    cursor: String!
    node: Image
  }

  type ImageConnection {
    pageInfo: PageInfo!
    edges: [ImageEdge]
  }

  type Image {
    pageInfo: PageInfo!
    originalSrc: String
    altText: String
    height: Int
    width: Int
  }

  type Option {
    id: ID
    name: String
    values: [String]
  }

  type SelectedOption {
    name: String
    value: String
  }

  type Variant {
    id: ID
    title: String
    sku: String
    selectedOptions: [SelectedOption]
    priceV2: MoneyV2
    compareAtPriceV2: MoneyV2
    image: Image
    product: Product
  }

  type VariantEdge {
    cursor: String!
    node: Variant
  }

  type VariantConnection {
    pageInfo: PageInfo!
    edges: [VariantEdge]
  }

  type Value {
    label: String
    isDefaul: Boolean
    hexColors: [String]
  }

  type ProductOption {
    entityId: Int
    displayName: String
    values: [Value]
  }

  interface Node {
    id: ID!
  }

  type ProductConnection {
    pageInfo: PageInfo!
    edges: [ProductEdge]
  }

  type ProductEdge {
    cursor: String!
    node: Product
  }

  type Product implements Node {
    id: ID!
    title: String
    handle: String
    description: String
    descriptionHtml: String
    vendor: String
    priceRange: PriceRange
    options: [Option]
    images(first: Int): ImageConnection
    variants(first: Int): VariantConnection
  }

  type CheckoutUserError {
    field: String
    message: String
  }

  type LineItem implements Node {
    id: ID!
    quantity: Int
    title: String
    unityPrice: MoneyV2
    variant: Variant
    product: Product
  }

  type LineItemEdge {
    cursor: String!
    node: LineItem
  }

  type LineItemConnection {
    pageInfo: PageInfo!
    edges: [LineItemEdge]
  }

  type Checkout implements Node {
    id: ID!
    webUrl: String
    subtotalPriceV2: MoneyV2
    totalTaxV2: MoneyV2
    totalPriceV2: MoneyV2
    completedAt: String
    createdAt: String
    taxesIncluded: Boolean
    lineItems(first: Int): LineItemConnection
  }

  type CheckoutResponse {
    checkoutUserErrors: [CheckoutUserError]
    checkout: Checkout
  }

  type Query {
    products(first: Int): ProductConnection
    productByHandle(handle: String): Product
    hello: String
    node(id: ID!): Node
  }

  input CheckoutLineItemInput {
    variantId: ID
    quantity: Int
  }

  input CheckoutLineItemUpdateInput {
    id: ID
    variantId: ID
    quantity: Int
  }

  input CheckoutCreateInput {
    id: ID
  }

  type Mutation {
    checkoutCreate(input: CheckoutCreateInput): CheckoutResponse
    checkoutLineItemsAdd(
      checkoutId: ID
      lineItems: [CheckoutLineItemInput]
    ): CheckoutResponse
    checkoutLineItemsUpdate(
      checkoutId: ID
      lineItems: [CheckoutLineItemUpdateInput]
    ): CheckoutResponse
    checkoutLineItemsRemove(checkoutId: ID, lineItemIds: [ID]): CheckoutResponse
  }
`);
