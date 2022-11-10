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

-- Дамп структуры для таблица github-next-js.product
CREATE TABLE IF NOT EXISTS `product` (
  `productId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `handle` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `title` text NOT NULL,
  `sku` tinytext DEFAULT NULL,
  `product_category_id` int(10) unsigned DEFAULT NULL,
  `manufacturerId` int(10) unsigned DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `descriptionHtml` mediumtext DEFAULT NULL,
  `descriptionRawDraftContentState` mediumtext DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `publishedAt` timestamp NULL DEFAULT NULL,
  `published` tinyint(1) unsigned DEFAULT 1,
  `orderNumber` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`productId`) USING BTREE,
  UNIQUE KEY `uniq_product_name_for_category_id` (`title`(100),`product_category_id`) USING BTREE,
  UNIQUE KEY `uniq_handle` (`handle`) USING HASH,
  KEY `FK_product_product_category` (`product_category_id`),
  KEY `FK_product_manufacturer` (`manufacturerId`) USING BTREE,
  CONSTRAINT `FK_product_manufacturer` FOREIGN KEY (`manufacturerId`) REFERENCES `manufacturer` (`manufacturerId`),
  CONSTRAINT `FK_product_product_category` FOREIGN KEY (`product_category_id`) REFERENCES `product_category` (`product_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4;

-- Дамп данных таблицы github-next-js.product: ~4 rows (приблизительно)
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT IGNORE INTO `product` (`productId`, `handle`, `title`, `sku`, `product_category_id`, `manufacturerId`, `description`, `descriptionHtml`, `descriptionRawDraftContentState`, `createdAt`, `updatedAt`, `publishedAt`, `published`, `orderNumber`) VALUES
	(15, 't-shirt', 'T-Shirt', NULL, 5, 16, NULL, NULL, '{"blocks":[{"key":"4uhlq","text":"","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}}],"entityMap":{}}', '2022-03-26 19:02:09', '2022-11-05 23:28:36', NULL, 0, 1),
	(21, '32234ffffffffffff323232/99', '99', NULL, 34, NULL, NULL, NULL, '{"blocks":[{"key":"93fvt","text":"","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}}],"entityMap":{}}', '2022-10-25 18:56:56', '2022-11-04 23:36:44', NULL, 1, 5),
	(41, 'li22ghtweight-jacket4545420023432afsdf999234324355', '898229234fsdfdsf993243455', NULL, 32, NULL, NULL, NULL, '{"blocks":[{"key":"1oigs","text":"","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}}],"entityMap":{}}', '2022-11-01 23:33:29', '2022-11-10 20:49:18', NULL, 1, 4),
	(45, 'li22g4ht33weight-jacket4545420023432afsdf999234324355', '898224339234fsdfdsf993243455', NULL, 32, NULL, NULL, NULL, '{"blocks":[{"key":"16upo","text":"","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}}],"entityMap":{}}', '2022-11-01 23:44:39', '2022-11-10 16:05:58', NULL, 1, 1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
