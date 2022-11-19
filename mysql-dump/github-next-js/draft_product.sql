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
  `descriptionRawDraftContentState` longtext DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `publishedAt` timestamp NULL DEFAULT NULL,
  `images_has_been_copied` tinyint(1) unsigned DEFAULT NULL,
  `published` tinyint(1) unsigned DEFAULT 1,
  `orderNumber` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`draftProductId`),
  UNIQUE KEY `uniq_manager_product_id` (`managerId`,`productId`),
  KEY `FK_product_product_category` (`product_category_id`),
  KEY `FK_product_manufacturer` (`manufacturerId`) USING BTREE,
  KEY `actual_relation` (`productId`) USING BTREE,
  CONSTRAINT `FK_draft_product_managers` FOREIGN KEY (`managerId`) REFERENCES `managers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_draft_product_product` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Дамп данных таблицы github-next-js.draft_product: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `draft_product` DISABLE KEYS */;
INSERT IGNORE INTO `draft_product` (`draftProductId`, `managerId`, `productId`, `handle`, `title`, `sku`, `product_category_id`, `manufacturerId`, `description`, `descriptionHtml`, `descriptionRawDraftContentState`, `createdAt`, `updatedAt`, `publishedAt`, `images_has_been_copied`, `published`, `orderNumber`) VALUES
	(_binary 0x75267585629311EDB37460A44C4F528E, 1, 21, '32234ffffffffffff323232/99', '99', NULL, 34, NULL, NULL, NULL, '', '2022-11-12 17:08:20', '2022-11-13 16:14:51', NULL, 1, 1, 1),
	(_binary 0x7A1C7E20637111EDB3B560A44C4F528E, 1, 45, '5', '8ddcddcccxdfsdfdf455', NULL, 5, NULL, 'process.nextTick(() => setFieldValue("descriptiyuyuy\n\njkkkkkkkk09909032323232322323209329032093290903209092121212kkkkkjkiopijkl;jkmk98yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyuuuuuuuuuuuuuuu\n\nonHtml", descriptionHtml));', 'process.nextTick(() => setFieldValue("descriptiyuyuy\n\njkkkkkkkk09909032323232322323209329032093290903209092121212kkkkkjkiopijkl;jkmk98yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyuuuuuuuuuuuuuuu\n\nonHtml", descriptionHtml));', NULL, '2022-11-13 19:37:34', '2022-11-13 19:37:34', NULL, 1, 1, 3),
	(_binary 0xA005640A629B11EDB37460A44C4F528E, 1, 41, 'li22ghtweight-jacket4545420023432afsdf999234324355', '898229234fsdfdsf993243455', NULL, 32, NULL, NULL, NULL, '', '2022-11-12 18:06:48', '2022-11-13 16:14:48', NULL, 1, 1, 4),
	(_binary 0xEE592933629811EDB37460A44C4F528E, 1, 15, 't-shirt', 'T-Shirt', NULL, 5, 16, NULL, NULL, '', '2022-11-12 17:47:31', '2022-11-18 21:42:31', NULL, 1, 1, 3);
/*!40000 ALTER TABLE `draft_product` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
