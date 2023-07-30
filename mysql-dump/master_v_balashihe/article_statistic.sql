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

-- Дамп данных таблицы master_v_balashihe.article_statistic: ~7 rows (приблизительно)
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

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
