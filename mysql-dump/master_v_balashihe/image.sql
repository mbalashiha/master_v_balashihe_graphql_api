-- --------------------------------------------------------
-- Хост:                         192.168.0.50
-- Версия сервера:               10.10.3-MariaDB-1:10.10.3+maria~ubu1804 - mariadb.org binary distribution
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

-- Дамп структуры для таблица master_v_balashihe.image
CREATE TABLE IF NOT EXISTS `image` (
  `imageId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `imgSrc` text NOT NULL,
  `width` int(10) unsigned NOT NULL,
  `height` int(10) unsigned NOT NULL,
  `altText` text DEFAULT NULL,
  `format` tinytext DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `originalWidth` int(10) unsigned DEFAULT NULL,
  `originalHeight` int(10) unsigned DEFAULT NULL,
  `pathOfOriginal` text DEFAULT NULL,
  PRIMARY KEY (`imageId`) USING BTREE,
  UNIQUE KEY `uniq_imgSrc` (`imgSrc`(100)) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Дамп данных таблицы master_v_balashihe.image: ~88 rows (приблизительно)
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(5, '/images/Hat-front-black__72990.1603748583.png', 2048, 2048, NULL, NULL, '2022-06-10 19:43:22', '2022-08-14 15:20:49', NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(6, '/images/Hat-back-black__57260.1602591509.png', 2048, 2048, NULL, NULL, '2022-06-10 19:43:22', '2022-08-14 15:20:49', NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(7, '/images/Hat-left-black__51142.1602591510.png', 2048, 2048, NULL, NULL, '2022-06-10 19:43:22', '2022-08-14 15:20:49', NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(8, '/images/Hat-front-white__31525.1602591510.png', 2048, 2048, NULL, NULL, '2022-06-10 19:43:22', '2022-08-14 15:20:49', NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(9, '/images/Men-Jacket-Front-Black__15466.1603283963.png', 2048, 2048, NULL, NULL, '2022-06-10 19:43:22', '2022-08-14 15:20:49', NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(10, '/images/Men-Jacket-Side-Black__68202.1603283961.png', 2048, 2048, NULL, NULL, '2022-06-10 19:43:22', '2022-08-14 15:20:49', NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(11, '/images/Men-Jacket-Back-Black__33864.1603283963.png', 2048, 2048, NULL, NULL, '2022-06-10 19:43:22', '2022-08-14 15:20:49', NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(12, '/images/Men-Jacket-Front-White__95300.1603283963.png', 2048, 2048, NULL, NULL, '2022-06-10 19:43:22', '2022-08-14 15:20:49', NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(13, '/images/Men-Jacket-Side-White__91924.1603283962.png', 2048, 2048, NULL, NULL, '2022-06-10 19:43:22', '2022-08-14 15:20:49', NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(14, '/images/Men-Jacket-Back-White__02866.1603283963.png', 2048, 2048, NULL, NULL, '2022-06-10 19:43:22', '2022-08-14 15:20:49', NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(15, '/images/Men-TShirt-Black-Front__70046.1603748348.png', 2048, 2048, NULL, NULL, '2022-06-10 19:43:22', '2022-08-14 15:20:49', NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(16, '/images/Men-TShirt-Black-Left-Side__72119.1603284781.png', 2048, 2048, NULL, NULL, '2022-06-10 19:43:22', '2022-08-14 15:20:49', NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(17, '/images/Men-TShirt-Black-Back__57266.1603748348.png', 2048, 2048, NULL, NULL, '2022-06-10 19:43:22', '2022-08-14 15:20:49', NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(18, '/images/Men-TShirt-White-Front__99616.1603284781.png', 2048, 2048, NULL, NULL, '2022-06-10 19:43:22', '2022-08-14 15:20:49', NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(19, '/images/Men-TShirt-White-Left-Side__69000.1603284781.png', 2048, 2048, NULL, NULL, '2022-06-10 19:43:22', '2022-08-14 15:20:49', NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(20, '/images/Men-TShirt-White-Back__33450.1603284781.png', 2048, 2048, NULL, NULL, '2022-06-10 19:43:22', '2022-08-14 15:20:49', NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(21, '/uploads/drafts/avatar-nnm-pirate-penguin-1644574095000-71638.jpg', 750, 1000, NULL, 'jpeg', '2022-08-05 17:02:32', '2022-08-05 17:02:32', NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(22, '/uploads/drafts/F1A10725AC9E3847469761D6E058129DC122B2F7327B022884pimgpsh-fullsize-distr-1461589367184-5588046.png', 2560, 1600, NULL, 'png', '2022-08-05 17:04:30', '2022-08-05 17:04:30', NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(23, '/uploads/drafts/Avatar-kartinka-policejskij-smajlik-1614103989630-7372.jpg', 225, 225, NULL, 'jpeg', '2022-08-05 17:04:30', '2022-08-05 17:04:30', NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(24, '/uploads/drafts/gosuslugi-1571928636256-3843558.png', 1250, 1023, NULL, 'png', '2022-08-05 17:04:30', '2022-08-05 17:04:30', NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(25, '/uploads/drafts/DSC03438-1611251723520-1684654.jpg', 1900, 1900, NULL, 'jpeg', '2022-08-05 17:04:30', '2022-08-05 17:04:30', NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(26, '/uploads/drafts/nnm-avatar-120x120-1644231061776-15135.png', 120, 120, NULL, 'png', '2022-08-05 17:04:30', '2022-08-05 17:04:30', NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(27, '/uploads/drafts/nnm-avatar-1644230939702-59712.png', 274, 274, NULL, 'png', '2022-08-05 17:04:30', '2022-08-05 17:04:30', NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(28, '/uploads/drafts/dollardollar-clipart-freebsd-freebsd-devil-1585413601569-373803.png', 920, 1113, NULL, 'png', '2022-08-08 17:52:20', '2022-08-08 17:52:20', NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(29, '/uploads/drafts/20190122-183922-1548255657355-2821872.jpg', 3264, 2448, NULL, 'jpeg', '2022-10-21 16:12:58', '2022-10-21 16:12:58', NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(30, '/uploads/drafts/20190109-155341-1547137177679-2779201.jpg', 3264, 2448, NULL, 'jpeg', '2022-10-21 16:12:58', '2022-10-21 16:12:58', NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(31, '/uploads/drafts/20190122-183919-1548255647195-2788447.jpg', 3264, 2448, NULL, 'jpeg', '2022-10-21 16:12:58', '2022-10-21 16:12:58', NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(32, '/uploads/drafts/20190122-183436-1548255561758-2914105.jpg', 2448, 3264, NULL, 'jpeg', '2022-10-21 16:39:20', '2022-10-21 16:39:20', NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(33, '/uploads/drafts/20180802-164540-1533226123288-698292.jpg', 3264, 2448, NULL, 'jpeg', '2022-10-21 16:39:20', '2022-10-21 16:39:20', NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(34, '/uploads/drafts/20190122-183821-1548255782314-2720820.jpg', 3264, 2448, NULL, 'jpeg', '2022-10-21 16:39:20', '2022-10-21 16:39:20', NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(35, '/uploads/drafts/20180802-164558-1533226412229-719093.jpg', 3264, 2448, NULL, 'jpeg', '2022-10-21 18:43:20', '2022-10-21 18:43:20', NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(36, '/uploads/drafts/20190109-124249-1547137265575-2378789.jpg', 2448, 3264, NULL, 'jpeg', '2022-10-21 18:43:20', '2022-10-21 18:43:20', NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(37, '/uploads/drafts/20190109-124304-1547137252170-2419720.jpg', 3264, 2448, NULL, 'jpeg', '2022-10-21 18:43:20', '2022-10-21 18:43:20', NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(38, '/uploads/drafts/20190109-155332-1547137192237-2742885.jpg', 3264, 2448, NULL, 'jpeg', '2022-10-21 18:43:20', '2022-10-21 18:43:20', NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(39, '/uploads/drafts/20190109-155325-1547137204917-2851322.jpg', 3264, 2448, NULL, 'jpeg', '2022-10-21 18:43:20', '2022-10-21 18:43:20', NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(40, '/uploads/drafts/20190122-183315-1548255518626-2543805.jpg', 2448, 3264, NULL, 'jpeg', '2022-10-23 17:57:00', '2022-10-23 17:57:00', NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(41, '/uploads/drafts/120180802-162215-1533224898490-2695602.jpg', 2448, 3264, NULL, 'jpeg', '2022-10-23 17:57:00', '2022-10-23 17:57:00', NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(42, '/uploads/drafts/balashikha-computer-master-120180802-162215-1533224898490-2695602.jpg', 3840, 5120, NULL, NULL, '2022-11-10 13:05:58', '2022-11-10 13:05:58', 2448, 3264, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(43, '/uploads/drafts/balashikha-computer-master-20190122-184158-1548255709387-2674673.jpg', 1620, 2160, NULL, NULL, '2022-11-10 13:05:58', '2022-11-10 13:05:58', 2448, 3264, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(44, '/uploads/drafts/balashikha-computer-master-sort-svgrepo-com-1667412435777-1166.svg', 3840, 3840, NULL, NULL, '2022-11-10 13:05:58', '2022-11-10 13:05:58', 489, 489, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(45, '/uploads/drafts/balashikha-computer-master-20190122-183919-1548255647195-2788447.jpg', 2880, 2160, NULL, NULL, '2022-11-10 13:05:58', '2022-11-10 13:05:58', 3264, 2448, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(46, '/uploads/drafts/balashikha-computer-master-20190122-183922-1548255657355-2821872.jpg', 2880, 2160, NULL, NULL, '2022-11-10 13:05:58', '2022-11-10 13:05:58', 3264, 2448, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(47, '/uploads/drafts/balashikha-computer-master-20190122-183821-1548255782314-2720820.jpg', 2880, 2160, NULL, NULL, '2022-11-10 13:05:58', '2022-11-10 13:05:58', 3264, 2448, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(48, '/uploads/drafts/balashikha-computer-master-20190122-183436-1548255561758-2914105.jpg', 3240, 4320, NULL, NULL, '2022-11-10 13:05:58', '2022-11-10 13:05:58', 2448, 3264, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(49, '/uploads/drafts/balashikha-computer-master-20190109-155341-1547137177679-2779201.jpg', 5760, 4320, NULL, NULL, '2022-11-10 13:05:58', '2022-11-10 13:05:58', 3264, 2448, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(50, '/uploads/drafts/balashikha-computer-master-20190109-155332-1547137192237-2742885.jpg', 5760, 4320, NULL, NULL, '2022-11-10 13:05:58', '2022-11-10 13:05:58', 3264, 2448, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(51, '/uploads/drafts/balashikha-computer-master-20190109-155325-1547137204917-2851322.jpg', 5760, 4320, NULL, NULL, '2022-11-10 13:05:58', '2022-11-10 13:05:58', 3264, 2448, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(52, '/uploads/drafts/balashikha-computer-master-20190122-183315-1548255518626-2543805.jpg', 3240, 4320, NULL, NULL, '2022-11-10 13:05:58', '2022-11-10 13:05:58', 2448, 3264, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(53, '/uploads/drafts/balashikha-computer-master-20190109-124304-1547137252170-2419720.jpg', 5760, 4320, NULL, NULL, '2022-11-10 13:05:58', '2022-11-10 13:05:58', 3264, 2448, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(54, '/uploads/drafts/balashikha-computer-master-20180802-164558-1533226412229-719093.jpg', 5760, 4320, NULL, NULL, '2022-11-10 13:05:58', '2022-11-10 13:05:58', 3264, 2448, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(55, '/uploads/drafts/balashikha-computer-master-20180802-164540-1533226123288-698292.jpg', 2880, 2160, NULL, NULL, '2022-11-10 13:05:58', '2022-11-10 13:05:58', 3264, 2448, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(56, '/uploads/drafts/balashikha-computer-master-20180521-080439-1526880297818-2271365.jpg', 1620, 2160, NULL, NULL, '2022-11-10 13:05:58', '2022-11-10 13:05:58', 2448, 3264, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(57, '/uploads/drafts/balashikha-computer-master-20190109-124249-1547137265575-2378789.jpg', 3240, 4320, NULL, NULL, '2022-11-10 13:05:58', '2022-11-10 13:05:58', 2448, 3264, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(58, '/uploads/drafts/draft-balashikha-computer-master-forum-image-1667929490000-5815.jpg', 7420, 3840, NULL, NULL, '2022-11-10 17:45:49', '2022-11-10 17:45:49', 400, 207, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(59, '/uploads/drafts/draft-balashikha-computer-master-content-uploads-41ova5sqn0l1-1477781790000-17228.jpg', 5754, 3840, NULL, NULL, '2022-11-10 17:45:49', '2022-11-10 17:45:49', 487, 325, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(60, '/uploads/uploads/drafts/drafts/balashikha-computer-master-20190109-155341-1547137177679-2779201.jpg', 5760, 4320, NULL, NULL, '2022-11-10 17:48:34', '2022-11-10 17:48:34', 3264, 2448, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(61, '/uploads/uploads/drafts/drafts/balashikha-computer-master-20190109-155325-1547137204917-2851322.jpg', 5760, 4320, NULL, NULL, '2022-11-10 17:48:34', '2022-11-10 17:48:34', 3264, 2448, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(62, '/uploads/drafts/balashikha-computer-master-avatar-nnm-Cutted-to-Squere-pirate-penguin-1644835172956-121540.jpg', 3840, 3840, NULL, NULL, '2022-11-12 15:05:46', '2022-11-12 15:05:46', 683, 683, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(63, '/uploads/drafts/draft-balashikha-computer-master-files-publ-broken-screen-469x352-1477781754000-46259.jpg', 5116, 3839, NULL, NULL, '2022-11-20 22:07:08', '2022-11-20 22:07:08', 469, 352, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(64, '/image/upload/webp/avatar-nnm-another-copy-pinguine-pirate-1644835997144-299703.webp', 678, 678, NULL, NULL, '2023-03-13 18:06:05', '2023-03-13 18:06:05', 678, 678, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(65, '/image/upload/webp/$$-clipart-freebsd-freebsd-devil-1585413601569-373803.webp', 920, 1113, NULL, NULL, '2023-03-13 18:07:20', '2023-03-13 18:07:20', 920, 1113, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(66, '/image/upload/webp/$$-devil-pngfuel-cutted-avatar-1671787729862-53935.webp', 821, 795, NULL, NULL, '2023-03-13 19:18:38', '2023-03-13 19:18:38', 821, 795, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(67, '/image/upload/webp/avatar-dsc03438-1611251798645-30908-png.webp', 120, 120, NULL, NULL, '2023-03-13 19:20:37', '2023-03-13 19:20:37', 120, 120, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(68, '/image/upload/webp/kisspng-bsd-daemon-berkeley-1609757841238-116702-jpg.webp', 530, 530, NULL, NULL, '2023-03-13 19:34:25', '2023-03-13 19:34:25', 530, 530, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(69, '/image/upload/webp/dollardollar-devil-pngfuel-com-1585413620282-488653-png.webp', 1000, 1032, NULL, NULL, '2023-03-13 19:55:31', '2023-03-13 19:55:31', 1000, 1032, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(71, '/image/upload/webp/avatar-kartinka-policejskij-smajlik-1614103989630-7372-jpg.webp', 225, 225, NULL, NULL, '2023-03-13 20:01:18', '2023-03-13 20:01:18', 225, 225, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(74, '/image/upload/webp/avatar-nnm-another-copy-pinguine-pirate-1644835997144-299703-png.webp', 678, 678, NULL, NULL, '2023-03-13 20:10:07', '2023-03-13 20:10:07', 678, 678, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(75, '/image/upload/webp/dollardollar-devil-pngfuel-jpeg-avatar-1671787432551-79883-jpg.webp', 1000, 1032, NULL, NULL, '2023-03-13 20:10:59', '2023-03-13 20:10:59', 1000, 1032, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(77, '/image/upload/webp/nnm-avatar-1644230939702-59712-png.webp', 274, 274, NULL, NULL, '2023-03-14 00:36:31', '2023-03-14 00:36:31', 274, 274, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(83, '/image/upload/webp/kisspng-bsd-daemon-berkeley-1585413536140-69971-jpg.webp', 900, 580, NULL, NULL, '2023-03-14 14:58:58', '2023-03-14 14:58:58', 900, 580, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(91, '/image/upload/webp/dollardollar-devil-pngfuel-cutted-avatar-1671787729862-53935-jpg.webp', 821, 795, NULL, NULL, '2023-03-14 15:18:05', '2023-03-14 15:18:05', 821, 795, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(93, '/image/upload/webp/dollardollar-clipart-freebsd-freebsd-devil-1585413601569-373803-png.webp', 920, 1113, NULL, NULL, '2023-03-14 15:18:06', '2023-03-14 15:18:06', 920, 1113, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(94, '/image/upload/webp/100x100-avatar-rutracker-pirate-penguin-1666608244482-14169-png.webp', 100, 100, NULL, NULL, '2023-03-14 15:18:06', '2023-03-14 15:18:06', 100, 100, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(96, '/image/upload/webp/avatar-nnm-small-120x120-pirate-penguin-1644835286015-12208-jpg.webp', 120, 120, NULL, NULL, '2023-03-14 15:18:06', '2023-03-14 15:18:06', 120, 120, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(97, '/image/upload/webp/avatar-nnm-120x120-pirate-penguin-1644836043083-17486-png.webp', 120, 120, NULL, NULL, '2023-03-14 15:18:06', '2023-03-14 15:18:06', 120, 120, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(99, '/image/upload/webp/avatar-nnm-cutted-to-squere-pirate-penguin-1644835172956-121540-jpg.webp', 683, 683, NULL, NULL, '2023-03-14 15:18:07', '2023-03-14 15:18:07', 683, 683, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(101, '/image/upload/webp/f1a10725ac9e3847469761d6e058129dc122b2f7327b022884pimgpsh-fullsize-distr-1461589367184-5588046-png.webp', 2560, 1600, NULL, NULL, '2023-03-14 15:42:40', '2023-03-14 15:42:40', 2560, 1600, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(111, '/image/upload/webp/avatar-nnm-pirate-penguin-1644574095000-71638-jpg.webp', 750, 1000, NULL, NULL, '2023-03-14 16:13:55', '2023-03-14 16:13:55', 750, 1000, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(112, '/image/upload/webp/dsc03438-1611251723520-1684654-jpg.webp', 1900, 1900, NULL, NULL, '2023-03-14 16:13:57', '2023-03-14 16:13:57', 1900, 1900, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(113, '/image/upload/webp/gosuslugi-1571928636256-3843558-png.webp', 1250, 1023, NULL, NULL, '2023-03-14 16:13:57', '2023-03-14 16:13:57', 1250, 1023, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(115, '/image/upload/webp/nnm-avatar-120x120-1644231061776-15135-png.webp', 120, 120, NULL, NULL, '2023-03-14 16:13:57', '2023-03-14 16:13:57', 120, 120, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(117, '/image/upload/webp/000-1592655581337-105468-webp.webp', 1287, 712, NULL, NULL, '2023-03-14 16:13:58', '2023-03-14 16:13:58', 1287, 712, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(147, '/image/upload/webp/balashiha-remont-compute-hardware-1673206155883-54592-webp.webp', 1029, 740, NULL, NULL, '2023-03-26 19:36:44', '2023-03-26 19:36:44', 1029, 740, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(149, '/image/upload/webp/virus-1673192124984-112217-png.webp', 750, 750, NULL, NULL, '2023-03-26 22:24:24', '2023-03-26 22:24:24', 750, 750, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(150, '/image/upload/webp/another-2-square-motherboard-dolls-board-1673288192849-916821-jpg.webp', 2048, 2048, NULL, NULL, '2023-04-15 19:05:31', '2023-04-15 19:05:31', 2048, 2048, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(151, '/image/upload/webp/beatiful-micro-chip-background-obrabotano-1681234813669-1987245-jpg.webp', 2187, 1447, NULL, NULL, '2023-04-15 19:07:11', '2023-04-15 19:07:11', 2187, 1447, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(152, '/image/upload/webp/1619084348-16-phonoteka-org-p-remont-kompyuterov-fon-16-1673192290673-484764-webp.webp', 3000, 2000, NULL, NULL, '2023-04-15 19:08:13', '2023-04-15 19:08:13', 3000, 2000, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(153, '/image/upload/webp/kisspng-computer-cases-housings-power-supply-unit-cooler-top-bench-5b2ccd4c4f5428-955011561529662796325-1673210180958-475972-png.webp', 567, 847, NULL, NULL, '2023-04-15 19:10:13', '2023-04-15 19:10:13', 567, 847, NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
