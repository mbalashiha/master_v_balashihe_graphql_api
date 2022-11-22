-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               10.5.9-MariaDB - mariadb.org binary distribution
-- Операционная система:         Win64
-- HeidiSQL Версия:              11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4;

-- Дамп данных таблицы github-next-js.product: ~5 rows (приблизительно)
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT IGNORE INTO `product` (`productId`, `handle`, `title`, `sku`, `product_category_id`, `manufacturerId`, `description`, `descriptionHtml`, `descriptionRawDraftContentState`, `createdAt`, `updatedAt`, `publishedAt`, `published`, `orderNumber`) VALUES
	(15, 't-shirt', 'T-Shirt', NULL, 5, 16, NULL, NULL, '', '2022-03-26 19:02:09', '2022-11-13 16:14:13', NULL, 0, 2),
	(21, '32234ffffffffffff323232/99', '99', NULL, 34, NULL, NULL, NULL, '', '2022-10-25 18:56:56', '2022-11-13 16:14:10', NULL, 1, 1),
	(41, 'li22ghtweight-jacket4545420023432afsdf999234324355', '898229234fsdfdsf993243455', NULL, 32, NULL, NULL, NULL, '', '2022-11-01 23:33:29', '2022-11-13 16:14:08', NULL, 1, 4),
	(45, '5', '8ddcddcccxdfsdfdf455', NULL, 5, NULL, 'process.nextTick(() => setFieldValue("descriptiyuyuy\n\njkkkkkkkk09909032323232322323209329032093290903209092121212kkkkkjkiopijkl;jkmk98yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyuuuuuuuuuuuuuuu\n\nonHtml", descriptionHtml));', 'process.nextTick(() => setFieldValue("descriptiyuyuy\n\njkkkkkkkk09909032323232322323209329032093290903209092121212kkkkkjkiopijkl;jkmk98yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyuuuuuuuuuuuuuuu\n\nonHtml", descriptionHtml));', NULL, '2022-11-01 23:44:39', '2022-11-13 19:36:59', NULL, 1, 3),
	(47, 'remont-i-zamena-razbitogo-ekrana-noutbuka-v-den-obrasheniya-zakazhite-vyezd-mastera-po-moskve-na-dom-ili-v-ofis', 'Ремонт и замена разбитого экрана ноутбука в день обращения. Закажите выезд мастера по Москве на дом или в офис', NULL, 32, NULL, 'Ремонт и замена разбитого экрана ноутбука в день обращения. Закажите выезд мастера по Москве на дом или в офис.\n\n\n\n    \n\n\n    \n        \n            \n                Заменим матрицу экрана ноутбука за 20 минут уже в день обращения! Звоните\n                    8&nbsp;(499)&nbsp;647-89-35\n                \n            \n        \n\n        \n            \n                \n                    \n                \n            \n            \n                \n                    \n                        Замена любых матриц прямо на дому\n                        1 год гарантия на замену матрицы.\n                        Оперативный выезд мастера бесплатно.\n                        Замена матрицы ноутбука 990 р.=\n                        Низкие цены на запчасти.\n                    \n                    Мы ремонтируем любые ноутбуки: Acer, Asus, Sony, Samsung, HP, Toshiba, Lenovo, Dell, eMachines, MSI, Packard Bell; от 8,9″ до 21″ дюймов.\n                    \n                \n            \n        \n\n        Экран ноутбука — один из самых хрупких компонентов, при физических повреждениях, падениях и ударах в первую очередь страдает именно экран и требуется замена матрицы экрана. Признаками этого могут являться трещины и деформации, черные блики и отсутствие подсветки изображения.\n\n\n        Сколько стоит ремонт и замена матрицы ноутбука в Москве?\n        Общая цена ремонта матрицы складывается из цены работ по замене и цены на саму матрицу для ноутбука,\n        которая зависит от диагонали (больше как правило дороже), разрешения (числа пикселей), типа (старая ламповая или современная LED) и производителя ноутбука, а также нескольких других характеристик. Обычно стандартная 15,6″ светодиодная матрица стоит от 2500 до 3500 руб, а работы по замене матрицы, включая выезд мастера на дом = 990 руб.\n\n\n        Цена замены матрицы в ноутбуке = 990 руб + стоимость матрицы\n        Наш мастер может приехать к вам на дом или в офис уже с необходимой матрицей и заменить её на месте. Коллектив «Компьютерный мастер Москва.ру» много лет специализируется на ремонте различной компьютерной техники. Ремонт и замена матриц на ноутбуках нашими специалистами производится оперативно — как правило в день обращения.\n\n        Разбили экран ноутбука? Вызывайте мастера на дом.\n        Мы сможем подобрать матрицу для вашего ноутбука по модели, озвучить стоимость и назначить выезд мастера.', '<article>\n    <h1>Ремонт и замена разбитого экрана ноутбука в день обращения. Закажите выезд мастера по Москве на дом или в офис.</h1>\n\n\n\n    <!-- Код который будет выводиться если в вашей области не добавлено ни одного виджета -->\n\n\n    <div>\n        <div>\n            <div>\n                <h3>Заменим матрицу экрана ноутбука за 20 минут уже в день обращения! Звоните\n                    <a href="tel:8(499)647-89-35"><span>8&nbsp;(499)&nbsp;647-89-35</span></a>\n                </h3>\n            </div>\n        </div>\n\n        <div>\n            <div>\n                <div>\n                    <img src="http://computer-master-moskva.ru/files/publ/broken-screen-469x352.jpg" width="469">\n                </div>\n            </div>\n            <div>\n                <div>\n                    <ul>\n                        <li>Замена любых матриц прямо на дому</li>\n                        <li>1 год гарантия на замену матрицы.</li>\n                        <li>Оперативный выезд мастера бесплатно.</li>\n                        <li>Замена матрицы ноутбука <span>990 р.=</span></li>\n                        <li>Низкие цены на запчасти.</li>\n                    </ul>\n                    <br><br>Мы ремонтируем любые ноутбуки: Acer, Asus, Sony, Samsung, HP, Toshiba, Lenovo, Dell, eMachines, MSI, Packard Bell; от 8,9″ до 21″ дюймов.\n                    <br><br>\n                </div>\n            </div>\n        </div>\n\n        Экран ноутбука — один из самых хрупких компонентов, при физических повреждениях, падениях и ударах в первую очередь страдает именно экран и требуется замена матрицы экрана. Признаками этого могут являться трещины и деформации, черные блики и отсутствие подсветки изображения.\n\n\n        <h3>Сколько стоит ремонт и замена матрицы ноутбука в Москве?</h3>\n        Общая цена ремонта матрицы складывается из цены работ по замене и цены на саму матрицу для ноутбука,\n        которая зависит от диагонали (больше как правило дороже), разрешения (числа пикселей), типа (старая ламповая или современная LED) и производителя ноутбука, а также нескольких других характеристик. Обычно стандартная 15,6″ светодиодная матрица стоит от 2500 до 3500 руб, а работы по замене матрицы, включая выезд мастера на дом = 990 руб.\n\n\n        <h3>Цена замены матрицы в ноутбуке = 990 руб + стоимость матрицы</h3>\n        Наш мастер может приехать к вам на дом или в офис уже с необходимой матрицей и заменить её на месте. Коллектив «Компьютерный мастер Москва.ру» много лет специализируется на ремонте различной компьютерной техники. Ремонт и замена матриц на ноутбуках нашими специалистами производится оперативно — как правило в день обращения.\n\n        <h3>Разбили экран ноутбука? Вызывайте мастера на дом.</h3>\n        Мы сможем подобрать матрицу для вашего ноутбука по модели, озвучить стоимость и назначить выезд мастера.\n\n    </div><!-- .entry-content -->\n\n    <footer>\n    </footer><!-- .entry -->\n</article>', NULL, '2022-11-21 01:07:08', '2022-11-22 19:18:49', NULL, 1, 5);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
