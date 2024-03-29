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

-- Дамп структуры для таблица github-next-js.product_variant
CREATE TABLE IF NOT EXISTS `product_variant` (
  `variantId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productId` int(10) unsigned NOT NULL,
  `price` decimal(16,4) unsigned DEFAULT NULL,
  `compareAtPrice` decimal(16,4) unsigned DEFAULT NULL,
  `currencyCodeId` int(10) unsigned NOT NULL DEFAULT 1,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `imageId` int(10) unsigned DEFAULT NULL,
  `sku` tinytext DEFAULT NULL,
  PRIMARY KEY (`variantId`),
  KEY `FK_product_variant_product` (`productId`),
  KEY `FK_product_variant_price_currency_code` (`currencyCodeId`),
  KEY `FK_product_variant_image` (`imageId`),
  CONSTRAINT `FK_product_variant_image` FOREIGN KEY (`imageId`) REFERENCES `image` (`imageId`),
  CONSTRAINT `FK_product_variant_price_currency_code` FOREIGN KEY (`currencyCodeId`) REFERENCES `price_currency_code` (`currencyCodeId`),
  CONSTRAINT `FK_product_variant_product` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Дамп данных таблицы github-next-js.product_variant: ~4 rows (приблизительно)
INSERT IGNORE INTO `product_variant` (`variantId`, `productId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(46, 21, 4.0000, NULL, 1, '2022-10-25 15:56:56', '2022-11-04 20:30:37', NULL, NULL),
	(64, 41, 10.0000, NULL, 1, '2022-11-01 20:33:29', '2022-11-01 20:33:29', NULL, NULL),
	(68, 45, 16.0000, NULL, 1, '2022-11-01 20:44:39', '2022-11-13 13:31:49', NULL, NULL),
	(70, 15, 50.0000, NULL, 3, '2022-11-05 20:28:36', '2022-11-05 20:28:36', NULL, NULL),
	(71, 47, 2.0000, NULL, 1, '2022-11-20 22:07:08', '2022-11-26 21:43:47', NULL, NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
