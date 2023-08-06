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

-- Дамп данных таблицы master_v_balashihe.article_statistic: ~270 rows (приблизительно)
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 17:10:48', _binary 0x7f000001, 69, '2023-07-30 17:10:48', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 17:26:42', _binary 0x7f000001, 77, '2023-07-30 17:26:42', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 17:35:56', _binary 0x7f000001, 77, '2023-07-30 17:35:56', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 17:36:00', _binary 0x7f000001, 76, '2023-07-30 17:35:59', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 17:36:18', _binary 0x7f000001, 77, '2023-07-30 17:36:17', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 17:36:19', _binary 0x7f000001, 76, '2023-07-30 17:36:19', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 17:36:30', _binary 0x7f000001, 80, '2023-07-30 17:36:30', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 17:57:10', _binary 0x7f000001, 80, '2023-07-30 17:57:09', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 17:57:52', _binary 0x7f000001, 80, '2023-07-30 17:57:51', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 17:57:53', _binary 0x7f000001, 80, '2023-07-30 17:57:52', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 17:57:55', _binary 0x7f000001, 80, '2023-07-30 17:57:54', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 17:57:56', _binary 0x7f000001, 80, '2023-07-30 17:57:56', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 17:58:47', _binary 0x7f000001, 80, '2023-07-30 17:58:47', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 17:59:14', _binary 0x7f000001, 80, '2023-07-30 17:59:13', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 17:59:22', _binary 0x7f000001, 80, '2023-07-30 17:59:22', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 17:59:33', _binary 0x7f000001, 80, '2023-07-30 17:59:32', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:00:12', _binary 0x7f000001, 80, '2023-07-30 18:00:12', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:00:21', _binary 0x7f000001, 80, '2023-07-30 18:00:21', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:00:39', _binary 0x7f000001, 80, '2023-07-30 18:00:39', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:00:46', _binary 0x7f000001, 80, '2023-07-30 18:00:45', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:01:03', _binary 0x7f000001, 80, '2023-07-30 18:01:03', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:01:24', _binary 0x7f000001, 80, '2023-07-30 18:01:24', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:01:29', _binary 0x7f000001, 80, '2023-07-30 18:01:28', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:02:43', _binary 0x7f000001, 80, '2023-07-30 18:02:43', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:03:21', _binary 0x7f000001, 80, '2023-07-30 18:03:21', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:03:29', _binary 0x7f000001, 80, '2023-07-30 18:03:29', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:03:34', _binary 0x7f000001, 80, '2023-07-30 18:03:33', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:03:56', _binary 0x7f000001, 80, '2023-07-30 18:03:55', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:04:39', _binary 0x7f000001, 80, '2023-07-30 18:04:39', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:05:16', _binary 0x7f000001, 80, '2023-07-30 18:05:16', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:05:45', _binary 0x7f000001, 80, '2023-07-30 18:05:45', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:06:01', _binary 0x7f000001, 80, '2023-07-30 18:06:00', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:06:10', _binary 0x7f000001, 80, '2023-07-30 18:06:10', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:06:14', _binary 0x7f000001, 80, '2023-07-30 18:06:13', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:06:15', _binary 0x7f000001, 80, '2023-07-30 18:06:15', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:06:56', _binary 0x7f000001, 80, '2023-07-30 18:06:56', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:07:33', _binary 0x7f000001, 80, '2023-07-30 18:07:33', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:07:38', _binary 0x7f000001, 80, '2023-07-30 18:07:37', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:07:43', _binary 0x7f000001, 80, '2023-07-30 18:07:42', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:07:45', _binary 0x7f000001, 80, '2023-07-30 18:07:45', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:07:52', _binary 0x7f000001, 80, '2023-07-30 18:07:51', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:07:58', _binary 0x7f000001, 80, '2023-07-30 18:07:58', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:08:06', _binary 0x7f000001, 80, '2023-07-30 18:08:05', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:08:07', _binary 0x7f000001, 80, '2023-07-30 18:08:07', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:08:09', _binary 0x7f000001, 80, '2023-07-30 18:08:09', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:08:13', _binary 0x7f000001, 80, '2023-07-30 18:08:12', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:08:15', _binary 0x7f000001, 80, '2023-07-30 18:08:15', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:08:18', _binary 0x7f000001, 80, '2023-07-30 18:08:17', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:08:21', _binary 0x7f000001, 80, '2023-07-30 18:08:20', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:08:24', _binary 0x7f000001, 80, '2023-07-30 18:08:24', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:08:26', _binary 0x7f000001, 80, '2023-07-30 18:08:26', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:08:29', _binary 0x7f000001, 80, '2023-07-30 18:08:29', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:08:32', _binary 0x7f000001, 80, '2023-07-30 18:08:31', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:08:35', _binary 0x7f000001, 80, '2023-07-30 18:08:34', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:08:37', _binary 0x7f000001, 80, '2023-07-30 18:08:37', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:09:04', _binary 0x7f000001, 80, '2023-07-30 18:09:04', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:09:19', _binary 0x7f000001, 80, '2023-07-30 18:09:19', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:09:51', _binary 0x7f000001, 80, '2023-07-30 18:09:51', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:09:53', _binary 0x7f000001, 80, '2023-07-30 18:09:52', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:09:59', _binary 0x7f000001, 80, '2023-07-30 18:09:59', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:10:01', _binary 0x7f000001, 80, '2023-07-30 18:10:00', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:10:24', _binary 0x7f000001, 80, '2023-07-30 18:10:24', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:10:35', _binary 0x7f000001, 80, '2023-07-30 18:10:35', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:10:45', _binary 0x7f000001, 80, '2023-07-30 18:10:45', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:10:52', _binary 0x7f000001, 80, '2023-07-30 18:10:52', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:11:13', _binary 0x7f000001, 80, '2023-07-30 18:11:13', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:11:40', _binary 0x7f000001, 80, '2023-07-30 18:11:40', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:11:55', _binary 0x7f000001, 80, '2023-07-30 18:11:55', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:12:03', _binary 0x7f000001, 80, '2023-07-30 18:12:03', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:12:28', _binary 0x7f000001, 80, '2023-07-30 18:12:28', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:12:37', _binary 0x7f000001, 80, '2023-07-30 18:12:37', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:12:39', _binary 0x7f000001, 80, '2023-07-30 18:12:39', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:13:09', _binary 0x7f000001, 80, '2023-07-30 18:13:09', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:13:16', _binary 0x7f000001, 80, '2023-07-30 18:13:15', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:13:38', _binary 0x7f000001, 80, '2023-07-30 18:13:38', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:14:02', _binary 0x7f000001, 77, '2023-07-30 18:14:02', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:14:24', _binary 0x7f000001, 80, '2023-07-30 18:14:24', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:19:28', _binary 0x7f000001, 80, '2023-07-30 18:19:28', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:19:52', _binary 0x7f000001, 80, '2023-07-30 18:19:51', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:20:19', _binary 0x7f000001, 80, '2023-07-30 18:20:19', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:20:44', _binary 0x7f000001, 80, '2023-07-30 18:20:44', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:21:18', _binary 0x7f000001, 80, '2023-07-30 18:21:18', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:21:57', _binary 0x7f000001, 80, '2023-07-30 18:21:57', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:22:36', _binary 0x7f000001, 80, '2023-07-30 18:22:36', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:22:41', _binary 0x7f000001, 80, '2023-07-30 18:22:41', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:22:55', _binary 0x7f000001, 80, '2023-07-30 18:22:54', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:22:58', _binary 0x7f000001, 80, '2023-07-30 18:22:58', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:23:00', _binary 0x7f000001, 80, '2023-07-30 18:23:00', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:23:17', _binary 0x7f000001, 80, '2023-07-30 18:23:17', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:23:28', _binary 0x7f000001, 80, '2023-07-30 18:23:27', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:23:43', _binary 0x7f000001, 80, '2023-07-30 18:23:43', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:23:50', _binary 0x7f000001, 80, '2023-07-30 18:23:50', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:24:01', _binary 0x7f000001, 80, '2023-07-30 18:24:01', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:24:18', _binary 0x7f000001, 80, '2023-07-30 18:24:17', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:24:27', _binary 0x7f000001, 80, '2023-07-30 18:24:27', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:24:37', _binary 0x7f000001, 80, '2023-07-30 18:24:36', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:26:08', _binary 0x7f000001, 80, '2023-07-30 18:26:08', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:27:10', _binary 0x7f000001, 80, '2023-07-30 18:27:10', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:27:15', _binary 0x7f000001, 80, '2023-07-30 18:27:15', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:28:07', _binary 0x7f000001, 80, '2023-07-30 18:28:07', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:28:14', _binary 0x7f000001, 80, '2023-07-30 18:28:14', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:28:22', _binary 0x7f000001, 80, '2023-07-30 18:28:21', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:29:06', _binary 0x7f000001, 80, '2023-07-30 18:29:06', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:29:20', _binary 0x7f000001, 80, '2023-07-30 18:29:19', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:30:03', _binary 0x7f000001, 80, '2023-07-30 18:30:03', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:30:17', _binary 0x7f000001, 80, '2023-07-30 18:30:17', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:31:10', _binary 0x7f000001, 80, '2023-07-30 18:31:10', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:31:12', _binary 0x7f000001, 80, '2023-07-30 18:31:12', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:31:35', _binary 0x7f000001, 80, '2023-07-30 18:31:34', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:31:38', _binary 0x7f000001, 80, '2023-07-30 18:31:38', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:31:42', _binary 0x7f000001, 80, '2023-07-30 18:31:41', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:31:45', _binary 0x7f000001, 80, '2023-07-30 18:31:44', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:31:46', _binary 0x7f000001, 80, '2023-07-30 18:31:45', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:31:56', _binary 0x7f000001, 80, '2023-07-30 18:31:56', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:32:02', _binary 0x7f000001, 80, '2023-07-30 18:32:02', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:32:09', _binary 0x7f000001, 80, '2023-07-30 18:32:09', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:32:12', _binary 0x7f000001, 80, '2023-07-30 18:32:11', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:33:58', _binary 0x7f000001, 80, '2023-07-30 18:33:58', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:34:00', _binary 0x7f000001, 80, '2023-07-30 18:33:59', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:34:25', _binary 0x7f000001, 80, '2023-07-30 18:34:24', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:34:49', _binary 0x7f000001, 80, '2023-07-30 18:34:49', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:34:51', _binary 0x7f000001, 80, '2023-07-30 18:34:50', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:35:57', _binary 0x7f000001, 80, '2023-07-30 18:35:57', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:37:11', _binary 0x7f000001, 80, '2023-07-30 18:37:10', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:37:28', _binary 0x7f000001, 80, '2023-07-30 18:37:27', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:37:38', _binary 0x7f000001, 80, '2023-07-30 18:37:38', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:37:43', _binary 0x7f000001, 80, '2023-07-30 18:37:42', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:38:08', _binary 0x7f000001, 80, '2023-07-30 18:38:08', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:38:17', _binary 0x7f000001, 80, '2023-07-30 18:38:17', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:42:22', _binary 0x7f000001, 80, '2023-07-30 18:42:22', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:42:25', _binary 0x7f000001, 80, '2023-07-30 18:42:24', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:42:30', _binary 0x7f000001, 80, '2023-07-30 18:42:30', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:44:28', _binary 0x7f000001, 80, '2023-07-30 18:44:28', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:44:33', _binary 0x7f000001, 80, '2023-07-30 18:44:32', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:44:35', _binary 0x7f000001, 80, '2023-07-30 18:44:34', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:45:20', _binary 0x7f000001, 80, '2023-07-30 18:45:19', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:45:38', _binary 0x7f000001, 80, '2023-07-30 18:45:38', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:46:22', _binary 0x7f000001, 80, '2023-07-30 18:46:22', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:46:49', _binary 0x7f000001, 80, '2023-07-30 18:46:49', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:46:53', _binary 0x7f000001, 80, '2023-07-30 18:46:52', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:48:28', _binary 0x7f000001, 80, '2023-07-30 18:48:28', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:53:55', _binary 0x7f000001, 80, '2023-07-30 18:53:55', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 18:58:10', _binary 0x7f000001, 80, '2023-07-30 18:58:10', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 19:02:44', _binary 0x7f000001, 80, '2023-07-30 19:02:44', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 19:02:51', _binary 0x7f000001, 80, '2023-07-30 19:02:51', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 19:02:54', _binary 0x7f000001, 80, '2023-07-30 19:02:53', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 19:03:40', _binary 0x7f000001, 76, '2023-07-30 19:03:40', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 19:04:41', _binary 0x7f000001, 77, '2023-07-30 19:04:41', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 19:08:31', _binary 0x7f000001, 77, '2023-07-30 19:08:31', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 19:08:39', _binary 0x7f000001, 77, '2023-07-30 19:08:39', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 19:12:12', _binary 0x7f000001, 76, '2023-07-30 19:12:12', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 19:12:32', _binary 0x7f000001, 76, '2023-07-30 19:12:32', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 19:12:34', _binary 0x7f000001, 76, '2023-07-30 19:12:34', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 19:12:39', _binary 0x7f000001, 76, '2023-07-30 19:12:39', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 19:12:49', _binary 0x7f000001, 76, '2023-07-30 19:12:48', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 19:15:39', _binary 0x7f000001, 80, '2023-07-30 19:15:39', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 19:19:46', _binary 0x7f000001, 80, '2023-07-30 19:19:46', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 19:19:52', _binary 0x7f000001, 80, '2023-07-30 19:19:52', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 19:19:55', _binary 0x7f000001, 80, '2023-07-30 19:19:54', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 19:20:28', _binary 0x7f000001, 80, '2023-07-30 19:20:28', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 19:20:53', _binary 0x7f000001, 80, '2023-07-30 19:20:53', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 19:21:01', _binary 0x7f000001, 80, '2023-07-30 19:21:01', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 19:21:05', _binary 0x7f000001, 80, '2023-07-30 19:21:05', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 19:21:11', _binary 0x7f000001, 80, '2023-07-30 19:21:10', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 19:21:15', _binary 0x7f000001, 80, '2023-07-30 19:21:14', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 19:21:17', _binary 0x7f000001, 80, '2023-07-30 19:21:16', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 19:22:23', _binary 0x7f000001, 80, '2023-07-30 19:22:23', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 19:22:25', _binary 0x7f000001, 80, '2023-07-30 19:22:25', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 19:22:28', _binary 0x7f000001, 80, '2023-07-30 19:22:28', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 19:22:30', _binary 0x7f000001, 80, '2023-07-30 19:22:29', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 19:27:27', _binary 0x7f000001, 80, '2023-07-30 19:27:27', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 19:27:28', _binary 0x7f000001, 80, '2023-07-30 19:27:28', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 19:27:32', _binary 0x7f000001, 80, '2023-07-30 19:27:31', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 19:27:34', _binary 0x7f000001, 80, '2023-07-30 19:27:33', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 19:29:43', _binary 0x7f000001, 77, '2023-07-30 19:29:43', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 19:31:08', _binary 0x7f000001, 77, '2023-07-30 19:31:08', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 19:38:19', _binary 0x7f000001, 76, '2023-07-30 19:38:19', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 19:40:29', _binary 0x7f000001, 77, '2023-07-30 19:40:29', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 19:55:02', _binary 0x7f000001, 77, '2023-07-30 19:55:01', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 19:55:59', _binary 0x7f000001, 77, '2023-07-30 19:55:59', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 19:57:16', _binary 0x7f000001, 77, '2023-07-30 19:57:16', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 21:37:25', _binary 0x7f000001, 77, '2023-07-30 21:37:24', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 21:38:02', _binary 0x7f000001, 80, '2023-07-30 21:38:01', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 22:16:16', _binary 0x7f000001, 77, '2023-07-30 22:16:16', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 23:01:30', _binary 0xc0a80005, 77, '2023-07-30 23:01:29', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 23:01:31', _binary 0xc0a80005, 77, '2023-07-30 23:01:30', 2);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 23:01:32', _binary 0xc0a80005, 77, '2023-07-30 23:01:31', 2);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 23:09:54', _binary 0xc0a80005, 77, '2023-07-30 23:09:53', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 23:15:11', _binary 0xc0a80005, 77, '2023-07-30 23:15:10', 2);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 23:15:12', _binary 0xc0a80005, 77, '2023-07-30 23:15:12', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 23:15:14', _binary 0xc0a80005, 77, '2023-07-30 23:15:13', 2);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 23:15:15', _binary 0xc0a80005, 77, '2023-07-30 23:15:14', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 23:15:23', _binary 0xc0a80005, 77, '2023-07-30 23:15:23', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 23:15:40', _binary 0xc0a80005, 77, '2023-07-30 23:15:39', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 23:18:18', _binary 0xc0a80005, 77, '2023-07-30 23:18:17', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 23:21:19', _binary 0xc0a80005, 77, '2023-07-30 23:21:18', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 23:24:44', _binary 0xc0a80005, 77, '2023-07-30 23:24:43', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 23:24:46', _binary 0xc0a80005, 77, '2023-07-30 23:24:45', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 23:25:32', _binary 0xc0a80005, 77, '2023-07-30 23:25:31', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 23:25:46', _binary 0xc0a80005, 77, '2023-07-30 23:25:45', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-30 23:25:53', _binary 0xc0a80005, 80, '2023-07-30 23:25:52', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-31 00:16:13', _binary 0xc0a80005, 77, '2023-07-31 00:16:12', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-31 00:16:16', _binary 0xc0a80005, 77, '2023-07-31 00:16:15', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-31 00:24:35', _binary 0xc0a80005, 77, '2023-07-31 00:24:35', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-31 00:24:39', _binary 0xc0a80005, 80, '2023-07-31 00:24:39', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-31 00:24:45', _binary 0xc0a80005, 76, '2023-07-31 00:24:45', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-31 00:28:23', _binary 0xc0a80005, 77, '2023-07-31 00:28:23', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-31 00:28:25', _binary 0xc0a80005, 80, '2023-07-31 00:28:24', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-31 00:28:52', _binary 0xc0a80005, 78, '2023-07-31 00:28:51', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-31 00:28:54', _binary 0xc0a80005, 79, '2023-07-31 00:28:54', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-31 00:28:55', _binary 0xc0a80005, 80, '2023-07-31 00:28:54', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-31 00:28:56', _binary 0xc0a80005, 69, '2023-07-31 00:28:55', 2);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-31 00:28:57', _binary 0xc0a80005, 71, '2023-07-31 00:28:57', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-31 00:28:58', _binary 0xc0a80005, 72, '2023-07-31 00:28:57', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-31 00:28:59', _binary 0xc0a80005, 73, '2023-07-31 00:28:59', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-31 00:29:00', _binary 0xc0a80005, 75, '2023-07-31 00:29:00', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-31 00:29:03', _binary 0xc0a80005, 78, '2023-07-31 00:29:03', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-31 00:29:04', _binary 0xc0a80005, 79, '2023-07-31 00:29:04', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-31 00:29:05', _binary 0xc0a80005, 80, '2023-07-31 00:29:04', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-31 00:33:11', _binary 0xc0a80005, 80, '2023-07-31 00:33:10', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-31 00:33:44', _binary 0xc0a80005, 75, '2023-07-31 00:33:44', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-31 00:34:21', _binary 0xc0a80005, 77, '2023-07-31 00:34:20', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-31 00:38:43', _binary 0xc0a80005, 77, '2023-07-31 00:38:43', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-31 00:42:00', _binary 0xc0a80005, 80, '2023-07-31 00:42:00', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-31 00:42:04', _binary 0xc0a80005, 80, '2023-07-31 00:42:03', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-31 00:42:07', _binary 0xc0a80005, 75, '2023-07-31 00:42:06', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-31 00:42:09', _binary 0xc0a80005, 70, '2023-07-31 00:42:09', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-31 00:42:14', _binary 0xc0a80005, 73, '2023-07-31 00:42:14', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-31 00:42:21', _binary 0xc0a80005, 72, '2023-07-31 00:42:21', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-31 00:42:33', _binary 0xc0a80005, 69, '2023-07-31 00:42:32', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-31 00:42:41', _binary 0xc0a80005, 69, '2023-07-31 00:42:41', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-31 00:43:13', _binary 0xc0a80005, 75, '2023-07-31 00:43:13', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-31 00:43:19', _binary 0xc0a80005, 78, '2023-07-31 00:43:19', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-31 00:43:20', _binary 0xc0a80005, 79, '2023-07-31 00:43:20', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-31 00:43:21', _binary 0xc0a80005, 80, '2023-07-31 00:43:21', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-31 00:43:22', _binary 0xc0a80005, 69, '2023-07-31 00:43:22', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-31 00:43:23', _binary 0xc0a80005, 70, '2023-07-31 00:43:23', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-31 00:43:24', _binary 0xc0a80005, 71, '2023-07-31 00:43:24', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-07-31 00:51:58', _binary 0x7f000001, 79, '2023-07-31 00:51:57', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 20:31:54', _binary 0x7f000001, 79, '2023-08-01 20:31:53', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 20:32:00', _binary 0x7f000001, 77, '2023-08-01 20:32:00', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 20:32:11', _binary 0x7f000001, 77, '2023-08-01 20:32:11', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 20:35:03', _binary 0x7f000001, 77, '2023-08-01 20:35:03', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 20:35:13', _binary 0x7f000001, 77, '2023-08-01 20:35:13', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 20:36:48', _binary 0x7f000001, 77, '2023-08-01 20:36:48', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 20:36:59', _binary 0x7f000001, 77, '2023-08-01 20:36:58', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 20:41:46', _binary 0x7f000001, 77, '2023-08-01 20:41:46', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 20:41:57', _binary 0x7f000001, 77, '2023-08-01 20:41:57', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 20:47:11', _binary 0x7f000001, 77, '2023-08-01 20:47:11', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 20:47:22', _binary 0x7f000001, 77, '2023-08-01 20:47:21', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 20:52:38', _binary 0x7f000001, 77, '2023-08-01 20:52:38', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 20:52:48', _binary 0x7f000001, 77, '2023-08-01 20:52:47', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 20:53:21', _binary 0x7f000001, 77, '2023-08-01 20:53:21', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 20:53:31', _binary 0x7f000001, 77, '2023-08-01 20:53:31', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 20:54:20', _binary 0x7f000001, 77, '2023-08-01 20:54:20', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 20:54:31', _binary 0x7f000001, 77, '2023-08-01 20:54:30', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 20:55:40', _binary 0x7f000001, 71, '2023-08-01 20:55:40', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 21:07:30', _binary 0x7f000001, 71, '2023-08-01 21:07:30', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 21:09:14', _binary 0x7f000001, 71, '2023-08-01 21:09:14', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 21:09:58', _binary 0x7f000001, 71, '2023-08-01 21:09:57', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 21:10:10', _binary 0x7f000001, 71, '2023-08-01 21:10:09', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 21:11:01', _binary 0x7f000001, 71, '2023-08-01 21:11:00', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 21:11:13', _binary 0x7f000001, 71, '2023-08-01 21:11:12', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 21:11:53', _binary 0x7f000001, 71, '2023-08-01 21:11:53', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 21:11:56', _binary 0x7f000001, 71, '2023-08-01 21:11:56', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 21:12:54', _binary 0x7f000001, 71, '2023-08-01 21:12:54', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 21:13:01', _binary 0x7f000001, 71, '2023-08-01 21:13:00', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 21:13:26', _binary 0x7f000001, 71, '2023-08-01 21:13:25', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 21:13:43', _binary 0x7f000001, 71, '2023-08-01 21:13:43', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 21:13:54', _binary 0x7f000001, 71, '2023-08-01 21:13:54', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 21:13:56', _binary 0x7f000001, 71, '2023-08-01 21:13:56', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 21:14:30', _binary 0x7f000001, 71, '2023-08-01 21:14:30', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 21:14:44', _binary 0x7f000001, 71, '2023-08-01 21:14:44', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 21:15:20', _binary 0x7f000001, 71, '2023-08-01 21:15:20', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 21:15:23', _binary 0x7f000001, 71, '2023-08-01 21:15:23', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 21:16:36', _binary 0x7f000001, 71, '2023-08-01 21:16:35', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 21:16:48', _binary 0x7f000001, 71, '2023-08-01 21:16:48', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 21:17:08', _binary 0x7f000001, 71, '2023-08-01 21:17:08', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 21:17:12', _binary 0x7f000001, 71, '2023-08-01 21:17:11', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 21:17:53', _binary 0x7f000001, 71, '2023-08-01 21:17:53', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 21:17:54', _binary 0x7f000001, 71, '2023-08-01 21:17:53', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 21:18:06', _binary 0x7f000001, 71, '2023-08-01 21:18:05', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 21:18:08', _binary 0x7f000001, 71, '2023-08-01 21:18:08', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 21:18:11', _binary 0x7f000001, 71, '2023-08-01 21:18:10', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 21:18:13', _binary 0x7f000001, 71, '2023-08-01 21:18:13', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 21:18:29', _binary 0x7f000001, 71, '2023-08-01 21:18:29', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 21:18:35', _binary 0x7f000001, 71, '2023-08-01 21:18:35', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 21:22:00', _binary 0x7f000001, 79, '2023-08-01 21:22:00', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 21:23:44', _binary 0x7f000001, 77, '2023-08-01 21:23:44', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 21:26:40', _binary 0x7f000001, 77, '2023-08-01 21:26:40', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 21:26:50', _binary 0x7f000001, 77, '2023-08-01 21:26:50', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 21:28:45', _binary 0x7f000001, 77, '2023-08-01 21:28:45', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 21:29:23', _binary 0x7f000001, 77, '2023-08-01 21:29:22', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-01 21:44:22', _binary 0x7f000001, 76, '2023-08-01 21:44:21', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-05 23:51:21', _binary 0x7f000001, 79, '2023-08-05 23:51:20', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-05 23:53:07', _binary 0x7f000001, 79, '2023-08-05 23:53:06', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-05 23:57:44', _binary 0x7f000001, 79, '2023-08-05 23:57:44', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-05 23:59:06', _binary 0x7f000001, 79, '2023-08-05 23:59:05', NULL);
INSERT IGNORE INTO `article_statistic` (`timestamp`, `ip`, `articleId`, `createdAt`, `duplicate`) VALUES
	('2023-08-05 23:59:37', _binary 0x7f000001, 79, '2023-08-05 23:59:35', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
