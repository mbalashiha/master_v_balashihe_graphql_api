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
  `imgSrc` text NOT NULL,
  `width` int(10) unsigned NOT NULL,
  `height` int(10) unsigned NOT NULL,
  `altText` text DEFAULT NULL,
  `format` tinytext DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `existingImageId` int(10) unsigned DEFAULT NULL,
  `originalWidth` int(10) unsigned DEFAULT NULL,
  `originalHeight` int(10) unsigned DEFAULT NULL,
  `pathOfOriginal` text DEFAULT NULL,
  PRIMARY KEY (`draftImageId`) USING BTREE,
  UNIQUE KEY `uniq_imgSrc` (`imgSrc`(100)) USING BTREE,
  KEY `FK_draft_image_image` (`existingImageId`),
  CONSTRAINT `FK_draft_image_image` FOREIGN KEY (`existingImageId`) REFERENCES `image` (`imageId`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Дамп данных таблицы github-next-js.draft_image: ~4 rows (приблизительно)
/*!40000 ALTER TABLE `draft_image` DISABLE KEYS */;
INSERT IGNORE INTO `draft_image` (`draftImageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `existingImageId`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(_binary 0x439875CF612111EDB34760A44C4F528E, '/uploads/drafts/draft-balashikha-computer-master-forum-image-1667929490000-5815.jpg', 7420, 3840, NULL, NULL, '2022-11-10 20:45:49', '2022-11-10 20:58:25', 58, 400, 207, NULL),
	(_binary 0x4399761A612111EDB34760A44C4F528E, '/uploads/drafts/draft-balashikha-computer-master-content-uploads-41ova5sqn0l1-1477781790000-17228.jpg', 5754, 3840, NULL, NULL, '2022-11-10 20:45:49', '2022-11-10 20:58:25', 59, 487, 325, NULL),
	(_binary 0x764BCA1C629B11EDB37460A44C4F528E, '/uploads/drafts/balashikha-computer-master-avatar-nnm-Cutted-to-Squere-pirate-penguin-1644835172956-121540.jpg', 3840, 3840, NULL, NULL, '2022-11-12 18:05:38', '2022-11-12 18:05:38', NULL, 683, 683, '/originals/uploaded/balashikha-computer-master-avatar-nnm-Cutted-to-Squere-pirate-penguin-1644835172956-121540.jpg'),
	(_binary 0x7EAFC2F062A311EDB37460A44C4F528E, '/uploads/drafts/balashikha-computer-master-avatar-nnm-another-copy-pinguine-pirate-1644835997144-299703.png', 3840, 3840, NULL, NULL, '2022-11-12 19:03:08', '2022-11-12 19:03:08', NULL, 678, 678, '/originals/uploaded/balashikha-computer-master-avatar-nnm-another-copy-pinguine-pirate-1644835997144-299703.png');
/*!40000 ALTER TABLE `draft_image` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
