-- --------------------------------------------------------
-- Хост:                         192.168.0.50
-- Версия сервера:               11.0.3-MariaDB-1:11.0.3+maria~ubu2204 - mariadb.org binary distribution
-- Операционная система:         debian-linux-gnu
-- HeidiSQL Версия:              12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Удаление временной таблицы и создание окончательной структуры представления
DROP TABLE IF EXISTS `null_draft_blog_article`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `null_draft_blog_article` AS select NULL AS `id`,NULL AS `draftArticleId`,`a`.`handle` AS `handle`,`a`.`absURL` AS `absURL`,`a`.`title` AS `title`,`a`.`blogCategoryId` AS `blogCategoryId`,`a`.`text` AS `text`,`a`.`textHtml` AS `textHtml`,`a`.`textRawDraftContentState` AS `textRawDraftContentState`,`a`.`createdAt` AS `createdAt`,`a`.`updatedAt` AS `updatedAt`,coalesce(`a`.`publishedAt`,`a`.`createdAt`) AS `publishedAt`,`a`.`unPublished` AS `unPublished`,`a`.`notSearchable` AS `notSearchable`,`a`.`notInList` AS `notInList`,`a`.`orderNumber` AS `orderNumber`,`a`.`managerId` AS `managerId`,NULL AS `isDraftSaved`,`a`.`id` AS `existingArticleId`,`a`.`imageId` AS `imageId`,`a`.`keyTextHtml` AS `keyTextHtml`,`a`.`h2` AS `h2`,`a`.`secondImageId` AS `secondImageId`,`a`.`viewed` AS `viewed`,`a`.`templateId` AS `templateId`,`a`.`description` AS `description` from `blog_article_handle` `a`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
