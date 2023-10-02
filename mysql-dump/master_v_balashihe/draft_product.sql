-- --------------------------------------------------------
-- Хост:                         192.168.0.50
-- Версия сервера:               11.0.3-MariaDB-1:11.0.3+maria~ubu2204 - mariadb.org binary distribution
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

-- Дамп структуры для таблица master_v_balashihe.draft_product
CREATE TABLE IF NOT EXISTS `draft_product` (
  `draftProductId` binary(16) NOT NULL DEFAULT unhex(replace(uuid(),'-','')),
  `managerId` int(10) unsigned NOT NULL,
  `productId` int(10) unsigned DEFAULT NULL,
  `handle` varchar(1024) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `title` text DEFAULT NULL,
  `sku` tinytext DEFAULT NULL,
  `product_category_id` int(10) unsigned DEFAULT NULL,
  `manufacturerId` int(10) unsigned DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `descriptionHtml` longtext DEFAULT NULL,
  `descriptionRawDraftContentState` longtext DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `publishedAt` timestamp NULL DEFAULT NULL,
  `images_has_been_copied` tinyint(1) unsigned DEFAULT NULL,
  `published` tinyint(1) unsigned DEFAULT 1,
  `orderNumber` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`draftProductId`),
  UNIQUE KEY `uniq_manager_product_id` (`managerId`,`productId`),
  KEY `FK_product_product_category` (`product_category_id`),
  KEY `FK_product_manufacturer` (`manufacturerId`) USING BTREE,
  KEY `actual_relation` (`productId`) USING BTREE,
  CONSTRAINT `FK_draft_product_product` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Дамп данных таблицы master_v_balashihe.draft_product: ~6 rows (приблизительно)
INSERT IGNORE INTO `draft_product` (`draftProductId`, `managerId`, `productId`, `handle`, `title`, `sku`, `product_category_id`, `manufacturerId`, `description`, `descriptionHtml`, `descriptionRawDraftContentState`, `createdAt`, `updatedAt`, `publishedAt`, `images_has_been_copied`, `published`, `orderNumber`) VALUES
	(_binary 0x1f4f5ff968fe11edb24160a44c4f528e, 1, NULL, NULL, 'Ремонт и замена разбитого экрана ноутбука в день обращения. Закажите выезд мастера по Москве на дом или в офис', NULL, NULL, NULL, '', '', NULL, '2022-11-20 18:07:00', '2022-11-20 18:12:29', NULL, NULL, 1, 5);
INSERT IGNORE INTO `draft_product` (`draftProductId`, `managerId`, `productId`, `handle`, `title`, `sku`, `product_category_id`, `manufacturerId`, `description`, `descriptionHtml`, `descriptionRawDraftContentState`, `createdAt`, `updatedAt`, `publishedAt`, `images_has_been_copied`, `published`, `orderNumber`) VALUES
	(_binary 0x75267585629311edb37460a44c4f528e, 1, 21, '32234ffffffffffff323232/99', '99', NULL, 34, NULL, NULL, NULL, '', '2022-11-12 14:08:20', '2022-11-13 13:14:51', NULL, 1, 1, 1);
INSERT IGNORE INTO `draft_product` (`draftProductId`, `managerId`, `productId`, `handle`, `title`, `sku`, `product_category_id`, `manufacturerId`, `description`, `descriptionHtml`, `descriptionRawDraftContentState`, `createdAt`, `updatedAt`, `publishedAt`, `images_has_been_copied`, `published`, `orderNumber`) VALUES
	(_binary 0x7a1c7e20637111edb3b560a44c4f528e, 1, 45, '5', '8ddcddcccxdfsdfdf455', NULL, 5, NULL, 'process.nextTick(() => setFieldValue("descriptiyuyuy\n\njkkkkkkkk09909032323232322323209329032093290903209092121212kkkkkjkiopijkl;jkmk98yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyuuuuuuuuuuuuuuu\n\nonHtml", descriptionHtml));', 'process.nextTick(() => setFieldValue("descriptiyuyuy\n\njkkkkkkkk09909032323232322323209329032093290903209092121212kkkkkjkiopijkl;jkmk98yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyuuuuuuuuuuuuuuu\n\nonHtml", descriptionHtml));', NULL, '2022-11-13 16:37:34', '2022-11-13 16:37:34', NULL, 1, 1, 3);
INSERT IGNORE INTO `draft_product` (`draftProductId`, `managerId`, `productId`, `handle`, `title`, `sku`, `product_category_id`, `manufacturerId`, `description`, `descriptionHtml`, `descriptionRawDraftContentState`, `createdAt`, `updatedAt`, `publishedAt`, `images_has_been_copied`, `published`, `orderNumber`) VALUES
	(_binary 0xa005640a629b11edb37460a44c4f528e, 1, 41, 'li22ghtweight-jacket4545420023432afsdf999234324355', '898229234fsdfdsf993243455', NULL, 32, NULL, NULL, NULL, '', '2022-11-12 15:06:48', '2022-11-13 13:14:48', NULL, 1, 1, 4);
