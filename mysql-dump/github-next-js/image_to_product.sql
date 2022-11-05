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

-- Дамп данных таблицы github-next-js.image_to_product: ~1 rows (приблизительно)
/*!40000 ALTER TABLE `image_to_product` DISABLE KEYS */;
INSERT IGNORE INTO `image_to_product` (`productId`, `imageId`, `orderNumber`) VALUES
	(21, 29, 1);
/*!40000 ALTER TABLE `image_to_product` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
