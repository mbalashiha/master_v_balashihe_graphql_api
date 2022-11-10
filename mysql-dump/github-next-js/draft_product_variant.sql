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

-- Дамп структуры для таблица github-next-js.draft_product_variant
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Дамп данных таблицы github-next-js.draft_product_variant: ~4 rows (приблизительно)
/*!40000 ALTER TABLE `draft_product_variant` DISABLE KEYS */;
INSERT IGNORE INTO `draft_product_variant` (`draftVariantId`, `draftProductId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(_binary 0x2F8B16345F8811EDBD1B60A44C4F528E, _binary 0x2F8ABE5F5F8811EDBD1B60A44C4F528E, 4.0000, NULL, 1, '2022-10-25 18:56:56', '2022-11-04 23:30:37', NULL, NULL),
	(_binary 0x439781E3612111EDB34760A44C4F528E, _binary 0x43974AB4612111EDB34760A44C4F528E, 13.0000, NULL, 1, '2022-11-01 23:44:39', '2022-11-01 23:44:39', NULL, NULL),
	(_binary 0x6B98577E5D4811EDB3BA60A44C4F528E, _binary 0x6B97E61E5D4811EDB3BA60A44C4F528E, 50.0000, NULL, 3, '2022-11-05 23:28:36', '2022-11-05 23:28:36', NULL, NULL),
	(_binary 0xFDE7B460611F11EDB34760A44C4F528E, _binary 0xFDE785C8611F11EDB34760A44C4F528E, 10.0000, NULL, 1, '2022-11-01 23:33:29', '2022-11-01 23:33:29', NULL, NULL);
/*!40000 ALTER TABLE `draft_product_variant` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
