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
  `handle` varchar(1024) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `title` text NOT NULL,
  `sku` tinytext DEFAULT NULL,
  `product_category_id` int(10) unsigned DEFAULT NULL,
  `manufacturerId` int(10) unsigned DEFAULT NULL,
  `description` text DEFAULT NULL,
  `descriptionHtml` text DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `publishedAt` timestamp NULL DEFAULT NULL,
  `descriptionRawDraftContentState` longtext DEFAULT NULL,
  PRIMARY KEY (`productId`) USING BTREE,
  UNIQUE KEY `uniq_handle` (`handle`),
  UNIQUE KEY `uniq_product_name_for_category_id` (`title`(100),`product_category_id`) USING BTREE,
  KEY `FK_product_product_category` (`product_category_id`),
  KEY `FK_product_manufacturer` (`manufacturerId`) USING BTREE,
  CONSTRAINT `FK_product_manufacturer` FOREIGN KEY (`manufacturerId`) REFERENCES `manufacturer` (`manufacturerId`),
  CONSTRAINT `FK_product_product_category` FOREIGN KEY (`product_category_id`) REFERENCES `product_category` (`product_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- Дамп данных таблицы github-next-js.product: ~7 rows (приблизительно)
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT IGNORE INTO `product` (`productId`, `handle`, `title`, `sku`, `product_category_id`, `manufacturerId`, `description`, `descriptionHtml`, `createdAt`, `updatedAt`, `publishedAt`, `descriptionRawDraftContentState`) VALUES
	(13, 'cool-hat', 'Cool Hat', NULL, NULL, 16, 'The Next.js beanie has arrived! This embroidered beauty has a snug fit that ensures you\'re going to feel cozy and warm whatever you\'re doing. • 60% cotton, 40% acrylic• Breathable cotton blend• Form-fitting shape• One size fits most', '<meta charset="utf-8">\n<p data-mce-fragment="1">The Next.js beanie has arrived! This embroidered beauty has a snug fit that ensures you\'re going to feel cozy and warm whatever you\'re doing.</p>\n<p data-mce-fragment="1">• 60% cotton, 40% acrylic<br data-mce-fragment="1">• Breathable cotton blend<br data-mce-fragment="1">• Form-fitting shape<br data-mce-fragment="1">• One size fits most</p>\n<meta charset="utf-8">', '2022-03-26 19:02:09', '2022-03-26 19:02:09', NULL, NULL),
	(14, 'lightweight-jacket', 'Lightweight Jacket', NULL, 5, 16, 'Add a little zing to your winter wardrobe with this vibrant Winter-breaker Jacket. With a brushed fleece inside, and a relaxed unisex fit, this jacket is just the stuff of the dreams, so be quick to grab yourself one!Long sleeve ripstop jacket colorblocked in black. Rough pattern in obsidian black and brown printed throughout. Printed graphic in white throughout. Logo-woven webbing trim in white and black throughout. Bungee-style drawstring at hood featuring rubberized logo hardware. Zip closure at front. Rubberized logo appliqué at chest. Welt pockets and textile logo patch in orange at waist. Elasticized cuffs. Partially lined. Black hardware.', '<meta charset="utf-8"><span data-mce-fragment="1">Add a little zing to your winter wardrobe with this vibrant Winter-breaker Jacket. With a brushed fleece inside, and a relaxed unisex fit, this jacket is just the stuff of the dreams, so be quick to grab yourself one!</span><br data-mce-fragment="1"><br data-mce-fragment="1"><span data-mce-fragment="1">Long sleeve ripstop jacket colorblocked in black. Rough pattern in obsidian black and brown printed throughout. Printed graphic in white throughout. Logo-woven webbing trim in white and black throughout. Bungee-style drawstring at hood featuring rubberized logo hardware. Zip closure at front. Rubberized logo appliqué at chest. Welt pockets and textile logo patch in orange at waist. Elasticized cuffs. Partially lined. Black hardware.</span>', '2022-03-26 19:02:09', '2022-07-08 19:10:49', NULL, NULL),
	(15, 't-shirt', 'T-Shirt', NULL, 5, 16, 'This t-shirt is a must-have in your wardrobe, combining the timeless fit of a classic tee with an intricate embroidered detail that brings the shirt to a whole new level. It\'s soft and durable, so be prepared to have a new favorite t-shirt!', '<meta charset="utf-8"><span data-mce-fragment="1">This t-shirt is a must-have in your wardrobe, combining the timeless fit of a classic tee with an intricate embroidered detail that brings the shirt to a whole new level. It\'s soft and durable, so be prepared to have a new favorite t-shirt!</span><br data-mce-fragment="1">', '2022-03-26 19:02:09', '2022-07-08 19:10:17', NULL, NULL),
	(16, '32234ffffffffffff323232/34234', '34234', NULL, 34, NULL, NULL, NULL, '2022-08-05 20:02:32', '2022-08-08 20:51:43', NULL, '{"blocks":[{"key":"bujnk","text":"","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}}],"entityMap":{}}'),
	(18, '34234hhhh', '34234hhhh', NULL, 5, NULL, '7', '<p>7</p>\n', '2022-08-05 20:04:30', '2022-08-05 20:04:30', NULL, '{"blocks":[{"key":"bsjh3","text":"7","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}}],"entityMap":{}}'),
	(19, '32234ffffffffffff323232/3', '3', NULL, 34, NULL, NULL, NULL, '2022-08-07 21:34:49', '2022-08-07 21:34:49', NULL, '{"blocks":[{"key":"7aduu","text":"","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}}],"entityMap":{}}'),
	(20, '32234ffffffffffff323232/24324', '24324', NULL, 34, NULL, NULL, NULL, '2022-08-07 21:53:14', '2022-08-07 21:53:14', NULL, '{"blocks":[{"key":"2suc8","text":"","type":"unstyled","depth":0,"inlineStyleRanges":[],"entityRanges":[],"data":{}}],"entityMap":{}}');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
