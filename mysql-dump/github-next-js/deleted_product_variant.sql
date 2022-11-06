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

-- Дамп структуры для таблица github-next-js.deleted_product_variant
CREATE TABLE IF NOT EXISTS `deleted_product_variant` (
  `variantId` int(10) unsigned NOT NULL,
  `productId` int(10) unsigned DEFAULT NULL,
  `price` decimal(16,4) unsigned DEFAULT NULL,
  `compareAtPrice` decimal(16,4) unsigned DEFAULT NULL,
  `currencyCodeId` int(10) unsigned DEFAULT 1,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `imageId` int(10) unsigned DEFAULT NULL,
  `sku` tinytext DEFAULT NULL,
  PRIMARY KEY (`variantId`),
  KEY `FK_product_variant_price_currency_code` (`currencyCodeId`),
  KEY `FK_product_variant_image` (`imageId`),
  KEY `FK_deleted_product_variant_deleted_product` (`productId`),
  CONSTRAINT `FK_deleted_product_variant_deleted_product` FOREIGN KEY (`productId`) REFERENCES `deleted_product` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Дамп данных таблицы github-next-js.deleted_product_variant: ~36 rows (приблизительно)
/*!40000 ALTER TABLE `deleted_product_variant` DISABLE KEYS */;
INSERT IGNORE INTO `deleted_product_variant` (`variantId`, `productId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(27, 13, 20.0000, 30.0000, 3, '2022-03-26 19:22:02', '2022-03-26 19:22:02', 5, NULL),
	(28, 13, 20.0000, 30.0000, 3, '2022-03-26 19:22:02', '2022-03-26 19:22:02', 5, NULL),
	(29, 13, 20.0000, 30.0000, 3, '2022-03-26 19:22:02', '2022-03-26 19:22:02', 5, NULL),
	(30, 13, 20.0000, 30.0000, 3, '2022-03-26 19:22:02', '2022-03-26 19:22:02', 5, NULL),
	(31, 13, 20.0000, 30.0000, 3, '2022-03-26 19:22:02', '2022-03-26 19:22:02', 5, NULL),
	(32, 13, 20.0000, 30.0000, 3, '2022-03-26 19:22:02', '2022-03-26 19:22:02', 5, NULL),
	(33, 14, 100.0000, 70.0000, 3, '2022-03-26 19:22:23', '2022-03-26 19:22:23', 9, NULL),
	(34, 14, 100.0000, 70.0000, 3, '2022-03-26 19:22:23', '2022-05-08 00:20:42', 7, NULL),
	(35, 14, 100.0000, 70.0000, 3, '2022-03-26 19:22:23', '2022-03-26 19:22:23', 9, NULL),
	(36, 14, 100.0000, 70.0000, 3, '2022-03-26 19:22:23', '2022-03-26 19:22:23', 9, NULL),
	(37, 14, 100.0000, 70.0000, 3, '2022-03-26 19:22:23', '2022-03-26 19:22:23', 9, NULL),
	(38, 14, 100.0000, 70.0000, 3, '2022-03-26 19:22:24', '2022-03-26 19:22:24', 9, NULL),
	(41, 16, 4.0000, NULL, 3, '2022-08-05 20:02:32', '2022-10-23 18:44:48', NULL, NULL),
	(42, 18, 3.0000, NULL, 1, '2022-08-05 20:04:30', '2022-08-05 20:04:30', NULL, NULL),
	(43, 19, 3.0000, NULL, 1, '2022-08-07 21:34:49', '2022-08-07 21:34:49', NULL, NULL),
	(44, 20, 3.0000, NULL, 1, '2022-08-07 21:53:14', '2022-08-07 21:53:14', NULL, NULL),
	(45, 14, 11.0000, NULL, 3, '2022-10-23 20:58:18', '2022-11-02 14:18:12', NULL, NULL),
	(47, 22, 1.0000, NULL, 1, '2022-10-25 18:57:00', '2022-10-25 18:57:00', NULL, NULL),
	(48, 25, 1.0000, NULL, 1, '2022-10-25 18:57:45', '2022-10-25 18:57:45', NULL, NULL),
	(49, 26, 1.0000, NULL, 1, '2022-10-28 20:16:09', '2022-10-28 20:16:09', NULL, NULL),
	(50, 27, 2.0000, NULL, 1, '2022-11-01 20:18:33', '2022-11-01 20:18:33', NULL, NULL),
	(51, 28, 2.0000, NULL, 1, '2022-11-01 20:42:05', '2022-11-01 20:42:05', NULL, NULL),
	(52, 29, 2.0000, NULL, 1, '2022-11-01 20:42:17', '2022-11-01 20:42:17', NULL, NULL),
	(53, 30, 2.0000, NULL, 1, '2022-11-01 20:50:13', '2022-11-01 20:50:13', NULL, NULL),
	(54, 31, 2.0000, NULL, 1, '2022-11-01 21:42:36', '2022-11-01 21:42:36', NULL, NULL),
	(55, 32, 2.0000, NULL, 1, '2022-11-01 21:46:13', '2022-11-01 21:46:13', NULL, NULL),
	(56, 33, 2.0000, NULL, 1, '2022-11-01 21:50:35', '2022-11-01 21:50:35', NULL, NULL),
	(57, 34, 2.0000, NULL, 1, '2022-11-01 22:14:41', '2022-11-01 22:14:41', NULL, NULL),
	(58, 35, 2.0000, NULL, 1, '2022-11-01 22:17:55', '2022-11-01 22:17:55', NULL, NULL),
	(59, 36, 2.0000, NULL, 1, '2022-11-01 22:21:05', '2022-11-01 22:21:05', NULL, NULL),
	(60, 37, 2.0000, NULL, 1, '2022-11-01 22:24:32', '2022-11-01 22:24:32', NULL, NULL),
	(61, 38, 10.0000, NULL, 2, '2022-11-01 22:52:08', '2022-11-01 22:52:08', NULL, NULL),
	(62, 39, 10.0000, NULL, 2, '2022-11-01 23:22:35', '2022-11-01 23:22:35', NULL, NULL),
	(63, 40, 10.0000, NULL, 2, '2022-11-01 23:24:48', '2022-11-01 23:24:48', NULL, NULL),
	(65, 42, 10.0000, NULL, 1, '2022-11-01 23:36:57', '2022-11-01 23:36:57', NULL, NULL),
	(66, 43, 13.0000, NULL, 1, '2022-11-01 23:40:17', '2022-11-01 23:40:17', NULL, NULL),
	(67, 44, 13.0000, NULL, 1, '2022-11-01 23:42:29', '2022-11-01 23:42:29', NULL, NULL),
	(69, 46, 13.0000, NULL, 1, '2022-11-01 23:52:18', '2022-11-01 23:52:18', NULL, NULL);
/*!40000 ALTER TABLE `deleted_product_variant` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
