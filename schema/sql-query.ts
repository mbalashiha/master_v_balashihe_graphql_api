export const sql = {
  cart: {
    getCheckoutQuery: `
    SELECT Lower(hex(c.checkoutId)) as webUrl, c.*,
        JSON_ARRAYAGG(
            JSON_OBJECT('variantId', i.variantId,
                            'quantity', i.quantity,
                'unityPrice', JSON_OBJECT(
                    'amount', Coalesce( v.price, v.compareAtPrice, 0) * i.quantity,  'currencyCode', cc.currencyCode
                    ),
                    'image',
                        IF(image.imageId is not Null, Json_Object(
                        'imageId', image.imageId,
                        'imgSrc', image.imgSrc,
                        'imgSrc', image.imgSrc,
                        'width', image.width,
                        'height', image.height,
                        'altText', image.altText,
                        'format', image.format
                        ), Null)
                )
            ) AS lineItemsJson,
        JSON_OBJECT('amount', SUM(Coalesce(v.price, v.compareAtPrice, 0) * Coalesce(i.quantity, 1)), 'currencyCode', cc.currencyCode) AS totalPrice,
        JSON_OBJECT('amount', SUM(Coalesce(v.price, v.compareAtPrice, 0) * Coalesce(i.quantity, 1)), 'currencyCode', cc.currencyCode) AS subtotalPrice
    FROM checkout c
        LEFT JOIN checkout_line_item i ON c.checkoutId=i.checkoutId
        LEFT JOIN product_variant v ON v.variantId=i.variantId
        Left Join product_variant_image image ON image.variantId=v.variantId
        Left Join price_currency_code cc On v.currencyCodeId=cc.currencyCodeId
    Where c.checkoutId=unhex($checkoutId)
	GROUP BY c.checkoutId`,
  },
};
