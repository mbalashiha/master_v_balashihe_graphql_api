-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               10.5.9-MariaDB - mariadb.org binary distribution
-- Операционная система:         Win64
-- HeidiSQL Версия:              11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Дамп структуры для представление github-next-js.draft_product_view
-- Удаление временной таблицы и создание окончательной структуры представления
DROP TABLE IF EXISTS `draft_product_view`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `draft_product_view` AS select coalesce(if(`p`.`handle` = '',NULL,`p`.`handle`),`existingproduct`.`handle`) AS `handle`,`p`.`managerId` AS `managerId`,min(coalesce(`v`.`price`,`v`.`compareAtPrice`)) AS `amount`,`cc`.`currencyCode` AS `currencyCode`,`m`.`manufacturerName` AS `vendor`,lcase(hex(`p`.`draftProductId`)) AS `draftProductId`,lcase(hex(`v`.`draftVariantId`)) AS `draftVariantId`,`p`.`productId` AS `productId`,`p`.`published` AS `published`,`p`.`orderNumber` AS `orderNumber`,coalesce(if(`p`.`title` = '',NULL,`p`.`title`),`existingproduct`.`title`,'') AS `title`,`p`.`sku` AS `sku`,`p`.`product_category_id` AS `product_category_id`,`p`.`manufacturerId` AS `manufacturerId`,`p`.`description` AS `description`,`p`.`descriptionHtml` AS `descriptionHtml`,`p`.`descriptionRawDraftContentState` AS `descriptionRawDraftContentState`,`p`.`createdAt` AS `createdAt`,`p`.`updatedAt` AS `updatedAt`,`p`.`publishedAt` AS `publishedAt`,`cc`.`currencyCodeId` AS `currencyCodeId`,json_objectagg(concat_ws('-',coalesce(`pov`.`variantName`,''),lcase(hex(`v`.`draftVariantId`)),coalesce(`p`.`productId`,lcase(hex(`p`.`draftProductId`)))),json_extract(`pov`.`options`,'$')) AS `variantsWithOptions`,json_object('amount',min(coalesce(`v`.`price`,`v`.`compareAtPrice`)),'currencyCode',`cc`.`currencyCode`,'currencyCodeId',`cc`.`currencyCodeId`) AS `price`,if(`im1`.`imgSrc` is not null and `im1`.`imgSrc` <> '',json_object('imgSrc',`im1`.`imgSrc`,'width',`im1`.`width`,'height',`im1`.`height`,'altText',`im1`.`altText`,'format',`im1`.`format`,'createdAt',`im1`.`createdAt`,'updatedAt',`im1`.`updatedAt`,'existingImageId',`im1`.`existingImageId`,'originalWidth',`im1`.`originalWidth`,'originalHeight',`im1`.`originalHeight`,'pathOfOriginal',`im1`.`pathOfOriginal`),NULL) AS `image`,concat('[',group_concat(if(`im`.`imgSrc` is not null and `im`.`imgSrc` <> '',json_object('imgSrc',`im`.`imgSrc`,'width',`im`.`width`,'height',`im`.`height`,'altText',`im`.`altText`,'format',`im`.`format`,'createdAt',`im`.`createdAt`,'updatedAt',`im`.`updatedAt`,'existingImageId',`im`.`existingImageId`,'originalWidth',`im`.`originalWidth`,'originalHeight',`im`.`originalHeight`,'pathOfOriginal',`im`.`pathOfOriginal`),NULL) order by `ip`.`orderNumber` ASC separator ','),']') AS `images` from (((((((((`draft_product` `p` left join `product` `existingproduct` on(`existingproduct`.`productId` = `p`.`productId`)) left join `manufacturer` `m` on(`m`.`manufacturerId` = `p`.`manufacturerId`)) left join `draft_product_variant` `v` on(`v`.`draftProductId` = `p`.`draftProductId`)) left join `price_currency_code` `cc` on(`cc`.`currencyCodeId` = coalesce(`v`.`currencyCodeId`,1))) left join `draft_product_options_view` `pov` on(`p`.`draftProductId` = `pov`.`draftProductId`)) left join `draft_image_to_product` `ip1` on(`p`.`draftProductId` = `ip1`.`draftProductId` and `ip1`.`orderNumber` in (select min(`draft_image_to_product`.`orderNumber`) from `draft_image_to_product` where `draft_image_to_product`.`draftProductId` = `p`.`draftProductId`))) left join `draft_image` `im1` on(`ip1`.`draftImageId` = `im1`.`draftImageId`)) left join `draft_image_to_product` `ip` on(`p`.`draftProductId` = `ip`.`draftProductId`)) left join `draft_image` `im` on(`ip`.`draftImageId` = `im`.`draftImageId`)) group by `p`.`draftProductId`;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
