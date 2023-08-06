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

-- Дамп структуры для таблица master_v_balashihe.failed_contact_emails
CREATE TABLE IF NOT EXISTS `failed_contact_emails` (
  `timestamp` timestamp NOT NULL,
  `ip` varbinary(16) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `counts` tinyint(3) unsigned DEFAULT NULL,
  `textBody` text DEFAULT NULL,
  `error` text DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`ip`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Дамп данных таблицы master_v_balashihe.failed_contact_emails: ~0 rows (приблизительно)
INSERT IGNORE INTO `failed_contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `textBody`, `error`) VALUES
	('2023-07-31 00:52:05', _binary 0x7f000001, '2023-07-31 00:52:05', NULL, '31.07.2023, 03:52:05  \r\n  \r\nИмя клиента:   \r\nТелефон: +7(343)221-43-42  \r\n', 'Mail command failed: 550 not local sender over smtp');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
