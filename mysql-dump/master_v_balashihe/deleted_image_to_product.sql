-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               10.6.11-MariaDB-0ubuntu0.22.04.1 - Ubuntu 22.04
-- Операционная система:         debian-linux-gnu
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

-- Дамп структуры для таблица master_v_balashihe.deleted_image_to_product
CREATE TABLE IF NOT EXISTS `deleted_image_to_product` (
  `productId` int(10) unsigned NOT NULL,
  `imageId` int(10) unsigned NOT NULL,
  `orderNumber` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`productId`,`imageId`),
  KEY `FK_deleted_image_to_product_image` (`imageId`),
  CONSTRAINT `FK_deleted_image_to_product_deleted_product` FOREIGN KEY (`productId`) REFERENCES `deleted_product` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_deleted_image_to_product_image` FOREIGN KEY (`imageId`) REFERENCES `image` (`imageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Дамп данных таблицы master_v_balashihe.deleted_image_to_product: ~2 rows (приблизительно)
INSERT IGNORE INTO `deleted_image_to_product` (`productId`, `imageId`, `orderNumber`) VALUES
	(14, 38, 1);
INSERT IGNORE INTO `deleted_image_to_product` (`productId`, `imageId`, `orderNumber`) VALUES
	(22, 38, 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
