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

-- Дамп структуры для таблица master_v_balashihe.draft_blog_article
CREATE TABLE IF NOT EXISTS `draft_blog_article` (
  `draftArticleId` binary(16) NOT NULL DEFAULT unhex(replace(uuid(),'-','')),
  `title` text DEFAULT NULL,
  `h2` text DEFAULT NULL,
  `handle` text CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `autoHandleSlug` text CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `absURL` text CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `blogCategoryId` int(10) unsigned DEFAULT NULL,
  `text` text DEFAULT NULL,
  `textHtml` text DEFAULT NULL,
  `textRawDraftContentState` longtext DEFAULT NULL,
  `imageId` int(10) unsigned DEFAULT NULL,
  `secondImageId` int(10) unsigned DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `publishedAt` timestamp NULL DEFAULT current_timestamp(),
  `orderNumber` int(10) unsigned DEFAULT NULL,
  `managerId` int(10) unsigned NOT NULL,
  `existingArticleId` int(10) unsigned DEFAULT NULL,
  `isDraftSaved` tinyint(1) unsigned DEFAULT NULL,
  `unPublished` tinyint(1) unsigned DEFAULT NULL,
  `notSearchable` tinyint(1) unsigned DEFAULT NULL,
  `notInList` tinyint(1) unsigned DEFAULT NULL,
  `keyTextHtml` text DEFAULT NULL,
  `createdByManagerId` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`draftArticleId`) USING BTREE,
  KEY `FK_draft_blog_article_blog_category` (`blogCategoryId`),
  KEY `FK_draft_blog_article_managers` (`managerId`),
  KEY `FK_draft_blog_article_blog_article` (`existingArticleId`) USING BTREE,
  KEY `FK_draft_blog_article_image` (`imageId`),
  KEY `FK_draft_blog_article_image_2` (`secondImageId`),
  KEY `FK_draft_blog_article_managers_2` (`createdByManagerId`),
  CONSTRAINT `FK_draft_blog_article_blog_article` FOREIGN KEY (`existingArticleId`) REFERENCES `blog_article` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_draft_blog_article_blog_category` FOREIGN KEY (`blogCategoryId`) REFERENCES `blog_category` (`blogCategoryId`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `FK_draft_blog_article_image` FOREIGN KEY (`imageId`) REFERENCES `image` (`imageId`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_draft_blog_article_image_2` FOREIGN KEY (`secondImageId`) REFERENCES `image` (`imageId`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_draft_blog_article_managers` FOREIGN KEY (`managerId`) REFERENCES `managers` (`id`),
  CONSTRAINT `FK_draft_blog_article_managers_2` FOREIGN KEY (`createdByManagerId`) REFERENCES `managers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Дамп данных таблицы master_v_balashihe.draft_blog_article: ~1 rows (приблизительно)
INSERT IGNORE INTO `draft_blog_article` (`draftArticleId`, `title`, `h2`, `handle`, `autoHandleSlug`, `absURL`, `blogCategoryId`, `text`, `textHtml`, `textRawDraftContentState`, `imageId`, `secondImageId`, `createdAt`, `updatedAt`, `publishedAt`, `orderNumber`, `managerId`, `existingArticleId`, `isDraftSaved`, `unPublished`, `notSearchable`, `notInList`, `keyTextHtml`, `createdByManagerId`) VALUES
	(_binary 0x1e5d856a1eaf11eeba2f0ae0afae0834, 'Мастер по ремонту компьютеров с хорошими отзывами в Балашихе Мастер с выездом на дом или в офисе рядом с центром города Балашиха', NULL, NULL, 'master-po-remontu-kompyuterov-s-horoshimi-otzyvami-v-balashihe-master-s-vyezdom-na-dom-ili-v-ofise-ryadom-s-centrom-goroda-balashiha', NULL, NULL, NULL, NULL, NULL, 169, NULL, '2023-07-09 23:19:57', '2023-07-10 00:40:47', '2023-03-22 13:53:09', NULL, 1, 72, NULL, NULL, NULL, NULL, NULL, NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
