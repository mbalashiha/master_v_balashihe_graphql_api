-- --------------------------------------------------------
-- Хост:                         192.168.0.50
-- Версия сервера:               11.0.2-MariaDB-1:11.0.2+maria~ubu2204 - mariadb.org binary distribution
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

-- Дамп структуры для таблица master_v_balashihe.draft_product_variant
CREATE TABLE IF NOT EXISTS `draft_product_variant` (
  `draftVariantId` binary(16) NOT NULL DEFAULT unhex(replace(uuid(),'-','')),
  `draftProductId` binary(16) NOT NULL,
  `price` decimal(16,4) unsigned DEFAULT NULL,
  `compareAtPrice` decimal(16,4) unsigned DEFAULT NULL,
  `currencyCodeId` int(10) unsigned NOT NULL DEFAULT 1,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `imageId` int(10) unsigned DEFAULT NULL,
  `sku` tinytext DEFAULT NULL,
  PRIMARY KEY (`draftVariantId`),
  KEY `FK_draft_product_variant_price_currency_code` (`currencyCodeId`),
  KEY `FK_draft_product_variant_draft_product` (`draftProductId`),
  CONSTRAINT `FK_draft_product_variant_draft_product` FOREIGN KEY (`draftProductId`) REFERENCES `draft_product` (`draftProductId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Дамп данных таблицы master_v_balashihe.draft_product_variant: ~7 rows (приблизительно)
INSERT IGNORE INTO `draft_product_variant` (`draftVariantId`, `draftProductId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(_binary 0x1f4f9fcc68fe11edb24160a44c4f528e, _binary 0x1f4f5ff968fe11edb24160a44c4f528e, NULL, 0.0000, 1, '2022-11-20 18:07:00', '2022-11-20 18:12:29', NULL, NULL);
INSERT IGNORE INTO `draft_product_variant` (`draftVariantId`, `draftProductId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(_binary 0x75269618629311edb37460a44c4f528e, _binary 0x75267585629311edb37460a44c4f528e, 4.0000, NULL, 1, '2022-10-25 15:56:56', '2022-11-04 20:30:37', NULL, NULL);
INSERT IGNORE INTO `draft_product_variant` (`draftVariantId`, `draftProductId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(_binary 0x7a1ca90b637111edb3b560a44c4f528e, _binary 0x7a1c7e20637111edb3b560a44c4f528e, 16.0000, NULL, 1, '2022-11-01 20:44:39', '2022-11-13 13:31:49', NULL, NULL);
INSERT IGNORE INTO `draft_product_variant` (`draftVariantId`, `draftProductId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(_binary 0xa0059fbe629b11edb37460a44c4f528e, _binary 0xa005640a629b11edb37460a44c4f528e, 10.0000, NULL, 1, '2022-11-01 20:33:29', '2022-11-01 20:33:29', NULL, NULL);
INSERT IGNORE INTO `draft_product_variant` (`draftVariantId`, `draftProductId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(_binary 0xa83bab18691f11edb24160a44c4f528e, _binary 0x1f4f5ff968fe11edb24160a44c4f528e, 1.0000, NULL, 1, '2022-11-20 22:07:03', '2022-11-20 22:07:03', NULL, NULL);
INSERT IGNORE INTO `draft_product_variant` (`draftVariantId`, `draftProductId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(_binary 0xabd4ce606dd411edb23e60a44c4f528e, _binary 0xabd4a7b86dd411edb23e60a44c4f528e, 2.0000, NULL, 1, '2022-11-20 22:07:08', '2022-11-26 21:43:47', NULL, NULL);
INSERT IGNORE INTO `draft_product_variant` (`draftVariantId`, `draftProductId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(_binary 0xee594b1e629811edb37460a44c4f528e, _binary 0xee592933629811edb37460a44c4f528e, 50.0000, NULL, 3, '2022-11-05 20:28:36', '2022-11-05 20:28:36', NULL, NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
