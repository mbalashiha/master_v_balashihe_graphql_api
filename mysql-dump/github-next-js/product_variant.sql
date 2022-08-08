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

-- Дамп структуры для таблица github-next-js.product_variant
CREATE TABLE IF NOT EXISTS `product_variant` (
  `variantId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productId` int(10) unsigned NOT NULL,
  `option_id_1` int(10) unsigned DEFAULT NULL,
  `option_id_2` int(10) unsigned DEFAULT NULL,
  `option_id_3` int(10) unsigned DEFAULT NULL,
  `option_id_4` int(10) unsigned DEFAULT NULL,
  `option_id_5` int(10) unsigned DEFAULT NULL,
  `option_id_6` int(10) unsigned DEFAULT NULL,
  `option_id_7` int(10) unsigned DEFAULT NULL,
  `option_id_8` int(10) unsigned DEFAULT NULL,
  `price` decimal(16,4) unsigned DEFAULT NULL,
  `compareAtPrice` decimal(16,4) unsigned DEFAULT NULL,
  `currencyCodeId` int(10) unsigned NOT NULL DEFAULT 1,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `imageId` int(10) unsigned DEFAULT NULL,
  `sku` tinytext DEFAULT NULL,
  PRIMARY KEY (`variantId`),
  KEY `FK_product_variant_product_option` (`option_id_1`),
  KEY `FK_product_variant_product` (`productId`),
  KEY `FK_product_variant_product_option_2` (`option_id_2`),
  KEY `FK_product_variant_product_option_3` (`option_id_3`),
  KEY `FK_product_variant_product_option_4` (`option_id_4`),
  KEY `FK_product_variant_price_currency_code` (`currencyCodeId`),
  KEY `FK_product_variant_image` (`imageId`),
  KEY `FK_product_variant_product_option_5` (`option_id_5`),
  KEY `FK_product_variant_product_option_6` (`option_id_6`),
  KEY `FK_product_variant_product_option_7` (`option_id_7`),
  KEY `FK_product_variant_product_option_8` (`option_id_8`),
  CONSTRAINT `FK_product_variant_image` FOREIGN KEY (`imageId`) REFERENCES `image` (`imageId`),
  CONSTRAINT `FK_product_variant_price_currency_code` FOREIGN KEY (`currencyCodeId`) REFERENCES `price_currency_code` (`currencyCodeId`),
  CONSTRAINT `FK_product_variant_product` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`),
  CONSTRAINT `FK_product_variant_product_option` FOREIGN KEY (`option_id_1`) REFERENCES `product_option` (`optionId`),
  CONSTRAINT `FK_product_variant_product_option_2` FOREIGN KEY (`option_id_2`) REFERENCES `product_option` (`optionId`),
  CONSTRAINT `FK_product_variant_product_option_3` FOREIGN KEY (`option_id_3`) REFERENCES `product_option` (`optionId`),
  CONSTRAINT `FK_product_variant_product_option_4` FOREIGN KEY (`option_id_4`) REFERENCES `product_option` (`optionId`),
  CONSTRAINT `FK_product_variant_product_option_5` FOREIGN KEY (`option_id_5`) REFERENCES `product_option` (`optionId`),
  CONSTRAINT `FK_product_variant_product_option_6` FOREIGN KEY (`option_id_6`) REFERENCES `product_option` (`optionId`),
  CONSTRAINT `FK_product_variant_product_option_7` FOREIGN KEY (`option_id_7`) REFERENCES `product_option` (`optionId`),
  CONSTRAINT `FK_product_variant_product_option_8` FOREIGN KEY (`option_id_8`) REFERENCES `product_option` (`optionId`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4;

-- Дамп данных таблицы github-next-js.product_variant: ~14 rows (приблизительно)
/*!40000 ALTER TABLE `product_variant` DISABLE KEYS */;
INSERT IGNORE INTO `product_variant` (`variantId`, `productId`, `option_id_1`, `option_id_2`, `option_id_3`, `option_id_4`, `option_id_5`, `option_id_6`, `option_id_7`, `option_id_8`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(27, 13, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, 20.0000, 30.0000, 3, '2022-03-26 19:22:02', '2022-03-26 19:22:02', 5, NULL),
	(28, 13, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, 20.0000, 30.0000, 3, '2022-03-26 19:22:02', '2022-03-26 19:22:02', 5, NULL),
	(29, 13, 6, 4, NULL, NULL, NULL, NULL, NULL, NULL, 20.0000, 30.0000, 3, '2022-03-26 19:22:02', '2022-03-26 19:22:02', 5, NULL),
	(30, 13, 6, 5, NULL, NULL, NULL, NULL, NULL, NULL, 20.0000, 30.0000, 3, '2022-03-26 19:22:02', '2022-03-26 19:22:02', 5, NULL),
	(31, 13, 7, 4, NULL, NULL, NULL, NULL, NULL, NULL, 20.0000, 30.0000, 3, '2022-03-26 19:22:02', '2022-03-26 19:22:02', 5, NULL),
	(32, 13, 7, 5, NULL, NULL, NULL, NULL, NULL, NULL, 20.0000, 30.0000, 3, '2022-03-26 19:22:02', '2022-03-26 19:22:02', 5, NULL),
	(33, 14, 6, 4, NULL, NULL, NULL, NULL, NULL, NULL, 100.0000, 70.0000, 3, '2022-03-26 19:22:23', '2022-03-26 19:22:23', 9, NULL),
	(34, 14, 6, 5, NULL, NULL, NULL, NULL, NULL, NULL, 100.0000, 70.0000, 3, '2022-03-26 19:22:23', '2022-05-08 00:20:42', 7, NULL),
	(35, 14, 7, 4, NULL, NULL, NULL, NULL, NULL, NULL, 100.0000, 70.0000, 3, '2022-03-26 19:22:23', '2022-03-26 19:22:23', 9, NULL),
	(36, 14, 7, 5, NULL, NULL, NULL, NULL, NULL, NULL, 100.0000, 70.0000, 3, '2022-03-26 19:22:23', '2022-03-26 19:22:23', 9, NULL),
	(37, 14, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, 100.0000, 70.0000, 3, '2022-03-26 19:22:23', '2022-03-26 19:22:23', 9, NULL),
	(38, 14, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, 100.0000, 70.0000, 3, '2022-03-26 19:22:24', '2022-03-26 19:22:24', 9, NULL),
	(39, 15, 7, 4, NULL, NULL, NULL, NULL, NULL, NULL, 50.0000, 30.0000, 3, '2022-03-26 19:22:51', '2022-03-26 19:22:51', 15, NULL),
	(40, 15, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, 50.0000, 30.0000, 3, '2022-03-26 19:22:51', '2022-05-08 00:20:38', 13, NULL),
	(41, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 37777777.0000, NULL, 3, '2022-08-05 20:02:32', '2022-08-08 20:50:24', NULL, NULL),
	(42, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3.0000, NULL, 1, '2022-08-05 20:04:30', '2022-08-05 20:04:30', NULL, NULL),
	(43, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3.0000, NULL, 1, '2022-08-07 21:34:49', '2022-08-07 21:34:49', NULL, NULL),
	(44, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3.0000, NULL, 1, '2022-08-07 21:53:14', '2022-08-07 21:53:14', NULL, NULL);
/*!40000 ALTER TABLE `product_variant` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
