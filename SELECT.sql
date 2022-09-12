SELECT
    `v`.`productId` AS `productId`,
    `v`.`variantId` AS `variantId`,
    `img`.`imageId` AS `imageId`,
    `img`.`originalSrc` AS `originalSrc`,
    img.originalSrc as imgSrc,
    `img`.`width` AS `width`,
    `img`.`height` AS `height`,
    `img`.`altText` AS `altText`,
    `img`.`format` AS `format`,
    `img`.`createdAt` AS `createdAt`,
    `img`.`updatedAt` AS `updatedAt`
FROM
    `product_variant` `v`
    LEFT JOIN `image` `img1` ON(`v`.`imageId` = `img1`.`imageId`)

LEFT JOIN `product_image` `img2` ON(
    `img1`.`imageId` IS NULL
    AND `img2`.`productId` = `v`.`productId`
)
LEFT JOIN image img ON img.imageId = Coalesce(img1.imageId, img2.imageId)
GROUP BY
    `v`.`variantId`