-- --------------------------------------------------------
-- Хост:                         192.168.0.50
-- Версия сервера:               11.0.3-MariaDB-1:11.0.3+maria~ubu2204 - mariadb.org binary distribution
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

-- Дамп структуры для таблица master_v_balashihe.blog_category
CREATE TABLE IF NOT EXISTS `blog_category` (
  `blogCategoryId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `categoryName` text NOT NULL,
  `handleId` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`blogCategoryId`) USING BTREE,
  UNIQUE KEY `uniq_blog_category_category_name` (`categoryName`(100)) USING BTREE,
  KEY `FK_blog_category_blog_category_index` (`parent_id`) USING BTREE,
  KEY `FK_blog_category_page_handle` (`handleId`),
  CONSTRAINT `FK_blog_category_blog_category_constraint` FOREIGN KEY (`parent_id`) REFERENCES `blog_category` (`blogCategoryId`),
  CONSTRAINT `FK_blog_category_page_handle` FOREIGN KEY (`handleId`) REFERENCES `page_handle` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Дамп данных таблицы master_v_balashihe.blog_category: ~1 rows (приблизительно)
INSERT IGNORE INTO `blog_category` (`blogCategoryId`, `categoryName`, `handleId`, `parent_id`, `updatedAt`, `createdAt`) VALUES
	(1, 'uslugi-mastera-v-balashihe', 37, NULL, '2023-12-02 17:42:01', '2023-12-02 17:34:01');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
