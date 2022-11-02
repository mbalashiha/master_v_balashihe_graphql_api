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
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `draft_product_view` AS select coalesce(if(`p`.`handle` = '',NULL,`p`.`handle`),`existingproduct`.`handle`) AS `handle`,`p`.`managerId` AS `managerId`,min(coalesce(`v`.`price`,`v`.`compareAtPrice`)) AS `amount`,`cc`.`currencyCode` AS `currencyCode`,`m`.`manufacturerName` AS `vendor`,lcase(hex(`p`.`draftProductId`)) AS `draftProductId`,lcase(hex(`v`.`draftVariantId`)) AS `draftVariantId`,`p`.`productId` AS `productId`,coalesce(if(`p`.`title` = '',NULL,`p`.`title`),`existingproduct`.`title`,'') AS `title`,`p`.`sku` AS `sku`,`p`.`product_category_id` AS `product_category_id`,`p`.`manufacturerId` AS `manufacturerId`,`p`.`description` AS `description`,`p`.`descriptionHtml` AS `descriptionHtml`,`p`.`descriptionRawDraftContentState` AS `descriptionRawDraftContentState`,`p`.`createdAt` AS `createdAt`,`p`.`updatedAt` AS `updatedAt`,`p`.`publishedAt` AS `publishedAt`,`cc`.`currencyCodeId` AS `currencyCodeId`,`p`.`published` AS `published` from ((((`draft_product` `p` left join `product` `existingproduct` on(`existingproduct`.`productId` = `p`.`productId`)) left join `manufacturer` `m` on(`m`.`manufacturerId` = `p`.`manufacturerId`)) left join `draft_product_variant` `v` on(`v`.`draftProductId` = `p`.`draftProductId`)) left join `price_currency_code` `cc` on(`cc`.`currencyCodeId` = coalesce(`v`.`currencyCodeId`,1))) group by `p`.`draftProductId` order by `p`.`updatedAt` desc;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
