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

-- Дамп структуры для таблица github-next-js.price_currency_code
CREATE TABLE IF NOT EXISTS `price_currency_code` (
  `currencyCodeId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `currencyCode` tinytext CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `symbolCode` char(1) DEFAULT NULL,
  PRIMARY KEY (`currencyCodeId`),
  UNIQUE KEY `Индекс 2` (`currencyCode`(100))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Дамп данных таблицы github-next-js.price_currency_code: ~3 rows (приблизительно)
INSERT IGNORE INTO `price_currency_code` (`currencyCodeId`, `currencyCode`, `symbolCode`) VALUES
	(1, 'RUB', NULL),
	(2, 'USD', NULL),
	(3, 'EUR', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
