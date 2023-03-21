-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               10.6.11-MariaDB-0ubuntu0.22.04.1 - Ubuntu 22.04
-- Операционная система:         debian-linux-gnu
-- HeidiSQL Версия:              12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Дамп структуры для представление master_v_balashihe.blog_article_handle
-- Удаление временной таблицы и создание окончательной структуры представления
DROP TABLE IF EXISTS `blog_article_handle`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `blog_article_handle` AS select `a`.`id` AS `id`,`a`.`title` AS `title`,`a`.`autoHandleSlugId` AS `autoHandleSlugId`,`a`.`handleId` AS `handleId`,`a`.`absURLid` AS `absURLid`,`a`.`blogCategoryId` AS `blogCategoryId`,`a`.`text` AS `text`,`a`.`textHtml` AS `textHtml`,`a`.`renderHtml` AS `renderHtml`,`a`.`textRawDraftContentState` AS `textRawDraftContentState`,`a`.`imageId` AS `imageId`,`a`.`createdAt` AS `createdAt`,`a`.`updatedAt` AS `updatedAt`,`a`.`publishedAt` AS `publishedAt`,`a`.`unPublished` AS `unPublished`,`a`.`notSearchable` AS `notSearchable`,`a`.`notInList` AS `notInList`,`a`.`orderNumber` AS `orderNumber`,`a`.`createdByManagerId` AS `createdByManagerId`,`a`.`managerId` AS `managerId`,`p1`.`handle` AS `handle`,`p2`.`handle` AS `autoHandleSlug`,`p3`.`handle` AS `absURL` from (((`blog_article` `a` left join `page_handle` `p1` on(`p1`.`id` = `a`.`handleId`)) left join `page_handle` `p2` on(`p2`.`id` = `a`.`autoHandleSlugId`)) left join `page_handle` `p3` on(`p3`.`id` = `a`.`absURLid`));

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
