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

-- Дамп структуры для таблица github-next-js.managers
CREATE TABLE IF NOT EXISTS `managers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(64) DEFAULT NULL,
  `password` char(49) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `is_admin` tinyint(1) DEFAULT NULL,
  `friendly_name` tinytext DEFAULT NULL,
  `email` text DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `Индекс 2` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Дамп данных таблицы github-next-js.managers: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `managers` DISABLE KEYS */;
INSERT IGNORE INTO `managers` (`id`, `login`, `password`, `is_admin`, `friendly_name`, `email`, `created`, `updated`) VALUES
	(1, 'me-mini', '76404901*072A21148F03AB0EF6A2D97E93F060CFB8559926', NULL, 'Владелец', NULL, '2022-09-28 17:36:45', '2022-09-28 17:36:45');
/*!40000 ALTER TABLE `managers` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
