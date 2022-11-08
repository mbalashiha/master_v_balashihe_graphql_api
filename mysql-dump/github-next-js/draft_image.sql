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

-- Дамп данных таблицы github-next-js.draft_image: ~5 rows (приблизительно)
/*!40000 ALTER TABLE `draft_image` DISABLE KEYS */;
INSERT IGNORE INTO `draft_image` (`draftImageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `existingImageId`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(_binary 0x2F8C8FA85F8811EDBD1B60A44C4F528E, '/uploads/drafts/20190122-183922-1548255657355-2821872.jpg', 3264, 2448, NULL, 'jpeg', '2022-10-21 19:12:58', '2022-11-08 20:10:06', 29, NULL, NULL, NULL),
	(_binary 0x2F8C97035F8811EDBD1B60A44C4F528E, '/uploads/drafts/20190122-183436-1548255561758-2914105.jpg', 2448, 3264, NULL, 'jpeg', '2022-10-21 19:39:20', '2022-11-08 20:10:06', 32, NULL, NULL, NULL),
	(_binary 0x2F8C98885F8811EDBD1B60A44C4F528E, '/uploads/drafts/20190122-183821-1548255782314-2720820.jpg', 3264, 2448, NULL, 'jpeg', '2022-10-21 19:39:20', '2022-11-08 20:10:06', 34, NULL, NULL, NULL),
	(_binary 0x798BF68B5F9C11EDBD1B60A44C4F528E, '/uploads/drafts/draft-content-uploads-41ova5sqn0l1-1477781790000-17228.jpg', 2158, 1440, NULL, NULL, '2022-11-08 22:35:20', '2022-11-08 22:35:20', NULL, 487, 325, '/originals-uploaded/original-content-uploads-41ova5sqn0l1-1477781790000-17228.jpg'),
	(_binary 0x9B00EDFC53D711EDB34C60A44C4F528E, '/uploads/drafts/20190109-155341-1547137177679-2779201.jpg', 3264, 2448, NULL, 'jpeg', '2022-10-24 23:08:20', '2022-10-24 23:08:20', NULL, NULL, NULL, NULL),
	(_binary 0xCF252D835AD611EDB47F60A44C4F528E, '/uploads/drafts/20190109-155332-1547137192237-2742885.jpg', 3264, 2448, NULL, 'jpeg', '2022-10-21 21:43:20', '2022-11-02 20:50:19', 38, NULL, NULL, NULL);
/*!40000 ALTER TABLE `draft_image` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
