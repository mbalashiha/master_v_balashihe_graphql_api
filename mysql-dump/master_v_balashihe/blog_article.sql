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

-- Дамп структуры для таблица master_v_balashihe.blog_article
CREATE TABLE IF NOT EXISTS `blog_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `handle` text CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `title` text NOT NULL,
  `blogCategoryId` int(10) unsigned DEFAULT NULL,
  `text` mediumtext NOT NULL,
  `textHtml` mediumtext NOT NULL,
  `textRawDraftContentState` mediumtext DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `publishedAt` timestamp NULL DEFAULT NULL,
  `published` tinyint(1) unsigned DEFAULT 1,
  `orderNumber` int(10) unsigned DEFAULT NULL,
  `managerId` int(10) unsigned NOT NULL,
  `createdByManagerId` int(10) unsigned NOT NULL,
  `autoHandleSlug` text NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_handle` (`handle`) USING HASH,
  UNIQUE KEY `uniq_title` (`title`) USING HASH,
  KEY `FK_blog_article_blog_category` (`blogCategoryId`) USING BTREE,
  KEY `FK_blog_article_managers` (`managerId`),
  KEY `FK_blog_article_managers_2` (`createdByManagerId`),
  FULLTEXT KEY `fulltext_search_index` (`title`,`text`),
  CONSTRAINT `FK_blog_article_blog_category` FOREIGN KEY (`blogCategoryId`) REFERENCES `blog_category` (`blogCategoryId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_blog_article_managers` FOREIGN KEY (`managerId`) REFERENCES `managers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_blog_article_managers_2` FOREIGN KEY (`createdByManagerId`) REFERENCES `managers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Дамп данных таблицы master_v_balashihe.blog_article: ~0 rows (приблизительно)
INSERT IGNORE INTO `blog_article` (`id`, `handle`, `title`, `blogCategoryId`, `text`, `textHtml`, `textRawDraftContentState`, `createdAt`, `updatedAt`, `publishedAt`, `published`, `orderNumber`, `managerId`, `createdByManagerId`, `autoHandleSlug`) VALUES
	(11, NULL, '11 adsadsad dsfsdf sdafsdfds dssdaf dsf  dddsse das                dddddddddddddddddddddddddddddddd', NULL, '2 22sdfdsfdsfsdf sdfsdfsd  sdfsdf   sdafdf    \n\ndddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd\n\nddd\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nsdfg\n\n\n\nfdgfdg sdkjfid jsdfk eiwlskdkdka; dsd', '<p>2 22sdfdsfdsfsdf sdfsdfsd&nbsp; sdfsdf&nbsp; &nbsp;sdafdf&nbsp; &nbsp;&nbsp;</p>\n<p>dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>\n<p>ddd</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>sdfg</p>\n<p>&nbsp;</p>\n<p>fdgfdg sdkjfid jsdfk eiwlskdkdka; dsd</p>', NULL, '2023-02-13 22:05:53', '2023-02-16 23:58:45', NULL, 1, NULL, 1, 1, '11-adsadsad-dsfsdf-sdafsdfds-dssdaf-dsf-dddsse-das-dddddddddddddddddddddddddddddddd');
INSERT IGNORE INTO `blog_article` (`id`, `handle`, `title`, `blogCategoryId`, `text`, `textHtml`, `textRawDraftContentState`, `createdAt`, `updatedAt`, `publishedAt`, `published`, `orderNumber`, `managerId`, `createdByManagerId`, `autoHandleSlug`) VALUES
	(16, NULL, '33323232', NULL, 'aa324324', '<p>aa324324</p>', NULL, '2023-02-21 17:51:08', '2023-02-21 17:53:02', NULL, NULL, NULL, 1, 1, '33323232');
INSERT IGNORE INTO `blog_article` (`id`, `handle`, `title`, `blogCategoryId`, `text`, `textHtml`, `textRawDraftContentState`, `createdAt`, `updatedAt`, `publishedAt`, `published`, `orderNumber`, `managerId`, `createdByManagerId`, `autoHandleSlug`) VALUES
	(17, NULL, 'fdsdfsd', NULL, 'ewrewrwer', '<p>ewrewrwer</p>', NULL, '2023-02-21 21:45:25', '2023-02-21 21:45:25', NULL, NULL, NULL, 1, 1, 'fdsdfsd');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
