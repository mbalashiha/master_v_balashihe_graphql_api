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

-- Дамп структуры для представление github-next-js.product_list
-- Удаление временной таблицы и создание окончательной структуры представления
DROP TABLE IF EXISTS `product_list`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `product_list` AS select `p`.`handle` AS `handle`,`cc`.`currencyCode` AS `currencyCode`,`m`.`manufacturerName` AS `vendor`,`p`.`productId` AS `productId`,`p`.`published` AS `published`,`p`.`orderNumber` AS `orderNumber`,`p`.`title` AS `title`,`p`.`sku` AS `sku`,`p`.`product_category_id` AS `product_category_id`,`p`.`manufacturerId` AS `manufacturerId`,`p`.`createdAt` AS `createdAt`,`p`.`updatedAt` AS `updatedAt`,`p`.`publishedAt` AS `publishedAt`,`cc`.`currencyCodeId` AS `currencyCodeId`,NULL AS `draftProductId`,NULL AS `draftVariantId`,json_object('amount',min(`v`.`price`),'currencyCode',`cc`.`currencyCode`,'currencyCodeId',`cc`.`currencyCodeId`) AS `price`,if(`im1`.`imgSrc` is not null and `im1`.`imgSrc` <> '',json_object('imgSrc',`im1`.`imgSrc`,'width',`im1`.`width`,'height',`im1`.`height`,'altText',`im1`.`altText`,'format',`im1`.`format`,'createdAt',`im1`.`createdAt`,'updatedAt',`im1`.`updatedAt`,'existingImageId',`im1`.`imageId`,'originalWidth',`im1`.`originalWidth`,'originalHeight',`im1`.`originalHeight`,'pathOfOriginal',`im1`.`pathOfOriginal`),NULL) AS `image` from (((((`product` `p` left join `manufacturer` `m` on(`m`.`manufacturerId` = `p`.`manufacturerId`)) left join `product_variant` `v` on(`v`.`productId` = `p`.`productId`)) left join `price_currency_code` `cc` on(`cc`.`currencyCodeId` = coalesce(`v`.`currencyCodeId`,1))) left join `image_to_product` `ip1` on(`p`.`productId` = `ip1`.`productId` and `ip1`.`orderNumber` in (select min(`image_to_product`.`orderNumber`) from `image_to_product` where `image_to_product`.`productId` = `p`.`productId`))) left join `image` `im1` on(`ip1`.`imageId` = `im1`.`imageId`)) group by `p`.`productId` order by `p`.`orderNumber`,`p`.`updatedAt` desc;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
