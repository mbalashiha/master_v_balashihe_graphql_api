-- --------------------------------------------------------
-- Хост:                         192.168.0.50
-- Версия сервера:               11.0.2-MariaDB-1:11.0.2+maria~ubu2204 - mariadb.org binary distribution
-- Операционная система:         debian-linux-gnu
-- HeidiSQL Версия:              12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Дамп структуры для таблица master_v_balashihe.contact_emails
CREATE TABLE IF NOT EXISTS `contact_emails` (
  `timestamp` timestamp NOT NULL,
  `ip` tinytext CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `counts` tinyint(3) unsigned DEFAULT NULL,
  `valuesText` text NOT NULL,
  `textBody` text DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`ip`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Дамп данных таблицы master_v_balashihe.contact_emails: ~7 rows (приблизительно)
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-22 21:14:57', '127.0.0.1', '2023-07-22 21:14:57', NULL, '', NULL);
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-22 21:16:14', '127.0.0.1', '2023-07-22 21:16:14', 2, '', NULL);
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-22 22:12:22', '127.0.0.1', '2023-07-22 22:12:22', NULL, '', NULL);
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-22 22:35:42', '127.0.0.1', '2023-07-22 22:35:49', 2, 'jk;', NULL);
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-22 22:38:51', '127.0.0.1', '2023-07-22 22:38:51', 2, 'jki;', NULL);
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-22 22:39:32', '127.0.0.1', '2023-07-22 22:39:31', 2, 'jkilll;', NULL);
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-22 22:42:06', '127.0.0.1', '2023-07-22 22:42:06', 4, 'jkilll;+7(324)324-__-__', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
