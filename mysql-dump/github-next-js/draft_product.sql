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

-- Дамп структуры для таблица github-next-js.draft_product
CREATE TABLE IF NOT EXISTS `draft_product` (
  `draftProductId` binary(16) NOT NULL DEFAULT unhex(replace(uuid(),'-','')),
  `productId` int(10) unsigned DEFAULT NULL,
  `handle` varchar(1024) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `title` text DEFAULT NULL,
  `sku` tinytext DEFAULT NULL,
  `product_category_id` int(10) unsigned DEFAULT NULL,
  `manufacturerId` int(10) unsigned DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `descriptionHtml` longtext DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `publishedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`draftProductId`),
  UNIQUE KEY `uniq_handle` (`handle`),
  UNIQUE KEY `uniq_product_name_for_category_id` (`title`(100),`product_category_id`) USING BTREE,
  KEY `FK_product_product_category` (`product_category_id`),
  KEY `FK_product_manufacturer` (`manufacturerId`) USING BTREE,
  KEY `actual_relation` (`productId`) USING BTREE,
  CONSTRAINT `FK_draft_product_product` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Дамп данных таблицы github-next-js.draft_product: ~13 rows (приблизительно)
/*!40000 ALTER TABLE `draft_product` DISABLE KEYS */;
INSERT IGNORE INTO `draft_product` (`draftProductId`, `productId`, `handle`, `title`, `sku`, `product_category_id`, `manufacturerId`, `description`, `descriptionHtml`, `createdAt`, `updatedAt`, `publishedAt`) VALUES
	(_binary 0x14BE44EAE8FA11ECB6DE02004C4F4F50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-10 23:15:36', '2022-06-10 23:15:36', NULL),
	(_binary 0x64B03930EF4211ECB66302004C4F4F50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-18 23:08:21', '2022-06-18 23:08:21', NULL),
	(_binary 0x71CE7675EF3F11ECB66302004C4F4F50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-18 22:47:14', '2022-06-18 22:47:14', NULL),
	(_binary 0xA09E2FFEEF3F11ECB66302004C4F4F50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-18 22:48:33', '2022-06-18 22:48:33', NULL),
	(_binary 0xA816E6A5EF3E11ECB66302004C4F4F50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-18 22:41:36', '2022-06-18 22:41:36', NULL),
	(_binary 0xAD0D0A83EF3E11ECB66302004C4F4F50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-18 22:41:44', '2022-06-18 22:41:44', NULL),
	(_binary 0xB35DA010EF3D11ECB66302004C4F4F50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-18 22:34:45', '2022-06-18 22:34:45', NULL),
	(_binary 0xB41D0B69EF3E11ECB66302004C4F4F50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-18 22:41:56', '2022-06-18 22:41:56', NULL),
	(_binary 0xB4722910EF3D11ECB66302004C4F4F50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-18 22:34:47', '2022-06-18 22:34:47', NULL),
	(_binary 0xB630BDF6EF3E11ECB66302004C4F4F50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-18 22:42:00', '2022-06-18 22:42:00', NULL),
	(_binary 0xB84AB3F2EF3D11ECB66302004C4F4F50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-18 22:34:54', '2022-06-18 22:34:54', NULL),
	(_binary 0xBE4735D9EF3D11ECB66302004C4F4F50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-18 22:35:04', '2022-06-18 22:35:04', NULL),
	(_binary 0xF038DEC8037111ED85C102004C4F4F50, NULL, NULL, 'OPdaaв23', NULL, 5, NULL, NULL, NULL, '2022-07-14 15:39:03', '2022-07-18 02:59:53', NULL);
/*!40000 ALTER TABLE `draft_product` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
