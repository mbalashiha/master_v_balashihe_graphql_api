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

-- Дамп данных таблицы master_v_balashihe.contact_emails: ~31 rows (приблизительно)
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
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-24 13:33:22', '127.0.0.1', '2023-07-24 13:33:23', 4, ';Другая техника;;Настроить Интернет или WI-FI', NULL);
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-24 13:34:08', '127.0.0.1', '2023-07-24 13:34:09', NULL, '4;Другая техника;;Настроить Интернет или WI-FI', NULL);
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-24 13:36:20', '127.0.0.1', '2023-07-24 13:36:21', 3, '4i;Другая техника;;Настроить Интернет или WI-FI', NULL);
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-24 13:59:26', '127.0.0.1', '2023-07-24 13:59:27', 2, '32423;', NULL);
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-24 14:23:08', '127.0.0.1', '2023-07-24 14:23:09', 2, 'd;', NULL);
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-24 14:31:22', '127.0.0.1', '2023-07-24 14:31:23', 2, ';8;Другая техника;;Настроить Интернет или WI-FI', NULL);
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-24 14:33:10', '127.0.0.1', '2023-07-24 14:33:11', NULL, ';87;Другая техника;;Настроить Интернет или WI-FI', NULL);
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-24 14:42:12', '127.0.0.1', '2023-07-24 14:42:13', 2, ';873432;Другая техника;;Настроить Интернет или WI-FI', NULL);
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-24 15:01:16', '127.0.0.1', '2023-07-24 15:01:16', 2, ';873432j;Другая техника;;Настроить Интернет или WI-FI', NULL);
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-24 15:03:35', '127.0.0.1', '2023-07-24 15:03:35', 2, ';873432jl;Другая техника;;Настроить Интернет или WI-FI', NULL);
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-24 15:05:57', '127.0.0.1', '2023-07-24 15:05:58', NULL, ';873432jl;;;Другая техника;;Настроить Интернет или WI-FI', NULL);
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-24 15:18:52', '127.0.0.1', '2023-07-24 15:18:52', NULL, ';8734;Другая техника;;Настроить Интернет или WI-FI', NULL);
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-24 15:20:17', '127.0.0.1', '2023-07-24 15:20:17', NULL, ';87340;Другая техника;;Настроить Интернет или WI-FI', NULL);
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-24 15:24:13', '127.0.0.1', '2023-07-24 15:24:14', 3, ';873409;Другая техника;;Настроить Интернет или WI-FI', NULL);
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-24 16:35:26', '127.0.0.1', '2023-07-24 16:35:26', NULL, '72343243243;;+7(234)324-32-43', NULL);
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-24 16:39:54', '127.0.0.1', '2023-07-24 16:39:55', 2, ';+7(234)324-32-43', NULL);
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-24 16:40:00', '127.0.0.1', '2023-07-24 16:40:00', 33, ';;+7(234)324-32-43', NULL);
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-24 16:46:03', '127.0.0.1', '2023-07-24 16:46:04', NULL, 'Дубликат сообщения;;+7(234)324-32-43', NULL);
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-24 16:47:23', '127.0.0.1', '2023-07-24 16:47:24', NULL, '4;+7(344)444-44-44', NULL);
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-24 16:48:32', '127.0.0.1', '2023-07-24 16:48:32', 2, '324;+7(333)333-33-33', NULL);
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-24 16:49:55', '127.0.0.1', '2023-07-24 16:49:56', NULL, 'Дубликат сообщения;324;+7(333)333-33-33', NULL);
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-24 16:58:25', '127.0.0.1', '2023-07-24 16:58:26', NULL, ';+7(444)444-44-44', NULL);
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-24 17:02:41', '127.0.0.1', '2023-07-24 17:02:42', 3, 'timeout 2000ms exited.;;+7(444)444-44-44', NULL);
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-24 17:02:47', '127.0.0.1', '2023-07-24 17:02:47', NULL, 'Дубликат сообщения;;+7(444)444-44-44', NULL);
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-24 17:16:12', '127.0.0.1', '2023-07-24 17:16:13', NULL, 'Дубликат сообщения;34223432;+7(444)444-44-44', NULL);
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-24 17:16:16', '127.0.0.1', '2023-07-24 17:16:17', NULL, ';34223432;+7(444)444-44-44', NULL);
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-24 17:17:18', '127.0.0.1', '2023-07-24 17:17:19', NULL, '222222222222;+7(222)222-22-22', NULL);
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-24 17:17:22', '127.0.0.1', '2023-07-24 17:17:23', NULL, 'Дубликат сообщения;222222222222;+7(222)222-22-22', NULL);
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-24 17:17:34', '127.0.0.1', '2023-07-24 17:17:35', NULL, ';222222222222;+7(222)222-22-22', NULL);
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-24 17:19:29', '127.0.0.1', '2023-07-24 17:19:30', NULL, 'e33333;+7(222)222-22-22', NULL);
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-24 17:26:22', '127.0.0.1', '2023-07-24 17:26:24', NULL, ';+7(888)888-88-88', NULL);
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-24 17:27:29', '127.0.0.1', '2023-07-24 17:27:30', NULL, 'i;+7(888)888-88-88', NULL);
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-24 17:31:41', '127.0.0.1', '2023-07-24 17:31:42', NULL, 'i999;+7(888)888-88-88', NULL);
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-24 17:32:57', '127.0.0.1', '2023-07-24 17:32:59', NULL, ';+7(000)000-00-00', NULL);
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-24 17:50:02', '127.0.0.1', '2023-07-24 17:50:03', NULL, ';+7(333)333-33-33', NULL);
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`) VALUES
	('2023-07-24 20:44:44', '127.0.0.1', '2023-07-24 20:44:45', NULL, ';В ближайшие 1-2 часа;Другая техника;Да, уже ремонтировали;+7(444)444-44-44;Настроить Интернет или WI-FI', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
