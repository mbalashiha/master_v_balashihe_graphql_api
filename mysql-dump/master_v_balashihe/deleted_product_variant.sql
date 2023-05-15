-- --------------------------------------------------------
-- Хост:                         192.168.0.50
-- Версия сервера:               10.10.3-MariaDB-1:10.10.3+maria~ubu1804 - mariadb.org binary distribution
-- Операционная система:         debian-linux-gnu
-- HeidiSQL Версия:              12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Дамп структуры для таблица master_v_balashihe.deleted_product_variant
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Дамп данных таблицы master_v_balashihe.deleted_product_variant: ~38 rows (приблизительно)
INSERT IGNORE INTO `deleted_product_variant` (`variantId`, `productId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(27, 13, 20.0000, 30.0000, 3, '2022-03-26 16:22:02', '2022-03-26 16:22:02', 5, NULL);
INSERT IGNORE INTO `deleted_product_variant` (`variantId`, `productId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(28, 13, 20.0000, 30.0000, 3, '2022-03-26 16:22:02', '2022-03-26 16:22:02', 5, NULL);
INSERT IGNORE INTO `deleted_product_variant` (`variantId`, `productId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(29, 13, 20.0000, 30.0000, 3, '2022-03-26 16:22:02', '2022-03-26 16:22:02', 5, NULL);
INSERT IGNORE INTO `deleted_product_variant` (`variantId`, `productId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(30, 13, 20.0000, 30.0000, 3, '2022-03-26 16:22:02', '2022-03-26 16:22:02', 5, NULL);
INSERT IGNORE INTO `deleted_product_variant` (`variantId`, `productId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(31, 13, 20.0000, 30.0000, 3, '2022-03-26 16:22:02', '2022-03-26 16:22:02', 5, NULL);
INSERT IGNORE INTO `deleted_product_variant` (`variantId`, `productId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(32, 13, 20.0000, 30.0000, 3, '2022-03-26 16:22:02', '2022-03-26 16:22:02', 5, NULL);
INSERT IGNORE INTO `deleted_product_variant` (`variantId`, `productId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(33, 14, 100.0000, 70.0000, 3, '2022-03-26 16:22:23', '2022-03-26 16:22:23', 9, NULL);
INSERT IGNORE INTO `deleted_product_variant` (`variantId`, `productId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(34, 14, 100.0000, 70.0000, 3, '2022-03-26 16:22:23', '2022-05-07 21:20:42', 7, NULL);
INSERT IGNORE INTO `deleted_product_variant` (`variantId`, `productId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(35, 14, 100.0000, 70.0000, 3, '2022-03-26 16:22:23', '2022-03-26 16:22:23', 9, NULL);
INSERT IGNORE INTO `deleted_product_variant` (`variantId`, `productId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(36, 14, 100.0000, 70.0000, 3, '2022-03-26 16:22:23', '2022-03-26 16:22:23', 9, NULL);
INSERT IGNORE INTO `deleted_product_variant` (`variantId`, `productId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(37, 14, 100.0000, 70.0000, 3, '2022-03-26 16:22:23', '2022-03-26 16:22:23', 9, NULL);
INSERT IGNORE INTO `deleted_product_variant` (`variantId`, `productId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(38, 14, 100.0000, 70.0000, 3, '2022-03-26 16:22:24', '2022-03-26 16:22:24', 9, NULL);
INSERT IGNORE INTO `deleted_product_variant` (`variantId`, `productId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(41, 16, 4.0000, NULL, 3, '2022-08-05 17:02:32', '2022-10-23 15:44:48', NULL, NULL);
INSERT IGNORE INTO `deleted_product_variant` (`variantId`, `productId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(42, 18, 3.0000, NULL, 1, '2022-08-05 17:04:30', '2022-08-05 17:04:30', NULL, NULL);
INSERT IGNORE INTO `deleted_product_variant` (`variantId`, `productId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(43, 19, 3.0000, NULL, 1, '2022-08-07 18:34:49', '2022-08-07 18:34:49', NULL, NULL);
INSERT IGNORE INTO `deleted_product_variant` (`variantId`, `productId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(44, 20, 3.0000, NULL, 1, '2022-08-07 18:53:14', '2022-08-07 18:53:14', NULL, NULL);
INSERT IGNORE INTO `deleted_product_variant` (`variantId`, `productId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(45, 14, 11.0000, NULL, 3, '2022-10-23 17:58:18', '2022-11-02 11:18:12', NULL, NULL);
INSERT IGNORE INTO `deleted_product_variant` (`variantId`, `productId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(47, 22, 1.0000, NULL, 1, '2022-10-25 15:57:00', '2022-10-25 15:57:00', NULL, NULL);
INSERT IGNORE INTO `deleted_product_variant` (`variantId`, `productId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(48, 25, 1.0000, NULL, 1, '2022-10-25 15:57:45', '2022-10-25 15:57:45', NULL, NULL);
INSERT IGNORE INTO `deleted_product_variant` (`variantId`, `productId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(49, 26, 1.0000, NULL, 1, '2022-10-28 17:16:09', '2022-10-28 17:16:09', NULL, NULL);
INSERT IGNORE INTO `deleted_product_variant` (`variantId`, `productId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(50, 27, 2.0000, NULL, 1, '2022-11-01 17:18:33', '2022-11-01 17:18:33', NULL, NULL);
INSERT IGNORE INTO `deleted_product_variant` (`variantId`, `productId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(51, 28, 2.0000, NULL, 1, '2022-11-01 17:42:05', '2022-11-01 17:42:05', NULL, NULL);
INSERT IGNORE INTO `deleted_product_variant` (`variantId`, `productId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(52, 29, 2.0000, NULL, 1, '2022-11-01 17:42:17', '2022-11-01 17:42:17', NULL, NULL);
INSERT IGNORE INTO `deleted_product_variant` (`variantId`, `productId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(53, 30, 2.0000, NULL, 1, '2022-11-01 17:50:13', '2022-11-01 17:50:13', NULL, NULL);
INSERT IGNORE INTO `deleted_product_variant` (`variantId`, `productId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(54, 31, 2.0000, NULL, 1, '2022-11-01 18:42:36', '2022-11-01 18:42:36', NULL, NULL);
INSERT IGNORE INTO `deleted_product_variant` (`variantId`, `productId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(55, 32, 2.0000, NULL, 1, '2022-11-01 18:46:13', '2022-11-01 18:46:13', NULL, NULL);
INSERT IGNORE INTO `deleted_product_variant` (`variantId`, `productId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(56, 33, 2.0000, NULL, 1, '2022-11-01 18:50:35', '2022-11-01 18:50:35', NULL, NULL);
INSERT IGNORE INTO `deleted_product_variant` (`variantId`, `productId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(57, 34, 2.0000, NULL, 1, '2022-11-01 19:14:41', '2022-11-01 19:14:41', NULL, NULL);
INSERT IGNORE INTO `deleted_product_variant` (`variantId`, `productId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(58, 35, 2.0000, NULL, 1, '2022-11-01 19:17:55', '2022-11-01 19:17:55', NULL, NULL);
INSERT IGNORE INTO `deleted_product_variant` (`variantId`, `productId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(59, 36, 2.0000, NULL, 1, '2022-11-01 19:21:05', '2022-11-01 19:21:05', NULL, NULL);
INSERT IGNORE INTO `deleted_product_variant` (`variantId`, `productId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(60, 37, 2.0000, NULL, 1, '2022-11-01 19:24:32', '2022-11-01 19:24:32', NULL, NULL);
INSERT IGNORE INTO `deleted_product_variant` (`variantId`, `productId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(61, 38, 10.0000, NULL, 2, '2022-11-01 19:52:08', '2022-11-01 19:52:08', NULL, NULL);
INSERT IGNORE INTO `deleted_product_variant` (`variantId`, `productId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(62, 39, 10.0000, NULL, 2, '2022-11-01 20:22:35', '2022-11-01 20:22:35', NULL, NULL);
INSERT IGNORE INTO `deleted_product_variant` (`variantId`, `productId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(63, 40, 10.0000, NULL, 2, '2022-11-01 20:24:48', '2022-11-01 20:24:48', NULL, NULL);
INSERT IGNORE INTO `deleted_product_variant` (`variantId`, `productId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(65, 42, 10.0000, NULL, 1, '2022-11-01 20:36:57', '2022-11-01 20:36:57', NULL, NULL);
INSERT IGNORE INTO `deleted_product_variant` (`variantId`, `productId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(66, 43, 13.0000, NULL, 1, '2022-11-01 20:40:17', '2022-11-01 20:40:17', NULL, NULL);
INSERT IGNORE INTO `deleted_product_variant` (`variantId`, `productId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(67, 44, 13.0000, NULL, 1, '2022-11-01 20:42:29', '2022-11-01 20:42:29', NULL, NULL);
INSERT IGNORE INTO `deleted_product_variant` (`variantId`, `productId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(69, 46, 13.0000, NULL, 1, '2022-11-01 20:52:18', '2022-11-01 20:52:18', NULL, NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
