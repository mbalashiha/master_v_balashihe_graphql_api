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
  `handle` varchar(1024) NOT NULL,
  `title` text NOT NULL,
  `sku` tinytext DEFAULT NULL,
  `product_category_id` int(10) unsigned DEFAULT NULL,
  `manufacturerId` int(10) unsigned DEFAULT NULL,
  `description` text DEFAULT NULL,
  `descriptionHtml` text DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`productId`) USING BTREE,
  UNIQUE KEY `uniq_product_name_for_category_id` (`title`(100),`product_category_id`) USING BTREE,
  UNIQUE KEY `uniq_handle` (`handle`) USING HASH,
  KEY `FK_product_product_category` (`product_category_id`),
  KEY `FK_product_manufacturer` (`manufacturerId`) USING BTREE,
  CONSTRAINT `FK_product_manufacturer` FOREIGN KEY (`manufacturerId`) REFERENCES `manufacturer` (`manufacturerId`),
  CONSTRAINT `FK_product_product_category` FOREIGN KEY (`product_category_id`) REFERENCES `product_category` (`product_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- Дамп данных таблицы github-next-js.product: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT IGNORE INTO `product` (`productId`, `handle`, `title`, `sku`, `product_category_id`, `manufacturerId`, `description`, `descriptionHtml`, `created`, `updated`) VALUES
	(6, '000', 'Cool Hat', NULL, NULL, 16, 'The Next.js beanie has arrived! This embroidered beauty has a snug fit that ensures you\'re going to feel cozy and warm whatever you\'re doing. • 60% cotton, 40% acrylic• Breathable cotton blend• Form-fitting shape• One size fits most', '<meta charset="utf-8">\n<p data-mce-fragment="1">The Next.js beanie has arrived! This embroidered beauty has a snug fit that ensures you\'re going to feel cozy and warm whatever you\'re doing.</p>\n<p data-mce-fragment="1">• 60% cotton, 40% acrylic<br data-mce-fragment="1">• Breathable cotton blend<br data-mce-fragment="1">• Form-fitting shape<br data-mce-fragment="1">• One size fits most</p>\n<meta charset="utf-8">', '2022-03-22 23:41:14', '2022-03-22 23:57:18'),
	(9, '2', 'Cool Hat', NULL, NULL, NULL, 'The Next.js beanie has arrived! This embroidered beauty has a snug fit that ensures you\'re going to feel cozy and warm whatever you\'re doing. • 60% cotton, 40% acrylic• Breathable cotton blend• Form-fitting shape• One size fits most', '<meta charset="utf-8">\n<p data-mce-fragment="1">The Next.js beanie has arrived! This embroidered beauty has a snug fit that ensures you\'re going to feel cozy and warm whatever you\'re doing.</p>\n<p data-mce-fragment="1">• 60% cotton, 40% acrylic<br data-mce-fragment="1">• Breathable cotton blend<br data-mce-fragment="1">• Form-fitting shape<br data-mce-fragment="1">• One size fits most</p>\n<meta charset="utf-8">', '2022-03-24 20:04:27', '2022-03-24 20:14:38'),
	(10, 'cool-hat', 'Cool Hat', NULL, NULL, 16, 'The Next.js beanie has arrived! This embroidered beauty has a snug fit that ensures you\'re going to feel cozy and warm whatever you\'re doing. • 60% cotton, 40% acrylic• Breathable cotton blend• Form-fitting shape• One size fits most', '<meta charset="utf-8">\n<p data-mce-fragment="1">The Next.js beanie has arrived! This embroidered beauty has a snug fit that ensures you\'re going to feel cozy and warm whatever you\'re doing.</p>\n<p data-mce-fragment="1">• 60% cotton, 40% acrylic<br data-mce-fragment="1">• Breathable cotton blend<br data-mce-fragment="1">• Form-fitting shape<br data-mce-fragment="1">• One size fits most</p>\n<meta charset="utf-8">', '2022-03-24 20:14:58', '2022-03-24 20:14:58'),
	(11, 'lightweight-jacket', 'Lightweight Jacket', NULL, NULL, 16, 'Add a little zing to your winter wardrobe with this vibrant Winter-breaker Jacket. With a brushed fleece inside, and a relaxed unisex fit, this jacket is just the stuff of the dreams, so be quick to grab yourself one!Long sleeve ripstop jacket colorblocked in black. Rough pattern in obsidian black and brown printed throughout. Printed graphic in white throughout. Logo-woven webbing trim in white and black throughout. Bungee-style drawstring at hood featuring rubberized logo hardware. Zip closure at front. Rubberized logo appliqué at chest. Welt pockets and textile logo patch in orange at waist. Elasticized cuffs. Partially lined. Black hardware.', '<meta charset="utf-8"><span data-mce-fragment="1">Add a little zing to your winter wardrobe with this vibrant Winter-breaker Jacket. With a brushed fleece inside, and a relaxed unisex fit, this jacket is just the stuff of the dreams, so be quick to grab yourself one!</span><br data-mce-fragment="1"><br data-mce-fragment="1"><span data-mce-fragment="1">Long sleeve ripstop jacket colorblocked in black. Rough pattern in obsidian black and brown printed throughout. Printed graphic in white throughout. Logo-woven webbing trim in white and black throughout. Bungee-style drawstring at hood featuring rubberized logo hardware. Zip closure at front. Rubberized logo appliqué at chest. Welt pockets and textile logo patch in orange at waist. Elasticized cuffs. Partially lined. Black hardware.</span>', '2022-03-24 20:29:30', '2022-03-24 20:29:30'),
	(12, 't-shirt', 'T-Shirt', NULL, NULL, 16, 'This t-shirt is a must-have in your wardrobe, combining the timeless fit of a classic tee with an intricate embroidered detail that brings the shirt to a whole new level. It\'s soft and durable, so be prepared to have a new favorite t-shirt!', '<meta charset="utf-8"><span data-mce-fragment="1">This t-shirt is a must-have in your wardrobe, combining the timeless fit of a classic tee with an intricate embroidered detail that brings the shirt to a whole new level. It\'s soft and durable, so be prepared to have a new favorite t-shirt!</span><br data-mce-fragment="1">', '2022-03-24 20:29:31', '2022-03-24 20:29:31');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
