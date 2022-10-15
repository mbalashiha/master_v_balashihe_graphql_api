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

-- Дамп структуры для представление github-next-js.product_view
-- Удаление временной таблицы и создание окончательной структуры представления
DROP TABLE IF EXISTS `product_view`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `product_view` AS select min(coalesce(`v`.`price`,`v`.`compareAtPrice`,0)) AS `amount`,`cc`.`currencyCode` AS `currencyCode`,`m`.`manufacturerName` AS `vendor`,`p`.`productId` AS `productId`,`v`.`variantId` AS `variantId`,`p`.`handle` AS `handle`,`p`.`title` AS `title`,`p`.`sku` AS `sku`,`p`.`product_category_id` AS `product_category_id`,`p`.`manufacturerId` AS `manufacturerId`,`p`.`description` AS `description`,`p`.`descriptionHtml` AS `descriptionHtml`,`p`.`descriptionRawDraftContentState` AS `descriptionRawDraftContentState`,`p`.`createdAt` AS `createdAt`,`p`.`updatedAt` AS `updatedAt`,`p`.`publishedAt` AS `publishedAt`,`cc`.`currencyCodeId` AS `currencyCodeId`,NULL AS `draftProductId`,NULL AS `draftVariantId` from (((`product` `p` left join `manufacturer` `m` on(`m`.`manufacturerId` = `p`.`manufacturerId`)) left join `product_variant` `v` on(`v`.`productId` = `p`.`productId`)) left join `price_currency_code` `cc` on(`cc`.`currencyCodeId` = coalesce(`v`.`currencyCodeId`,1))) group by `p`.`productId`;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
