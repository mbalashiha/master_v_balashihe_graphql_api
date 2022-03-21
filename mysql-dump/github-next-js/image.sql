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

-- Дамп структуры для таблица github-next-js.image
CREATE TABLE IF NOT EXISTS `image` (
  `imageId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `originalSrc` text NOT NULL,
  `width` int(10) unsigned NOT NULL,
  `height` int(10) unsigned NOT NULL,
  `altText` text DEFAULT NULL,
  `format` tinytext DEFAULT NULL,
  PRIMARY KEY (`imageId`) USING BTREE,
  UNIQUE KEY `uniq_imgSrc` (`originalSrc`(100)) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Дамп данных таблицы github-next-js.image: ~1 rows (приблизительно)
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT IGNORE INTO `image` (`imageId`, `originalSrc`, `width`, `height`, `altText`, `format`) VALUES
	(1, '/uploaded/20220202-154836438-my-new-motherboard-20190122-183919-whiynweq.jpg', 3264, 2448, NULL, 'jpeg');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
