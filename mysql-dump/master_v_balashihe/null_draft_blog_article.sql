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

-- Дамп структуры для представление master_v_balashihe.null_draft_blog_article
-- Удаление временной таблицы и создание окончательной структуры представления
DROP TABLE IF EXISTS `null_draft_blog_article`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `null_draft_blog_article` AS select NULL AS `id`,NULL AS `draftArticleId`,`a`.`handle` AS `handle`,`a`.`title` AS `title`,`a`.`autoHandleSlug` AS `autoHandleSlug`,`a`.`blogCategoryId` AS `blogCategoryId`,`a`.`text` AS `text`,`a`.`textHtml` AS `textHtml`,`a`.`textRawDraftContentState` AS `textRawDraftContentState`,`a`.`createdAt` AS `createdAt`,`a`.`updatedAt` AS `updatedAt`,`a`.`publishedAt` AS `publishedAt`,`a`.`published` AS `published`,`a`.`orderNumber` AS `orderNumber`,`a`.`managerId` AS `managerId`,NULL AS `isDraftSaved`,`a`.`id` AS `existingArticleId` from `blog_article` `a`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
