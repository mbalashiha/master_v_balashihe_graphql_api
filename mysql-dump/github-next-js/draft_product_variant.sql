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

-- Дамп данных таблицы github-next-js.draft_product_variant: ~33 rows (приблизительно)
/*!40000 ALTER TABLE `draft_product_variant` DISABLE KEYS */;
INSERT IGNORE INTO `draft_product_variant` (`draftVariantId`, `draftProductId`, `option_id_1`, `option_id_2`, `option_id_3`, `option_id_4`, `option_id_5`, `option_id_6`, `option_id_7`, `option_id_8`, `price`, `compareAtPrice`, `currencyCodeId`, `createdAt`, `updatedAt`, `imageId`, `sku`) VALUES
	(_binary 0x68039C5A5AE711EDB47F60A44C4F528E, _binary 0x680197935AE711EDB47F60A44C4F528E, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 1, '2022-11-02 22:49:07', '2022-11-02 22:49:25', NULL, NULL),
	(_binary 0xAAEC649B5AD711EDB47F60A44C4F528E, _binary 0xAAEBA5AB5AD711EDB47F60A44C4F528E, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, 20.0000, 30.0000, 3, '2022-03-26 19:22:02', '2022-03-26 19:22:02', 5, NULL),
	(_binary 0xAAEC76DE5AD711EDB47F60A44C4F528E, _binary 0xAAEBA5AB5AD711EDB47F60A44C4F528E, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, 20.0000, 30.0000, 3, '2022-03-26 19:22:02', '2022-03-26 19:22:02', 5, NULL),
	(_binary 0xAAEC7F975AD711EDB47F60A44C4F528E, _binary 0xAAEBA5AB5AD711EDB47F60A44C4F528E, 6, 4, NULL, NULL, NULL, NULL, NULL, NULL, 20.0000, 30.0000, 3, '2022-03-26 19:22:02', '2022-03-26 19:22:02', 5, NULL),
	(_binary 0xAAEC876B5AD711EDB47F60A44C4F528E, _binary 0xAAEBA5AB5AD711EDB47F60A44C4F528E, 6, 5, NULL, NULL, NULL, NULL, NULL, NULL, 20.0000, 30.0000, 3, '2022-03-26 19:22:02', '2022-03-26 19:22:02', 5, NULL),
	(_binary 0xAAEC8BCA5AD711EDB47F60A44C4F528E, _binary 0xAAEBA5AB5AD711EDB47F60A44C4F528E, 7, 4, NULL, NULL, NULL, NULL, NULL, NULL, 20.0000, 30.0000, 3, '2022-03-26 19:22:02', '2022-03-26 19:22:02', 5, NULL),
	(_binary 0xAAEC8FE45AD711EDB47F60A44C4F528E, _binary 0xAAEBA5AB5AD711EDB47F60A44C4F528E, 7, 5, NULL, NULL, NULL, NULL, NULL, NULL, 20.0000, 30.0000, 3, '2022-03-26 19:22:02', '2022-03-26 19:22:02', 5, NULL),
	(_binary 0xCF22AA9E5AD611EDB47F60A44C4F528E, _binary 0xCF224FD55AD611EDB47F60A44C4F528E, 6, 4, NULL, NULL, NULL, NULL, NULL, NULL, 100.0000, 70.0000, 3, '2022-03-26 19:22:23', '2022-03-26 19:22:23', 9, NULL),
	(_binary 0xCF22BFA95AD611EDB47F60A44C4F528E, _binary 0xCF224FD55AD611EDB47F60A44C4F528E, 6, 5, NULL, NULL, NULL, NULL, NULL, NULL, 100.0000, 70.0000, 3, '2022-03-26 19:22:23', '2022-05-08 00:20:42', 7, NULL),
	(_binary 0xCF22C2265AD611EDB47F60A44C4F528E, _binary 0xCF224FD55AD611EDB47F60A44C4F528E, 7, 4, NULL, NULL, NULL, NULL, NULL, NULL, 100.0000, 70.0000, 3, '2022-03-26 19:22:23', '2022-03-26 19:22:23', 9, NULL),
	(_binary 0xCF22C38F5AD611EDB47F60A44C4F528E, _binary 0xCF224FD55AD611EDB47F60A44C4F528E, 7, 5, NULL, NULL, NULL, NULL, NULL, NULL, 100.0000, 70.0000, 3, '2022-03-26 19:22:23', '2022-03-26 19:22:23', 9, NULL),
	(_binary 0xCF22C4D85AD611EDB47F60A44C4F528E, _binary 0xCF224FD55AD611EDB47F60A44C4F528E, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, 100.0000, 70.0000, 3, '2022-03-26 19:22:23', '2022-03-26 19:22:23', 9, NULL),
	(_binary 0xCF22C6175AD611EDB47F60A44C4F528E, _binary 0xCF224FD55AD611EDB47F60A44C4F528E, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, 100.0000, 70.0000, 3, '2022-03-26 19:22:24', '2022-03-26 19:22:24', 9, NULL),
	(_binary 0xCF22C7575AD611EDB47F60A44C4F528E, _binary 0xCF224FD55AD611EDB47F60A44C4F528E, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11.0000, NULL, 3, '2022-10-23 20:58:18', '2022-11-02 14:18:12', NULL, NULL);
/*!40000 ALTER TABLE `draft_product_variant` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
