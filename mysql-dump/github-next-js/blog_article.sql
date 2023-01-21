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

-- Дамп структуры для таблица github-next-js.blog_article
CREATE TABLE IF NOT EXISTS `blog_article` (
  `articeId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `handle` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `title` text NOT NULL,
  `blog_category_id` int(10) unsigned DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `descriptionHtml` mediumtext DEFAULT NULL,
  `descriptionRawDraftContentState` mediumtext DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `publishedAt` timestamp NULL DEFAULT NULL,
  `published` tinyint(1) unsigned DEFAULT 1,
  `orderNumber` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`articeId`) USING BTREE,
  UNIQUE KEY `uniq_handle` (`handle`) USING HASH,
  UNIQUE KEY `uniq_title` (`title`) USING HASH,
  KEY `FK_blog_article_blog_category` (`blog_category_id`),
  CONSTRAINT `FK_blog_article_blog_category` FOREIGN KEY (`blog_category_id`) REFERENCES `blog_category` (`blog_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Дамп данных таблицы github-next-js.blog_article: ~0 rows (приблизительно)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
