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

-- Дамп данных таблицы github-next-js.draft_product_variant: ~7 rows (приблизительно)
/*!40000 ALTER TABLE `draft_product_variant` DISABLE KEYS */;
INSERT IGNORE INTO `draft_product_variant` (`draftVariantId`, `draftProductId`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(_binary 0x1F4F9FCC68FE11EDB24160A44C4F528E, _binary 0x1F4F5FF968FE11EDB24160A44C4F528E, NULL, 0.0000, 1, '2022-11-20 21:07:00', '2022-11-20 21:12:29', NULL, NULL),
	(_binary 0x75269618629311EDB37460A44C4F528E, _binary 0x75267585629311EDB37460A44C4F528E, 4.0000, NULL, 1, '2022-10-25 18:56:56', '2022-11-04 23:30:37', NULL, NULL),
	(_binary 0x7A1CA90B637111EDB3B560A44C4F528E, _binary 0x7A1C7E20637111EDB3B560A44C4F528E, 16.0000, NULL, 1, '2022-11-01 23:44:39', '2022-11-13 16:31:49', NULL, NULL),
	(_binary 0x8C9C1A626A8111EDB2D960A44C4F528E, _binary 0x8C9B604C6A8111EDB2D960A44C4F528E, 1.0000, NULL, 1, '2022-11-21 01:07:08', '2022-11-21 01:07:08', NULL, NULL),
	(_binary 0xA0059FBE629B11EDB37460A44C4F528E, _binary 0xA005640A629B11EDB37460A44C4F528E, 10.0000, NULL, 1, '2022-11-01 23:33:29', '2022-11-01 23:33:29', NULL, NULL),
	(_binary 0xA83BAB18691F11EDB24160A44C4F528E, _binary 0x1F4F5FF968FE11EDB24160A44C4F528E, 1.0000, NULL, 1, '2022-11-21 01:07:03', '2022-11-21 01:07:03', NULL, NULL),
	(_binary 0xEE594B1E629811EDB37460A44C4F528E, _binary 0xEE592933629811EDB37460A44C4F528E, 50.0000, NULL, 3, '2022-11-05 23:28:36', '2022-11-05 23:28:36', NULL, NULL);
/*!40000 ALTER TABLE `draft_product_variant` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
