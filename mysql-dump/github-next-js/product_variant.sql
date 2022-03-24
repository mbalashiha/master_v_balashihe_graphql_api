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
  `price` int(10) unsigned DEFAULT NULL,
  `compareAtPrice` int(10) unsigned DEFAULT NULL,
  `currencyCodeId` int(10) unsigned NOT NULL DEFAULT 1,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;

-- Дамп данных таблицы github-next-js.product_variant: ~6 rows (приблизительно)
/*!40000 ALTER TABLE `product_variant` DISABLE KEYS */;
INSERT IGNORE INTO `product_variant` (`variantId`, `productId`, `option_id_1`, `option_id_2`, `option_id_3`, `option_id_4`, `option_id_5`, `option_id_6`, `option_id_7`, `option_id_8`, `price`, `compareAtPrice`, `currencyCodeId`, `created`, `updated`, `imageId`, `sku`) VALUES
	(13, 9, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, 20, 30, 3, '2022-03-24 20:04:27', '2022-03-24 20:04:27', 1, NULL),
	(14, 9, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, 20, 30, 3, '2022-03-24 20:04:27', '2022-03-24 20:04:27', 1, NULL),
	(15, 9, 6, 4, NULL, NULL, NULL, NULL, NULL, NULL, 20, 30, 3, '2022-03-24 20:04:27', '2022-03-24 20:04:27', 1, NULL),
	(16, 9, 6, 5, NULL, NULL, NULL, NULL, NULL, NULL, 20, 30, 3, '2022-03-24 20:04:27', '2022-03-24 20:04:27', 1, NULL),
	(17, 9, 7, 4, NULL, NULL, NULL, NULL, NULL, NULL, 20, 30, 3, '2022-03-24 20:04:27', '2022-03-24 20:04:27', 1, NULL),
	(18, 9, 7, 5, NULL, NULL, NULL, NULL, NULL, NULL, 20, 30, 3, '2022-03-24 20:04:27', '2022-03-24 20:04:27', 1, NULL),
	(19, 10, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, 20, 30, 3, '2022-03-24 20:14:58', '2022-03-24 20:14:58', 1, NULL),
	(20, 10, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, 20, 30, 3, '2022-03-24 20:14:58', '2022-03-24 20:14:58', 1, NULL),
	(21, 10, 6, 4, NULL, NULL, NULL, NULL, NULL, NULL, 20, 30, 3, '2022-03-24 20:14:58', '2022-03-24 20:14:58', 1, NULL),
	(22, 10, 6, 5, NULL, NULL, NULL, NULL, NULL, NULL, 20, 30, 3, '2022-03-24 20:14:58', '2022-03-24 20:14:58', 1, NULL),
	(23, 10, 7, 4, NULL, NULL, NULL, NULL, NULL, NULL, 20, 30, 3, '2022-03-24 20:14:58', '2022-03-24 20:14:58', 1, NULL),
	(24, 10, 7, 5, NULL, NULL, NULL, NULL, NULL, NULL, 20, 30, 3, '2022-03-24 20:14:58', '2022-03-24 20:14:58', 1, NULL),
	(25, 11, 6, 4, NULL, NULL, NULL, NULL, NULL, NULL, 100, 70, 3, '2022-03-24 20:29:30', '2022-03-24 20:29:30', 1, NULL),
	(26, 11, 6, 5, NULL, NULL, NULL, NULL, NULL, NULL, 100, 70, 3, '2022-03-24 20:29:30', '2022-03-24 20:29:30', NULL, NULL),
	(27, 11, 7, 4, NULL, NULL, NULL, NULL, NULL, NULL, 100, 70, 3, '2022-03-24 20:29:30', '2022-03-24 20:29:30', 1, NULL),
	(28, 11, 7, 5, NULL, NULL, NULL, NULL, NULL, NULL, 100, 70, 3, '2022-03-24 20:29:30', '2022-03-24 20:29:30', 1, NULL),
	(29, 11, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, 100, 70, 3, '2022-03-24 20:29:30', '2022-03-24 20:29:30', 1, NULL),
	(30, 11, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, 100, 70, 3, '2022-03-24 20:29:30', '2022-03-24 20:29:30', 1, NULL),
	(31, 12, 7, 4, NULL, NULL, NULL, NULL, NULL, NULL, 50, 30, 3, '2022-03-24 20:29:31', '2022-03-24 20:29:31', 1, NULL),
	(32, 12, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, 50, 30, 3, '2022-03-24 20:29:31', '2022-03-24 20:29:31', NULL, NULL);
/*!40000 ALTER TABLE `product_variant` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
