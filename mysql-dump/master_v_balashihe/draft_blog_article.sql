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

-- Дамп структуры для таблица master_v_balashihe.draft_blog_article
CREATE TABLE IF NOT EXISTS `draft_blog_article` (
  `draftArticleId` binary(16) NOT NULL DEFAULT unhex(replace(uuid(),'-','')),
  `title` text DEFAULT NULL,
  `h2` text DEFAULT NULL,
  `handle` text CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
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
  `templateId` int(10) unsigned DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `autoHandleSlug` text DEFAULT NULL,
  PRIMARY KEY (`draftArticleId`) USING BTREE,
  KEY `FK_draft_blog_article_blog_category` (`blogCategoryId`),
  KEY `FK_draft_blog_article_managers` (`managerId`),
  KEY `FK_draft_blog_article_blog_article` (`existingArticleId`) USING BTREE,
  KEY `FK_draft_blog_article_image` (`imageId`),
  KEY `FK_draft_blog_article_image_2` (`secondImageId`),
  KEY `FK_draft_blog_article_managers_2` (`createdByManagerId`),
  KEY `FK_draft_blog_article_article_templates` (`templateId`),
  CONSTRAINT `FK_draft_blog_article_article_templates` FOREIGN KEY (`templateId`) REFERENCES `article_templates` (`templateId`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_draft_blog_article_blog_article` FOREIGN KEY (`existingArticleId`) REFERENCES `blog_article` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_draft_blog_article_blog_category` FOREIGN KEY (`blogCategoryId`) REFERENCES `blog_category` (`blogCategoryId`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `FK_draft_blog_article_image` FOREIGN KEY (`imageId`) REFERENCES `image` (`imageId`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_draft_blog_article_image_2` FOREIGN KEY (`secondImageId`) REFERENCES `image` (`imageId`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_draft_blog_article_managers` FOREIGN KEY (`managerId`) REFERENCES `managers` (`id`),
  CONSTRAINT `FK_draft_blog_article_managers_2` FOREIGN KEY (`createdByManagerId`) REFERENCES `managers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Дамп данных таблицы master_v_balashihe.draft_blog_article: ~6 rows (приблизительно)
INSERT IGNORE INTO `draft_blog_article` (`draftArticleId`, `title`, `h2`, `handle`, `absURL`, `blogCategoryId`, `text`, `textHtml`, `textRawDraftContentState`, `imageId`, `secondImageId`, `createdAt`, `updatedAt`, `publishedAt`, `orderNumber`, `managerId`, `existingArticleId`, `isDraftSaved`, `unPublished`, `notSearchable`, `notInList`, `keyTextHtml`, `createdByManagerId`, `templateId`, `description`, `autoHandleSlug`) VALUES
	(_binary 0x18d1089b3f7711eebe1a888888888788, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-20 16:32:04', '2023-10-29 21:33:41', '2023-08-20 16:32:04', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL);
INSERT IGNORE INTO `draft_blog_article` (`draftArticleId`, `title`, `h2`, `handle`, `absURL`, `blogCategoryId`, `text`, `textHtml`, `textRawDraftContentState`, `imageId`, `secondImageId`, `createdAt`, `updatedAt`, `publishedAt`, `orderNumber`, `managerId`, `existingArticleId`, `isDraftSaved`, `unPublished`, `notSearchable`, `notInList`, `keyTextHtml`, `createdByManagerId`, `templateId`, `description`, `autoHandleSlug`) VALUES
	(_binary 0x1e5d856a1eaf11eeba2f0ae0afae0834, 'Мастер по ремонту компьютеров с хорошими отзывами в Балашихе Мастер с выездом на дом или в офисе рядом с центром города Балашиха', NULL, NULL, NULL, NULL, 'Возможно ли справиться с ремонтом компьютерной техники самому? Оправдано ли это? Конечно можно освоить любую предметную область, если есть желание. Вопрос только в том оправдано ли это по затратам времени. Многим людям всё время не хватает времени на свою работу. Некоторые люди считают, что должно быть разделение труда. Может это и правильно? Компьютерный мастер, который изо дня в день делает повторяющиеся операции, всегда лучше справиться чем компьютерный любитель между делом. Неумелыми действиями можно убить компьютер или ноутбук окончательно без возможности восстановления. Очень упорные люди часто выламывают разъёмы на электронике, отрывают пластиковые язычки на коннекторах. Всегда есть риск деформации контактов разъёмов и сокетов. Всегда лучше когда каждый занимается своим делом, которое приносит ему деньги. Возможность выезда компьютерного мастера на дом (или в офис) в Балашихе, в центре города Балашихе, всегда сэкономит ваше время. К тому же окажется для вас существенной экономией в сравнении со штатным сотрудником инженером сервисного обслуживания и ремонта бытовой техники. Ремонт компьютеров и другой бытовой техники на территории города Балашиха у заказчика с выездом на дом. В большинстве случаев достаточно ремонта компьютерной техники на дому без необходимость везти компьютерную технику самому в сервисный центр в Балашихе. Опытный компьютерный мастер произведёт настройку Вашего компьютера или телевизора у Вас на глаз, и покажет и научит как это делать самому. Опытный компьютерный мастер и инженер по сервисному обслуживанию электроники выполняет следующие работы у Вас в квартире: Модернизация вашего компьютера с заменой комплектующих. Установка и восстановления Windows любых версий, включая семёрку, Windows 10 и Windows 11 Мастер может вручную удалить компьютерные вирусы и восстановить Вашу антивирусную защиту Microsoft Defender Вдохнуть в Ваш морально и физически устаревший компьютер вторую жизнь с помощью ОС Linux Mint самой последней версии Восстановить удалённые данные на вашем жёстком диске, если они не были перезаписаны другими данными Замена, подбор, ремонт материнских плат, видеокарт, дисков SSD или HDD и любой компьютерной периферии квалифицированным специалистом инженером Внушительный опыт инженера по диагностике и ремонту вычислительной техники позволяет быстро идентифицировать проблему. Мастер в Балашихе, который является инженером по ремонту и обслуживанию компьютерной техники, способен в одиночку решить более 90% возникающих у клиентов проблем. Во многих случаях мною даётся гарантия на выполненные услуги в городе Балашиха.', '<p>Возможно ли справиться с ремонтом компьютерной техники самому? Оправдано ли это?</p>\n<p>Конечно можно освоить любую предметную область, если есть желание. Вопрос только в том оправдано ли это по затратам времени. Многим людям всё время не хватает времени на свою работу. Некоторые люди считают, что должно быть разделение труда. Может это и правильно?</p>\n<p>Компьютерный мастер, который изо дня в день делает повторяющиеся операции, всегда лучше справиться чем компьютерный любитель между делом. Неумелыми действиями можно убить компьютер или ноутбук окончательно без возможности восстановления. Очень упорные люди часто выламывают разъёмы на электронике, отрывают пластиковые язычки на коннекторах. Всегда есть риск деформации контактов разъёмов и сокетов. Всегда лучше когда каждый занимается своим делом, которое приносит ему деньги. Возможность выезда компьютерного мастера на дом (или в офис) в Балашихе, в центре города Балашихе, всегда сэкономит ваше время. К тому же окажется для вас существенной экономией в сравнении со штатным сотрудником инженером сервисного обслуживания и ремонта бытовой техники.</p>\n<p>Ремонт компьютеров и другой бытовой техники на территории города Балашиха у заказчика с выездом на дом.</p>\n<p>В большинстве случаев достаточно ремонта компьютерной техники на дому без необходимость везти компьютерную технику самому в сервисный центр в Балашихе. Опытный компьютерный мастер произведёт настройку Вашего компьютера или телевизора у Вас на глаз, и покажет и научит как это делать самому. Опытный компьютерный мастер и инженер по сервисному обслуживанию электроники выполняет следующие работы у Вас в квартире:</p>\n<ul>\n<li>Модернизация вашего компьютера с заменой комплектующих.</li>\n<li>Установка и восстановления Windows любых версий, включая семёрку, Windows 10 и Windows 11</li>\n<li>Мастер может вручную <a href="/management/uslugi-mastera-v-balashihe/nizkaya-tsena-udaleniya-computer-virus"> удалить компьютерные вирусы и восстановить Вашу антивирусную защиту </a> Microsoft Defender</li>\n<li>Вдохнуть в Ваш морально и физически устаревший компьютер вторую жизнь с помощью ОС Linux Mint самой последней версии</li>\n<li>Восстановить удалённые данные на вашем жёстком диске, если они не были перезаписаны другими данными</li>\n<li>Замена, подбор, ремонт материнских плат, видеокарт, дисков SSD или HDD и любой компьютерной периферии квалифицированным специалистом инженером</li>\n</ul>\n<p>Внушительный опыт инженера по диагностике и ремонту вычислительной техники позволяет быстро идентифицировать проблему. Мастер в Балашихе, который является инженером по ремонту и обслуживанию компьютерной техники, способен в одиночку решить более 90% возникающих у клиентов проблем. Во многих случаях мною даётся гарантия на выполненные услуги в городе Балашиха.</p>', NULL, 169, NULL, '2023-07-09 23:19:57', '2023-11-15 22:58:29', '2023-03-22 13:53:09', NULL, 1, 72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `draft_blog_article` (`draftArticleId`, `title`, `h2`, `handle`, `absURL`, `blogCategoryId`, `text`, `textHtml`, `textRawDraftContentState`, `imageId`, `secondImageId`, `createdAt`, `updatedAt`, `publishedAt`, `orderNumber`, `managerId`, `existingArticleId`, `isDraftSaved`, `unPublished`, `notSearchable`, `notInList`, `keyTextHtml`, `createdByManagerId`, `templateId`, `description`, `autoHandleSlug`) VALUES
	(_binary 0x66808c4c6bbd11eeb5100ae0afad05aa, NULL, NULL, NULL, NULL, NULL, 'Приветствую! Я закончил факультет Информационных технологий в МИРЭА (специалист), бюджетное отделение. Пока учился по чуть-чуть работал настройщиком компьютеров эникейщиком, что лучше назвать словами "компьютерный мастер". Хотя моя должность на первом месте работы была именно "веб-программист", и это первая запись в моей трудовой книжке, когда мне было 19 лет. Но там мало платили и я забросил такое "веб-программирование". Работая мастером эникейщиком получалось заработать даже больше за меньшее время. На этом сайте я сейчас пишу программирую свою CMS, то есть свой движок сайта больше в учебный целях. Играюсь здесь с веб-технологиями. Перед выпуском в МИРЭА должна быть производственная практика. Меня отправили поработать в предприятие в Москве. Там меня взяли на постоянную работу, поэтому я там задержался. Моя должность называлась инженер сервисного обслуживания и ремонта, и работал я в отделе сервисного обслуживания и ремонта, службы информационных технологий. Конечно здесь речь идёт о сервисным обслуживании компьютерной техники, рабочих станций, коих суммарно на предприятии было более двух тысяч. Для этой должности формально обязательно требовался диплом о высшем образовании. На собеседовании был первый вопрос об известной в узких кругах семиуровневой модели ОСИ (OSI). Эта 7-ми уровневая модель ОСИ была первой наверное больше гипотетической попыткой создания современного Интернета, и в МИРЭА эту тему на занятиях очень много мусолили. Честно говоря, считаю что эта 7-ми уровневая модель ОСИ не представляет никакого практического интереса в настоящем времени. Начальник службы окончил Бауманку, и видно программы обучения были схожи. Вот я ему и сразу выдал заученную информацию по этой теме о первой неудачной попытке создания сети Интернет. Этот отдел сервисного обслуживания и ремонта был по сути внутренним сервисным центром предприятия. Ремонтировались материнские платы, которые потом использовались для экспериментов. Могу сейчас твёрдо сказать, что 90% процентов вызовов я выполнял один без привлечения других сотрудников технической службы. Сейчас мне в работе компьютерным мастером крайне редко нужны услуги других ремонтников. Выезд компьютерного мастера и диагностика в Балашихе бесплатна без каких-либо условий. Вы платите только за сделанную работу, то есть за починку или настройку компьютера. Я настраиваю роутеры WIFI в Балашихе для раздачи интернета у вас дома. Удаляю вирусы без переустановки операционной системы в балашихинском районе. Цены на услуги мастера по ремонту очень доступные для центра города Балашихи. Я ремонтирую ноутбуки в Балашихи и могу произвести замену матрицы экрана ноутбука. В Балашихе рядом с Шоссе Энтузиастов вы можете получить у меня компьютерную помощь и обучение компьютерной грамотности. Установка, переустановка и настройка операционный системы Windows или Linux в Балашихе.', '<p>Приветствую! Я закончил факультет Информационных технологий в МИРЭА (специалист), бюджетное отделение.</p>\n<p>Пока учился по чуть-чуть работал настройщиком компьютеров эникейщиком, что лучше назвать словами "компьютерный мастер". Хотя моя должность на первом&nbsp; &nbsp; месте работы была именно "веб-программист", и это первая запись в моей трудовой книжке, когда мне было 19 лет. Но там мало платили и я забросил такое "веб-программирование". Работая мастером эникейщиком получалось заработать даже больше за меньшее время. На этом сайте я сейчас пишу программирую свою CMS, то есть свой движок сайта больше в учебный целях. Играюсь здесь с веб-технологиями.</p>\n<p>Перед выпуском в МИРЭА должна быть производственная практика. Меня отправили поработать в предприятие в Москве. Там меня взяли на постоянную работу, поэтому я там задержался. Моя должность называлась инженер сервисного обслуживания и ремонта, и работал я в отделе сервисного обслуживания и ремонта, службы информационных технологий. Конечно здесь речь идёт о сервисным обслуживании компьютерной техники, рабочих станций, коих суммарно на предприятии было более двух тысяч. Для этой должности формально обязательно требовался диплом о высшем образовании. На собеседовании был первый вопрос об известной в узких кругах семиуровневой модели ОСИ (OSI). Эта 7-ми уровневая модель ОСИ была первой наверное больше гипотетической попыткой создания современного Интернета, и в МИРЭА эту тему на занятиях очень много мусолили. Честно говоря, считаю что эта 7-ми уровневая модель ОСИ не представляет никакого практического интереса в настоящем времени. Начальник службы окончил Бауманку, и видно программы обучения были схожи. Вот я ему и сразу выдал заученную информацию по этой теме о первой неудачной попытке создания сети Интернет. Этот отдел сервисного обслуживания и ремонта был по сути внутренним сервисным центром предприятия. Ремонтировались материнские платы, которые потом использовались для экспериментов. Могу сейчас твёрдо сказать, что 90% процентов вызовов я выполнял один без привлечения других сотрудников технической службы.</p>\n<p>Сейчас мне в работе компьютерным мастером крайне редко нужны услуги других ремонтников.</p>\n<p>Выезд компьютерного мастера и диагностика в Балашихе бесплатна без каких-либо условий. Вы платите только за сделанную работу, то есть за починку или настройку компьютера. Я настраиваю роутеры WIFI в Балашихе для раздачи интернета у вас дома. Удаляю вирусы без переустановки операционной системы в балашихинском районе. Цены на услуги мастера по ремонту очень доступные для центра города Балашихи. Я ремонтирую ноутбуки в Балашихи и могу произвести замену матрицы экрана ноутбука. В Балашихе рядом с Шоссе Энтузиастов вы можете получить у меня компьютерную помощь и обучение компьютерной грамотности. Установка, переустановка и настройка операционный системы Windows или Linux в Балашихе.</p>', NULL, NULL, NULL, '2023-10-16 00:46:10', '2023-12-06 22:52:23', '2023-10-16 00:46:10', NULL, 1, 76, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `draft_blog_article` (`draftArticleId`, `title`, `h2`, `handle`, `absURL`, `blogCategoryId`, `text`, `textHtml`, `textRawDraftContentState`, `imageId`, `secondImageId`, `createdAt`, `updatedAt`, `publishedAt`, `orderNumber`, `managerId`, `existingArticleId`, `isDraftSaved`, `unPublished`, `notSearchable`, `notInList`, `keyTextHtml`, `createdByManagerId`, `templateId`, `description`, `autoHandleSlug`) VALUES
	(_binary 0x897f299a751311eebb2e0ae0afad05aa, NULL, NULL, NULL, NULL, NULL, 'Семантическая разметка необходима, чтобы данные о Вашем бизнесе попали в справочники всех поисковых систем. Если у Вас есть физический офис с адресом, Вам необходимо добиться того, чтобы контактные данные Вашей компании появились в онлайн-справочниках и Ваш офис появился на всех популярных онлайн картах. Вот для этого и нужна семантическая разметка, чтобы поисковые системы сделали это автоматически. В моём случае мне важно, чтобы место, где я официально работаю компьютерным мастером, появилось в онлайн картах и справочниках. Во всех онлайн картах и онлайн справочников. <div itemScope itemType="https://schema.org/LocalBusiness"> <Box> <p> <meta itemProp="name" content="Компьютерный мастер в Балашихе" /> <meta itemProp="image" content={"/images/master_v_balashihe.jpg"} /> <Link itemProp="url" href={`${process.env.NEXT_PUBLIC_SITE_URL || "/"}`}> &copy; {new Date().getFullYear()}{" "} <span itemProp="name">Компьютерный мастер в Балашихе РФ</span> </Link> </p> <div itemProp="address" itemScope itemType="https://schema.org/PostalAddress" > <span itemProp="postalCode">143912</span>,{" "} <span itemProp="addressLocality">Балашиха</span>, центр города,{" "} <span itemProp="streetAddress">шоссе Энтузиастов, 7</span> <meta itemProp="addressRegion" content="Московская область" /> <meta itemProp="addressCountry" content="Россия" /> </div> <span itemProp="geo" itemScope itemType="https://schema.org/GeoCoordinates"> <meta itemProp="latitude" content="55.794831" /> <meta itemProp="longitude" content="37.92264" /> </span> </Box> <Box sx={{ color: grey[400], marginTop: "8px", }} > <p> Вызвать мастера в Балашихе для ремонта компьютера или ноутбука на дом или в офис, тел.{" "} <span itemProp="telephone">{NEXT_PUBLIC_CONTACT_PHONE_TEXT}</span> </p> <time itemProp="openingHours" dateTime="Mo-Su"> Время работы: с 9:00 до 23:00 | Без выходных </time> </Box> </div> <p class="s"></p>', '<p>Семантическая разметка необходима, чтобы данные о Вашем бизнесе попали в справочники всех поисковых систем. Если у Вас есть физический офис с адресом, Вам необходимо добиться того, чтобы контактные данные Вашей компании появились в онлайн-справочниках и Ваш офис появился на всех популярных онлайн картах. Вот для этого и нужна семантическая разметка, чтобы поисковые системы сделали это автоматически.</p>\n<p>В моём случае мне важно, чтобы место, где я официально работаю компьютерным мастером, появилось в онлайн картах и справочниках. Во всех онлайн картах и онлайн справочников.</p>\n<pre class="language-tsx"><code>&lt;div itemScope itemType="https://schema.org/LocalBusiness"&gt;\n  &lt;Box&gt;\n    &lt;p&gt;\n      &lt;meta itemProp="name" content="Компьютерный мастер в Балашихе" /&gt;\n      &lt;meta itemProp="image" content={"/images/master_v_balashihe.jpg"} /&gt;\n      &lt;Link itemProp="url" href={`${process.env.NEXT_PUBLIC_SITE_URL || "/"}`}&gt;\n        &amp;copy; {new Date().getFullYear()}{" "}\n        &lt;span itemProp="name"&gt;Компьютерный мастер в Балашихе РФ&lt;/span&gt;\n      &lt;/Link&gt;\n    &lt;/p&gt;\n    &lt;div\n      itemProp="address"\n      itemScope\n      itemType="https://schema.org/PostalAddress"\n    &gt;\n      &lt;span itemProp="postalCode"&gt;143912&lt;/span&gt;,{" "}\n      &lt;span itemProp="addressLocality"&gt;Балашиха&lt;/span&gt;, центр города,{" "}\n      &lt;span itemProp="streetAddress"&gt;шоссе Энтузиастов, 7&lt;/span&gt;\n      &lt;meta itemProp="addressRegion" content="Московская область" /&gt;\n      &lt;meta itemProp="addressCountry" content="Россия" /&gt;\n    &lt;/div&gt;\n    &lt;span itemProp="geo" itemScope itemType="https://schema.org/GeoCoordinates"&gt;\n      &lt;meta itemProp="latitude" content="55.794831" /&gt;\n      &lt;meta itemProp="longitude" content="37.92264" /&gt;\n    &lt;/span&gt;\n  &lt;/Box&gt;\n  &lt;Box\n    sx={{\n      color: grey[400],\n      marginTop: "8px",\n    }}\n  &gt;\n    &lt;p&gt;\n      Вызвать мастера в Балашихе для ремонта компьютера или ноутбука на дом или\n      в офис, тел.{" "}\n      &lt;span itemProp="telephone"&gt;{NEXT_PUBLIC_CONTACT_PHONE_TEXT}&lt;/span&gt;\n    &lt;/p&gt;\n    &lt;time itemProp="openingHours" dateTime="Mo-Su"&gt;\n      Время работы: с 9:00 до 23:00 | Без выходных\n    &lt;/time&gt;\n  &lt;/Box&gt;\n&lt;/div&gt;</code></pre>\n<pre class="language-markup"><code>&lt;p class="s"&gt;&lt;/p&gt;</code></pre>', NULL, NULL, NULL, '2023-10-27 21:55:26', '2023-12-04 20:11:04', '2023-10-27 21:55:26', NULL, 1, 82, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `draft_blog_article` (`draftArticleId`, `title`, `h2`, `handle`, `absURL`, `blogCategoryId`, `text`, `textHtml`, `textRawDraftContentState`, `imageId`, `secondImageId`, `createdAt`, `updatedAt`, `publishedAt`, `orderNumber`, `managerId`, `existingArticleId`, `isDraftSaved`, `unPublished`, `notSearchable`, `notInList`, `keyTextHtml`, `createdByManagerId`, `templateId`, `description`, `autoHandleSlug`) VALUES
	(_binary 0xf04ca4583f9f11eebe1a888888888788, 'Ремонт ноутбуков в Балашихе в день обращения у Вас дома или в офисном центре', NULL, 'remont-noutbukov-v-balashihe-v-den-obrasheniya-u-vas-doma-ili-v-ofisnom-centre', NULL, NULL, NULL, NULL, NULL, 167, NULL, '2023-08-20 21:24:25', '2023-08-20 21:24:25', '2023-03-22 13:53:09', NULL, 1, 69, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL);
INSERT IGNORE INTO `draft_blog_article` (`draftArticleId`, `title`, `h2`, `handle`, `absURL`, `blogCategoryId`, `text`, `textHtml`, `textRawDraftContentState`, `imageId`, `secondImageId`, `createdAt`, `updatedAt`, `publishedAt`, `orderNumber`, `managerId`, `existingArticleId`, `isDraftSaved`, `unPublished`, `notSearchable`, `notInList`, `keyTextHtml`, `createdByManagerId`, `templateId`, `description`, `autoHandleSlug`) VALUES
	(_binary 0xfe71b74276a211eeba5a0ae0afad05aa, NULL, NULL, NULL, NULL, NULL, 'sdfsdfsdfdsfdsfsdsfsdfsd', '<p>sdfsdfsdfdsfdsfsdsfsdfsd</p>', NULL, NULL, NULL, '2023-10-29 21:34:52', '2023-10-29 21:34:59', '2023-10-29 21:34:52', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
