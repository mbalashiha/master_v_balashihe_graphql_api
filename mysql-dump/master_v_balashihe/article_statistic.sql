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

-- Дамп структуры для таблица master_v_balashihe.article_statistic
CREATE TABLE IF NOT EXISTS `article_statistic` (
  `timestamp` timestamp NOT NULL,
  `ip` varbinary(16) NOT NULL,
  `articleId` int(10) unsigned NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `duplicate` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`timestamp`,`ip`),
  KEY `FK_article_statistic_blog_article` (`articleId`),
  CONSTRAINT `FK_article_statistic_blog_article` FOREIGN KEY (`articleId`) REFERENCES `blog_article` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Дамп данных таблицы master_v_balashihe.article_statistic: ~560 rows (приблизительно)
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-09 17:25:28', _binary 0xc6104e2d, 77, '2023-08-09 17:25:27', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-09 17:27:02', _binary 0xc6104e2d, 77, '2023-08-09 17:27:02', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-09 17:27:14', _binary 0xc6104e2d, 77, '2023-08-09 17:27:14', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-09 17:27:21', _binary 0xc6104e2d, 77, '2023-08-09 17:27:20', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-09 17:27:23', _binary 0xc6104e2d, 77, '2023-08-09 17:27:23', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-09 17:27:26', _binary 0xc6104e2d, 77, '2023-08-09 17:27:26', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-09 17:27:53', _binary 0xc6104e2d, 77, '2023-08-09 17:27:53', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-09 20:25:27', _binary 0x05fffd49, 78, '2023-08-09 20:25:36', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-09 20:58:03', _binary 0xd5b4cb91, 76, '2023-08-09 20:58:04', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-09 21:08:52', _binary 0xd5b4cb7c, 76, '2023-08-09 21:09:00', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-09 22:13:58', _binary 0x05fffd41, 77, '2023-08-09 22:14:00', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-09 22:27:08', _binary 0xd5b4cb21, 77, '2023-08-09 22:27:12', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-09 22:34:53', _binary 0x05ffe7a9, 77, '2023-08-09 22:35:08', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-09 23:41:51', _binary 0xd5b4cb81, 77, '2023-08-09 23:42:03', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-09 23:54:43', _binary 0xd5b4cb8a, 77, '2023-08-09 23:54:44', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-10 00:16:53', _binary 0x05ffe7bb, 77, '2023-08-10 00:17:01', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-10 00:27:14', _binary 0xd5b4cbd6, 78, '2023-08-10 00:27:15', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-10 00:42:10', _binary 0xd5b4cb7c, 76, '2023-08-10 00:42:10', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-10 00:51:54', _binary 0xd5b4cb06, 76, '2023-08-10 00:51:54', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-10 02:02:50', _binary 0x2ceccff8, 77, '2023-08-10 02:02:50', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-10 07:30:52', _binary 0x05ffe741, 76, '2023-08-10 07:30:53', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-10 07:39:47', _binary 0x05ffe756, 76, '2023-08-10 07:39:47', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-10 08:31:11', _binary 0x36d4f173, 77, '2023-08-10 08:31:11', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-10 10:42:13', _binary 0x55af3962, 77, '2023-08-10 10:42:12', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-10 10:42:32', _binary 0xd5b4cbd6, 77, '2023-08-10 10:42:32', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-10 13:03:46', _binary 0x36bf33f9, 77, '2023-08-10 13:03:46', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-10 13:05:36', _binary 0x23500ba7, 77, '2023-08-10 13:05:36', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-10 16:14:49', _binary 0xd5b4cb8a, 77, '2023-08-10 16:14:50', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-10 17:16:03', _binary 0x67489299, 77, '2023-08-10 17:16:03', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-10 21:25:59', _binary 0x05ffe799, 77, '2023-08-10 21:26:04', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-10 21:42:26', _binary 0x5f6cd581, 77, '2023-08-10 21:42:27', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-10 21:42:38', _binary 0xd5b4cb1e, 77, '2023-08-10 21:42:50', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-10 21:53:10', _binary 0x05ffe711, 77, '2023-08-10 21:53:11', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-11 00:51:01', _binary 0x05ffe711, 77, '2023-08-11 00:51:01', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-11 04:35:04', _binary 0x05ffe735, 77, '2023-08-11 04:35:05', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-11 04:50:19', _binary 0x5f6cd557, 80, '2023-08-11 04:50:20', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-11 04:50:20', _binary 0x57fae0ec, 78, '2023-08-11 04:50:20', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-11 04:50:22', _binary 0x5f6cd5ce, 71, '2023-08-11 04:50:24', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-11 04:51:18', _binary 0x052dcfaf, 70, '2023-08-11 04:51:18', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-11 04:54:12', _binary 0xd5b4cbf8, 76, '2023-08-11 04:54:20', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-11 05:03:38', _binary 0x05ffe7c1, 80, '2023-08-11 05:04:18', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-11 05:04:45', _binary 0x5f6cd5af, 78, '2023-08-11 05:04:45', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-11 05:05:15', _binary 0x5f6cd5ce, 70, '2023-08-11 05:05:19', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-11 05:08:23', _binary 0x052dcfaf, 80, '2023-08-11 05:08:23', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-11 05:31:35', _binary 0xd5b4cb37, 77, '2023-08-11 05:31:35', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-11 05:31:54', _binary 0x05ffe79f, 77, '2023-08-11 05:31:57', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-11 06:48:59', _binary 0xb2429e5e, 77, '2023-08-11 06:48:58', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-11 07:08:10', _binary 0x55c0bcd9, 77, '2023-08-11 07:08:08', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-11 07:42:37', _binary 0x538bb305, 77, '2023-08-11 07:39:46', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-11 08:04:05', _binary 0x235b2ba4, 77, '2023-08-11 08:04:05', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-11 08:06:28', _binary 0x235bb8b1, 77, '2023-08-11 08:06:28', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-11 08:13:17', _binary 0xd5b4cb8d, 77, '2023-08-11 08:13:18', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-11 09:14:13', _binary 0x5eb4b0d7, 77, '2023-08-11 09:14:14', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-11 09:14:22', _binary 0x5eb4b0d7, 76, '2023-08-11 09:14:23', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-11 09:20:59', _binary 0x5f6cd5ed, 76, '2023-08-11 09:21:13', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-11 11:42:19', _binary 0xb921a15e, 77, '2023-08-11 11:42:19', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-11 14:09:12', _binary 0x23581b7b, 77, '2023-08-11 14:09:12', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-11 14:49:19', _binary 0x342426ea, 77, '2023-08-11 14:49:19', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-11 15:26:06', _binary 0x67489299, 77, '2023-08-11 15:26:06', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-11 16:43:32', _binary 0xb922f0ab, 77, '2023-08-11 16:43:28', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-11 16:49:11', _binary 0x284dbea9, 77, '2023-08-11 16:49:12', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-11 17:04:53', _binary 0xb922f0ab, 77, '2023-08-11 17:04:48', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-12 11:24:00', _binary 0x5f6cd5cb, 76, '2023-08-12 11:24:00', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-12 11:36:25', _binary 0x5f6cd5d2, 76, '2023-08-12 11:37:04', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-12 11:42:44', _binary 0x5f6cd5ee, 76, '2023-08-12 11:42:49', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-12 12:43:53', _binary 0xd5b4cb28, 76, '2023-08-12 12:44:01', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-12 12:51:27', _binary 0xd5b4cb7d, 76, '2023-08-12 12:51:28', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-12 12:57:51', _binary 0x05ffe713, 76, '2023-08-12 12:57:57', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-12 13:36:26', _binary 0x5f6cd5d2, 76, '2023-08-12 13:36:40', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-12 13:44:10', _binary 0x3ed44010, 77, '2023-08-12 13:44:09', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-12 21:23:16', _binary 0xd5b4cbe7, 77, '2023-08-12 21:23:16', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-13 10:47:18', _binary 0xd5b4cb34, 77, '2023-08-13 10:47:24', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-13 10:54:37', _binary 0x5f6cd5c0, 77, '2023-08-13 10:54:42', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-13 20:24:18', _binary 0x5f6cd5ad, 77, '2023-08-13 20:24:53', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-13 20:33:19', _binary 0xd5b4cbc7, 77, '2023-08-13 20:33:31', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-13 20:46:28', _binary 0x05fffd52, 77, '2023-08-13 20:46:45', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-13 21:02:54', _binary 0xd5b4cbcb, 77, '2023-08-13 21:03:01', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-13 21:15:50', _binary 0xd5b4cbd1, 77, '2023-08-13 21:15:59', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-13 22:40:07', _binary 0x5f6cd594, 77, '2023-08-13 22:40:31', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-14 19:48:38', _binary 0x5f6cd5ba, 77, '2023-08-14 19:48:45', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-14 20:01:12', _binary 0x05fffd53, 77, '2023-08-14 20:01:13', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-14 20:15:19', _binary 0xd5b4cbd0, 77, '2023-08-14 20:15:20', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-14 20:20:46', _binary 0x5f6cd5aa, 77, '2023-08-14 20:20:46', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-14 20:27:32', _binary 0x05ffe77f, 77, '2023-08-14 20:27:49', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-14 20:42:27', _binary 0x5f6cd5d0, 77, '2023-08-14 20:42:40', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-15 00:44:06', _binary 0x36cb49c6, 77, '2023-08-15 00:44:06', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-15 09:55:52', _binary 0xd5b4cb11, 77, '2023-08-15 09:55:52', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-15 10:22:15', _binary 0xbcaaacc4, 77, '2023-08-15 10:19:23', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-15 12:12:39', _binary 0x05ffe797, 77, '2023-08-15 12:12:42', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-15 12:21:14', _binary 0x5f6cd5f1, 77, '2023-08-15 12:21:20', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-15 12:30:41', _binary 0x052dcf4d, 77, '2023-08-15 12:30:42', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-16 10:36:17', _binary 0x6d6a8f43, 77, '2023-08-16 10:36:15', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-16 10:40:10', _binary 0x6d6a8f43, 77, '2023-08-16 10:40:08', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-16 11:53:07', _binary 0x3ecc2829, 77, '2023-08-16 11:53:07', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-16 13:08:14', _binary 0xd5b4cbc9, 77, '2023-08-16 13:08:21', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-16 13:08:22', _binary 0x05ffe7bb, 77, '2023-08-16 13:08:31', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-17 12:32:33', _binary 0x538bb305, 77, '2023-08-17 12:29:41', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-17 12:35:54', _binary 0x5f6cd586, 77, '2023-08-17 12:35:55', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-17 13:28:12', _binary 0x05ffe717, 77, '2023-08-17 13:28:13', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-17 13:51:46', _binary 0xd5b4cbbf, 77, '2023-08-17 13:51:55', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-18 14:03:31', _binary 0xb2b04b50, 77, '2023-08-18 14:03:32', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-18 15:03:32', _binary 0x22ded403, 77, '2023-08-18 15:03:32', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-19 08:25:55', _binary 0x57fae0cb, 77, '2023-08-19 08:25:56', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-19 08:58:04', _binary 0x05fffd4e, 77, '2023-08-19 08:58:08', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-19 09:00:23', _binary 0x05ffe7f6, 77, '2023-08-19 09:00:43', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-19 23:53:47', _binary 0xc2237505, 77, '2023-08-19 23:53:47', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-20 18:52:54', _binary 0x57fae0dd, 77, '2023-08-20 18:53:01', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-20 21:04:44', _binary 0x05ffe717, 77, '2023-08-20 21:04:49', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-21 15:24:29', _binary 0xd5b4cb39, 77, '2023-08-21 15:24:35', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-21 15:50:16', _binary 0xd5b4cb8c, 76, '2023-08-21 15:50:25', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-21 16:00:28', _binary 0x5f6cd5be, 76, '2023-08-21 16:00:43', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-21 17:37:56', _binary 0x57fae0f5, 77, '2023-08-21 17:37:59', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-21 17:53:16', _binary 0x05fffd46, 77, '2023-08-21 17:53:18', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-21 17:54:41', _binary 0xd5b4cb6a, 77, '2023-08-21 17:55:01', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-22 03:30:37', _binary 0x5f6cd57b, 77, '2023-08-22 03:30:37', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-22 03:40:04', _binary 0x05ffe78f, 77, '2023-08-22 03:40:07', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-22 15:22:15', _binary 0xd42e126e, 77, '2023-08-22 15:22:16', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-22 19:29:14', _binary 0x55adcd8e, 78, '2023-08-22 19:29:14', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-22 19:32:11', _binary 0xb93d4ebd, 77, '2023-08-22 19:32:14', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-24 08:55:02', _binary 0x6db831db, 78, '2023-08-24 08:55:02', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-24 18:36:30', _binary 0x57fae0ca, 77, '2023-08-24 18:36:33', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-26 03:17:33', _binary 0x4fad5a23, 77, '2023-08-26 03:17:32', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-26 03:23:38', _binary 0x5fa1efba, 78, '2023-08-26 03:23:38', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-27 14:08:12', _binary 0x341a7c98, 77, '2023-08-27 14:08:12', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-28 22:38:37', _binary 0x052dcfb8, 77, '2023-08-28 22:38:37', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-29 17:03:43', _binary 0x5f6cd5d2, 77, '2023-08-29 17:03:43', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-30 17:19:27', _binary 0x57fae0e3, 77, '2023-08-30 17:19:28', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-31 03:03:37', _binary 0x05ffe74e, 77, '2023-08-31 03:03:37', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-31 03:03:37', _binary 0x5f6cd55a, 77, '2023-08-31 03:03:37', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-31 15:39:51', _binary 0x5f6cd5cc, 77, '2023-08-31 15:39:51', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-02 03:13:38', _binary 0x2ceccff8, 77, '2023-09-02 03:13:38', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-02 03:58:34', _binary 0x36bde680, 77, '2023-09-02 03:58:34', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-02 14:12:02', _binary 0x05ffe79c, 77, '2023-09-02 14:12:30', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-03 07:47:08', _binary 0x05ffe76d, 77, '2023-09-03 07:47:11', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-03 09:20:31', _binary 0x5f6cd561, 77, '2023-09-03 09:20:34', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-03 21:19:33', _binary 0x5f6cd5b7, 71, '2023-09-03 21:19:37', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-04 08:48:21', _binary 0x5f6cd5c6, 77, '2023-09-04 08:48:24', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-04 22:53:09', _binary 0x1f0d7f75, 77, '2023-09-04 22:53:09', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-05 03:42:44', _binary 0x5f6cd5b9, 77, '2023-09-05 03:42:45', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-05 03:42:47', _binary 0x57fae049, 77, '2023-09-05 03:42:48', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-05 09:18:58', _binary 0xd5b4cb30, 78, '2023-09-05 09:18:58', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-05 09:27:36', _binary 0x05ffe799, 78, '2023-09-05 09:27:38', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-06 13:06:45', _binary 0x23581138, 77, '2023-09-06 13:06:45', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-06 16:07:39', _binary 0x5fa1eff7, 77, '2023-09-06 16:07:39', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-07 08:23:50', _binary 0x058ff29b, 77, '2023-09-07 08:23:50', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-07 08:23:55', _binary 0x058ff29b, 77, '2023-09-07 08:23:55', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-07 09:30:22', _binary 0x5853c8a6, 77, '2023-09-07 09:30:21', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-07 10:08:15', _binary 0x57fae01f, 77, '2023-09-07 10:08:15', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-07 10:41:29', _binary 0x05ffe775, 77, '2023-09-07 10:41:32', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-08 01:10:10', _binary 0x05e440be, 77, '2023-09-08 01:10:11', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-08 06:13:54', _binary 0x50523f39, 77, '2023-09-08 06:13:54', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-08 08:56:18', _binary 0x284dbcb3, 77, '2023-09-08 08:56:19', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-08 11:24:29', _binary 0x05ffe769, 77, '2023-09-08 11:24:30', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-08 11:24:29', _binary 0x57fae0e4, 77, '2023-09-08 11:30:18', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-08 11:41:01', _binary 0x5f6cd5e8, 77, '2023-09-08 11:41:05', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-08 19:38:03', _binary 0xd5b4cb3f, 77, '2023-09-08 19:38:05', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-09 07:00:26', _binary 0x5fa1dd63, 77, '2023-09-09 07:00:26', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-10 13:19:10', _binary 0xd5b4cbbe, 77, '2023-09-10 13:19:10', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-10 15:56:48', _binary 0xd5b4cbaf, 77, '2023-09-10 15:56:51', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-10 17:15:25', _binary 0xd5b4cba5, 77, '2023-09-10 17:15:30', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-10 21:26:43', _binary 0x5fa1dd0c, 77, '2023-09-10 21:26:39', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-11 05:50:38', _binary 0xd5b4cb46, 77, '2023-09-11 05:50:38', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-11 22:38:27', _binary 0x3ed25bca, 77, '2023-09-11 22:39:23', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-12 12:58:07', _binary 0x235d26e4, 77, '2023-09-12 12:58:07', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-12 16:40:43', _binary 0xd5b4cb57, 77, '2023-09-12 16:50:31', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-13 08:09:09', _binary 0xd5b4cb03, 77, '2023-09-13 08:09:09', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-14 02:56:01', _binary 0x5fa1dd5d, 77, '2023-09-14 02:56:01', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-15 03:23:49', _binary 0x5f6cd557, 77, '2023-09-15 03:23:50', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-15 13:16:37', _binary 0x05ffe76d, 77, '2023-09-15 13:16:37', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-15 21:27:12', _binary 0xd5b4cb31, 77, '2023-09-15 21:27:27', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-16 02:36:44', _binary 0x57fae0e1, 73, '2023-09-16 02:36:44', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-16 02:36:44', _binary 0xd5b4cb0a, 76, '2023-09-16 02:36:44', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-16 07:24:50', _binary 0xd5b4cb45, 80, '2023-09-16 07:24:54', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-16 07:35:36', _binary 0x5f6cd5d4, 80, '2023-09-16 07:35:52', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-16 07:40:04', _binary 0x05ffe7c1, 80, '2023-09-16 07:40:06', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-16 07:55:01', _binary 0x50506c24, 77, '2023-09-16 07:55:02', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-16 07:55:34', _binary 0x50506c24, 77, '2023-09-16 07:55:35', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-16 19:43:48', _binary 0x284dbed4, 77, '2023-09-16 19:43:48', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-16 23:22:32', _binary 0x24638881, 77, '2023-09-16 23:22:33', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-17 14:20:34', _binary 0x22fe357d, 77, '2023-09-17 14:20:34', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-17 14:20:51', _binary 0x22fe357d, 77, '2023-09-17 14:20:51', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-17 14:25:51', _binary 0x419ae2ab, 77, '2023-09-17 14:25:51', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-17 14:49:30', _binary 0x22fe357d, 77, '2023-09-17 14:49:31', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-17 14:49:49', _binary 0x22fe357d, 77, '2023-09-17 14:49:49', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-17 14:51:55', _binary 0x5f6cd5f9, 77, '2023-09-17 14:51:55', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-17 14:57:14', _binary 0x05ffe7ad, 77, '2023-09-17 14:57:15', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-17 14:57:48', _binary 0x05ffe77e, 78, '2023-09-17 14:57:48', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-17 14:57:49', _binary 0x05ffe788, 80, '2023-09-17 14:57:50', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-17 14:58:29', _binary 0x5f6cd5e9, 76, '2023-09-17 14:58:36', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-17 15:03:38', _binary 0x57fae02b, 76, '2023-09-17 15:03:38', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-17 15:06:15', _binary 0x5f6cd5cb, 78, '2023-09-17 15:06:16', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-17 15:08:14', _binary 0x419ae2aa, 77, '2023-09-17 15:08:14', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-17 15:08:32', _binary 0x36bce92d, 77, '2023-09-17 15:08:32', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-17 15:13:03', _binary 0x05ffe77e, 76, '2023-09-17 15:13:03', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-17 15:14:00', _binary 0x5f6cd584, 78, '2023-09-17 15:14:06', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-17 15:30:44', _binary 0x23586c1e, 77, '2023-09-17 15:30:44', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-17 15:30:56', _binary 0x22d5c95a, 77, '2023-09-17 15:30:57', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-17 15:40:35', _binary 0xd5b4cba9, 77, '2023-09-17 15:40:50', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-17 15:42:30', _binary 0x5f6cd55e, 76, '2023-09-17 15:42:34', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-17 16:47:18', _binary 0xcda92763, 77, '2023-09-17 16:47:19', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-17 16:51:30', _binary 0x50506c24, 77, '2023-09-17 16:51:40', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-17 16:52:04', _binary 0x50506c24, 77, '2023-09-17 16:52:13', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-17 17:02:55', _binary 0xcda92761, 77, '2023-09-17 17:02:55', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-17 17:08:45', _binary 0xcda92757, 77, '2023-09-17 17:08:45', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-17 19:32:53', _binary 0x57fae011, 77, '2023-09-17 19:33:03', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-18 08:37:15', _binary 0x9538a0b1, 77, '2023-09-18 08:37:15', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-18 09:36:35', _binary 0x90d987c7, 77, '2023-09-18 09:36:35', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-18 14:00:56', _binary 0x36f43fd9, 77, '2023-09-18 14:00:56', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-19 03:41:02', _binary 0x4f7e3edc, 77, '2023-09-19 03:41:02', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-19 15:24:06', _binary 0xd5b4cb90, 77, '2023-09-19 15:24:07', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-19 15:30:32', _binary 0x05ffe7c5, 77, '2023-09-19 15:30:40', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-19 22:17:56', _binary 0x36cb8a93, 77, '2023-09-19 22:17:48', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-20 01:26:57', _binary 0x5f1df05a, 77, '2023-09-20 01:26:54', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-20 08:37:07', _binary 0x05ffe72e, 77, '2023-09-20 08:37:10', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-20 19:02:31', _binary 0x3212906e, 77, '2023-09-20 19:02:24', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-20 19:02:34', _binary 0x5eb4ac8f, 77, '2023-09-20 19:02:21', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-20 19:11:15', _binary 0xd5b4cba8, 70, '2023-09-20 19:11:21', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-20 21:15:15', _binary 0x4d2ba9f1, 77, '2023-09-20 21:15:13', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-20 21:15:18', _binary 0x12ed2a4f, 77, '2023-09-20 21:15:18', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-21 00:21:38', _binary 0xd5b4cb9e, 77, '2023-09-21 00:21:38', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-21 11:40:51', _binary 0x05ffe774, 77, '2023-09-21 11:40:52', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-21 12:26:39', _binary 0x05ffe77a, 77, '2023-09-21 12:26:41', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-21 14:19:33', _binary 0x36ca91a2, 77, '2023-09-21 14:19:33', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-21 20:32:59', _binary 0x57fae0d7, 77, '2023-09-21 20:33:04', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-22 01:45:33', _binary 0x5f6cd5b3, 77, '2023-09-22 01:45:34', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-22 13:40:50', _binary 0x3ed25fb1, 77, '2023-09-22 13:40:51', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-22 17:20:40', _binary 0x5f6cd5d8, 77, '2023-09-22 17:20:46', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-23 00:30:06', _binary 0xd5b4cba7, 77, '2023-09-23 00:30:20', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-23 05:35:18', _binary 0x5f6cd5de, 77, '2023-09-23 05:35:19', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-23 05:39:26', _binary 0xd5b4cbfd, 77, '2023-09-23 05:39:40', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-23 08:00:54', _binary 0x57fae0d7, 77, '2023-09-23 08:00:54', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-23 22:27:38', _binary 0xcda927a9, 77, '2023-09-23 22:27:38', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-24 02:04:16', _binary 0x57fae024, 77, '2023-09-24 02:04:17', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-25 09:09:00', _binary 0xd5b4cb03, 77, '2023-09-25 09:09:06', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-25 20:12:04', _binary 0x42f945a7, 77, '2023-09-25 20:12:15', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-26 00:06:02', _binary 0x6f07609a, 77, '2023-09-26 00:06:02', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-26 17:10:55', _binary 0x05ffe78d, 77, '2023-09-26 17:10:56', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-26 17:31:04', _binary 0x1fb4aa2a, 77, '2023-09-26 17:31:01', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-27 15:14:28', _binary 0x1f17419f, 77, '2023-09-27 15:14:29', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-28 01:54:29', _binary 0x05ffe745, 77, '2023-09-28 01:54:30', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-28 13:25:14', _binary 0x22d8b2b5, 77, '2023-09-28 13:25:14', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-28 16:26:58', _binary 0x50fbe22e, 77, '2023-09-28 16:26:57', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-28 17:53:58', _binary 0x05ffe773, 77, '2023-09-28 17:53:58', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-28 23:36:14', _binary 0x57fae0dc, 77, '2023-09-28 23:36:17', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-29 17:14:35', _binary 0x5fa1dd26, 77, '2023-09-29 17:14:32', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-30 10:52:02', _binary 0xd5b4cb72, 77, '2023-09-30 10:52:02', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-09-30 22:45:41', _binary 0x5fa1dd4c, 77, '2023-09-30 22:45:41', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-01 13:57:56', _binary 0x5f6cd563, 77, '2023-10-01 13:57:56', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-01 15:19:00', _binary 0x05ffe720, 77, '2023-10-01 15:19:13', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-01 19:02:54', _binary 0x5fa1dd38, 77, '2023-10-01 19:02:51', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-02 01:06:40', _binary 0x5f6cd562, 77, '2023-10-02 01:06:40', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-02 08:05:31', _binary 0xd5b4cb58, 77, '2023-10-02 08:05:32', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-02 16:46:08', _binary 0x5fa1ef8d, 77, '2023-10-02 16:46:06', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-03 09:42:15', _binary 0x5fa1dd15, 77, '2023-10-03 09:42:15', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-03 20:04:03', _binary 0x6f0760a1, 77, '2023-10-03 20:04:03', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-04 08:14:36', _binary 0xd5b4cb44, 77, '2023-10-04 08:14:38', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-04 16:27:52', _binary 0x57fae0cf, 77, '2023-10-04 16:27:54', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-04 16:30:26', _binary 0xd5b4cbd9, 77, '2023-10-04 16:30:55', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-04 19:16:02', _binary 0x6db87051, 77, '2023-10-04 19:16:03', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-04 22:04:24', _binary 0xd5b4cb44, 77, '2023-10-04 22:04:24', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-04 22:20:02', _binary 0x05ffe709, 77, '2023-10-04 22:20:02', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-05 06:26:22', _binary 0x5f6cd58e, 77, '2023-10-05 06:26:32', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-05 12:03:44', _binary 0x12edf5cb, 77, '2023-10-05 12:03:45', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-07 07:49:31', _binary 0x57fae0e7, 77, '2023-10-07 07:49:50', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-08 07:37:06', _binary 0x5fa1dd19, 77, '2023-10-08 07:37:06', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-08 14:08:53', _binary 0x419ae2a7, 77, '2023-10-08 14:08:53', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-08 14:11:11', _binary 0x419ae2aa, 77, '2023-10-08 14:11:11', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-08 15:00:33', _binary 0x419ae2a6, 77, '2023-10-08 15:00:33', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-08 15:03:05', _binary 0x419ae2ab, 77, '2023-10-08 15:03:06', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-08 17:34:18', _binary 0xd8fb824a, 77, '2023-10-08 17:34:19', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-09 16:17:39', _binary 0x5853c8f2, 77, '2023-10-09 16:17:38', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-10 11:59:48', _binary 0x3695fbe9, 77, '2023-10-10 11:59:49', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-10 18:15:42', _binary 0x05e49114, 77, '2023-10-10 18:15:41', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-10 18:16:40', _binary 0x5fa1dd02, 77, '2023-10-10 18:16:40', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-10 20:32:01', _binary 0x5f6cd5d6, 77, '2023-10-10 20:32:06', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-12 00:45:00', _binary 0x058b8957, 77, '2023-10-12 00:45:01', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-12 14:28:32', _binary 0x284dbea7, 77, '2023-10-12 14:28:33', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-12 14:45:09', _binary 0x50523f49, 77, '2023-10-12 14:45:09', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-12 15:41:20', _binary 0x05ffe719, 77, '2023-10-12 15:41:34', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-12 22:23:35', _binary 0x57fae012, 77, '2023-10-12 22:23:36', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-12 22:31:11', _binary 0x5f6cd5c6, 77, '2023-10-12 22:31:12', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-12 23:19:39', _binary 0xd5b4cba3, 76, '2023-10-12 23:19:48', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-12 23:20:28', _binary 0x05ffe79e, 80, '2023-10-12 23:20:37', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-12 23:20:34', _binary 0x05ffe780, 78, '2023-10-12 23:20:41', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-12 23:20:42', _binary 0x57fae038, 70, '2023-10-12 23:21:01', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-12 23:32:00', _binary 0x05ffe722, 76, '2023-10-12 23:32:13', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-12 23:32:28', _binary 0xd5b4cba3, 70, '2023-10-12 23:32:55', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-12 23:32:40', _binary 0x5f6cd5c6, 72, '2023-10-12 23:32:58', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-12 23:34:54', _binary 0x05ffe79e, 78, '2023-10-12 23:35:03', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-12 23:41:10', _binary 0x5f6cd582, 72, '2023-10-12 23:41:28', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-12 23:41:37', _binary 0x5f6cd57b, 76, '2023-10-12 23:41:37', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-12 23:44:00', _binary 0x05ffe722, 70, '2023-10-12 23:44:00', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-12 23:53:17', _binary 0x5f6cd550, 70, '2023-10-12 23:53:18', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-13 15:57:13', _binary 0x3c38c436, 77, '2023-10-13 15:57:15', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-13 23:20:50', _binary 0x5fa1dd51, 77, '2023-10-13 23:20:50', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-14 05:35:10', _binary 0x5f6cd5ca, 73, '2023-10-14 05:35:11', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-14 17:40:31', _binary 0x05ffe733, 77, '2023-10-14 17:40:31', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-15 05:03:44', _binary 0x4fad58e3, 77, '2023-10-15 05:03:43', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-15 12:36:32', _binary 0x2cea3047, 77, '2023-10-15 12:36:32', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-15 18:36:07', _binary 0x5f6cd596, 77, '2023-10-15 18:36:11', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-15 20:28:57', _binary 0xd5b4cb2a, 76, '2023-10-15 20:28:58', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-15 22:25:56', _binary 0x05ffe75d, 77, '2023-10-15 22:25:57', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-15 23:44:48', _binary 0x05ffe7a6, 77, '2023-10-15 23:44:48', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-16 16:15:25', _binary 0x5f6cd5bf, 76, '2023-10-16 16:15:28', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-16 16:38:17', _binary 0x867a11aa, 77, '2023-10-16 16:38:25', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-16 22:32:22', _binary 0x058b00a7, 77, '2023-10-16 22:32:19', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-17 03:37:33', _binary 0x4d25e4c4, 77, '2023-10-17 03:37:33', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-17 14:32:48', _binary 0x36b03be4, 77, '2023-10-17 14:32:41', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-17 16:11:21', _binary 0xb22e67f9, 77, '2023-10-17 16:11:05', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-17 19:54:09', _binary 0x4fad5c5e, 76, '2023-10-17 19:54:08', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-18 03:05:21', _binary 0x5f1df0ba, 77, '2023-10-18 03:04:21', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-18 03:06:25', _binary 0x3435a461, 77, '2023-10-18 03:03:52', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-18 22:05:11', _binary 0xcc65a113, 77, '2023-10-18 22:05:12', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-18 22:40:43', _binary 0x6f076099, 77, '2023-10-18 22:40:43', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-19 12:34:21', _binary 0x05ffe75a, 77, '2023-10-19 12:34:21', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-19 12:41:11', _binary 0x36eb0b54, 77, '2023-10-19 12:40:59', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-19 12:43:20', _binary 0x05e49ae9, 77, '2023-10-19 12:41:59', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-19 16:54:31', _binary 0x05ffe733, 77, '2023-10-19 16:54:42', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-20 01:29:05', _binary 0xd5b4cb97, 77, '2023-10-20 01:29:15', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-20 03:24:49', _binary 0x5f1df0a0, 76, '2023-10-20 03:24:49', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-20 05:11:48', _binary 0x9538a0ea, 77, '2023-10-20 05:11:48', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-20 14:10:11', _binary 0x953896b2, 77, '2023-10-20 14:10:12', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-21 11:37:57', _binary 0x5f6cd57a, 77, '2023-10-21 11:37:57', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-21 17:42:36', _binary 0x05ffe7b1, 77, '2023-10-21 17:42:36', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-22 01:23:47', _binary 0x5f6cd56e, 77, '2023-10-22 01:23:48', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-22 05:17:00', _binary 0x5f6cd599, 77, '2023-10-22 05:17:01', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-22 05:22:22', _binary 0x023c31e2, 76, '2023-10-22 05:22:24', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-22 23:01:50', _binary 0xd5b4cb1b, 78, '2023-10-22 23:01:51', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-22 23:01:58', _binary 0x57fae019, 80, '2023-10-22 23:02:00', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-22 23:13:49', _binary 0x05ffe71e, 78, '2023-10-22 23:13:49', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-23 05:37:34', _binary 0xb22e6fe5, 76, '2023-10-23 05:37:33', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-23 12:11:42', _binary 0x12ecf1ec, 77, '2023-10-23 12:11:42', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-24 06:16:53', _binary 0xd5b4cbec, 77, '2023-10-24 06:16:54', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-24 20:50:54', _binary 0x05ffe744, 77, '2023-10-24 20:50:58', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-26 02:06:27', _binary 0x5fbdd68a, 80, '2023-10-26 02:06:26', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-26 14:23:35', _binary 0x419ae2a9, 77, '2023-10-26 14:23:35', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-26 15:59:13', _binary 0xd46dc46c, 77, '2023-10-26 15:59:13', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-27 15:02:20', _binary 0xc21fadc9, 77, '2023-10-27 15:02:21', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-27 15:06:32', _binary 0x05ffe73d, 77, '2023-10-27 15:06:33', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-28 07:15:21', _binary 0x5f1deee5, 77, '2023-10-28 07:15:21', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-28 19:20:35', _binary 0x59f8ab17, 77, '2023-10-28 19:20:35', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-28 20:06:29', _binary 0x5cff4ec8, 77, '2023-10-28 20:06:29', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-29 00:13:35', _binary 0x57fae0fd, 77, '2023-10-29 00:13:37', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-29 00:44:29', _binary 0x5f1dec02, 80, '2023-10-29 00:44:27', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-29 14:20:57', _binary 0xcc65a113, 77, '2023-10-29 14:20:57', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-29 14:22:34', _binary 0x5f6cd577, 77, '2023-10-29 14:22:35', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-29 16:24:30', _binary 0x5fa1dd4a, 80, '2023-10-29 16:24:31', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-30 04:00:36', _binary 0xd5b4cb14, 77, '2023-10-30 04:00:47', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-30 04:17:59', _binary 0x57fae0ca, 77, '2023-10-30 04:18:24', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-30 05:08:05', _binary 0xc3d34d8e, 77, '2023-10-30 05:08:05', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-30 05:36:53', _binary 0xd5b4cb7a, 72, '2023-10-30 05:36:55', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-31 14:00:40', _binary 0x4fad583c, 80, '2023-10-31 14:00:40', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-31 15:52:11', _binary 0xd5b4cbaf, 77, '2023-10-31 15:52:12', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-10-31 21:48:17', _binary 0x5f54dc60, 77, '2023-10-31 21:48:11', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-01 13:02:17', _binary 0x2d4fb945, 77, '2023-11-01 13:02:23', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-02 09:52:26', _binary 0xd5b4cbf0, 77, '2023-11-02 09:52:29', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-02 17:40:54', _binary 0x5f1df2eb, 77, '2023-11-02 17:40:52', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-02 19:45:35', _binary 0x6f0760a7, 77, '2023-11-02 19:45:36', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-02 19:46:56', _binary 0x24638880, 77, '2023-11-02 19:46:57', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-02 19:47:08', _binary 0x24638881, 77, '2023-11-02 19:47:09', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-03 08:04:19', _binary 0x59f8ab17, 77, '2023-11-03 08:04:19', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-03 10:22:01', _binary 0x57fae015, 77, '2023-11-03 10:22:02', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-03 20:52:57', _binary 0xcc65a113, 77, '2023-11-03 20:52:57', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-04 01:14:31', _binary 0x5f6cd5c8, 77, '2023-11-04 01:14:31', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-04 19:13:02', _binary 0x42f95329, 77, '2023-11-04 19:13:05', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-04 19:15:19', _binary 0x42f947c5, 77, '2023-11-04 19:15:29', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-05 02:55:40', _binary 0xd5b4cbba, 77, '2023-11-05 02:55:45', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-05 09:00:59', _binary 0x5fa1efbe, 77, '2023-11-05 09:00:59', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-05 10:44:51', _binary 0x25cc060c, 77, '2023-11-05 10:44:51', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-05 19:58:46', _binary 0x42f94228, 80, '2023-11-05 19:58:51', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-05 20:20:09', _binary 0x42f94227, 80, '2023-11-05 20:20:15', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-06 17:12:16', _binary 0x05ffe7af, 77, '2023-11-06 17:12:16', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-06 20:10:08', _binary 0x5f6cd5ef, 77, '2023-11-06 20:10:09', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-07 21:08:10', _binary 0x24638880, 77, '2023-11-07 21:08:18', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-07 21:33:45', _binary 0x058c40c8, 77, '2023-11-07 21:33:45', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-08 08:13:10', _binary 0xc39a7a16, 77, '2023-11-08 08:13:27', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-08 18:43:03', _binary 0x57fae018, 77, '2023-11-08 18:43:03', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-08 20:58:57', _binary 0xd5b4cb6c, 77, '2023-11-08 20:58:57', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-08 20:59:05', _binary 0xbc11a4c5, 77, '2023-11-08 20:59:05', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-08 20:59:06', _binary 0xd5b4cb95, 82, '2023-11-08 20:59:07', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-08 21:09:53', _binary 0x5f6cd5ae, 82, '2023-11-08 21:09:57', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-08 21:14:32', _binary 0xd5b4cb66, 82, '2023-11-08 21:14:34', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-08 21:18:25', _binary 0x5f6cd5d3, 78, '2023-11-08 21:18:27', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-08 21:18:44', _binary 0x5f6cd5ae, 82, '2023-11-08 21:18:52', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-08 21:18:55', _binary 0xd5b4cb7c, 76, '2023-11-08 21:19:03', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-08 21:30:51', _binary 0x05ffe772, 78, '2023-11-08 21:30:55', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-09 14:22:38', _binary 0x05ffe745, 77, '2023-11-09 14:22:39', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-10 03:59:54', _binary 0xa87744ac, 77, '2023-11-10 03:59:54', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-11 08:36:31', _binary 0x57fae004, 77, '2023-11-11 08:36:31', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-12 01:52:00', _binary 0x5fa1dd69, 77, '2023-11-12 01:51:54', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-13 00:30:53', _binary 0x6f076098, 77, '2023-11-13 00:30:53', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-13 00:57:00', _binary 0x1fb4bd99, 77, '2023-11-13 00:57:05', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-13 03:57:42', _binary 0x36b11e0b, 77, '2023-11-13 03:57:39', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-13 03:57:49', _binary 0xb22e57fb, 77, '2023-11-13 03:56:36', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-13 18:28:30', _binary 0x5f6cd565, 77, '2023-11-13 18:28:30', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-13 21:31:56', _binary 0x05ffe758, 77, '2023-11-13 21:31:58', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-14 15:29:14', _binary 0x25cc060c, 77, '2023-11-14 15:29:13', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-15 21:28:22', _binary 0x5f1defe9, 77, '2023-11-15 21:28:23', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-15 22:46:49', _binary 0x5853c8df, 77, '2023-11-15 22:46:49', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-16 00:00:00', _binary 0x42f94227, 77, '2023-11-16 03:01:43', 2);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-16 00:00:00', _binary 0x42f94228, 82, '2023-11-16 10:07:20', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-16 00:00:00', _binary 0x42f94f02, 77, '2023-11-16 13:37:55', 3);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-16 03:02:03', _binary 0x42f94228, 77, '2023-11-16 03:02:04', 2);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-16 08:56:15', _binary 0x05ffe751, 77, '2023-11-16 08:56:15', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-16 10:55:32', _binary 0x5f6cd571, 77, '2023-11-16 10:55:35', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-16 17:27:57', _binary 0x419ae2a9, 77, '2023-11-16 17:27:57', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-16 19:19:48', _binary 0xcda9276e, 77, '2023-11-16 19:19:48', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-16 19:21:18', _binary 0xcda9279e, 77, '2023-11-16 19:21:18', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-16 20:01:22', _binary 0x23577879, 77, '2023-11-16 20:01:22', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-16 22:39:21', _binary 0x5f1def58, 77, '2023-11-16 22:39:21', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-16 23:32:13', _binary 0x419ae2a8, 77, '2023-11-16 23:32:13', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-17 04:33:09', _binary 0x419ae2a8, 77, '2023-11-17 04:33:10', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-17 23:46:56', _binary 0xbc200368, 77, '2023-11-17 23:46:56', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-17 23:47:35', _binary 0x36ac4e1f, 77, '2023-11-17 23:47:01', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-18 03:41:54', _binary 0x57fae021, 77, '2023-11-18 03:41:58', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-18 04:27:30', _binary 0x254f0d14, 77, '2023-11-18 04:27:30', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-18 06:38:24', _binary 0x058b3374, 77, '2023-11-18 06:38:24', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-19 01:16:59', _binary 0x50fbec9b, 77, '2023-11-19 01:17:00', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-19 12:18:10', _binary 0xb0d2464d, 77, '2023-11-19 12:18:09', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-19 23:06:30', _binary 0x05ffe7bd, 77, '2023-11-19 23:06:30', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-19 23:23:53', _binary 0x05ffe723, 77, '2023-11-19 23:23:54', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-20 07:27:28', _binary 0x90d98798, 77, '2023-11-20 07:27:28', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-20 07:54:29', _binary 0x5fa1dd45, 77, '2023-11-20 07:54:30', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-20 16:14:37', _binary 0x953896f2, 77, '2023-11-20 16:14:37', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-20 18:06:55', _binary 0x5d9da90c, 77, '2023-11-20 18:06:55', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-20 18:07:19', _binary 0x5d9da90c, 76, '2023-11-20 18:07:19', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-20 21:21:14', _binary 0x5fa1dd63, 77, '2023-11-20 21:21:15', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-21 05:08:34', _binary 0x5fa1dd47, 77, '2023-11-21 05:08:23', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-21 09:13:59', _binary 0x05ffe744, 77, '2023-11-21 09:13:59', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-21 20:17:15', _binary 0x5fa1dd2b, 77, '2023-11-21 20:17:15', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-21 21:52:33', _binary 0x22fe357d, 77, '2023-11-21 21:52:34', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-21 21:52:54', _binary 0x22fe357d, 77, '2023-11-21 21:52:54', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-22 04:02:34', _binary 0x5fa1efda, 77, '2023-11-22 04:02:34', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-23 00:00:00', _binary 0x42f94227, 77, '2023-11-23 03:19:09', 2);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-23 05:44:01', _binary 0x023cd6fa, 77, '2023-11-23 05:44:01', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-23 08:09:10', _binary 0xbc11b28f, 77, '2023-11-23 08:09:09', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-23 08:12:20', _binary 0x2ef27449, 77, '2023-11-23 08:12:20', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-23 16:58:15', _binary 0x5fa1dd74, 77, '2023-11-23 16:58:13', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-23 16:58:49', _binary 0x25cc031f, 77, '2023-11-23 16:58:50', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-23 17:00:09', _binary 0x4fad58e4, 77, '2023-11-23 17:00:10', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-24 03:31:56', _binary 0x5fa1dd02, 77, '2023-11-24 03:31:56', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-24 17:44:29', _binary 0x5f6cd584, 77, '2023-11-24 17:44:58', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-25 07:41:33', _binary 0x5853c8df, 77, '2023-11-25 07:41:36', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-26 20:28:12', _binary 0xd5b4cb56, 80, '2023-11-26 20:28:34', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-26 20:35:17', _binary 0x05ffe7cb, 77, '2023-11-26 20:35:18', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-27 09:34:44', _binary 0xd5b4cb8e, 77, '2023-11-27 09:34:48', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-27 09:35:07', _binary 0x5fa1dd5e, 77, '2023-11-27 09:34:59', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-29 11:52:07', _binary 0x57fae048, 80, '2023-11-29 11:52:19', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-11-30 07:00:15', _binary 0x5f6cd591, 77, '2023-11-30 07:00:30', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-01 10:50:12', _binary 0xd5b4cbf4, 77, '2023-12-01 10:50:34', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-01 10:57:10', _binary 0x05ffe720, 77, '2023-12-01 10:57:18', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-02 10:04:32', _binary 0x05ffe752, 77, '2023-12-02 10:04:33', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-04 01:03:10', _binary 0x5f6cd5fe, 77, '2023-12-04 01:03:11', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-04 03:34:58', _binary 0xd35f3208, 77, '2023-12-04 03:34:58', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-04 20:38:00', _binary 0x5f8ba5d9, 77, '2023-12-04 20:38:00', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-05 09:50:24', _binary 0xd5b4cb18, 82, '2023-12-05 09:50:24', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-05 09:51:01', _binary 0xd5b4cbfa, 77, '2023-12-05 09:51:01', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-05 09:52:19', _binary 0xd5b4cbdb, 76, '2023-12-05 09:52:19', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-05 09:55:18', _binary 0x5f6cd55f, 77, '2023-12-05 09:55:20', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-05 10:01:47', _binary 0x5f6cd5f8, 76, '2023-12-05 10:01:48', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-05 10:10:56', _binary 0xd5b4cb18, 76, '2023-12-05 10:11:18', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-05 10:17:55', _binary 0xd5b4cbb4, 76, '2023-12-05 10:18:03', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-05 10:27:08', _binary 0x57fae0f6, 76, '2023-12-05 10:27:15', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-05 11:18:18', _binary 0x5f6cd583, 76, '2023-12-05 11:18:39', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-05 11:26:01', _binary 0x5f6cd5c2, 76, '2023-12-05 11:26:16', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-05 11:35:56', _binary 0x05ffe745, 76, '2023-12-05 11:36:06', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-06 03:57:50', _binary 0x5fa1dd77, 77, '2023-12-06 03:57:46', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-06 04:58:05', _binary 0x23cbfd0d, 77, '2023-12-06 04:58:05', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-06 04:58:19', _binary 0x23cbfccd, 77, '2023-12-06 04:58:19', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-06 04:58:31', _binary 0x05a12c2c, 77, '2023-12-06 04:58:31', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-07 18:41:43', _binary 0x419ae2ab, 77, '2023-12-07 18:41:44', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-07 18:58:04', _binary 0x419ae2a6, 77, '2023-12-07 18:58:04', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-07 19:34:23', _binary 0x419ae2ab, 77, '2023-12-07 19:34:23', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-07 19:46:59', _binary 0x419ae2a7, 77, '2023-12-07 19:46:59', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-07 19:47:23', _binary 0x419ae2a6, 77, '2023-12-07 19:47:24', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-07 21:04:55', _binary 0x4fad58d5, 77, '2023-12-07 21:04:21', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-08 10:15:59', _binary 0x57fae02e, 77, '2023-12-08 10:15:59', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-08 12:30:06', _binary 0x05ffe750, 77, '2023-12-08 12:30:08', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-09 19:19:22', _binary 0x5f6cd5f3, 77, '2023-12-09 19:19:33', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-09 23:45:38', _binary 0x4fad5c2b, 77, '2023-12-09 23:45:37', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-10 14:21:25', _binary 0x05ffe7b8, 77, '2023-12-10 14:21:26', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-11 16:24:41', _binary 0x05e440be, 77, '2023-12-11 16:24:41', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-12 10:58:14', _binary 0xcc65a120, 77, '2023-12-12 10:58:15', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-12 21:13:46', _binary 0xd5b4cb74, 77, '2023-12-12 21:13:46', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-13 05:02:28', _binary 0x05ffe708, 77, '2023-12-13 05:02:32', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-13 19:40:09', _binary 0xb935fb12, 77, '2023-12-13 19:40:09', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-13 20:33:36', _binary 0x50fbeb44, 77, '2023-12-13 20:33:36', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-13 20:35:27', _binary 0x9246c0b4, 77, '2023-12-13 20:35:28', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-13 21:06:06', _binary 0x24638888, 77, '2023-12-13 21:06:07', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-14 21:37:34', _binary 0x5f6cd578, 77, '2023-12-14 21:37:35', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-15 08:07:36', _binary 0xcc65a120, 77, '2023-12-15 08:07:36', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-15 12:21:52', _binary 0x5fa1dd3b, 77, '2023-12-15 12:21:54', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-15 12:22:15', _binary 0x36bd3a50, 77, '2023-12-15 12:22:12', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-16 15:33:40', _binary 0x5fa1efab, 77, '2023-12-16 15:33:39', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-16 20:02:18', _binary 0x340cec2e, 77, '2023-12-16 20:02:35', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-17 04:11:56', _binary 0xd423add2, 77, '2023-12-17 04:12:08', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-17 07:28:56', _binary 0x5fa1efeb, 71, '2023-12-17 07:28:55', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-17 13:36:26', _binary 0x5f6cd5c0, 77, '2023-12-17 13:37:05', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-17 19:10:36', _binary 0xd5b4cb1c, 82, '2023-12-17 19:10:44', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-17 19:14:15', _binary 0x05ffe7b2, 78, '2023-12-17 19:14:28', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-18 06:44:50', _binary 0x05e4c6e6, 77, '2023-12-18 06:44:50', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-18 07:16:26', _binary 0xd5b4cba7, 73, '2023-12-18 07:16:30', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-18 07:31:41', _binary 0xd5b4cb56, 77, '2023-12-18 07:31:46', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-18 08:19:28', _binary 0x5f6cd59c, 78, '2023-12-18 08:19:36', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-20 02:10:51', _binary 0x5f1df035, 71, '2023-12-20 02:10:51', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-20 02:11:10', _binary 0x6db814e9, 71, '2023-12-20 02:11:11', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-20 13:29:28', _binary 0x57fae0e6, 77, '2023-12-20 13:29:40', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-20 14:16:47', _binary 0xd5b4cb3f, 77, '2023-12-20 14:16:56', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-20 18:29:10', _binary 0x953896f6, 77, '2023-12-20 18:29:10', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-20 20:12:12', _binary 0x4f7e3f7b, 77, '2023-12-20 20:12:12', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-20 21:19:08', _binary 0x90d9878a, 77, '2023-12-20 21:19:08', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-21 06:21:35', _binary 0x5f6cd5f3, 77, '2023-12-21 06:21:35', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-21 11:05:20', _binary 0xd5e8cf82, 77, '2023-12-21 11:05:20', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-21 11:59:47', _binary 0xd5b4cbd5, 80, '2023-12-21 12:00:43', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-21 13:36:35', _binary 0x5fa1dd32, 71, '2023-12-21 13:36:35', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-22 10:15:07', _binary 0x284dbe99, 77, '2023-12-22 10:15:07', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-22 23:24:48', _binary 0x5fa1dd04, 77, '2023-12-22 23:24:45', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-24 00:00:00', _binary 0x42f94227, 77, '2023-12-24 11:25:19', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-24 19:56:32', _binary 0x6dad207c, 77, '2023-12-24 19:56:32', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-24 23:01:01', _binary 0xd5b4cb2e, 77, '2023-12-24 23:01:22', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-25 06:33:36', _binary 0x57fae0ed, 72, '2023-12-25 06:33:36', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-26 04:26:21', _binary 0x05ffe79f, 77, '2023-12-26 04:26:42', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-26 15:39:12', _binary 0x5fa1dd3e, 77, '2023-12-26 15:39:11', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-26 23:49:40', _binary 0x5f6cd592, 77, '2023-12-26 23:49:44', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-27 14:35:22', _binary 0x25cc85f0, 77, '2023-12-27 14:35:23', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-27 19:41:55', _binary 0x57fae024, 96, '2023-12-27 19:42:03', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-27 20:30:37', _binary 0xd5b4cba1, 96, '2023-12-27 20:30:37', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-27 20:43:22', _binary 0xd5b4cb29, 96, '2023-12-27 20:43:34', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-28 00:00:00', _binary 0x42f94bc1, 76, '2023-12-28 05:47:19', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-29 16:43:33', _binary 0x57fae00b, 77, '2023-12-29 16:43:33', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-30 00:00:00', _binary 0x42f94f03, 96, '2023-12-30 13:44:12', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-30 00:00:00', _binary 0x42f94f04, 96, '2023-12-30 14:25:57', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-30 06:59:18', _binary 0xd5b4cbb6, 77, '2023-12-30 06:59:19', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-30 11:54:47', _binary 0x6db86219, 77, '2023-12-30 11:54:44', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-31 06:08:31', _binary 0x419ae2a6, 77, '2023-12-31 06:08:31', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-31 07:09:48', _binary 0x4fad5cd3, 77, '2023-12-31 07:09:48', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-31 14:00:20', _binary 0x05ffe7a3, 77, '2023-12-31 14:00:20', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-31 14:02:04', _binary 0xd5b4cb64, 77, '2023-12-31 14:02:10', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-12-31 19:08:56', _binary 0x6d5f49c1, 96, '2023-12-31 19:08:56', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2024-01-01 00:00:00', _binary 0x42f94227, 82, '2024-01-01 00:32:53', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2024-01-01 00:00:00', _binary 0x42f94228, 69, '2024-01-01 04:49:52', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2024-01-02 00:00:00', _binary 0x42f949c1, 77, '2024-01-02 23:11:58', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2024-01-02 00:00:00', _binary 0x42f949c2, 72, '2024-01-02 23:34:23', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2024-01-02 01:34:13', _binary 0x05ffe725, 77, '2024-01-02 01:34:25', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2024-01-02 16:03:57', _binary 0x05ffe78d, 82, '2024-01-02 16:04:01', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2024-01-02 16:04:35', _binary 0xd5b4cbe2, 77, '2024-01-02 16:04:52', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2024-01-02 16:06:16', _binary 0xd5b4cbfb, 76, '2024-01-02 16:06:38', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2024-01-03 04:47:30', _binary 0x5f6cd5cd, 76, '2024-01-03 04:47:39', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2024-01-03 15:42:03', _binary 0x5fa1dd63, 96, '2024-01-03 15:42:04', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2024-01-03 22:10:19', _binary 0x05ffe799, 77, '2024-01-03 22:10:31', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2024-01-03 22:24:12', _binary 0x5f6cd57a, 77, '2024-01-03 22:24:13', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2024-01-04 20:45:39', _binary 0x05ffe7a3, 96, '2024-01-04 20:46:18', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2024-01-04 21:10:54', _binary 0x5f1de552, 96, '2024-01-04 21:10:53', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2024-01-05 04:40:21', _binary 0x284dbd1c, 77, '2024-01-05 04:40:21', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2024-01-06 03:51:08', _binary 0x05ffe7b5, 77, '2024-01-06 03:51:09', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2024-01-06 08:11:02', _binary 0x5f6cd55d, 77, '2024-01-06 08:11:07', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2024-01-06 17:32:08', _binary 0x5f6cd5cb, 76, '2024-01-06 17:32:08', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2024-01-06 23:26:49', _binary 0x6db8699d, 96, '2024-01-06 23:26:45', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2024-01-07 07:07:26', _binary 0xb9a65492, 77, '2024-01-07 07:07:27', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2024-01-07 14:51:18', _binary 0xd5b4cb0b, 77, '2024-01-07 14:51:19', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
