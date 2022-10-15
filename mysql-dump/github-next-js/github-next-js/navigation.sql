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

-- Дамп структуры для таблица github-next-js.navigation
CREATE TABLE IF NOT EXISTS `navigation` (
  `page_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_page_id` int(10) unsigned DEFAULT NULL,
  `page_name` varchar(512) DEFAULT NULL,
  `page_path` varchar(1024) NOT NULL,
  `page_type` int(11) DEFAULT NULL,
  `show_in_menu` tinyint(1) DEFAULT NULL,
  `menu_index` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Дамп данных таблицы github-next-js.navigation: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `navigation` DISABLE KEYS */;
INSERT IGNORE INTO `navigation` (`page_id`, `parent_page_id`, `page_name`, `page_path`, `page_type`, `show_in_menu`, `menu_index`) VALUES
	(1, 1, 'Главная', '/', NULL, NULL, NULL),
	(2, 1, 'Политика конфиденциальности', '/privacy', NULL, NULL, NULL);
/*!40000 ALTER TABLE `navigation` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
