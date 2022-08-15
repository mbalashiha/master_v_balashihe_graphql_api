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
  PRIMARY KEY (`draftVariantId`),
  KEY `FK_draft_product_variant_draft_product` (`draftProductId`),
  KEY `FK_draft_product_variant_price_currency_code` (`currencyCodeId`),
  KEY `FK_draft_product_variant_product_option` (`option_id_1`),
  KEY `FK_draft_product_variant_product_option_2` (`option_id_2`),
  KEY `FK_draft_product_variant_product_option_3` (`option_id_3`),
  KEY `FK_draft_product_variant_product_option_4` (`option_id_4`),
  KEY `FK_draft_product_variant_product_option_5` (`option_id_5`),
  KEY `FK_draft_product_variant_product_option_6` (`option_id_6`),
  KEY `FK_draft_product_variant_product_option_7` (`option_id_7`),
  KEY `FK_draft_product_variant_product_option_8` (`option_id_8`),
  CONSTRAINT `FK_draft_product_variant_draft_product` FOREIGN KEY (`draftProductId`) REFERENCES `draft_product` (`draftProductId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_draft_product_variant_price_currency_code` FOREIGN KEY (`currencyCodeId`) REFERENCES `price_currency_code` (`currencyCodeId`),
  CONSTRAINT `FK_draft_product_variant_product_option` FOREIGN KEY (`option_id_1`) REFERENCES `product_option` (`optionId`),
  CONSTRAINT `FK_draft_product_variant_product_option_2` FOREIGN KEY (`option_id_2`) REFERENCES `product_option` (`optionId`),
  CONSTRAINT `FK_draft_product_variant_product_option_3` FOREIGN KEY (`option_id_3`) REFERENCES `product_option` (`optionId`),
  CONSTRAINT `FK_draft_product_variant_product_option_4` FOREIGN KEY (`option_id_4`) REFERENCES `product_option` (`optionId`),
  CONSTRAINT `FK_draft_product_variant_product_option_5` FOREIGN KEY (`option_id_5`) REFERENCES `product_option` (`optionId`),
  CONSTRAINT `FK_draft_product_variant_product_option_6` FOREIGN KEY (`option_id_6`) REFERENCES `product_option` (`optionId`),
  CONSTRAINT `FK_draft_product_variant_product_option_7` FOREIGN KEY (`option_id_7`) REFERENCES `product_option` (`optionId`),
  CONSTRAINT `FK_draft_product_variant_product_option_8` FOREIGN KEY (`option_id_8`) REFERENCES `product_option` (`optionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Дамп данных таблицы github-next-js.draft_product_variant: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `draft_product_variant` DISABLE KEYS */;
INSERT IGNORE INTO `draft_product_variant` (`draftVariantId`, `draftProductId`, `option_id_1`, `option_id_2`, `option_id_3`, `option_id_4`, `option_id_5`, `option_id_6`, `option_id_7`, `option_id_8`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(_binary 0xDB2FF0A5174211EDB8B260A44C4F528E, _binary 0xDB2FC985174211EDB8B260A44C4F528E, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 37777777.0000, NULL, 3, '2022-08-08 20:52:26', '2022-08-08 20:52:26', NULL, NULL);
/*!40000 ALTER TABLE `draft_product_variant` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
