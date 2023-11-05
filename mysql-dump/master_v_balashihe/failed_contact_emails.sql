-- --------------------------------------------------------
-- Хост:                         192.168.0.50
-- Версия сервера:               11.0.3-MariaDB-1:11.0.3+maria~ubu2204 - mariadb.org binary distribution
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

-- Дамп данных таблицы master_v_balashihe.failed_contact_emails: ~13 rows (приблизительно)
INSERT IGNORE INTO `failed_contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `textBody`, `error`) VALUES
	('2023-07-31 00:52:05', _binary 0x7f000001, '2023-07-31 00:52:05', NULL, '31.07.2023, 03:52:05  \r\n  \r\nИмя клиента:   \r\nТелефон: +7(343)221-43-42  \r\n', 'Mail command failed: 550 not local sender over smtp');
INSERT IGNORE INTO `failed_contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `textBody`, `error`) VALUES
	('2023-09-10 21:25:25', _binary 0x00000000000000000000000000000001, '2023-09-10 21:25:25', NULL, '', 'already has valuesText row');
INSERT IGNORE INTO `failed_contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `textBody`, `error`) VALUES
	('2023-09-10 21:28:38', _binary 0x00000000000000000000000000000001, '2023-09-10 21:28:38', NULL, '', 'already has valuesText row');
INSERT IGNORE INTO `failed_contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `textBody`, `error`) VALUES
	('2023-09-10 21:30:20', _binary 0x00000000000000000000000000000001, '2023-09-10 21:30:21', NULL, '', 'already has valuesText row');
INSERT IGNORE INTO `failed_contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `textBody`, `error`) VALUES
	('2023-09-12 14:23:04', _binary 0x7f000001, '2023-09-12 14:23:04', NULL, '', 'No correct ip and timestamp or form values');
INSERT IGNORE INTO `failed_contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `textBody`, `error`) VALUES
	('2023-09-12 22:45:14', _binary 0x7f000001, '2023-09-12 22:45:16', NULL, '', 'Error: read ECONNRESET\n    at TCP.onStreamRead (node:internal/stream_base_commons:217:20)\n    at TCP.callbackTrampoline (node:internal/async_hooks:130:17)\n    --------------------\n    at Protocol._enqueue (/home/yoo/cms/master_v_balashihe_graphql_api/node_modules/.pnpm/mysql@2.18.1/node_modules/mysql/lib/protocol/Protocol.js:144:48)\n    at Connection.query (/home/yoo/cms/master_v_balashihe_graphql_api/node_modules/.pnpm/mysql@2.18.1/node_modules/mysql/lib/Connection.js:198:25)\n    at /home/yoo/cms/master_v_balashihe_graphql_api/node_modules/.pnpm/serverless-mysql@1.5.4/node_modules/serverless-mysql/index.js:189:16\n    at new Promise (<anonymous>)\n    at Object.query (/home/yoo/cms/master_v_balashihe_graphql_api/node_modules/.pnpm/serverless-mysql@1.5.4/node_modules/serverless-mysql/index.js:185:12)\n    at process.processTicksAndRejections (node:internal/process/task_queues:95:5)');
INSERT IGNORE INTO `failed_contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `textBody`, `error`) VALUES
	('2023-09-16 20:41:28', _binary 0x7f000001, '2023-09-16 20:41:29', NULL, '', 'Error: read ECONNRESET\n    at TCP.onStreamRead (node:internal/stream_base_commons:217:20)\n    --------------------\n    at Protocol._enqueue (/home/yoo/cms/master_v_balashihe_graphql_api/node_modules/.pnpm/mysql@2.18.1/node_modules/mysql/lib/protocol/Protocol.js:144:48)\n    at Connection.query (/home/yoo/cms/master_v_balashihe_graphql_api/node_modules/.pnpm/mysql@2.18.1/node_modules/mysql/lib/Connection.js:198:25)\n    at /home/yoo/cms/master_v_balashihe_graphql_api/node_modules/.pnpm/serverless-mysql@1.5.4/node_modules/serverless-mysql/index.js:189:16\n    at new Promise (<anonymous>)\n    at Object.query (/home/yoo/cms/master_v_balashihe_graphql_api/node_modules/.pnpm/serverless-mysql@1.5.4/node_modules/serverless-mysql/index.js:185:12)\n    at process.processTicksAndRejections (node:internal/process/task_queues:95:5)');
INSERT IGNORE INTO `failed_contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `textBody`, `error`) VALUES
	('2023-10-22 19:18:45', _binary 0x7f000001, '2023-10-22 19:18:45', NULL, '', 'already has valuesText row');
INSERT IGNORE INTO `failed_contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `textBody`, `error`) VALUES
	('2023-10-22 19:18:53', _binary 0x7f000001, '2023-10-22 19:18:53', NULL, '', 'already has valuesText row');
INSERT IGNORE INTO `failed_contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `textBody`, `error`) VALUES
	('2023-10-22 19:18:56', _binary 0x7f000001, '2023-10-22 19:18:56', NULL, '', 'already has valuesText row');
INSERT IGNORE INTO `failed_contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `textBody`, `error`) VALUES
	('2023-10-22 19:18:57', _binary 0x7f000001, '2023-10-22 19:18:57', NULL, '', 'already has valuesText row');
INSERT IGNORE INTO `failed_contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `textBody`, `error`) VALUES
	('2023-10-22 19:18:58', _binary 0x7f000001, '2023-10-22 19:18:58', NULL, '', 'already has valuesText row');
INSERT IGNORE INTO `failed_contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `textBody`, `error`) VALUES
	('2023-10-22 19:19:00', _binary 0x7f000001, '2023-10-22 19:19:00', NULL, '', 'already has valuesText row');
INSERT IGNORE INTO `failed_contact_emails` (`timestamp`, `ip`, `createdAt`, `counts`, `textBody`, `error`) VALUES
	('2023-10-22 19:45:24', _binary 0x7f000001, '2023-10-22 19:45:24', NULL, '', 'already has valuesText row');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
