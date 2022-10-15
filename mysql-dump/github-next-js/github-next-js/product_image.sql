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

-- Дамп структуры для представление github-next-js.product_image
-- Удаление временной таблицы и создание окончательной структуры представления
DROP TABLE IF EXISTS `product_image`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `product_image` AS select `p`.`productId` AS `productId`,`im`.`originalSrc` AS `imgSrc`,`im`.`imageId` AS `imageId`,`im`.`originalSrc` AS `originalSrc`,`im`.`width` AS `width`,`im`.`height` AS `height`,`im`.`altText` AS `altText`,`im`.`format` AS `format`,`im`.`createdAt` AS `createdAt`,`im`.`updatedAt` AS `updatedAt` from ((`product` `p` left join `image_to_product` `ip` on(`p`.`productId` = `ip`.`productId` and (`ip`.`orderNumber` is null or `ip`.`orderNumber` in (select min(`inip`.`orderNumber`) from `image_to_product` `inip` where `inip`.`productId` = `p`.`productId` group by `inip`.`productId`)))) left join `image` `im` on(`im`.`imageId` = `ip`.`imageId`)) group by `p`.`productId`;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
