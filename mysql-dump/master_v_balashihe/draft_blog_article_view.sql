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

-- Дамп структуры для представление master_v_balashihe.draft_blog_article_view
-- Удаление временной таблицы и создание окончательной структуры представления
DROP TABLE IF EXISTS `draft_blog_article_view`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `draft_blog_article_view` AS select `a`.`displayingPageHandle` AS `displayingPageHandle`,if(`d`.`draftArticleId` is not null,lcase(hex(`d`.`draftArticleId`)),NULL) AS `id`,`d`.`draftArticleId` AS `draftArticleId`,if(`d`.`handle` = `d`.`autoHandleSlug`,NULL,`d`.`handle`) AS `handle`,`d`.`absURL` AS `absURL`,if(`a`.`id` is not null and ifnull(`d`.`title`,'') = '',`a`.`title`,`d`.`title`) AS `title`,if(`a`.`id` is not null and ifnull(`d`.`autoHandleSlug`,'') = '',`a`.`autoHandleSlug`,`d`.`autoHandleSlug`) AS `autoHandleSlug`,if(`a`.`id` is not null and ifnull(`d`.`blogCategoryId`,'') = '',`a`.`blogCategoryId`,`d`.`blogCategoryId`) AS `blogCategoryId`,if(`a`.`id` is not null and ifnull(`d`.`text`,'') = '',`a`.`text`,`d`.`text`) AS `text`,if(`a`.`id` is not null and ifnull(`d`.`textHtml`,'') = '',`a`.`textHtml`,`d`.`textHtml`) AS `textHtml`,if(`a`.`id` is not null and ifnull(`d`.`textRawDraftContentState`,'') = '',`a`.`textRawDraftContentState`,`d`.`textRawDraftContentState`) AS `textRawDraftContentState`,`d`.`createdAt` AS `createdAt`,`d`.`updatedAt` AS `updatedAt`,`d`.`publishedAt` AS `publishedAt`,`d`.`unPublished` AS `unPublished`,`d`.`notSearchable` AS `notSearchable`,`d`.`notInList` AS `notInList`,`d`.`orderNumber` AS `orderNumber`,`d`.`managerId` AS `managerId`,`d`.`existingArticleId` AS `existingArticleId`,`d`.`isDraftSaved` AS `isDraftSaved`,`d`.`imageId` AS `imageId` from (`draft_blog_article` `d` left join `blog_article_handle` `a` on(`d`.`existingArticleId` is not null and `a`.`id` = `d`.`existingArticleId`)) where `d`.`isDraftSaved` is null;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
