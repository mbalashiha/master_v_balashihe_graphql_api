-- --------------------------------------------------------
-- Хост:                         192.168.0.50
-- Версия сервера:               11.0.3-MariaDB-1:11.0.3+maria~ubu2204 - mariadb.org binary distribution
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
  `useAsRandom` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`imageId`) USING BTREE,
  UNIQUE KEY `uniq_imgSrc` (`imgSrc`(100)) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=317 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Дамп данных таблицы master_v_balashihe.image: ~152 rows (приблизительно)
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(5, '/images/Hat-front-black__72990.1603748583.png', 2048, 2048, NULL, NULL, '2022-06-10 19:43:22', '2022-08-14 15:20:49', NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(6, '/images/Hat-back-black__57260.1602591509.png', 2048, 2048, NULL, NULL, '2022-06-10 19:43:22', '2022-08-14 15:20:49', NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(7, '/images/Hat-left-black__51142.1602591510.png', 2048, 2048, NULL, NULL, '2022-06-10 19:43:22', '2022-08-14 15:20:49', NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(8, '/images/Hat-front-white__31525.1602591510.png', 2048, 2048, NULL, NULL, '2022-06-10 19:43:22', '2022-08-14 15:20:49', NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(9, '/images/Men-Jacket-Front-Black__15466.1603283963.png', 2048, 2048, NULL, NULL, '2022-06-10 19:43:22', '2022-08-14 15:20:49', NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(10, '/images/Men-Jacket-Side-Black__68202.1603283961.png', 2048, 2048, NULL, NULL, '2022-06-10 19:43:22', '2022-08-14 15:20:49', NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(11, '/images/Men-Jacket-Back-Black__33864.1603283963.png', 2048, 2048, NULL, NULL, '2022-06-10 19:43:22', '2022-08-14 15:20:49', NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(12, '/images/Men-Jacket-Front-White__95300.1603283963.png', 2048, 2048, NULL, NULL, '2022-06-10 19:43:22', '2022-08-14 15:20:49', NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(13, '/images/Men-Jacket-Side-White__91924.1603283962.png', 2048, 2048, NULL, NULL, '2022-06-10 19:43:22', '2022-08-14 15:20:49', NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(14, '/images/Men-Jacket-Back-White__02866.1603283963.png', 2048, 2048, NULL, NULL, '2022-06-10 19:43:22', '2022-08-14 15:20:49', NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(15, '/images/Men-TShirt-Black-Front__70046.1603748348.png', 2048, 2048, NULL, NULL, '2022-06-10 19:43:22', '2022-08-14 15:20:49', NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(16, '/images/Men-TShirt-Black-Left-Side__72119.1603284781.png', 2048, 2048, NULL, NULL, '2022-06-10 19:43:22', '2022-08-14 15:20:49', NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(17, '/images/Men-TShirt-Black-Back__57266.1603748348.png', 2048, 2048, NULL, NULL, '2022-06-10 19:43:22', '2022-08-14 15:20:49', NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(18, '/images/Men-TShirt-White-Front__99616.1603284781.png', 2048, 2048, NULL, NULL, '2022-06-10 19:43:22', '2022-08-14 15:20:49', NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(19, '/images/Men-TShirt-White-Left-Side__69000.1603284781.png', 2048, 2048, NULL, NULL, '2022-06-10 19:43:22', '2022-08-14 15:20:49', NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(20, '/images/Men-TShirt-White-Back__33450.1603284781.png', 2048, 2048, NULL, NULL, '2022-06-10 19:43:22', '2022-08-14 15:20:49', NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(21, '/uploads/drafts/avatar-nnm-pirate-penguin-1644574095000-71638.jpg', 750, 1000, NULL, 'jpeg', '2022-08-05 17:02:32', '2022-08-05 17:02:32', NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(22, '/uploads/drafts/F1A10725AC9E3847469761D6E058129DC122B2F7327B022884pimgpsh-fullsize-distr-1461589367184-5588046.png', 2560, 1600, NULL, 'png', '2022-08-05 17:04:30', '2022-08-05 17:04:30', NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(23, '/uploads/drafts/Avatar-kartinka-policejskij-smajlik-1614103989630-7372.jpg', 225, 225, NULL, 'jpeg', '2022-08-05 17:04:30', '2022-08-05 17:04:30', NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(24, '/uploads/drafts/gosuslugi-1571928636256-3843558.png', 1250, 1023, NULL, 'png', '2022-08-05 17:04:30', '2022-08-05 17:04:30', NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(25, '/uploads/drafts/DSC03438-1611251723520-1684654.jpg', 1900, 1900, NULL, 'jpeg', '2022-08-05 17:04:30', '2022-08-05 17:04:30', NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(26, '/uploads/drafts/nnm-avatar-120x120-1644231061776-15135.png', 120, 120, NULL, 'png', '2022-08-05 17:04:30', '2022-08-05 17:04:30', NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(27, '/uploads/drafts/nnm-avatar-1644230939702-59712.png', 274, 274, NULL, 'png', '2022-08-05 17:04:30', '2022-08-05 17:04:30', NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(28, '/uploads/drafts/dollardollar-clipart-freebsd-freebsd-devil-1585413601569-373803.png', 920, 1113, NULL, 'png', '2022-08-08 17:52:20', '2022-08-08 17:52:20', NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(29, '/uploads/drafts/20190122-183922-1548255657355-2821872.jpg', 3264, 2448, NULL, 'jpeg', '2022-10-21 16:12:58', '2022-10-21 16:12:58', NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(30, '/uploads/drafts/20190109-155341-1547137177679-2779201.jpg', 3264, 2448, NULL, 'jpeg', '2022-10-21 16:12:58', '2022-10-21 16:12:58', NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(31, '/uploads/drafts/20190122-183919-1548255647195-2788447.jpg', 3264, 2448, NULL, 'jpeg', '2022-10-21 16:12:58', '2022-10-21 16:12:58', NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(32, '/uploads/drafts/20190122-183436-1548255561758-2914105.jpg', 2448, 3264, NULL, 'jpeg', '2022-10-21 16:39:20', '2022-10-21 16:39:20', NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(33, '/uploads/drafts/20180802-164540-1533226123288-698292.jpg', 3264, 2448, NULL, 'jpeg', '2022-10-21 16:39:20', '2022-10-21 16:39:20', NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(34, '/uploads/drafts/20190122-183821-1548255782314-2720820.jpg', 3264, 2448, NULL, 'jpeg', '2022-10-21 16:39:20', '2022-10-21 16:39:20', NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(35, '/uploads/drafts/20180802-164558-1533226412229-719093.jpg', 3264, 2448, NULL, 'jpeg', '2022-10-21 18:43:20', '2022-10-21 18:43:20', NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(36, '/uploads/drafts/20190109-124249-1547137265575-2378789.jpg', 2448, 3264, NULL, 'jpeg', '2022-10-21 18:43:20', '2022-10-21 18:43:20', NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(37, '/uploads/drafts/20190109-124304-1547137252170-2419720.jpg', 3264, 2448, NULL, 'jpeg', '2022-10-21 18:43:20', '2022-10-21 18:43:20', NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(38, '/uploads/drafts/20190109-155332-1547137192237-2742885.jpg', 3264, 2448, NULL, 'jpeg', '2022-10-21 18:43:20', '2022-10-21 18:43:20', NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(39, '/uploads/drafts/20190109-155325-1547137204917-2851322.jpg', 3264, 2448, NULL, 'jpeg', '2022-10-21 18:43:20', '2022-10-21 18:43:20', NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(40, '/uploads/drafts/20190122-183315-1548255518626-2543805.jpg', 2448, 3264, NULL, 'jpeg', '2022-10-23 17:57:00', '2022-10-23 17:57:00', NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(41, '/uploads/drafts/120180802-162215-1533224898490-2695602.jpg', 2448, 3264, NULL, 'jpeg', '2022-10-23 17:57:00', '2022-10-23 17:57:00', NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(42, '/uploads/drafts/balashikha-computer-master-120180802-162215-1533224898490-2695602.jpg', 3840, 5120, NULL, NULL, '2022-11-10 13:05:58', '2022-11-10 13:05:58', 2448, 3264, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(43, '/uploads/drafts/balashikha-computer-master-20190122-184158-1548255709387-2674673.jpg', 1620, 2160, NULL, NULL, '2022-11-10 13:05:58', '2022-11-10 13:05:58', 2448, 3264, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(44, '/uploads/drafts/balashikha-computer-master-sort-svgrepo-com-1667412435777-1166.svg', 3840, 3840, NULL, NULL, '2022-11-10 13:05:58', '2022-11-10 13:05:58', 489, 489, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(45, '/uploads/drafts/balashikha-computer-master-20190122-183919-1548255647195-2788447.jpg', 2880, 2160, NULL, NULL, '2022-11-10 13:05:58', '2022-11-10 13:05:58', 3264, 2448, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(46, '/uploads/drafts/balashikha-computer-master-20190122-183922-1548255657355-2821872.jpg', 2880, 2160, NULL, NULL, '2022-11-10 13:05:58', '2022-11-10 13:05:58', 3264, 2448, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(47, '/uploads/drafts/balashikha-computer-master-20190122-183821-1548255782314-2720820.jpg', 2880, 2160, NULL, NULL, '2022-11-10 13:05:58', '2022-11-10 13:05:58', 3264, 2448, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(48, '/uploads/drafts/balashikha-computer-master-20190122-183436-1548255561758-2914105.jpg', 3240, 4320, NULL, NULL, '2022-11-10 13:05:58', '2022-11-10 13:05:58', 2448, 3264, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(49, '/uploads/drafts/balashikha-computer-master-20190109-155341-1547137177679-2779201.jpg', 5760, 4320, NULL, NULL, '2022-11-10 13:05:58', '2022-11-10 13:05:58', 3264, 2448, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(50, '/uploads/drafts/balashikha-computer-master-20190109-155332-1547137192237-2742885.jpg', 5760, 4320, NULL, NULL, '2022-11-10 13:05:58', '2022-11-10 13:05:58', 3264, 2448, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(51, '/uploads/drafts/balashikha-computer-master-20190109-155325-1547137204917-2851322.jpg', 5760, 4320, NULL, NULL, '2022-11-10 13:05:58', '2022-11-10 13:05:58', 3264, 2448, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(52, '/uploads/drafts/balashikha-computer-master-20190122-183315-1548255518626-2543805.jpg', 3240, 4320, NULL, NULL, '2022-11-10 13:05:58', '2022-11-10 13:05:58', 2448, 3264, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(53, '/uploads/drafts/balashikha-computer-master-20190109-124304-1547137252170-2419720.jpg', 5760, 4320, NULL, NULL, '2022-11-10 13:05:58', '2022-11-10 13:05:58', 3264, 2448, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(54, '/uploads/drafts/balashikha-computer-master-20180802-164558-1533226412229-719093.jpg', 5760, 4320, NULL, NULL, '2022-11-10 13:05:58', '2022-11-10 13:05:58', 3264, 2448, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(55, '/uploads/drafts/balashikha-computer-master-20180802-164540-1533226123288-698292.jpg', 2880, 2160, NULL, NULL, '2022-11-10 13:05:58', '2022-11-10 13:05:58', 3264, 2448, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(56, '/uploads/drafts/balashikha-computer-master-20180521-080439-1526880297818-2271365.jpg', 1620, 2160, NULL, NULL, '2022-11-10 13:05:58', '2022-11-10 13:05:58', 2448, 3264, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(57, '/uploads/drafts/balashikha-computer-master-20190109-124249-1547137265575-2378789.jpg', 3240, 4320, NULL, NULL, '2022-11-10 13:05:58', '2022-11-10 13:05:58', 2448, 3264, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(58, '/uploads/drafts/draft-balashikha-computer-master-forum-image-1667929490000-5815.jpg', 7420, 3840, NULL, NULL, '2022-11-10 17:45:49', '2022-11-10 17:45:49', 400, 207, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(59, '/uploads/drafts/draft-balashikha-computer-master-content-uploads-41ova5sqn0l1-1477781790000-17228.jpg', 5754, 3840, NULL, NULL, '2022-11-10 17:45:49', '2022-11-10 17:45:49', 487, 325, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(60, '/uploads/uploads/drafts/drafts/balashikha-computer-master-20190109-155341-1547137177679-2779201.jpg', 5760, 4320, NULL, NULL, '2022-11-10 17:48:34', '2022-11-10 17:48:34', 3264, 2448, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(61, '/uploads/uploads/drafts/drafts/balashikha-computer-master-20190109-155325-1547137204917-2851322.jpg', 5760, 4320, NULL, NULL, '2022-11-10 17:48:34', '2022-11-10 17:48:34', 3264, 2448, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(62, '/uploads/drafts/balashikha-computer-master-avatar-nnm-Cutted-to-Squere-pirate-penguin-1644835172956-121540.jpg', 3840, 3840, NULL, NULL, '2022-11-12 15:05:46', '2022-11-12 15:05:46', 683, 683, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(63, '/uploads/drafts/draft-balashikha-computer-master-files-publ-broken-screen-469x352-1477781754000-46259.jpg', 5116, 3839, NULL, NULL, '2022-11-20 22:07:08', '2022-11-20 22:07:08', 469, 352, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(64, '/image/upload/webp/avatar-nnm-another-copy-pinguine-pirate-1644835997144-299703.webp', 678, 678, NULL, NULL, '2023-03-13 18:06:05', '2023-03-13 18:06:05', 678, 678, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(65, '/image/upload/webp/$$-clipart-freebsd-freebsd-devil-1585413601569-373803.webp', 920, 1113, NULL, NULL, '2023-03-13 18:07:20', '2023-03-13 18:07:20', 920, 1113, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(66, '/image/upload/webp/$$-devil-pngfuel-cutted-avatar-1671787729862-53935.webp', 821, 795, NULL, NULL, '2023-03-13 19:18:38', '2023-03-13 19:18:38', 821, 795, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(67, '/image/upload/webp/avatar-dsc03438-1611251798645-30908-png.webp', 120, 120, NULL, NULL, '2023-03-13 19:20:37', '2023-03-13 19:20:37', 120, 120, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(68, '/image/upload/webp/kisspng-bsd-daemon-berkeley-1609757841238-116702-jpg.webp', 530, 530, NULL, NULL, '2023-03-13 19:34:25', '2023-03-13 19:34:25', 530, 530, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(69, '/image/upload/webp/dollardollar-devil-pngfuel-com-1585413620282-488653-png.webp', 1000, 1032, NULL, NULL, '2023-03-13 19:55:31', '2023-03-13 19:55:31', 1000, 1032, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(71, '/image/upload/webp/avatar-kartinka-policejskij-smajlik-1614103989630-7372-jpg.webp', 225, 225, NULL, NULL, '2023-03-13 20:01:18', '2023-03-13 20:01:18', 225, 225, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(74, '/image/upload/webp/avatar-nnm-another-copy-pinguine-pirate-1644835997144-299703-png.webp', 678, 678, NULL, NULL, '2023-03-13 20:10:07', '2023-03-13 20:10:07', 678, 678, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(75, '/image/upload/webp/dollardollar-devil-pngfuel-jpeg-avatar-1671787432551-79883-jpg.webp', 1000, 1032, NULL, NULL, '2023-03-13 20:10:59', '2023-03-13 20:10:59', 1000, 1032, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(77, '/image/upload/webp/nnm-avatar-1644230939702-59712-png.webp', 274, 274, NULL, NULL, '2023-03-14 00:36:31', '2023-03-14 00:36:31', 274, 274, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(83, '/image/upload/webp/kisspng-bsd-daemon-berkeley-1585413536140-69971-jpg.webp', 900, 580, NULL, NULL, '2023-03-14 14:58:58', '2023-03-14 14:58:58', 900, 580, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(91, '/image/upload/webp/dollardollar-devil-pngfuel-cutted-avatar-1671787729862-53935-jpg.webp', 821, 795, NULL, NULL, '2023-03-14 15:18:05', '2023-03-14 15:18:05', 821, 795, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(93, '/image/upload/webp/dollardollar-clipart-freebsd-freebsd-devil-1585413601569-373803-png.webp', 920, 1113, NULL, NULL, '2023-03-14 15:18:06', '2023-03-14 15:18:06', 920, 1113, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(94, '/image/upload/webp/100x100-avatar-rutracker-pirate-penguin-1666608244482-14169-png.webp', 100, 100, NULL, NULL, '2023-03-14 15:18:06', '2023-03-14 15:18:06', 100, 100, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(96, '/image/upload/webp/avatar-nnm-small-120x120-pirate-penguin-1644835286015-12208-jpg.webp', 120, 120, NULL, NULL, '2023-03-14 15:18:06', '2023-03-14 15:18:06', 120, 120, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(97, '/image/upload/webp/avatar-nnm-120x120-pirate-penguin-1644836043083-17486-png.webp', 120, 120, NULL, NULL, '2023-03-14 15:18:06', '2023-03-14 15:18:06', 120, 120, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(99, '/image/upload/webp/avatar-nnm-cutted-to-squere-pirate-penguin-1644835172956-121540-jpg.webp', 683, 683, NULL, NULL, '2023-03-14 15:18:07', '2023-03-14 15:18:07', 683, 683, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(101, '/image/upload/webp/f1a10725ac9e3847469761d6e058129dc122b2f7327b022884pimgpsh-fullsize-distr-1461589367184-5588046-png.webp', 2560, 1600, NULL, NULL, '2023-03-14 15:42:40', '2023-03-14 15:42:40', 2560, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(111, '/image/upload/webp/avatar-nnm-pirate-penguin-1644574095000-71638-jpg.webp', 750, 1000, NULL, NULL, '2023-03-14 16:13:55', '2023-03-14 16:13:55', 750, 1000, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(112, '/image/upload/webp/dsc03438-1611251723520-1684654-jpg.webp', 1900, 1900, NULL, NULL, '2023-03-14 16:13:57', '2023-03-14 16:13:57', 1900, 1900, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(113, '/image/upload/webp/gosuslugi-1571928636256-3843558-png.webp', 1250, 1023, NULL, NULL, '2023-03-14 16:13:57', '2023-03-14 16:13:57', 1250, 1023, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(115, '/image/upload/webp/nnm-avatar-120x120-1644231061776-15135-png.webp', 120, 120, NULL, NULL, '2023-03-14 16:13:57', '2023-03-14 16:13:57', 120, 120, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(117, '/image/upload/webp/000-1592655581337-105468-webp.webp', 1287, 712, NULL, NULL, '2023-03-14 16:13:58', '2023-03-14 16:13:58', 1287, 712, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(147, '/image/upload/webp/balashiha-remont-compute-hardware-1673206155883-54592-webp.webp', 1029, 740, NULL, NULL, '2023-03-26 19:36:44', '2023-03-26 19:36:44', 1029, 740, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(149, '/image/upload/webp/virus-1673192124984-112217-png.webp', 750, 750, NULL, NULL, '2023-03-26 22:24:24', '2023-03-26 22:24:24', 750, 750, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(150, '/image/upload/webp/another-2-square-motherboard-dolls-board-1673288192849-916821-jpg.webp', 2048, 2048, NULL, NULL, '2023-04-15 19:05:31', '2023-04-15 19:05:31', 2048, 2048, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(151, '/image/upload/webp/beatiful-micro-chip-background-obrabotano-1681234813669-1987245-jpg.webp', 2187, 1447, NULL, NULL, '2023-04-15 19:07:11', '2023-04-15 19:07:11', 2187, 1447, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(152, '/image/upload/webp/1619084348-16-phonoteka-org-p-remont-kompyuterov-fon-16-1673192290673-484764-webp.webp', 3000, 2000, NULL, NULL, '2023-04-15 19:08:13', '2023-04-15 19:08:13', 3000, 2000, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(153, '/image/upload/webp/kisspng-computer-cases-housings-power-supply-unit-cooler-top-bench-5b2ccd4c4f5428-955011561529662796325-1673210180958-475972-png.webp', 567, 847, NULL, NULL, '2023-04-15 19:10:13', '2023-04-15 19:10:13', 567, 847, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(154, '/image/upload/webp/computer-master-photo-balashikha-obrabotano-1684174021276-446383-jpg.webp', 714, 817, NULL, NULL, '2023-06-15 15:18:02', '2023-06-15 15:18:02', 714, 817, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(156, '/image/upload/webp/kisspng-windows-7-logo-windows-vista-microsoft-5ab6ff6950d0e4-1612021415219423773311-1687801750664-269527-png.webp', 1000, 1000, NULL, NULL, '2023-06-28 21:05:35', '2023-06-28 21:05:35', 1000, 1000, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(157, '/image/upload/webp/balashiha-windows-7-logo-microsoft-1687801750664-269527-png.webp', 1000, 1000, NULL, NULL, '2023-06-28 21:06:54', '2023-06-28 21:06:54', 1000, 1000, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(158, '/image/upload/webp/balashiha-windows-7-logo-microsoft-1687986542495-272282-png.webp', 890, 883, NULL, NULL, '2023-06-28 21:09:16', '2023-06-28 21:09:16', 890, 883, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(159, '/image/upload/webp/balashiha-os-mirosoft-windows-7-10-1687986729105-328338-png.webp', 898, 883, NULL, NULL, '2023-06-28 21:13:32', '2023-06-28 21:13:32', 898, 883, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(160, '/image/upload/webp/blue-screen-of-death-1687801635520-106333-png.webp', 512, 512, NULL, NULL, '2023-07-05 12:53:25', '2023-07-05 12:53:25', 512, 512, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(161, '/image/upload/webp/programs-computer-1688561818301-207862-png.webp', 500, 503, NULL, NULL, '2023-07-05 12:57:57', '2023-07-05 12:57:57', 500, 503, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(162, '/image/upload/webp/virus-danger-1687543510386-1073197-png.webp', 1920, 1654, NULL, NULL, '2023-07-05 12:59:11', '2023-07-05 12:59:11', 1920, 1654, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(163, '/image/upload/webp/laptop-1673210850945-1147358-png.webp', 1040, 1067, NULL, NULL, '2023-07-05 13:47:19', '2023-07-05 13:47:19', 1040, 1067, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(164, '/image/upload/webp/png-transparent-car-repairing-location-service-location-car-service-location-location-pin-service-3d-icon-1688563481795-74902-png.webp', 920, 920, NULL, NULL, '2023-07-05 15:05:06', '2023-07-05 15:05:06', 920, 920, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(165, '/image/upload/webp/prozrachnyj-fon-png-transparent-car-repairing-location-service-location-car-service-location-location-pin-service-3d-icon-obrabotano-1688569468213-186296-png.webp', 920, 920, NULL, NULL, '2023-07-05 15:07:30', '2023-07-05 15:07:30', 920, 920, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(166, '/image/upload/webp/gear-screw-master-1688564087966-1369037-png.webp', 1680, 1680, NULL, NULL, '2023-07-05 15:11:46', '2023-07-05 15:11:46', 1680, 1680, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(167, '/image/upload/webp/pc-repair-man-1688563916729-497671-png.webp', 1438, 1402, NULL, NULL, '2023-07-05 15:15:54', '2023-07-05 15:15:54', 1438, 1402, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(168, '/image/upload/webp/vecteezy-a-3d-icon-of-a-computer-in-critical-error-due-to-a-virus-25003644-828-1688562227116-5189235-png.webp', 2500, 2500, NULL, NULL, '2023-07-05 15:16:48', '2023-07-05 15:16:48', 2500, 2500, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(169, '/image/upload/webp/modeling-social-media-in-computer-1688562505251-1619736-png.webp', 2200, 2200, NULL, NULL, '2023-07-09 23:20:07', '2023-07-09 23:20:07', 2200, 2200, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(268, '/images/random/computer_master_balashikha_hero.webp', 515, 392, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 515, 392, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(269, '/images/random/IMG_20230927_182127.jpg', 4000, 3000, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 4000, 3000, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(270, '/images/random/IMG_20230927_152211.jpg', 4000, 3000, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 4000, 3000, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(271, '/images/random/IMG_20230921_220356.jpg', 2114, 2128, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 2114, 2128, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(272, '/images/random/IMG_20230913_165825_BURST19.jpg', 2145, 1713, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 2145, 1713, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(273, '/images/random/IMG_20230911_162856.jpg', 3117, 2250, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 3117, 2250, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(274, '/images/random/IMG_20230911_161313.jpg', 2550, 2250, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 2550, 2250, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(275, '/images/random/IMG_20230911_161211.jpg', 2778, 2250, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 2778, 2250, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(276, '/images/random/IMG_20230911_160558_edited.jpg', 2963, 2250, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 2963, 2250, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(277, '/images/random/IMG_20230909_184513.jpg', 4000, 3000, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 4000, 3000, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(278, '/images/random/IMG_20230909_184234.jpg', 4000, 3000, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 4000, 3000, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(279, '/images/random/IMG_20230908_153251.jpg', 2988, 2250, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 2988, 2250, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(280, '/images/random/IMG_20230908_152934.jpg', 2623, 2250, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 2623, 2250, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(281, '/images/random/IMG_20230908_144331.jpg', 3279, 2250, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 3279, 2250, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(282, '/images/random/IMG_20230908_143135.jpg', 3367, 2250, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 3367, 2250, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(283, '/images/random/IMG_20230903_173758.jpg', 4000, 3000, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 4000, 3000, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(284, '/images/random/IMG_20230903_171608.jpg', 3092, 3000, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 3092, 3000, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(285, '/images/random/IMG_20230903_165612.jpg', 4000, 3000, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 4000, 3000, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(286, '/images/random/IMG_20230901_002045.jpg', 4000, 3000, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 4000, 3000, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(287, '/images/random/IMG_20230901_002001.jpg', 4000, 3000, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 4000, 3000, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(288, '/images/random/IMG_20230831_232050.jpg', 3316, 3000, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 3316, 3000, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(289, '/images/random/IMG_20230831_232043.jpg', 3386, 3000, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 3386, 3000, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(290, '/images/random/IMG_20230831_232011.jpg', 4000, 3000, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 4000, 3000, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(291, '/images/random/IMG_20230831_231836.jpg', 3481, 3000, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 3481, 3000, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(292, '/images/random/IMG_20230831_231603.jpg', 4000, 3000, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 4000, 3000, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(293, '/images/random/IMG_20230831_224313.jpg', 3270, 3000, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 3270, 3000, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(294, '/images/random/IMG_20230830_230604.jpg', 4000, 3000, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 4000, 3000, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(295, '/images/random/IMG_20230830_225945.jpg', 4000, 3000, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 4000, 3000, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(296, '/images/random/IMG_20230830_223738.jpg', 3041, 2908, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 3041, 2908, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(297, '/images/random/IMG_20230830_220753.jpg', 3111, 3000, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 3111, 3000, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(298, '/images/random/IMG_20230830_215515.jpg', 3000, 3717, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 3000, 3717, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(299, '/images/random/IMG_20230830_215240.jpg', 4000, 3000, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 4000, 3000, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(300, '/images/random/IMG_20230801_190718.jpg', 3000, 2585, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 3000, 2585, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(301, '/images/random/20190411_095819.jpg', 3264, 2448, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 3264, 2448, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(302, '/images/random/20190218_093925.jpg', 3264, 2448, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 3264, 2448, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(303, '/images/random/20190218_093707.jpg', 3264, 2448, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 3264, 2448, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(304, '/images/random/20190217_174729.jpg', 3264, 2448, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 3264, 2448, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(305, '/images/random/20190216_211715.jpg', 3264, 2448, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 3264, 2448, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(306, '/images/random/20190216_192955.jpg', 3264, 2448, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 3264, 2448, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(307, '/images/random/20190123_130742.jpg', 3264, 2448, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 3264, 2448, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(308, '/images/random/20190122_194920.jpg', 3264, 2448, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 3264, 2448, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(309, '/images/random/20181210_205230.jpg', 2445, 2131, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 2445, 2131, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(310, '/images/random/20181210_205156.jpg', 2717, 2340, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 2717, 2340, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(311, '/images/random/20181024_083259.jpg', 2880, 2448, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 2880, 2448, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(312, '/images/random/20181013_112140.jpg', 1762, 1651, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 1762, 1651, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(313, '/images/random/20181013_112105.jpg', 1882, 2263, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 1882, 2263, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(314, '/images/random/20180411_121847.jpg', 2968, 2448, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 2968, 2448, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(315, '/images/random/20180411_121622.jpg', 2917, 2448, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 2917, 2448, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(316, '/images/random/20170913_090052.jpg', 3264, 2448, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 3264, 2448, NULL, 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
