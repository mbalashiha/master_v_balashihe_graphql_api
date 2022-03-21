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
  `handle` text DEFAULT NULL,
  `title` text DEFAULT NULL,
  `sku` tinytext DEFAULT NULL,
  `product_category_id` int(10) unsigned DEFAULT NULL,
  `manufacturer_id` int(10) unsigned DEFAULT NULL,
  `description` text DEFAULT NULL,
  `descriptionHtml` text DEFAULT NULL,
  PRIMARY KEY (`productId`) USING BTREE,
  UNIQUE KEY `uniq_product_name_for_category_id` (`title`(100),`product_category_id`) USING BTREE,
  KEY `FK_product_product_category` (`product_category_id`),
  KEY `FK_product_manufacturer` (`manufacturer_id`),
  CONSTRAINT `FK_product_manufacturer` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturer` (`manufacturer_id`),
  CONSTRAINT `FK_product_product_category` FOREIGN KEY (`product_category_id`) REFERENCES `product_category` (`product_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Дамп данных таблицы github-next-js.product: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT IGNORE INTO `product` (`productId`, `handle`, `title`, `sku`, `product_category_id`, `manufacturer_id`, `description`, `descriptionHtml`) VALUES
	(1, NULL, 'dsdsdds', NULL, 3, 13, NULL, NULL),
	(2, NULL, 'dsdsddstt', NULL, 3, 13, NULL, NULL),
	(3, NULL, 'dsdsddstt2323', NULL, 3, 13, NULL, NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
