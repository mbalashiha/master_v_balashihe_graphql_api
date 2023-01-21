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

-- Дамп структуры для таблица github-next-js.product
CREATE TABLE IF NOT EXISTS `product` (
  `productId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `handle` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `title` text NOT NULL,
  `sku` tinytext DEFAULT NULL,
  `product_category_id` int(10) unsigned DEFAULT NULL,
  `manufacturerId` int(10) unsigned DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `descriptionHtml` mediumtext DEFAULT NULL,
  `descriptionRawDraftContentState` mediumtext DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `publishedAt` timestamp NULL DEFAULT NULL,
  `published` tinyint(1) unsigned DEFAULT 1,
  `orderNumber` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`productId`) USING BTREE,
  UNIQUE KEY `uniq_product_name_for_category_id` (`title`(100),`product_category_id`) USING BTREE,
  UNIQUE KEY `uniq_handle` (`handle`) USING HASH,
  KEY `FK_product_product_category` (`product_category_id`),
  KEY `FK_product_manufacturer` (`manufacturerId`) USING BTREE,
  CONSTRAINT `FK_product_manufacturer` FOREIGN KEY (`manufacturerId`) REFERENCES `manufacturer` (`manufacturerId`),
  CONSTRAINT `FK_product_product_category` FOREIGN KEY (`product_category_id`) REFERENCES `product_category` (`product_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Дамп данных таблицы github-next-js.product: ~5 rows (приблизительно)
INSERT IGNORE INTO `product` (`productId`, `handle`, `title`, `sku`, `product_category_id`, `manufacturerId`, `description`, `descriptionHtml`, `descriptionRawDraftContentState`, `createdAt`, `updatedAt`, `publishedAt`, `published`, `orderNumber`) VALUES
	(15, 't-shirt', 'T-Shirt', NULL, 5, 16, NULL, NULL, '', '2022-03-26 16:02:09', '2022-11-13 13:14:13', NULL, 0, 2),
	(21, '32234ffffffffffff323232/99', '99', NULL, 34, NULL, NULL, NULL, '', '2022-10-25 15:56:56', '2022-11-13 13:14:10', NULL, 1, 1),
	(41, 'li22ghtweight-jacket4545420023432afsdf999234324355', '898229234fsdfdsf993243455', NULL, 32, NULL, NULL, NULL, '', '2022-11-01 20:33:29', '2022-11-13 13:14:08', NULL, 1, 4),
	(45, '5', '8ddcddcccxdfsdfdf455', NULL, 5, NULL, 'process.nextTick(() => setFieldValue("descriptiyuyuy\n\njkkkkkkkk09909032323232322323209329032093290903209092121212kkkkkjkiopijkl;jkmk98yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyuuuuuuuuuuuuuuu\n\nonHtml", descriptionHtml));', 'process.nextTick(() => setFieldValue("descriptiyuyuy\n\njkkkkkkkk09909032323232322323209329032093290903209092121212kkkkkjkiopijkl;jkmk98yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyuuuuuuuuuuuuuuu\n\nonHtml", descriptionHtml));', NULL, '2022-11-01 20:44:39', '2022-11-13 16:36:59', NULL, 1, 3),
	(47, 'remont-i-zamena-razbitogo-ekrana-noutbuka-v-den-obrasheniya-zakazhite-vyezd-mastera-po-moskve-na-dom-ili-v-ofis', 'Ремонт и замена разбитого экрана ноутбука в день обращения. Закажите выезд мастера по Москве на дом или в офис', NULL, 32, NULL, 'Ремонт и замена разбитого экрана ноутбука в день обращения. Закажите выезд мастера по Москве на дом или в офис.\n\nЗаменю повреждённую матрицу экрана ноутбука или монитора за 1 час уже в день обращения в удобное для Вас время.\n    Звоните.\n\n\n    Замена любых матриц прямо на дому\n    1 год гарантия на замену матрицы.\n    Оперативный выезд мастера бесплатно.\n    Замена матрицы ноутбука от 1200 рублей.\n    Низкие цены на запчасти.\n\nЯ ремонтирую любые ноутбуки: Acer, Asus, Sony, Samsung, HP,\nToshiba, Lenovo, Dell, eMachines, MSI, Packard Bell; от 8,9″ до 21″ дюймов.\n\nЭкран ноутбука — один из самых хрупких компонентов, при физических повреждениях, падениях и ударах в первую очередь страдает именно экран и требуется\nзамена матрицы экрана. Признаками этого могут являться трещины и деформации, черные блики и отсутствие подсветки изображения.\n\nСколько стоит ремонт и замена матрицы ноутбука в Москве?\nОбщая цена ремонта матрицы складывается из цены работ по замене и цены на саму матрицу для ноутбука,\nкоторая зависит от диагонали (больше как правило дороже), разрешения (числа пикселей), типа (старая ламповая или современная LED)\nи производителя ноутбука, а также нескольких других характеристик. Обычно стандартная 15,6″ светодиодная матрица стоит от 2500 до 3500 руб,\nа работы по замене матрицы, включая выезд мастера на дом = 990 руб.\n\n\nЦена замены матрицы в ноутбуке = 990 руб + стоимость матрицы\nНаш мастер может приехать к вам на дом или в офис уже с необходимой матрицей и заменить её на месте.\nКоллектив «Компьютерный мастер Москва.ру» много лет специализируется на ремонте различной компьютерной техники.\nРемонт и замена матриц на ноутбуках нашими специалистами производится оперативно — как правило в день обращения.\n\nРазбили экран ноутбука? Вызывайте мастера на дом.\nМы сможем подобрать матрицу для вашего ноутбука по модели, озвучить стоимость и назначить выезд мастера.', '<h1>Ремонт и замена разбитого экрана ноутбука в день обращения. Закажите выезд мастера по Москве на дом или в офис.</h1>\n\n<h3>Заменю повреждённую матрицу экрана ноутбука или монитора за 1 час уже в день обращения в удобное для Вас время.\n    Звоните.\n</h3>\n<ul>\n    <li>Замена любых матриц прямо на дому</li>\n    <li>1 год гарантия на замену матрицы.</li>\n    <li>Оперативный выезд мастера бесплатно.</li>\n    <li>Замена матрицы ноутбука от 1200 рублей.</li>\n    <li>Низкие цены на запчасти.</li>\n</ul>\n<br><br>Я ремонтирую любые ноутбуки: Acer, Asus, Sony, Samsung, HP,\nToshiba, Lenovo, Dell, eMachines, MSI, Packard Bell; от 8,9″ до 21″ дюймов.\n\nЭкран ноутбука — один из самых хрупких компонентов, при физических повреждениях, падениях и ударах в первую очередь страдает именно экран и требуется\nзамена матрицы экрана. Признаками этого могут являться трещины и деформации, черные блики и отсутствие подсветки изображения.\n\n<h3>Сколько стоит ремонт и замена матрицы ноутбука в Москве?</h3>\nОбщая цена ремонта матрицы складывается из цены работ по замене и цены на саму матрицу для ноутбука,\nкоторая зависит от диагонали (больше как правило дороже), разрешения (числа пикселей), типа (старая ламповая или современная LED)\nи производителя ноутбука, а также нескольких других характеристик. Обычно стандартная 15,6″ светодиодная матрица стоит от 2500 до 3500 руб,\nа работы по замене матрицы, включая выезд мастера на дом = 990 руб.\n\n\n<h3>Цена замены матрицы в ноутбуке = 990 руб + стоимость матрицы</h3>\nНаш мастер может приехать к вам на дом или в офис уже с необходимой матрицей и заменить её на месте.\nКоллектив «Компьютерный мастер Москва.ру» много лет специализируется на ремонте различной компьютерной техники.\nРемонт и замена матриц на ноутбуках нашими специалистами производится оперативно — как правило в день обращения.\n\n<h3>Разбили экран ноутбука? Вызывайте мастера на дом.</h3>\nМы сможем подобрать матрицу для вашего ноутбука по модели, озвучить стоимость и назначить выезд мастера.', NULL, '2022-11-20 22:07:08', '2022-11-24 17:49:29', NULL, 1, 5);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
