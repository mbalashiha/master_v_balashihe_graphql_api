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

-- Дамп данных таблицы github-next-js.draft_image: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `draft_image` DISABLE KEYS */;
INSERT IGNORE INTO `draft_image` (`draftImageId`, `originalSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`) VALUES
	(_binary 0x0652C26AE8F511ECB6DE02004C4F4F50, '/uploads/drafts/avatar-nnm-Small-120x120-pirate-penguin-1644835286015-12208.jpg', 120, 120, NULL, 'jpeg', '2022-06-10 22:41:05', '2022-06-10 22:41:54'),
	(_binary 0x259E6B3CE8FA11ECB6DE02004C4F4F50, '/uploads/drafts/avatar-nnm-pirate-penguin-1644574095000-71638.jpg', 750, 1000, NULL, 'jpeg', '2022-06-10 23:16:04', '2022-06-10 23:16:04'),
	(_binary 0x25AB944CE8FA11ECB6DE02004C4F4F50, '/uploads/drafts/nnm-avatar-120x120-1644231061776-15135.png', 120, 120, NULL, 'png', '2022-06-10 23:16:04', '2022-06-10 23:16:04'),
	(_binary 0x25AC9DCCE8FA11ECB6DE02004C4F4F50, '/uploads/drafts/Avatar-kartinka-policejskij-smajlik-1614103989630-7372.jpg', 225, 225, NULL, 'jpeg', '2022-06-10 23:16:04', '2022-06-10 23:16:04'),
	(_binary 0x25ADBF23E8FA11ECB6DE02004C4F4F50, '/uploads/drafts/gosuslugi-1571928636256-3843558.png', 1250, 1023, NULL, 'png', '2022-06-10 23:16:04', '2022-06-10 23:16:04'),
	(_binary 0x3E6F849FE8F911ECB6DE02004C4F4F50, '/uploads/drafts/DSC03438-1611251723520-1684654.jpg', 1900, 1900, NULL, 'jpeg', '2022-06-10 23:09:36', '2022-06-10 23:09:36'),
	(_binary 0x4F481004E8F911ECB6DE02004C4F4F50, '/uploads/drafts/nnm-avatar-1644230939702-59712.png', 274, 274, NULL, 'png', '2022-06-10 23:10:04', '2022-06-10 23:10:04'),
	(_binary 0xB109C619E8F611ECB6DE02004C4F4F50, '/uploads/drafts/dollardollar-clipart-freebsd-freebsd-devil-1585413601569-373803.png', 920, 1113, NULL, 'png', '2022-06-10 22:51:20', '2022-06-10 22:51:20'),
	(_binary 0xCA36EE90E8F911ECB6DE02004C4F4F50, '/uploads/drafts/F1A10725AC9E3847469761D6E058129DC122B2F7327B022884pimgpsh-fullsize-distr-1461589367184-5588046.png', 2560, 1600, NULL, 'png', '2022-06-10 23:13:31', '2022-06-10 23:13:31'),
	(_binary 0xCC6074ACE8F611ECB6DE02004C4F4F50, '/uploads/drafts/avatar-DSC03438-1611251798645-30908.png', 120, 120, NULL, 'png', '2022-06-10 22:52:06', '2022-06-10 22:52:06');
/*!40000 ALTER TABLE `draft_image` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
