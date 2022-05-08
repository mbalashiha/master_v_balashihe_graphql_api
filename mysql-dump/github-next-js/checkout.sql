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
  `checkoutId` binary(16) NOT NULL DEFAULT unhex(replace(uuid(),'-','')),
  `checkoutName` tinytext DEFAULT NULL,
  `taxesIncluded` tinyint(1) unsigned DEFAULT NULL,
  `completedAt` timestamp NULL DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`checkoutId`),
  UNIQUE KEY `Индекс 2` (`checkoutName`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Дамп данных таблицы github-next-js.checkout: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `checkout` DISABLE KEYS */;
INSERT IGNORE INTO `checkout` (`checkoutId`, `checkoutName`, `taxesIncluded`, `completedAt`, `createdAt`, `updatedAt`) VALUES
	(_binary 0x44AD91D4CA4611ECB72102004C4F4F50, NULL, NULL, NULL, '2022-05-02 21:32:52', '2022-05-02 21:32:52');
/*!40000 ALTER TABLE `checkout` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
