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

-- Дамп структуры для представление github-next-js.product_options_view
-- Удаление временной таблицы и создание окончательной структуры представления
DROP TABLE IF EXISTS `product_options_view`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `product_options_view` AS select `p`.`productId` AS `productId`,`v`.`variantId` AS `variantId`,group_concat(concat(coalesce(`on`.`name`,'default'),if(`ov`.`value` is null or `ov`.`value` = '','',concat('-',`ov`.`value`))) separator '-') AS `variantName`,json_objectagg(coalesce(`on`.`name`,'default'),coalesce(`ov`.`value`,'')) AS `options`,`v`.`price` AS `price`,`v`.`compareAtPrice` AS `compareAtPrice`,`cc`.`currencyCode` AS `currencyCode`,`cc`.`currencyCodeId` AS `currencyCodeId`,`v`.`createdAt` AS `createdAt`,`v`.`updatedAt` AS `updatedAt`,`v`.`imageId` AS `imageId`,`v`.`sku` AS `sku` from ((((((`product` `p` left join `manufacturer` `m` on(`m`.`manufacturerId` = `p`.`manufacturerId`)) left join `product_variant` `v` on(`v`.`productId` = `p`.`productId`)) left join `product_variant_id_to_option_id` `v2o` on(`v`.`variantId` = `v2o`.`variantId`)) left join `product_option_name` `on` on(`v2o`.`nameId` = `on`.`nameId`)) left join `product_option_name_value` `ov` on(`v2o`.`valueId` = `ov`.`valueId`)) left join `price_currency_code` `cc` on(`cc`.`currencyCodeId` = coalesce(`v`.`currencyCodeId`,1))) group by `v`.`variantId`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
