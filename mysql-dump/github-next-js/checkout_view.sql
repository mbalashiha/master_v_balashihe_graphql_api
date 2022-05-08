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

-- Дамп структуры для представление github-next-js.checkout_view
-- Удаление временной таблицы и создание окончательной структуры представления
DROP TABLE IF EXISTS `checkout_view`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `checkout_view` AS select lcase(hex(`c`.`checkoutId`)) AS `webUrl`,`c`.`checkoutName` AS `checkoutName`,`c`.`taxesIncluded` AS `taxesIncluded`,`c`.`completedAt` AS `completedAt`,`c`.`createdAt` AS `createdAt`,`c`.`updatedAt` AS `updatedAt` from `checkout` `c`;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
