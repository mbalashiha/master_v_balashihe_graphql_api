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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- Дамп данных таблицы github-next-js.image: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT IGNORE INTO `image` (`imageId`, `originalSrc`, `width`, `height`, `altText`, `format`) VALUES
	(5, 'Hat-front-black__72990.1603748583.png', 2048, 2048, NULL, NULL),
	(6, 'Hat-back-black__57260.1602591509.png', 2048, 2048, NULL, NULL),
	(7, 'Hat-left-black__51142.1602591510.png', 2048, 2048, NULL, NULL),
	(8, 'Hat-front-white__31525.1602591510.png', 2048, 2048, NULL, NULL),
	(9, 'Men-Jacket-Front-Black__15466.1603283963.png', 2048, 2048, NULL, NULL),
	(10, 'Men-Jacket-Side-Black__68202.1603283961.png', 2048, 2048, NULL, NULL),
	(11, 'Men-Jacket-Back-Black__33864.1603283963.png', 2048, 2048, NULL, NULL),
	(12, 'Men-Jacket-Front-White__95300.1603283963.png', 2048, 2048, NULL, NULL),
	(13, 'Men-Jacket-Side-White__91924.1603283962.png', 2048, 2048, NULL, NULL),
	(14, 'Men-Jacket-Back-White__02866.1603283963.png', 2048, 2048, NULL, NULL),
	(15, 'Men-TShirt-Black-Front__70046.1603748348.png', 2048, 2048, NULL, NULL),
	(16, 'Men-TShirt-Black-Left-Side__72119.1603284781.png', 2048, 2048, NULL, NULL),
	(17, 'Men-TShirt-Black-Back__57266.1603748348.png', 2048, 2048, NULL, NULL),
	(18, 'Men-TShirt-White-Front__99616.1603284781.png', 2048, 2048, NULL, NULL),
	(19, 'Men-TShirt-White-Left-Side__69000.1603284781.png', 2048, 2048, NULL, NULL),
	(20, 'Men-TShirt-White-Back__33450.1603284781.png', 2048, 2048, NULL, NULL);
/*!40000 ALTER TABLE `image` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
