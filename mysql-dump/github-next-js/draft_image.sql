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

-- Дамп структуры для таблица github-next-js.draft_image
CREATE TABLE IF NOT EXISTS `draft_image` (
  `draftImageId` binary(16) NOT NULL DEFAULT unhex(replace(uuid(),'-','')),
  `originalSrc` text NOT NULL,
  `width` int(10) unsigned NOT NULL,
  `height` int(10) unsigned NOT NULL,
  `altText` text DEFAULT NULL,
  `format` tinytext DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`draftImageId`) USING BTREE,
  UNIQUE KEY `uniq_imgSrc` (`originalSrc`(100)) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Дамп данных таблицы github-next-js.draft_image: ~8 rows (приблизительно)
/*!40000 ALTER TABLE `draft_image` DISABLE KEYS */;
INSERT IGNORE INTO `draft_image` (`draftImageId`, `originalSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`) VALUES
	(_binary 0x3811ACC8095111ED846D60A44C4F528E, '/uploads/drafts/F1A10725AC9E3847469761D6E058129DC122B2F7327B022884pimgpsh-fullsize-distr-1461589367184-5588046.png', 2560, 1600, NULL, 'png', '2022-07-22 02:59:58', '2022-07-22 02:59:58'),
	(_binary 0x8870E720EDBA11ECB87B02004C4F4F50, '/uploads/drafts/avatar-nnm-Cutted-to-Squere-pirate-penguin-1644835172956-121540.jpg', 683, 683, NULL, 'jpeg', '2022-06-17 00:23:18', '2022-06-17 00:23:18'),
	(_binary 0x9B64B22BECEC11ECB71202004C4F4F50, '/uploads/drafts/avatar-DSC03438-1611251798645-30908.png', 120, 120, NULL, 'png', '2022-06-15 23:49:14', '2022-06-15 23:49:14'),
	(_binary 0xA8170F99EF3E11ECB66302004C4F4F50, '/uploads/drafts/avatar-nnm-Small-120x120-pirate-penguin-1644835286015-12208.jpg', 120, 120, NULL, 'jpeg', '2022-06-18 22:41:36', '2022-06-18 22:41:36'),
	(_binary 0xB41D392FEF3E11ECB66302004C4F4F50, '/uploads/drafts/nnm-avatar-120x120-1644231061776-15135.png', 120, 120, NULL, 'png', '2022-06-18 22:41:56', '2022-06-18 22:41:56'),
	(_binary 0xB84AEF55EF3D11ECB66302004C4F4F50, '/uploads/drafts/kisspng-bsd-daemon-berkeley-1585413536140-69971.jpg', 900, 580, NULL, 'jpeg', '2022-06-18 22:34:54', '2022-06-18 22:34:54'),
	(_binary 0xBE480E3AEF3D11ECB66302004C4F4F50, '/uploads/drafts/avatar-nnm-120x120-pirate-penguin-1644836043083-17486.png', 120, 120, NULL, 'png', '2022-06-18 22:35:04', '2022-06-18 22:35:04');
/*!40000 ALTER TABLE `draft_image` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
