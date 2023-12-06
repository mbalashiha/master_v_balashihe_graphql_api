-- --------------------------------------------------------
-- Хост:                         192.168.0.50
-- Версия сервера:               11.0.3-MariaDB-1:11.0.3+maria~ubu2204 - mariadb.org binary distribution
-- Операционная система:         debian-linux-gnu
-- HeidiSQL Версия:              12.6.0.6765
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

-- Дамп данных таблицы master_v_balashihe.contact_emails: ~32 rows (приблизительно)
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
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`, `response`) VALUES
	('2023-08-09 17:26:36', _binary 0xc6104e2d, '2023-08-09 17:26:36', NULL, ';Можно вечером;Другая техника;Нет, это впервые;+7(798)798-78-97;Настроить Интернет или WI-FI', NULL, '250 OK id=1qTmxA-0054Ea-1j');
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`, `response`) VALUES
	('2023-09-06 20:16:12', _binary 0x00000000000000000000000000000001, '2023-09-06 20:16:15', NULL, ';dsfdsf;+7 (234) 324-32-43', NULL, '250 OK id=1qdywg-001eHD-2B');
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`, `response`) VALUES
	('2023-09-10 20:58:20', _binary 0x00000000000000000000000000000001, '2023-09-10 20:58:22', NULL, 'ыфвавы;;+7 (565) 656-65-65', NULL, '250 OK id=1qfRVd-000g1Z-2W');
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`, `response`) VALUES
	('2023-09-10 21:02:32', _binary 0x00000000000000000000000000000001, '2023-09-10 21:02:33', NULL, 'fsdfdsfd;;+7 (333) 333-33-33', NULL, '250 OK id=1qfRZg-002CqD-2b');
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`, `response`) VALUES
	('2023-09-10 21:11:24', _binary 0x00000000000000000000000000000001, '2023-09-10 21:11:26', NULL, '32432;\n\n;+7 (324) 324-32-43', NULL, '250 OK id=1qfRiI-00FLJo-0B');
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`, `response`) VALUES
	('2023-09-10 21:11:47', _binary 0x00000000000000000000000000000001, '2023-09-10 21:11:47', NULL, '32432;\n\n\n\n;+7 (324) 324-32-43', NULL, '250 OK id=1qfRid-004Epr-0n');
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`, `response`) VALUES
	('2023-09-10 21:25:20', _binary 0x00000000000000000000000000000001, '2023-09-10 21:25:22', NULL, '32432;;+7 (324) 324-32-43', NULL, '250 OK id=1qfRvl-002P0M-2Y');
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`, `response`) VALUES
	('2023-09-10 22:49:04', _binary 0x00000000000000000000000000000001, '2023-09-10 22:49:05', NULL, 'sdfsfaf;dfsdafas;+7 (324) 324-32-43', NULL, '250 OK id=1qfTEn-0058uZ-1f');
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`, `response`) VALUES
	('2023-09-12 12:20:12', _binary 0x00000000000000000000000000000001, '2023-09-12 12:20:13', NULL, '324324324;23432144321432;+7 (234) 324-32-43', NULL, '250 OK id=1qg2NI-00AXul-2G');
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`, `response`) VALUES
	('2023-09-12 12:26:37', _binary 0x00000000000000000000000000000001, '2023-09-12 12:26:40', NULL, 'eqwe322213213213213;123213213;+7 (213) 213-12-32', NULL, '250 OK id=1qg2TX-001jOp-2S');
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`, `response`) VALUES
	('2023-09-12 13:04:27', _binary 0x00000000000000000000000000000001, '2023-09-12 13:04:29', NULL, 'sadsad;;+7 (222) 222-22-22', NULL, '250 OK id=1qg349-00FpiD-1c');
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`, `response`) VALUES
	('2023-09-12 13:06:23', _binary 0x00000000000000000000000000000001, '2023-09-12 13:06:25', NULL, '213213213;;+7 (213) 231-23-13', NULL, '250 OK id=1qg361-007N1d-03');
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`, `response`) VALUES
	('2023-09-12 13:09:41', _binary 0x00000000000000000000000000000001, '2023-09-12 13:09:44', NULL, '32432423423;234;+7 (234) 324-32-42', NULL, '250 OK id=1qg39D-0077hU-2l');
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`, `response`) VALUES
	('2023-09-12 13:16:02', _binary 0x7f000001, '2023-09-12 13:16:04', NULL, '3333333333;3;+7 (333) 333-33-33', NULL, '250 OK id=1qg3FL-000XGD-19');
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`, `response`) VALUES
	('2023-09-12 13:46:25', _binary 0x7f000001, '2023-09-12 13:46:27', NULL, '33333333333333333;Не важно, можно не сегодня;Другая техника;Нет, это впервые;+7(333)333-33-33;Всё работает, но надо что-то установить или настроить', NULL, '250 OK id=1qg3ik-000P9M-2F');
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`, `response`) VALUES
	('2023-09-12 14:19:25', _binary 0x7f000001, '2023-09-12 14:19:28', NULL, '34324@342.ru;erewr;werew;+7 (___) ___-__-__', NULL, '250 OK id=1qg4Eh-00AfRM-2u');
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`, `response`) VALUES
	('2023-09-12 14:25:57', _binary 0x7f000001, '2023-09-12 14:25:59', NULL, '23432@erw.r;32432;234;', NULL, '250 OK id=1qg4L0-00CNpD-2v');
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`, `response`) VALUES
	('2023-09-12 14:35:20', _binary 0x7f000001, '2023-09-12 14:35:21', NULL, '43543@dfdsfd.ru;234324;23432141', NULL, '250 OK id=1qg4U5-00FFcU-0T');
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`, `response`) VALUES
	('2023-09-12 14:35:55', _binary 0x7f000001, '2023-09-12 14:35:56', NULL, ';234324;234324324;+7 (241) 231-43-23', NULL, '250 OK id=1qg4Ue-002MwO-0J');
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`, `response`) VALUES
	('2023-09-12 14:45:19', _binary 0x7f000001, '2023-09-12 14:45:22', NULL, '324324@dafdsfa.ru;345;345;+7 (5__) ___-__-__', NULL, '250 OK id=1qg4dm-008pl8-0P');
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`, `response`) VALUES
	('2023-09-12 14:51:20', _binary 0x7f000001, '2023-09-12 14:51:22', NULL, 'sfsd@daf.47;234;32423', NULL, '250 OK id=1qg4jZ-008v2m-2l');
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`, `response`) VALUES
	('2023-09-12 16:11:26', _binary 0x7f000001, '2023-09-12 16:11:27', NULL, '432@dfaa.ru;213434324321;234324', NULL, '250 OK id=1qg5z5-000HW7-09');
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`, `response`) VALUES
	('2023-09-12 16:15:18', _binary 0x7f000001, '2023-09-12 16:15:20', NULL, '4@dfa.ru;32423432;323423', NULL, '250 OK id=1qg62q-007Odf-0b');
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`, `response`) VALUES
	('2023-09-12 17:04:41', _binary 0x7f000001, '2023-09-12 17:04:43', NULL, 'dfsdf@ddd.ru;3333333333;134324234;+7 (333) 333-33-33', NULL, '250 OK id=1qg6oc-000txG-2o');
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`, `response`) VALUES
	('2023-09-12 19:48:07', _binary 0x7f000001, '2023-09-12 19:48:10', NULL, ';erewrew;afdsdfsd;+7 (123) 213-12-31', NULL, '250 OK id=1qg9Mo-00G1YK-01');
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`, `response`) VALUES
	('2023-09-12 22:45:42', _binary 0x7f000001, '2023-09-12 22:45:43', NULL, ';222222;22222;+7 (222) 222-23-33', NULL, '250 OK id=1qgC8d-00Du0r-1v');
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`, `response`) VALUES
	('2023-09-12 23:05:45', _binary 0x7f000001, '2023-09-12 23:05:49', NULL, ';23423;3243242;+7 (335) 555-55-55', NULL, '250 OK id=1qgCS4-00DulV-14');
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`, `response`) VALUES
	('2023-09-12 23:09:06', _binary 0x7f000001, '2023-09-12 23:09:07', NULL, ';43534543;666;+7 (555) 555-55-55', NULL, '250 OK id=1qgCVG-00E19J-3A');
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`, `response`) VALUES
	('2023-09-12 23:29:35', _binary 0x7f000001, '2023-09-12 23:29:37', NULL, 'dafs@dfsd.ru;ewrewewr;3432;+7 (435) 433-45-43', NULL, '250 OK id=1qgCp7-007fyq-0O');
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`, `response`) VALUES
	('2023-09-12 23:33:35', _binary 0x7f000001, '2023-09-12 23:33:38', NULL, '21312@dfds.ru;213213;3423432', NULL, '250 OK id=1qgCsz-00HItr-2e');
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`, `response`) VALUES
	('2023-09-16 16:12:19', _binary 0x7f000001, '2023-09-16 16:12:19', NULL, ';545;234;+7 (424) 243-42-34', NULL, '250 OK id=1qhXu7-002M8o-1e');
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`, `response`) VALUES
	('2023-09-16 17:51:10', _binary 0x7f000001, '2023-09-16 17:51:10', NULL, ';4324324;234324324324;+7 (324) 324-32-43', NULL, '250 OK id=1qhZRm-005E6z-03');
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`, `response`) VALUES
	('2023-09-16 20:41:38', _binary 0x7f000001, '2023-09-16 20:41:38', NULL, '32432432;+7(324)324-23-42', NULL, '250 OK id=1qhc6k-00DDNJ-0k');
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`, `response`) VALUES
	('2023-10-22 19:18:40', _binary 0x7f000001, '2023-10-22 19:18:42', NULL, ';234324;234324324324;+7 (234) 324-32-43', NULL, '250 OK id=1qudyE-00EYOm-0q');
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`, `response`) VALUES
	('2023-10-22 19:37:11', _binary 0x7f000001, '2023-10-22 19:37:12', NULL, ';324324324;234324324;+7 (234) 324-32-43', NULL, '250 OK id=1queG8-00HF2d-0U');
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`, `response`) VALUES
	('2023-10-22 19:45:10', _binary 0x7f000001, '2023-10-22 19:45:13', NULL, '32432423432432432;Не важно, можно не сегодня;Другая техника;Нет, это впервые;+7 (234) 324-32-43;Настроить Интернет или WI-FI;Настроить или проконсультироваться', NULL, '250 OK id=1queNs-00B59m-2n');
INSERT IGNORE INTO `contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `valuesText`, `textBody`, `response`) VALUES
	('2023-10-22 20:05:46', _binary 0x7f000001, '2023-10-22 20:05:47', NULL, '234324324;Можно вечером;Настольный ПК;Нет, это впервые;+7 (234) 324-32-43;Всё хорошо, но надо что-то установить или настроить;Исправить ошибки или глюки', NULL, '250 OK id=1quehn-006Wmn-14');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
