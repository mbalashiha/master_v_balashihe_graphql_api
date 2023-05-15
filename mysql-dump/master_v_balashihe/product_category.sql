-- --------------------------------------------------------
-- Хост:                         192.168.0.50
-- Версия сервера:               10.10.3-MariaDB-1:10.10.3+maria~ubu1804 - mariadb.org binary distribution
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

-- Дамп структуры для таблица master_v_balashihe.product_category
CREATE TABLE IF NOT EXISTS `product_category` (
  `product_category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` text NOT NULL,
  `handle` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`product_category_id`),
  UNIQUE KEY `uniq_handle_uri_slug` (`handle`(100)) USING BTREE,
  UNIQUE KEY `uniq_category_name` (`category_name`(100)) USING BTREE,
  KEY `FK_product_category_product_category` (`parent_id`),
  CONSTRAINT `FK_product_category_product_category` FOREIGN KEY (`parent_id`) REFERENCES `product_category` (`product_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Дамп данных таблицы master_v_balashihe.product_category: ~0 rows (приблизительно)
INSERT IGNORE INTO `product_category` (`product_category_id`, `category_name`, `handle`, `parent_id`, `updatedAt`, `createdAt`) VALUES
	(5, '11', '11', NULL, '2022-07-07 20:15:23', '2022-07-07 20:15:23');
INSERT IGNORE INTO `product_category` (`product_category_id`, `category_name`, `handle`, `parent_id`, `updatedAt`, `createdAt`) VALUES
	(32, '222', '222', NULL, '2022-07-17 23:59:01', '2022-07-17 23:59:01');
INSERT IGNORE INTO `product_category` (`product_category_id`, `category_name`, `handle`, `parent_id`, `updatedAt`, `createdAt`) VALUES
	(34, '32234фффффффффффф323232', '32234ffffffffffff323232', 5, '2022-10-21 14:00:32', '2022-07-22 18:38:03');
INSERT IGNORE INTO `product_category` (`product_category_id`, `category_name`, `handle`, `parent_id`, `updatedAt`, `createdAt`) VALUES
	(35, '32432', '32432', NULL, '2022-08-07 18:30:58', '2022-08-07 18:30:58');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
