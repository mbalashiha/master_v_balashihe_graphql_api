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

-- Дамп структуры для таблица github-next-js.checkout
CREATE TABLE IF NOT EXISTS `checkout` (
  `checkoutId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `checkoutName` tinytext DEFAULT NULL,
  `webUrl` text DEFAULT NULL,
  `taxesIncluded` tinyint(1) unsigned DEFAULT NULL,
  `completedAt` timestamp NULL DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`checkoutId`),
  UNIQUE KEY `Индекс 2` (`checkoutName`(100))
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;

-- Дамп данных таблицы github-next-js.checkout: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `checkout` DISABLE KEYS */;
INSERT IGNORE INTO `checkout` (`checkoutId`, `checkoutName`, `webUrl`, `taxesIncluded`, `completedAt`, `createdAt`, `updatedAt`) VALUES
	(25, NULL, NULL, NULL, NULL, '2022-04-08 20:58:44', '2022-04-08 20:58:44'),
	(26, NULL, NULL, NULL, NULL, '2022-04-08 20:59:13', '2022-04-08 20:59:13'),
	(27, NULL, NULL, NULL, NULL, '2022-04-08 21:04:17', '2022-04-08 21:04:17'),
	(28, NULL, NULL, NULL, NULL, '2022-04-08 21:09:39', '2022-04-08 21:09:39'),
	(29, NULL, NULL, NULL, NULL, '2022-04-08 21:10:31', '2022-04-08 21:10:31');
/*!40000 ALTER TABLE `checkout` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
