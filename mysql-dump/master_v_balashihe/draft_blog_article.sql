-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               10.6.11-MariaDB-0ubuntu0.22.04.1 - Ubuntu 22.04
-- Операционная система:         debian-linux-gnu
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

-- Дамп структуры для таблица master_v_balashihe.draft_blog_article
CREATE TABLE IF NOT EXISTS `draft_blog_article` (
  `draftArticleId` binary(16) NOT NULL DEFAULT unhex(replace(uuid(),'-','')),
  `title` text DEFAULT NULL,
  `handle` text CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `autoHandleSlug` text CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `absURL` varchar(1024) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `blogCategoryId` int(10) unsigned DEFAULT NULL,
  `text` mediumtext DEFAULT NULL,
  `textHtml` mediumtext DEFAULT NULL,
  `textRawDraftContentState` mediumtext DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `publishedAt` timestamp NULL DEFAULT NULL,
  `published` tinyint(1) unsigned DEFAULT 1,
  `orderNumber` int(10) unsigned DEFAULT NULL,
  `managerId` int(10) unsigned NOT NULL,
  `existingArticleId` int(10) unsigned DEFAULT NULL,
  `isDraftSaved` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`draftArticleId`) USING BTREE,
  KEY `FK_draft_blog_article_blog_category` (`blogCategoryId`),
  KEY `FK_draft_blog_article_managers` (`managerId`),
  KEY `FK_draft_blog_article_blog_article` (`existingArticleId`) USING BTREE,
  CONSTRAINT `FK_draft_blog_article_blog_article` FOREIGN KEY (`existingArticleId`) REFERENCES `blog_article` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_draft_blog_article_blog_category` FOREIGN KEY (`blogCategoryId`) REFERENCES `blog_category` (`blogCategoryId`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `FK_draft_blog_article_managers` FOREIGN KEY (`managerId`) REFERENCES `managers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Дамп данных таблицы master_v_balashihe.draft_blog_article: ~0 rows (приблизительно)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
