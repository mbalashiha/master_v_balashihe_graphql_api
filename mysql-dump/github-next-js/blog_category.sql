-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               10.10.2-MariaDB - mariadb.org binary distribution
-- Операционная система:         Win64
-- HeidiSQL Версия:              12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Дамп структуры для таблица github-next-js.blog_category
CREATE TABLE IF NOT EXISTS `blog_category` (
  `blog_category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` text NOT NULL,
  `handle` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`blog_category_id`) USING BTREE,
  UNIQUE KEY `uniq_blog_category_handle_uri_slug` (`handle`(100)) USING BTREE,
  UNIQUE KEY `uniq_blog_category_category_name` (`category_name`(100)) USING BTREE,
  KEY `FK_blog_category_blog_category_index` (`parent_id`) USING BTREE,
  CONSTRAINT `FK_blog_category_blog_category_constraint` FOREIGN KEY (`parent_id`) REFERENCES `blog_category` (`blog_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Дамп данных таблицы github-next-js.blog_category: ~0 rows (приблизительно)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
