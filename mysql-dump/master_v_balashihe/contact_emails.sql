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
  `ip` varbinary(16) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `counts` tinyint(3) unsigned DEFAULT NULL,
  `valuesText` text NOT NULL,
  `textBody` text DEFAULT NULL,
  `response` text DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Дамп данных таблицы master_v_balashihe.contact_emails: ~4 rows (приблизительно)
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`, `response`) VALUES
	('2023-07-30 22:34:32', _binary 0xc0a80005, '2023-07-30 22:34:32', NULL, ';+7(234)324-32-43', NULL, '250 OK id=1qQEzg-00EQSG-05');
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`, `response`) VALUES
	('2023-07-30 23:18:46', _binary 0xc0a80005, '2023-07-30 23:18:46', NULL, ';+7(324)324-32-43', NULL, '250 OK id=1qQFgT-002ueX-2m');
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`, `response`) VALUES
	('2023-07-31 00:16:24', _binary 0xc0a80005, '2023-07-31 00:16:24', NULL, ';+7(234)324-23-43', NULL, '250 OK id=1qQGaF-00BALx-Vb');
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`, `response`) VALUES
	('2023-07-31 00:29:16', _binary 0xc0a80005, '2023-07-31 00:29:16', NULL, ';+7(879)879-87-98', NULL, '250 OK id=1qQGmi-00E0pM-AN');
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`, `response`) VALUES
	('2023-07-31 00:33:19', _binary 0xc0a80005, '2023-07-31 00:33:19', NULL, ';Другая техника;+7(343)412-43-12;Другое', NULL, '250 OK id=1qQGqc-00FpcQ-Uz');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
