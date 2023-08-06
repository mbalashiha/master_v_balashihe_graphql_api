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
INSERT IGNORE INTO `draft_blog_article` (`draftArticleId`, `title`, `h2`, `handle`, `autoHandleSlug`, `absURL`, `blogCategoryId`, `text`, `textHtml`, `textRawDraftContentState`, `imageId`, `secondImageId`, `createdAt`, `updatedAt`, `publishedAt`, `orderNumber`, `managerId`, `existingArticleId`, `isDraftSaved`, `unPublished`, `notSearchable`, `notInList`, `keyTextHtml`, `createdByManagerId`) VALUES
	(_binary 0x67a166332f0a11eeb9cc0ae0afae0834, 'Ремонт ноутбука в Балашихе рядом с МФЦ', NULL, NULL, 'remont-noutbuka-v-balashihe-ryadom-s-mfc', NULL, NULL, 'Если Вы живёте в городе Балашиха, то для Вас доступен качественный ремонт ноутбука по невысокой цене дешевле чем в Москве. Я хочу отметить, что услуги ремонта ноутбуков в Балашихе довольно таки востребованы многими людьми. Ноутбук позволяет человеку получить мобильность и полный функционал программного обеспечения, но присутствуют сложности в работе системы охлаждения ноутбука. Часто возникает задача замены кулеров активной системы охлаждения и чистка радиаторов от пыли, включая замену старой термопасты, которая помимо всего прочего могла высохнуть от времени и потерять свои теплопроводные свойства. В большинстве случаях не требуется дорогостоящий ремонт, достаточно просто правильно настроить BIOS ноутбука, добавить количество оперативной памяти, перенастроить операционную систему и т. д. Существует много параметров от которых зависит высокое быстродействие ноутбука. Если Вы являетесь небольшой компанией в Балашихе для мелкого ремонта техники вам невыгодно нанимать инженера на полную занятость и достаточно иногда вызывать мастера по ремонту. В перечень услуг по ремонту, которые я указываю, входит замена повреждённой матрицы ноутбука без необходимости посещать сервисный центр самому клиенту. Также я заменяю жёсткие диски на SSD, провожу диагностику системы охлаждения ноутбука. Как показывает практика, востребована услуга чистки ноутбука с заменой термопасты на дому. Так как процессор ноутбука сбрасывает частоты при перегреве, из-за чего производительность ноутбука может упасть в два или три раза. Я имею профильное высшее образование МГТУ МИРЭА по специальности информационные системы и технологии и имею достаточный опыт работы в сервисном центре предприятия. В том числе я могу оказать услугу перепайки чипа на материнской плате с помощью паяльного фена, но не пугайтесь: в подавляющем большинстве случаев если ноутбук перестал загружаться такие сложности не нужны, может быть достаточно разобрать ноутбук и почистить контакты элементов ластиком и кисточкой. Подробно об услугах ремонта в Балашихе Настройка, ремонт и модернизация ноутбука Замена и модернизация комплектующих любых ноутбуков Балашиха Шоссе Энтузиастов Восстановление нормальной работы ноутбука: замена морально устаревшего SSD в ноутбуке, восстановление заводских настроек на ноутбуке, переустановка операционной системы на ноутбуке оперативно рядом с МФЦ в центре города Балашиха. Чистка ноутбука от пыли, чистка и проверка контактных площадок ноутбука: причины шума ноутбука из-за активной системы охлаждения кулеров, сброс частот процессора и отключение ноутбука Чистка радиаторов охлаждения ноутбука, проверка работы испарительной камеры, тепловых трубок. По "стандарту" чистку Ноутбука нужно проводить раз в полгода, также нужно учитывать ресурс работы крутилок вентиляторов и заменять fan, издающие неприятный шум. В случае когда ноутбук не проходит загрузочные тесты bios или зависает при загрузке операционной системы, необходимо полностью разобрать ноутбук и почистить контакты комплектующих, в первую очередь контакты планок оперативной памяти, ластиком от грязи и оксидной плёнки. Замена повреждённой матрицы экрана ноутбука в сервисном центре Балашиха Ремонт матрицы экрана ноутбука происходит в день обращения из имеющихся в складском запасе компьютерных комплектующих матриц и экранов', '<p>Если Вы живёте в городе Балашиха, то для Вас доступен качественный ремонт ноутбука по невысокой цене дешевле чем в Москве.</p>\n<p>Я хочу отметить, что услуги ремонта ноутбуков в Балашихе довольно таки востребованы многими людьми. Ноутбук позволяет человеку получить мобильность и полный функционал программного обеспечения, но присутствуют сложности в работе системы охлаждения ноутбука. Часто возникает задача замены кулеров активной системы охлаждения и чистка радиаторов от пыли, включая замену старой термопасты, которая помимо всего прочего могла высохнуть от времени и потерять свои теплопроводные свойства.</p>\n<p>В большинстве случаях не требуется дорогостоящий ремонт, достаточно просто правильно настроить BIOS ноутбука, добавить количество оперативной памяти, перенастроить операционную систему и т. д. Существует много параметров от которых зависит высокое быстродействие ноутбука.</p>\n<p>Если Вы являетесь небольшой компанией в Балашихе для мелкого ремонта техники вам невыгодно нанимать инженера на полную занятость и достаточно иногда вызывать мастера по ремонту.</p>\n<p>В перечень услуг по ремонту, которые я указываю, входит замена повреждённой матрицы ноутбука без необходимости посещать сервисный центр самому клиенту. Также я заменяю жёсткие диски на SSD, провожу диагностику системы охлаждения ноутбука.</p>\n<p>Как показывает практика, востребована услуга чистки ноутбука с заменой термопасты на дому. Так как процессор ноутбука сбрасывает частоты при перегреве, из-за чего производительность ноутбука может упасть в два или три раза.</p>\n<p>Я имею профильное высшее образование МГТУ МИРЭА по специальности информационные системы и технологии и имею достаточный опыт работы в сервисном центре предприятия. В том числе я могу оказать услугу перепайки чипа на материнской плате с помощью паяльного фена, но не пугайтесь: в подавляющем большинстве случаев если ноутбук перестал загружаться такие сложности не нужны, может быть достаточно разобрать ноутбук и почистить контакты элементов ластиком и кисточкой.</p>\n<h3>Подробно об услугах ремонта в Балашихе</h3>\n<table style="border-collapse: collapse; width: 100%;" border="1">\n<tbody>\n<tr>\n<td colspan="2">Настройка, ремонт и модернизация ноутбука</td>\n</tr>\n<tr>\n<td style="width: 46.7722%;">Замена и модернизация комплектующих любых ноутбуков Балашиха Шоссе Энтузиастов</td>\n<td style="width: 46.7722%;">Восстановление нормальной работы ноутбука: замена морально устаревшего SSD в ноутбуке, восстановление заводских настроек на ноутбуке, переустановка операционной системы на ноутбуке оперативно рядом с МФЦ в центре города Балашиха.</td>\n</tr>\n<tr>\n<td style="width: 46.7722%;" rowspan="2">\n<p>Чистка ноутбука от пыли, чистка и проверка контактных площадок ноутбука:&nbsp;</p>\n<p>причины шума ноутбука из-за активной системы охлаждения кулеров, сброс частот процессора и отключение ноутбука</p>\n</td>\n<td style="width: 46.7722%;">\n<p>Чистка радиаторов охлаждения ноутбука, проверка работы испарительной камеры, тепловых трубок.</p>\n<p>По "стандарту" чистку Ноутбука нужно проводить раз в полгода, также нужно учитывать ресурс работы крутилок вентиляторов и заменять fan, издающие неприятный шум.</p>\n</td>\n</tr>\n<tr>\n<td style="width: 46.7722%;">\n<p>В случае когда ноутбук не проходит загрузочные тесты bios или зависает при загрузке операционной системы, необходимо полностью разобрать ноутбук и почистить контакты комплектующих, в первую очередь контакты планок оперативной памяти, ластиком от грязи и оксидной плёнки.</p>\n</td>\n</tr>\n<tr>\n<td style="width: 46.7722%;">\n<p>Замена повреждённой матрицы экрана ноутбука в сервисном центре Балашиха</p>\n</td>\n<td style="width: 46.7722%;">\n<p>Ремонт матрицы экрана ноутбука происходит в день обращения из имеющихся в складском запасе компьютерных комплектующих матриц и экранов</p>\n</td>\n</tr>\n</tbody>\n</table>', NULL, NULL, NULL, '2023-07-30 18:53:42', '2023-07-30 18:53:44', '2023-07-30 18:53:42', NULL, 1, 80, NULL, NULL, NULL, NULL, NULL, NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
