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

-- Дамп структуры для таблица github-next-js.image_to_product
CREATE TABLE IF NOT EXISTS `image_to_product` (
  `productId` int(10) unsigned NOT NULL,
  `imageId` int(10) unsigned NOT NULL,
  `orderNumber` tinyint(3) unsigned NOT NULL,
  UNIQUE KEY `FK_image_to_product_image` (`imageId`,`productId`) USING BTREE,
  KEY `FK_image_to_product_product` (`productId`),
  CONSTRAINT `FK_image_to_product_product` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Дамп данных таблицы github-next-js.image_to_product: ~23 rows (приблизительно)
/*!40000 ALTER TABLE `image_to_product` DISABLE KEYS */;
INSERT IGNORE INTO `image_to_product` (`productId`, `imageId`, `orderNumber`) VALUES
	(13, 5, 0),
	(13, 6, 1),
	(13, 7, 2),
	(13, 8, 3),
	(14, 9, 0),
	(14, 10, 1),
	(14, 11, 2),
	(14, 12, 3),
	(14, 13, 4),
	(14, 14, 5),
	(15, 15, 0),
	(15, 16, 1),
	(15, 17, 2),
	(15, 18, 3),
	(15, 19, 4),
	(15, 20, 5),
	(18, 21, 0),
	(18, 22, 1),
	(18, 23, 2),
	(18, 24, 3),
	(18, 25, 4),
	(18, 26, 5),
	(18, 27, 6),
	(16, 28, 0);
/*!40000 ALTER TABLE `image_to_product` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
