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

-- Дамп структуры для таблица github-next-js.image_to_product
CREATE TABLE IF NOT EXISTS `image_to_product` (
  `productId` int(10) unsigned NOT NULL,
  `imageId` int(10) unsigned NOT NULL,
  `orderNumber` tinyint(3) unsigned NOT NULL,
  UNIQUE KEY `FK_image_to_product_image` (`imageId`,`productId`) USING BTREE,
  KEY `FK_image_to_product_product` (`productId`),
  CONSTRAINT `FK_image_to_product_product` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Дамп данных таблицы github-next-js.image_to_product: ~3 rows (приблизительно)
INSERT IGNORE INTO `image_to_product` (`productId`, `imageId`, `orderNumber`) VALUES
	(45, 58, 1),
	(45, 59, 2),
	(41, 62, 1),
	(47, 63, 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
