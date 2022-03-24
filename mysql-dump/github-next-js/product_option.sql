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

-- Дамп структуры для таблица github-next-js.product_option
CREATE TABLE IF NOT EXISTS `product_option` (
  `optionId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nameId` int(10) unsigned NOT NULL,
  `valueId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`optionId`),
  UNIQUE KEY `FK_product_option_product` (`nameId`,`valueId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Дамп данных таблицы github-next-js.product_option: ~5 rows (приблизительно)
/*!40000 ALTER TABLE `product_option` DISABLE KEYS */;
INSERT IGNORE INTO `product_option` (`optionId`, `nameId`, `valueId`) VALUES
	(3, 4, 3),
	(6, 4, 6),
	(7, 4, 7),
	(4, 5, 4),
	(5, 5, 5);
/*!40000 ALTER TABLE `product_option` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