INSERT IGNORE INTO `draft_product` (`draftProductId`, `managerId`, `productId`, `handle`, `title`, `sku`, `product_category_id`, `manufacturerId`, `description`, `descriptionHtml`, `descriptionRawDraftContentState`, `createdAt`, `updatedAt`, `publishedAt`, `images_has_been_copied`, `published`, `orderNumber`) VALUES
	(_binary 0xabd4a7b86dd411edb23e60a44c4f528e, 1, 47, 'remont-i-zamena-razbitogo-ekrana-noutbuka-v-den-obrasheniya-zakazhite-vyezd-mastera-po-moskve-na-dom-ili-v-ofis', 'Ремонт и замена разбитого экрана ноутбука в день обращения. Закажите выезд мастера по Москве на дом или в офис', NULL, 32, NULL, 'Ремонт и замена разбитого экрана ноутбука в день обращения. Закажите выезд мастера по Москве на дом или в офис.\n\nЗаменю повреждённую матрицу экрана ноутбука или монитора за 1 час уже в день обращения в удобное для Вас время.\n    Звоните.\n\n\n    Замена любых матриц прямо на дому\n    1 год гарантия на замену матрицы.\n    Оперативный выезд мастера бесплатно.\n    Замена матрицы ноутбука от 1200 рублей.\n    Низкие цены на запчасти.\n\nЯ ремонтирую любые ноутбуки: Acer, Asus, Sony, Samsung, HP,\nToshiba, Lenovo, Dell, eMachines, MSI, Packard Bell; от 8,9″ до 21″ дюймов.\n\nЭкран ноутбука — один из самых хрупких компонентов, при физических повреждениях, падениях и ударах в первую очередь страдает именно экран и требуется\nзамена матрицы экрана. Признаками этого могут являться трещины и деформации, черные блики и отсутствие подсветки изображения.\n\nСколько стоит ремонт и замена матрицы ноутбука в Москве?\nОбщая цена ремонта матрицы складывается из цены работ по замене и цены на саму матрицу для ноутбука,\nкоторая зависит от диагонали (больше как правило дороже), разрешения (числа пикселей), типа (старая ламповая или современная LED)\nи производителя ноутбука, а также нескольких других характеристик. Обычно стандартная 15,6″ светодиодная матрица стоит от 2500 до 3500 руб,\nа работы по замене матрицы, включая выезд мастера на дом = 990 руб.\n\n\nЦена замены матрицы в ноутбуке = 990 руб + стоимость матрицы\nНаш мастер может приехать к вам на дом или в офис уже с необходимой матрицей и заменить её на месте.\nКоллектив «Компьютерный мастер Москва.ру» много лет специализируется на ремонте различной компьютерной техники.\nРемонт и замена матриц на ноутбуках нашими специалистами производится оперативно — как правило в день обращения.\n\nРазбили экран ноутбука? Вызывайте мастера на дом.\nМы сможем подобрать матрицу для вашего ноутбука по модели, озвучить стоимость и назначить выезд мастера.', '<h1>Ремонт и замена разбитого экрана ноутбука в день обращения. Закажите выезд мастера по Москве на дом или в офис.</h1>\n\n<h3>Заменю повреждённую матрицу экрана ноутбука или монитора за 1 час уже в день обращения в удобное для Вас время.\n    Звоните.\n</h3>\n<ul>\n    <li>Замена любых матриц прямо на дому</li>\n    <li>1 год гарантия на замену матрицы.</li>\n    <li>Оперативный выезд мастера бесплатно.</li>\n    <li>Замена матрицы ноутбука от 1200 рублей.</li>\n    <li>Низкие цены на запчасти.</li>\n</ul>\n<br><br>Я ремонтирую любые ноутбуки: Acer, Asus, Sony, Samsung, HP,\nToshiba, Lenovo, Dell, eMachines, MSI, Packard Bell; от 8,9″ до 21″ дюймов.\n\nЭкран ноутбука — один из самых хрупких компонентов, при физических повреждениях, падениях и ударах в первую очередь страдает именно экран и требуется\nзамена матрицы экрана. Признаками этого могут являться трещины и деформации, черные блики и отсутствие подсветки изображения.\n\n<h3>Сколько стоит ремонт и замена матрицы ноутбука в Москве?</h3>\nОбщая цена ремонта матрицы складывается из цены работ по замене и цены на саму матрицу для ноутбука,\nкоторая зависит от диагонали (больше как правило дороже), разрешения (числа пикселей), типа (старая ламповая или современная LED)\nи производителя ноутбука, а также нескольких других характеристик. Обычно стандартная 15,6″ светодиодная матрица стоит от 2500 до 3500 руб,\nа работы по замене матрицы, включая выезд мастера на дом = 990 руб.\n\n\n<h3>Цена замены матрицы в ноутбуке = 990 руб + стоимость матрицы</h3>\nНаш мастер может приехать к вам на дом или в офис уже с необходимой матрицей и заменить её на месте.\nКоллектив «Компьютерный мастер Москва.ру» много лет специализируется на ремонте различной компьютерной техники.\nРемонт и замена матриц на ноутбуках нашими специалистами производится оперативно — как правило в день обращения.\n\n<h3>Разбили экран ноутбука? Вызывайте мастера на дом.</h3>\nМы сможем подобрать матрицу для вашего ноутбука по модели, озвучить стоимость и назначить выезд мастера.', NULL, '2022-11-26 21:52:50', '2022-11-26 21:52:50', NULL, 1, 1, 5);
INSERT IGNORE INTO `draft_product` (`draftProductId`, `managerId`, `productId`, `handle`, `title`, `sku`, `product_category_id`, `manufacturerId`, `description`, `descriptionHtml`, `descriptionRawDraftContentState`, `createdAt`, `updatedAt`, `publishedAt`, `images_has_been_copied`, `published`, `orderNumber`) VALUES
	(_binary 0xee592933629811edb37460a44c4f528e, 1, 15, 't-shirt', 'T-Shirt', NULL, 5, 16, NULL, NULL, '', '2022-11-12 14:47:31', '2022-11-18 18:42:31', NULL, 1, 1, 3);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
