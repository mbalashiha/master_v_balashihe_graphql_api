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

-- Дамп структуры для таблица github-next-js.product_option_name_value
CREATE TABLE IF NOT EXISTS `product_option_name_value` (
  `valueId` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `value` varchar(512) NOT NULL,
  PRIMARY KEY (`valueId`),
  UNIQUE KEY `uniq_value_string` (`value`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Дамп данных таблицы github-next-js.product_option_name_value: ~5 rows (приблизительно)
/*!40000 ALTER TABLE `product_option_name_value` DISABLE KEYS */;
INSERT IGNORE INTO `product_option_name_value` (`valueId`, `value`) VALUES
	(8, ''),
	(4, '#000000'),
	(5, '#ffffff'),
	(6, 'l'),
	(7, 'm'),
	(3, 's');
/*!40000 ALTER TABLE `product_option_name_value` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
