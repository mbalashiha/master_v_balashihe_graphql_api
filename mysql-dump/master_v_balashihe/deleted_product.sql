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

-- Дамп структуры для таблица master_v_balashihe.deleted_product
CREATE TABLE IF NOT EXISTS `deleted_product` (
  `productId` int(10) unsigned NOT NULL,
  `handle` text CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `title` text DEFAULT NULL,
  `sku` tinytext DEFAULT NULL,
  `product_category_id` int(10) unsigned DEFAULT NULL,
  `manufacturerId` int(10) unsigned DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `descriptionHtml` mediumtext DEFAULT NULL,
  `descriptionRawDraftContentState` mediumtext DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `publishedAt` timestamp NULL DEFAULT NULL,
  `published` tinyint(1) unsigned DEFAULT 1,
  `orderNumber` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`productId`) USING BTREE,
  UNIQUE KEY `uniq_product_name_for_category_id` (`title`(100),`product_category_id`) USING BTREE,
  UNIQUE KEY `uniq_handle` (`handle`) USING HASH,
  KEY `FK_product_manufacturer` (`manufacturerId`) USING BTREE,
  KEY `FK_deleted_product_product_category` (`product_category_id`),
  CONSTRAINT `FK_deleted_product_product_category` FOREIGN KEY (`product_category_id`) REFERENCES `product_category` (`product_category_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Дамп данных таблицы master_v_balashihe.deleted_product: ~27 rows (приблизительно)
INSERT IGNORE INTO `deleted_product` (`productId`, `handle`, `title`, `sku`, `product_category_id`, `manufacturerId`, `description`, `descriptionHtml`, `descriptionRawDraftContentState`, `createdAt`, `updatedAt`, `publishedAt`, `published`, `orderNumber`) VALUES
	(13, 'cool-hat', 'Cool Hat', NULL, NULL, 16, 'The Next.js beanie has arrived! This embroidered beauty has a snug fit that ensures you\'re going to feel cozy and warm whatever you\'re doing. • 60% cotton, 40% acrylic• Breathable cotton blend• Form-fitting shape• One size fits most', '<meta charset="utf-8">\n<p data-mce-fragment="1">The Next.js beanie has arrived! This embroidered beauty has a snug fit that ensures you\'re going to feel cozy and warm whatever you\'re doing.</p>\n<p data-mce-fragment="1">• 60% cotton, 40% acrylic<br data-mce-fragment="1">• Breathable cotton blend<br data-mce-fragment="1">• Form-fitting shape<br data-mce-fragment="1">• One size fits most</p>\n<meta charset="utf-8">', NULL, '2022-03-26 16:02:09', '2022-03-26 16:02:09', NULL, NULL, NULL);
INSERT IGNORE INTO `deleted_product` (`productId`, `handle`, `title`, `sku`, `product_category_id`, `manufacturerId`, `description`, `descriptionHtml`, `descriptionRawDraftContentState`, `createdAt`, `updatedAt`, `publishedAt`, `published`, `orderNumber`) VALUES
	(14, '111199333434', '99888434334', NULL, 34, NULL, NULL, NULL, '{"blocks":[{"key":"fshhl","text":"","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}}],"entityMap":{}}', '2022-03-26 16:02:09', '2022-11-02 11:18:12', NULL, 1, NULL);
INSERT IGNORE INTO `deleted_product` (`productId`, `handle`, `title`, `sku`, `product_category_id`, `manufacturerId`, `description`, `descriptionHtml`, `descriptionRawDraftContentState`, `createdAt`, `updatedAt`, `publishedAt`, `published`, `orderNumber`) VALUES
	(16, '222/222/11/32234ffffffffffff323232/32234ffffffffffff323232/34234', '342343434', NULL, 32, NULL, '#####', '<p>#####</p>\n', '{"blocks":[{"key":"4glk8","text":"#####","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}}],"entityMap":{}}', '2022-08-05 17:02:32', '2022-10-23 17:57:00', NULL, NULL, NULL);
INSERT IGNORE INTO `deleted_product` (`productId`, `handle`, `title`, `sku`, `product_category_id`, `manufacturerId`, `description`, `descriptionHtml`, `descriptionRawDraftContentState`, `createdAt`, `updatedAt`, `publishedAt`, `published`, `orderNumber`) VALUES
	(18, '34234hhhh', '34234hhhh', NULL, 5, NULL, '7', '<p>7</p>\n', '{"blocks":[{"key":"bsjh3","text":"7","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}}],"entityMap":{}}', '2022-08-05 17:04:30', '2022-08-05 17:04:30', NULL, NULL, NULL);
INSERT IGNORE INTO `deleted_product` (`productId`, `handle`, `title`, `sku`, `product_category_id`, `manufacturerId`, `description`, `descriptionHtml`, `descriptionRawDraftContentState`, `createdAt`, `updatedAt`, `publishedAt`, `published`, `orderNumber`) VALUES
	(19, '32234ffffffffffff323232/3', '3', NULL, 34, NULL, NULL, NULL, '{"blocks":[{"key":"7aduu","text":"","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}}],"entityMap":{}}', '2022-08-07 18:34:49', '2022-08-07 18:34:49', NULL, NULL, NULL);
INSERT IGNORE INTO `deleted_product` (`productId`, `handle`, `title`, `sku`, `product_category_id`, `manufacturerId`, `description`, `descriptionHtml`, `descriptionRawDraftContentState`, `createdAt`, `updatedAt`, `publishedAt`, `published`, `orderNumber`) VALUES
	(20, '32234ffffffffffff323232/24324', '24324', NULL, 34, NULL, NULL, NULL, '{"blocks":[{"key":"2suc8","text":"","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}}],"entityMap":{}}', '2022-08-07 18:53:14', '2022-08-07 18:53:14', NULL, NULL, NULL);
INSERT IGNORE INTO `deleted_product` (`productId`, `handle`, `title`, `sku`, `product_category_id`, `manufacturerId`, `description`, `descriptionHtml`, `descriptionRawDraftContentState`, `createdAt`, `updatedAt`, `publishedAt`, `published`, `orderNumber`) VALUES
	(22, '32234ffffffffffff323232/99dd', '99dd', NULL, 34, NULL, NULL, NULL, '{"blocks":[{"key":"93fvt","text":"","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}}],"entityMap":{}}', '2022-10-25 15:57:00', '2022-11-01 21:15:14', NULL, 1, NULL);
INSERT IGNORE INTO `deleted_product` (`productId`, `handle`, `title`, `sku`, `product_category_id`, `manufacturerId`, `description`, `descriptionHtml`, `descriptionRawDraftContentState`, `createdAt`, `updatedAt`, `publishedAt`, `published`, `orderNumber`) VALUES
	(25, '32234ffffffffffff323232/dsfdsf33333', '99dd00', NULL, 34, NULL, NULL, NULL, '{"blocks":[{"key":"93fvt","text":"","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}}],"entityMap":{}}', '2022-10-25 15:57:45', '2022-11-01 19:13:53', NULL, 1, NULL);
INSERT IGNORE INTO `deleted_product` (`productId`, `handle`, `title`, `sku`, `product_category_id`, `manufacturerId`, `description`, `descriptionHtml`, `descriptionRawDraftContentState`, `createdAt`, `updatedAt`, `publishedAt`, `published`, `orderNumber`) VALUES
	(26, '32234ffffffffffff323232/dsfdsf33333dsds', '99dd0011', NULL, 34, NULL, NULL, NULL, '{"blocks":[{"key":"98tkq","text":"","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}}],"entityMap":{}}', '2022-10-28 17:16:09', '2022-11-01 20:55:14', NULL, 0, NULL);
INSERT IGNORE INTO `deleted_product` (`productId`, `handle`, `title`, `sku`, `product_category_id`, `manufacturerId`, `description`, `descriptionHtml`, `descriptionRawDraftContentState`, `createdAt`, `updatedAt`, `publishedAt`, `published`, `orderNumber`) VALUES
	(27, '12221/lightweight-jacket333', '99', NULL, 32, NULL, NULL, NULL, '{"blocks":[{"key":"13e1b","text":"","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}}],"entityMap":{}}', '2022-11-01 17:18:33', '2022-11-01 17:18:33', NULL, 1, NULL);
INSERT IGNORE INTO `deleted_product` (`productId`, `handle`, `title`, `sku`, `product_category_id`, `manufacturerId`, `description`, `descriptionHtml`, `descriptionRawDraftContentState`, `createdAt`, `updatedAt`, `publishedAt`, `published`, `orderNumber`) VALUES
	(28, '12221/lightweight-jacket3333', '99d', NULL, 32, NULL, NULL, NULL, '{"blocks":[{"key":"291jg","text":"","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}}],"entityMap":{}}', '2022-11-01 17:42:05', '2022-11-01 17:42:05', NULL, 1, NULL);
INSERT IGNORE INTO `deleted_product` (`productId`, `handle`, `title`, `sku`, `product_category_id`, `manufacturerId`, `description`, `descriptionHtml`, `descriptionRawDraftContentState`, `createdAt`, `updatedAt`, `publishedAt`, `published`, `orderNumber`) VALUES
	(29, '12221/lightweight-jacket33333333', '99d333', NULL, 32, NULL, NULL, NULL, '{"blocks":[{"key":"291jg","text":"","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}}],"entityMap":{}}', '2022-11-01 17:42:17', '2022-11-01 17:42:17', NULL, 1, NULL);
INSERT IGNORE INTO `deleted_product` (`productId`, `handle`, `title`, `sku`, `product_category_id`, `manufacturerId`, `description`, `descriptionHtml`, `descriptionRawDraftContentState`, `createdAt`, `updatedAt`, `publishedAt`, `published`, `orderNumber`) VALUES
	(30, '12221/lightweight-jacket333324324333', '99432432', NULL, 32, NULL, NULL, NULL, '{"blocks":[{"key":"2k4ji","text":"","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}}],"entityMap":{}}', '2022-11-01 17:50:13', '2022-11-01 17:50:13', NULL, 1, NULL);
INSERT IGNORE INTO `deleted_product` (`productId`, `handle`, `title`, `sku`, `product_category_id`, `manufacturerId`, `description`, `descriptionHtml`, `descriptionRawDraftContentState`, `createdAt`, `updatedAt`, `publishedAt`, `published`, `orderNumber`) VALUES
	(31, '12221/lightweight-jacket3333333300', '99d33399', NULL, 32, NULL, NULL, NULL, '{"blocks":[{"key":"e57r5","text":"","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}}],"entityMap":{}}', '2022-11-01 18:42:36', '2022-11-01 18:42:36', NULL, 1, NULL);
INSERT IGNORE INTO `deleted_product` (`productId`, `handle`, `title`, `sku`, `product_category_id`, `manufacturerId`, `description`, `descriptionHtml`, `descriptionRawDraftContentState`, `createdAt`, `updatedAt`, `publishedAt`, `published`, `orderNumber`) VALUES
	(32, '12221/lightweight-jacket33332432433323232', '99432432323223', NULL, 32, NULL, NULL, NULL, '{"blocks":[{"key":"fpq2f","text":"","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}}],"entityMap":{}}', '2022-11-01 18:46:13', '2022-11-01 18:46:13', NULL, 1, NULL);
INSERT IGNORE INTO `deleted_product` (`productId`, `handle`, `title`, `sku`, `product_category_id`, `manufacturerId`, `description`, `descriptionHtml`, `descriptionRawDraftContentState`, `createdAt`, `updatedAt`, `publishedAt`, `published`, `orderNumber`) VALUES
	(33, '12221/lightweight-jacket333333330000000', '99d33399000000', NULL, 32, NULL, NULL, NULL, '{"blocks":[{"key":"5qpud","text":"","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}}],"entityMap":{}}', '2022-11-01 18:50:35', '2022-11-01 18:50:35', NULL, 1, NULL);
INSERT IGNORE INTO `deleted_product` (`productId`, `handle`, `title`, `sku`, `product_category_id`, `manufacturerId`, `description`, `descriptionHtml`, `descriptionRawDraftContentState`, `createdAt`, `updatedAt`, `publishedAt`, `published`, `orderNumber`) VALUES
	(34, '3434343fffffffffffffffffffffffffffffffffffffffffffffffffffffffffff', '3434343fffffffffffffffffffffffffffffffffffffffffffffffffffffffffff', NULL, 32, NULL, NULL, NULL, '{"blocks":[{"key":"6487j","text":"","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}}],"entityMap":{}}', '2022-11-01 19:14:41', '2022-11-01 19:14:41', NULL, 1, NULL);
INSERT IGNORE INTO `deleted_product` (`productId`, `handle`, `title`, `sku`, `product_category_id`, `manufacturerId`, `description`, `descriptionHtml`, `descriptionRawDraftContentState`, `createdAt`, `updatedAt`, `publishedAt`, `published`, `orderNumber`) VALUES
	(35, 'lightweight-jacket45454', '8989', NULL, 5, NULL, NULL, NULL, '{"blocks":[{"key":"2286e","text":"","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}}],"entityMap":{}}', '2022-11-01 19:17:55', '2022-11-01 19:17:55', NULL, 1, NULL);
INSERT IGNORE INTO `deleted_product` (`productId`, `handle`, `title`, `sku`, `product_category_id`, `manufacturerId`, `description`, `descriptionHtml`, `descriptionRawDraftContentState`, `createdAt`, `updatedAt`, `publishedAt`, `published`, `orderNumber`) VALUES
	(36, 'lightweight-jacket4545400', '8989', NULL, 32, NULL, NULL, NULL, '{"blocks":[{"key":"4o7pm","text":"","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}}],"entityMap":{}}', '2022-11-01 19:21:05', '2022-11-01 19:21:05', NULL, 1, NULL);
INSERT IGNORE INTO `deleted_product` (`productId`, `handle`, `title`, `sku`, `product_category_id`, `manufacturerId`, `description`, `descriptionHtml`, `descriptionRawDraftContentState`, `createdAt`, `updatedAt`, `publishedAt`, `published`, `orderNumber`) VALUES
	(37, 'lightweight-jacket454540023432afsdf', '8989234fsdfdsf', NULL, 32, NULL, NULL, NULL, '{"blocks":[{"key":"d37bn","text":"","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}}],"entityMap":{}}', '2022-11-01 19:24:32', '2022-11-01 19:24:32', NULL, 1, NULL);
INSERT IGNORE INTO `deleted_product` (`productId`, `handle`, `title`, `sku`, `product_category_id`, `manufacturerId`, `description`, `descriptionHtml`, `descriptionRawDraftContentState`, `createdAt`, `updatedAt`, `publishedAt`, `published`, `orderNumber`) VALUES
	(38, 'lightweight-jacket454540023432afsdf999', '8989234fsdfdsf99', NULL, 32, NULL, NULL, NULL, '{"blocks":[{"key":"83o5u","text":"","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}}],"entityMap":{}}', '2022-11-01 19:52:08', '2022-11-01 19:52:08', NULL, 1, NULL);
INSERT IGNORE INTO `deleted_product` (`productId`, `handle`, `title`, `sku`, `product_category_id`, `manufacturerId`, `description`, `descriptionHtml`, `descriptionRawDraftContentState`, `createdAt`, `updatedAt`, `publishedAt`, `published`, `orderNumber`) VALUES
	(39, 'lightweight-jacket454540023432afsdf9992343243', '8989234fsdfdsf9932434', NULL, 32, NULL, '32434', '<p>32434</p>\n', '{"blocks":[{"key":"6jn13","text":"32434","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}}],"entityMap":{}}', '2022-11-01 20:22:35', '2022-11-01 20:22:35', NULL, 1, NULL);
INSERT IGNORE INTO `deleted_product` (`productId`, `handle`, `title`, `sku`, `product_category_id`, `manufacturerId`, `description`, `descriptionHtml`, `descriptionRawDraftContentState`, `createdAt`, `updatedAt`, `publishedAt`, `published`, `orderNumber`) VALUES
	(40, 'lightweight-jacket454540023432afsdf999234324355', '8989234fsdfdsf993243455', NULL, 32, NULL, NULL, NULL, '{"blocks":[{"key":"7932c","text":"","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}}],"entityMap":{}}', '2022-11-01 20:24:48', '2022-11-01 20:24:48', NULL, 1, NULL);
INSERT IGNORE INTO `deleted_product` (`productId`, `handle`, `title`, `sku`, `product_category_id`, `manufacturerId`, `description`, `descriptionHtml`, `descriptionRawDraftContentState`, `createdAt`, `updatedAt`, `publishedAt`, `published`, `orderNumber`) VALUES
	(42, 'li22ght33weight-jacket4545420023432afsdf999234324355', '89822339234fsdfdsf993243455', NULL, 32, NULL, NULL, NULL, '{"blocks":[{"key":"ae50u","text":"","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}}],"entityMap":{}}', '2022-11-01 20:36:57', '2022-11-01 20:36:57', NULL, 1, NULL);
INSERT IGNORE INTO `deleted_product` (`productId`, `handle`, `title`, `sku`, `product_category_id`, `manufacturerId`, `description`, `descriptionHtml`, `descriptionRawDraftContentState`, `createdAt`, `updatedAt`, `publishedAt`, `published`, `orderNumber`) VALUES
	(43, 'li22222ght33weight-jacket4545420023432afsdf999234324355', '8922822339234fsdfdsf993243455', NULL, 32, NULL, NULL, NULL, '{"blocks":[{"key":"a6ng1","text":"","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}}],"entityMap":{}}', '2022-11-01 20:40:17', '2022-11-01 20:40:17', NULL, 1, NULL);
INSERT IGNORE INTO `deleted_product` (`productId`, `handle`, `title`, `sku`, `product_category_id`, `manufacturerId`, `description`, `descriptionHtml`, `descriptionRawDraftContentState`, `createdAt`, `updatedAt`, `publishedAt`, `published`, `orderNumber`) VALUES
	(44, 'li22g23434ht33weight-jacket4545420023432afsdf999234324355', '8983243422339234fsdfdsf993243455', NULL, 32, NULL, NULL, NULL, '{"blocks":[{"key":"a3oaf","text":"","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}}],"entityMap":{}}', '2022-11-01 20:42:29', '2022-11-01 20:42:29', NULL, 1, NULL);
INSERT IGNORE INTO `deleted_product` (`productId`, `handle`, `title`, `sku`, `product_category_id`, `manufacturerId`, `description`, `descriptionHtml`, `descriptionRawDraftContentState`, `createdAt`, `updatedAt`, `publishedAt`, `published`, `orderNumber`) VALUES
	(46, 'li22g232323ht33weight-jacket4545420023432afsdf999234324355', '892323822339234fsdfdsf993243455', NULL, 32, NULL, NULL, NULL, '{"blocks":[{"key":"7un70","text":"","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}}],"entityMap":{}}', '2022-11-01 20:52:18', '2022-11-01 20:52:18', NULL, 1, NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
