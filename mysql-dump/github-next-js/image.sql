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
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`imageId`) USING BTREE,
  UNIQUE KEY `uniq_imgSrc` (`originalSrc`(100)) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;

-- Дамп данных таблицы github-next-js.image: ~23 rows (приблизительно)
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT IGNORE INTO `image` (`imageId`, `originalSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`) VALUES
	(5, 'Hat-front-black__72990.1603748583.png', 2048, 2048, NULL, NULL, '2022-06-10 22:43:22', '2022-06-10 22:43:42'),
	(6, 'Hat-back-black__57260.1602591509.png', 2048, 2048, NULL, NULL, '2022-06-10 22:43:22', '2022-06-10 22:43:42'),
	(7, 'Hat-left-black__51142.1602591510.png', 2048, 2048, NULL, NULL, '2022-06-10 22:43:22', '2022-06-10 22:43:42'),
	(8, 'Hat-front-white__31525.1602591510.png', 2048, 2048, NULL, NULL, '2022-06-10 22:43:22', '2022-06-10 22:43:42'),
	(9, 'Men-Jacket-Front-Black__15466.1603283963.png', 2048, 2048, NULL, NULL, '2022-06-10 22:43:22', '2022-06-10 22:43:42'),
	(10, 'Men-Jacket-Side-Black__68202.1603283961.png', 2048, 2048, NULL, NULL, '2022-06-10 22:43:22', '2022-06-10 22:43:42'),
	(11, 'Men-Jacket-Back-Black__33864.1603283963.png', 2048, 2048, NULL, NULL, '2022-06-10 22:43:22', '2022-06-10 22:43:42'),
	(12, 'Men-Jacket-Front-White__95300.1603283963.png', 2048, 2048, NULL, NULL, '2022-06-10 22:43:22', '2022-06-10 22:43:42'),
	(13, 'Men-Jacket-Side-White__91924.1603283962.png', 2048, 2048, NULL, NULL, '2022-06-10 22:43:22', '2022-06-10 22:43:42'),
	(14, 'Men-Jacket-Back-White__02866.1603283963.png', 2048, 2048, NULL, NULL, '2022-06-10 22:43:22', '2022-06-10 22:43:42'),
	(15, 'Men-TShirt-Black-Front__70046.1603748348.png', 2048, 2048, NULL, NULL, '2022-06-10 22:43:22', '2022-06-10 22:43:42'),
	(16, 'Men-TShirt-Black-Left-Side__72119.1603284781.png', 2048, 2048, NULL, NULL, '2022-06-10 22:43:22', '2022-06-10 22:43:42'),
	(17, 'Men-TShirt-Black-Back__57266.1603748348.png', 2048, 2048, NULL, NULL, '2022-06-10 22:43:22', '2022-06-10 22:43:42'),
	(18, 'Men-TShirt-White-Front__99616.1603284781.png', 2048, 2048, NULL, NULL, '2022-06-10 22:43:22', '2022-06-10 22:43:42'),
	(19, 'Men-TShirt-White-Left-Side__69000.1603284781.png', 2048, 2048, NULL, NULL, '2022-06-10 22:43:22', '2022-06-10 22:43:42'),
	(20, 'Men-TShirt-White-Back__33450.1603284781.png', 2048, 2048, NULL, NULL, '2022-06-10 22:43:22', '2022-06-10 22:43:42'),
	(21, '/uploads/drafts/avatar-nnm-pirate-penguin-1644574095000-71638.jpg', 750, 1000, NULL, 'jpeg', '2022-08-05 20:02:32', '2022-08-05 20:02:32'),
	(22, '/uploads/drafts/F1A10725AC9E3847469761D6E058129DC122B2F7327B022884pimgpsh-fullsize-distr-1461589367184-5588046.png', 2560, 1600, NULL, 'png', '2022-08-05 20:04:30', '2022-08-05 20:04:30'),
	(23, '/uploads/drafts/Avatar-kartinka-policejskij-smajlik-1614103989630-7372.jpg', 225, 225, NULL, 'jpeg', '2022-08-05 20:04:30', '2022-08-05 20:04:30'),
	(24, '/uploads/drafts/gosuslugi-1571928636256-3843558.png', 1250, 1023, NULL, 'png', '2022-08-05 20:04:30', '2022-08-05 20:04:30'),
	(25, '/uploads/drafts/DSC03438-1611251723520-1684654.jpg', 1900, 1900, NULL, 'jpeg', '2022-08-05 20:04:30', '2022-08-05 20:04:30'),
	(26, '/uploads/drafts/nnm-avatar-120x120-1644231061776-15135.png', 120, 120, NULL, 'png', '2022-08-05 20:04:30', '2022-08-05 20:04:30'),
	(27, '/uploads/drafts/nnm-avatar-1644230939702-59712.png', 274, 274, NULL, 'png', '2022-08-05 20:04:30', '2022-08-05 20:04:30');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
