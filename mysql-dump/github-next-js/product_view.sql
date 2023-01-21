-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               10.10.2-MariaDB - mariadb.org binary distribution
-- Операционная система:         Win64
-- HeidiSQL Версия:              12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Дамп структуры для представление github-next-js.product_view
-- Удаление временной таблицы и создание окончательной структуры представления
DROP TABLE IF EXISTS `product_view`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `product_view` AS select `p`.`handle` AS `handle`,min(coalesce(`v`.`price`,`v`.`compareAtPrice`,0)) AS `amount`,`cc`.`currencyCode` AS `currencyCode`,`m`.`manufacturerName` AS `vendor`,`p`.`productId` AS `productId`,`v`.`variantId` AS `variantId`,`p`.`published` AS `published`,`p`.`orderNumber` AS `orderNumber`,`p`.`title` AS `title`,`p`.`sku` AS `sku`,`p`.`product_category_id` AS `product_category_id`,`p`.`manufacturerId` AS `manufacturerId`,`p`.`description` AS `description`,`p`.`descriptionHtml` AS `descriptionHtml`,`p`.`descriptionRawDraftContentState` AS `descriptionRawDraftContentState`,`p`.`createdAt` AS `createdAt`,`p`.`updatedAt` AS `updatedAt`,`p`.`publishedAt` AS `publishedAt`,`cc`.`currencyCodeId` AS `currencyCodeId`,NULL AS `draftProductId`,NULL AS `draftVariantId`,json_objectagg(concat_ws('-',coalesce(`pov`.`variantName`,''),`v`.`variantId`,`p`.`productId`),json_extract(`pov`.`options`,'$')) AS `variantsWithOptions`,json_object('amount',min(coalesce(`v`.`price`,`v`.`compareAtPrice`)),'currencyCode',`cc`.`currencyCode`,'currencyCodeId',`cc`.`currencyCodeId`) AS `price`,if(`im1`.`imgSrc` is not null and `im1`.`imgSrc` <> '',json_object('imgSrc',`im1`.`imgSrc`,'width',`im1`.`width`,'height',`im1`.`height`,'altText',`im1`.`altText`,'format',`im1`.`format`,'createdAt',`im1`.`createdAt`,'updatedAt',`im1`.`updatedAt`,'existingImageId',`im1`.`imageId`,'originalWidth',`im1`.`originalWidth`,'originalHeight',`im1`.`originalHeight`,'pathOfOriginal',`im1`.`pathOfOriginal`),NULL) AS `image`,concat('[',group_concat(if(`im`.`imgSrc` is not null and `im`.`imgSrc` <> '',json_object('imgSrc',`im`.`imgSrc`,'width',`im`.`width`,'height',`im`.`height`,'altText',`im`.`altText`,'format',`im`.`format`,'createdAt',`im`.`createdAt`,'updatedAt',`im`.`updatedAt`,'existingImageId',`im`.`imageId`,'originalWidth',`im`.`originalWidth`,'originalHeight',`im`.`originalHeight`,'pathOfOriginal',`im`.`pathOfOriginal`),NULL) order by `ip`.`orderNumber` ASC separator ','),']') AS `images` from ((((((((`product` `p` left join `manufacturer` `m` on(`m`.`manufacturerId` = `p`.`manufacturerId`)) left join `product_variant` `v` on(`v`.`productId` = `p`.`productId`)) left join `price_currency_code` `cc` on(`cc`.`currencyCodeId` = coalesce(`v`.`currencyCodeId`,1))) left join `product_options_view` `pov` on(`v`.`variantId` = `pov`.`variantId`)) left join `image_to_product` `ip1` on(`p`.`productId` = `ip1`.`productId` and `ip1`.`orderNumber` in (select min(`image_to_product`.`orderNumber`) from `image_to_product` where `image_to_product`.`productId` = `p`.`productId`))) left join `image` `im1` on(`ip1`.`imageId` = `im1`.`imageId`)) left join `image_to_product` `ip` on(`p`.`productId` = `ip`.`productId`)) left join `image` `im` on(`ip`.`imageId` = `im`.`imageId`)) group by `p`.`productId`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
