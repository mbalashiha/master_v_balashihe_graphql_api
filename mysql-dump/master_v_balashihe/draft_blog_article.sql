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

-- Дамп структуры для таблица master_v_balashihe.draft_blog_article
CREATE TABLE IF NOT EXISTS `draft_blog_article` (
  `draftArticleId` binary(16) NOT NULL DEFAULT unhex(replace(uuid(),'-','')),
  `handle` text CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `title` text DEFAULT NULL,
  `autoHandleSlug` text CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
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
  CONSTRAINT `FK_draft_blog_article_blog_article` FOREIGN KEY (`existingArticleId`) REFERENCES `blog_article` (`articled`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_draft_blog_article_blog_category` FOREIGN KEY (`blogCategoryId`) REFERENCES `blog_category` (`blogCategoryId`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `FK_draft_blog_article_managers` FOREIGN KEY (`managerId`) REFERENCES `managers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Дамп данных таблицы master_v_balashihe.draft_blog_article: ~1 rows (приблизительно)
INSERT IGNORE INTO `draft_blog_article` (`draftArticleId`, `handle`, `title`, `autoHandleSlug`, `blogCategoryId`, `text`, `textHtml`, `textRawDraftContentState`, `createdAt`, `updatedAt`, `publishedAt`, `published`, `orderNumber`, `managerId`, `existingArticleId`, `isDraftSaved`) VALUES
	(_binary 0xf378457ca71d11ed8cee60a44c4f528e, NULL, NULL, NULL, NULL, '1343242343243\n\n33333333333333333333333\n\n\n\nfdsfsdf\n\nsadfsdfsd\n\n\n\n\n\nsdfsdf\n\n\n\n\n\nasfdsdfsd', '<p>1343242343243</p>\n<p>33333333333333333333333</p>\n<p>&nbsp;</p>\n<p>fdsfsdf</p>\n<p>sadfsdfsd</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>sdfsdf</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>asfdsdfsd</p>', NULL, '2023-02-07 19:31:02', '2023-02-07 20:47:50', NULL, 1, NULL, 1, NULL, NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
