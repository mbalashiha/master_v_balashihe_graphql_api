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

-- Дамп структуры для представление github-next-js.product_variant_image
-- Удаление временной таблицы и создание окончательной структуры представления
DROP TABLE IF EXISTS `product_variant_image`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `product_variant_image` AS select `v`.`productId` AS `productId`,`v`.`variantId` AS `variantId`,`img`.`imageId` AS `imageId`,`img`.`originalSrc` AS `originalSrc`,`img`.`originalSrc` AS `imgSrc`,`img`.`width` AS `width`,`img`.`height` AS `height`,`img`.`altText` AS `altText`,`img`.`format` AS `format`,`img`.`createdAt` AS `createdAt`,`img`.`updatedAt` AS `updatedAt` from (((`product_variant` `v` left join `image` `img1` on(`v`.`imageId` = `img1`.`imageId`)) left join `product_image` `img2` on(`img1`.`imageId` is null and `img2`.`productId` = `v`.`productId`)) left join `image` `img` on(`img`.`imageId` = coalesce(`img1`.`imageId`,`img2`.`imageId`))) group by `v`.`variantId`;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
