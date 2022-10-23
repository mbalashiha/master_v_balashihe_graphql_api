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
  `managerId` int(10) unsigned NOT NULL,
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
  `descriptionRawDraftContentState` longtext DEFAULT NULL,
  `images_has_been_copied` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`draftProductId`),
  UNIQUE KEY `uniq_manager_product_id` (`managerId`,`productId`),
  KEY `FK_product_product_category` (`product_category_id`),
  KEY `FK_product_manufacturer` (`manufacturerId`) USING BTREE,
  KEY `actual_relation` (`productId`) USING BTREE,
  CONSTRAINT `FK_draft_product_managers` FOREIGN KEY (`managerId`) REFERENCES `managers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_draft_product_product` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Дамп данных таблицы github-next-js.draft_product: ~1 rows (приблизительно)
/*!40000 ALTER TABLE `draft_product` DISABLE KEYS */;
INSERT IGNORE INTO `draft_product` (`draftProductId`, `managerId`, `productId`, `handle`, `title`, `sku`, `product_category_id`, `manufacturerId`, `description`, `descriptionHtml`, `createdAt`, `updatedAt`, `publishedAt`, `descriptionRawDraftContentState`, `images_has_been_copied`) VALUES
	(_binary 0x1ECF1A5352FE11EDB43960A44C4F528E, 1, 14, '11/lightweight-jacket', 'Lightweight Jacket', NULL, 5, 16, NULL, NULL, '2022-10-23 21:11:33', '2022-10-23 21:11:34', NULL, '{"blocks":[{"key":"7ju2f","text":"","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}}],"entityMap":{}}', 1);
/*!40000 ALTER TABLE `draft_product` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
