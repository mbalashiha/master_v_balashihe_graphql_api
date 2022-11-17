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
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4;

-- Дамп данных таблицы github-next-js.image: ~53 rows (приблизительно)
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`) VALUES
	(5, '/images/Hat-front-black__72990.1603748583.png', 2048, 2048, NULL, NULL, '2022-06-10 22:43:22', '2022-08-14 18:20:49', NULL, NULL, NULL),
	(6, '/images/Hat-back-black__57260.1602591509.png', 2048, 2048, NULL, NULL, '2022-06-10 22:43:22', '2022-08-14 18:20:49', NULL, NULL, NULL),
	(7, '/images/Hat-left-black__51142.1602591510.png', 2048, 2048, NULL, NULL, '2022-06-10 22:43:22', '2022-08-14 18:20:49', NULL, NULL, NULL),
	(8, '/images/Hat-front-white__31525.1602591510.png', 2048, 2048, NULL, NULL, '2022-06-10 22:43:22', '2022-08-14 18:20:49', NULL, NULL, NULL),
	(9, '/images/Men-Jacket-Front-Black__15466.1603283963.png', 2048, 2048, NULL, NULL, '2022-06-10 22:43:22', '2022-08-14 18:20:49', NULL, NULL, NULL),
	(10, '/images/Men-Jacket-Side-Black__68202.1603283961.png', 2048, 2048, NULL, NULL, '2022-06-10 22:43:22', '2022-08-14 18:20:49', NULL, NULL, NULL),
	(11, '/images/Men-Jacket-Back-Black__33864.1603283963.png', 2048, 2048, NULL, NULL, '2022-06-10 22:43:22', '2022-08-14 18:20:49', NULL, NULL, NULL),
	(12, '/images/Men-Jacket-Front-White__95300.1603283963.png', 2048, 2048, NULL, NULL, '2022-06-10 22:43:22', '2022-08-14 18:20:49', NULL, NULL, NULL),
	(13, '/images/Men-Jacket-Side-White__91924.1603283962.png', 2048, 2048, NULL, NULL, '2022-06-10 22:43:22', '2022-08-14 18:20:49', NULL, NULL, NULL),
	(14, '/images/Men-Jacket-Back-White__02866.1603283963.png', 2048, 2048, NULL, NULL, '2022-06-10 22:43:22', '2022-08-14 18:20:49', NULL, NULL, NULL),
	(15, '/images/Men-TShirt-Black-Front__70046.1603748348.png', 2048, 2048, NULL, NULL, '2022-06-10 22:43:22', '2022-08-14 18:20:49', NULL, NULL, NULL),
	(16, '/images/Men-TShirt-Black-Left-Side__72119.1603284781.png', 2048, 2048, NULL, NULL, '2022-06-10 22:43:22', '2022-08-14 18:20:49', NULL, NULL, NULL),
	(17, '/images/Men-TShirt-Black-Back__57266.1603748348.png', 2048, 2048, NULL, NULL, '2022-06-10 22:43:22', '2022-08-14 18:20:49', NULL, NULL, NULL),
	(18, '/images/Men-TShirt-White-Front__99616.1603284781.png', 2048, 2048, NULL, NULL, '2022-06-10 22:43:22', '2022-08-14 18:20:49', NULL, NULL, NULL),
	(19, '/images/Men-TShirt-White-Left-Side__69000.1603284781.png', 2048, 2048, NULL, NULL, '2022-06-10 22:43:22', '2022-08-14 18:20:49', NULL, NULL, NULL),
	(20, '/images/Men-TShirt-White-Back__33450.1603284781.png', 2048, 2048, NULL, NULL, '2022-06-10 22:43:22', '2022-08-14 18:20:49', NULL, NULL, NULL),
	(21, '/uploads/drafts/avatar-nnm-pirate-penguin-1644574095000-71638.jpg', 750, 1000, NULL, 'jpeg', '2022-08-05 20:02:32', '2022-08-05 20:02:32', NULL, NULL, NULL),
	(22, '/uploads/drafts/F1A10725AC9E3847469761D6E058129DC122B2F7327B022884pimgpsh-fullsize-distr-1461589367184-5588046.png', 2560, 1600, NULL, 'png', '2022-08-05 20:04:30', '2022-08-05 20:04:30', NULL, NULL, NULL),
	(23, '/uploads/drafts/Avatar-kartinka-policejskij-smajlik-1614103989630-7372.jpg', 225, 225, NULL, 'jpeg', '2022-08-05 20:04:30', '2022-08-05 20:04:30', NULL, NULL, NULL),
	(24, '/uploads/drafts/gosuslugi-1571928636256-3843558.png', 1250, 1023, NULL, 'png', '2022-08-05 20:04:30', '2022-08-05 20:04:30', NULL, NULL, NULL),
	(25, '/uploads/drafts/DSC03438-1611251723520-1684654.jpg', 1900, 1900, NULL, 'jpeg', '2022-08-05 20:04:30', '2022-08-05 20:04:30', NULL, NULL, NULL),
	(26, '/uploads/drafts/nnm-avatar-120x120-1644231061776-15135.png', 120, 120, NULL, 'png', '2022-08-05 20:04:30', '2022-08-05 20:04:30', NULL, NULL, NULL),
	(27, '/uploads/drafts/nnm-avatar-1644230939702-59712.png', 274, 274, NULL, 'png', '2022-08-05 20:04:30', '2022-08-05 20:04:30', NULL, NULL, NULL),
	(28, '/uploads/drafts/dollardollar-clipart-freebsd-freebsd-devil-1585413601569-373803.png', 920, 1113, NULL, 'png', '2022-08-08 20:52:20', '2022-08-08 20:52:20', NULL, NULL, NULL),
	(29, '/uploads/drafts/20190122-183922-1548255657355-2821872.jpg', 3264, 2448, NULL, 'jpeg', '2022-10-21 19:12:58', '2022-10-21 19:12:58', NULL, NULL, NULL),
	(30, '/uploads/drafts/20190109-155341-1547137177679-2779201.jpg', 3264, 2448, NULL, 'jpeg', '2022-10-21 19:12:58', '2022-10-21 19:12:58', NULL, NULL, NULL),
	(31, '/uploads/drafts/20190122-183919-1548255647195-2788447.jpg', 3264, 2448, NULL, 'jpeg', '2022-10-21 19:12:58', '2022-10-21 19:12:58', NULL, NULL, NULL),
	(32, '/uploads/drafts/20190122-183436-1548255561758-2914105.jpg', 2448, 3264, NULL, 'jpeg', '2022-10-21 19:39:20', '2022-10-21 19:39:20', NULL, NULL, NULL),
	(33, '/uploads/drafts/20180802-164540-1533226123288-698292.jpg', 3264, 2448, NULL, 'jpeg', '2022-10-21 19:39:20', '2022-10-21 19:39:20', NULL, NULL, NULL),
	(34, '/uploads/drafts/20190122-183821-1548255782314-2720820.jpg', 3264, 2448, NULL, 'jpeg', '2022-10-21 19:39:20', '2022-10-21 19:39:20', NULL, NULL, NULL),
	(35, '/uploads/drafts/20180802-164558-1533226412229-719093.jpg', 3264, 2448, NULL, 'jpeg', '2022-10-21 21:43:20', '2022-10-21 21:43:20', NULL, NULL, NULL),
	(36, '/uploads/drafts/20190109-124249-1547137265575-2378789.jpg', 2448, 3264, NULL, 'jpeg', '2022-10-21 21:43:20', '2022-10-21 21:43:20', NULL, NULL, NULL),
	(37, '/uploads/drafts/20190109-124304-1547137252170-2419720.jpg', 3264, 2448, NULL, 'jpeg', '2022-10-21 21:43:20', '2022-10-21 21:43:20', NULL, NULL, NULL),
	(38, '/uploads/drafts/20190109-155332-1547137192237-2742885.jpg', 3264, 2448, NULL, 'jpeg', '2022-10-21 21:43:20', '2022-10-21 21:43:20', NULL, NULL, NULL),
	(39, '/uploads/drafts/20190109-155325-1547137204917-2851322.jpg', 3264, 2448, NULL, 'jpeg', '2022-10-21 21:43:20', '2022-10-21 21:43:20', NULL, NULL, NULL),
	(40, '/uploads/drafts/20190122-183315-1548255518626-2543805.jpg', 2448, 3264, NULL, 'jpeg', '2022-10-23 20:57:00', '2022-10-23 20:57:00', NULL, NULL, NULL),
	(41, '/uploads/drafts/120180802-162215-1533224898490-2695602.jpg', 2448, 3264, NULL, 'jpeg', '2022-10-23 20:57:00', '2022-10-23 20:57:00', NULL, NULL, NULL),
	(42, '/uploads/drafts/balashikha-computer-master-120180802-162215-1533224898490-2695602.jpg', 3840, 5120, NULL, NULL, '2022-11-10 16:05:58', '2022-11-10 16:05:58', 2448, 3264, NULL),
	(43, '/uploads/drafts/balashikha-computer-master-20190122-184158-1548255709387-2674673.jpg', 1620, 2160, NULL, NULL, '2022-11-10 16:05:58', '2022-11-10 16:05:58', 2448, 3264, NULL),
	(44, '/uploads/drafts/balashikha-computer-master-sort-svgrepo-com-1667412435777-1166.svg', 3840, 3840, NULL, NULL, '2022-11-10 16:05:58', '2022-11-10 16:05:58', 489, 489, NULL),
	(45, '/uploads/drafts/balashikha-computer-master-20190122-183919-1548255647195-2788447.jpg', 2880, 2160, NULL, NULL, '2022-11-10 16:05:58', '2022-11-10 16:05:58', 3264, 2448, NULL),
	(46, '/uploads/drafts/balashikha-computer-master-20190122-183922-1548255657355-2821872.jpg', 2880, 2160, NULL, NULL, '2022-11-10 16:05:58', '2022-11-10 16:05:58', 3264, 2448, NULL),
	(47, '/uploads/drafts/balashikha-computer-master-20190122-183821-1548255782314-2720820.jpg', 2880, 2160, NULL, NULL, '2022-11-10 16:05:58', '2022-11-10 16:05:58', 3264, 2448, NULL),
	(48, '/uploads/drafts/balashikha-computer-master-20190122-183436-1548255561758-2914105.jpg', 3240, 4320, NULL, NULL, '2022-11-10 16:05:58', '2022-11-10 16:05:58', 2448, 3264, NULL),
	(49, '/uploads/drafts/balashikha-computer-master-20190109-155341-1547137177679-2779201.jpg', 5760, 4320, NULL, NULL, '2022-11-10 16:05:58', '2022-11-10 16:05:58', 3264, 2448, NULL),
	(50, '/uploads/drafts/balashikha-computer-master-20190109-155332-1547137192237-2742885.jpg', 5760, 4320, NULL, NULL, '2022-11-10 16:05:58', '2022-11-10 16:05:58', 3264, 2448, NULL),
	(51, '/uploads/drafts/balashikha-computer-master-20190109-155325-1547137204917-2851322.jpg', 5760, 4320, NULL, NULL, '2022-11-10 16:05:58', '2022-11-10 16:05:58', 3264, 2448, NULL),
	(52, '/uploads/drafts/balashikha-computer-master-20190122-183315-1548255518626-2543805.jpg', 3240, 4320, NULL, NULL, '2022-11-10 16:05:58', '2022-11-10 16:05:58', 2448, 3264, NULL),
	(53, '/uploads/drafts/balashikha-computer-master-20190109-124304-1547137252170-2419720.jpg', 5760, 4320, NULL, NULL, '2022-11-10 16:05:58', '2022-11-10 16:05:58', 3264, 2448, NULL),
	(54, '/uploads/drafts/balashikha-computer-master-20180802-164558-1533226412229-719093.jpg', 5760, 4320, NULL, NULL, '2022-11-10 16:05:58', '2022-11-10 16:05:58', 3264, 2448, NULL),
	(55, '/uploads/drafts/balashikha-computer-master-20180802-164540-1533226123288-698292.jpg', 2880, 2160, NULL, NULL, '2022-11-10 16:05:58', '2022-11-10 16:05:58', 3264, 2448, NULL),
	(56, '/uploads/drafts/balashikha-computer-master-20180521-080439-1526880297818-2271365.jpg', 1620, 2160, NULL, NULL, '2022-11-10 16:05:58', '2022-11-10 16:05:58', 2448, 3264, NULL),
	(57, '/uploads/drafts/balashikha-computer-master-20190109-124249-1547137265575-2378789.jpg', 3240, 4320, NULL, NULL, '2022-11-10 16:05:58', '2022-11-10 16:05:58', 2448, 3264, NULL),
	(58, '/uploads/drafts/draft-balashikha-computer-master-forum-image-1667929490000-5815.jpg', 7420, 3840, NULL, NULL, '2022-11-10 20:45:49', '2022-11-10 20:45:49', 400, 207, NULL),
	(59, '/uploads/drafts/draft-balashikha-computer-master-content-uploads-41ova5sqn0l1-1477781790000-17228.jpg', 5754, 3840, NULL, NULL, '2022-11-10 20:45:49', '2022-11-10 20:45:49', 487, 325, NULL),
	(60, '/uploads/uploads/drafts/drafts/balashikha-computer-master-20190109-155341-1547137177679-2779201.jpg', 5760, 4320, NULL, NULL, '2022-11-10 20:48:34', '2022-11-10 20:48:34', 3264, 2448, NULL),
	(61, '/uploads/uploads/drafts/drafts/balashikha-computer-master-20190109-155325-1547137204917-2851322.jpg', 5760, 4320, NULL, NULL, '2022-11-10 20:48:34', '2022-11-10 20:48:34', 3264, 2448, NULL),
	(62, '/uploads/drafts/balashikha-computer-master-avatar-nnm-Cutted-to-Squere-pirate-penguin-1644835172956-121540.jpg', 3840, 3840, NULL, NULL, '2022-11-12 18:05:46', '2022-11-12 18:05:46', 683, 683, NULL);
/*!40000 ALTER TABLE `image` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
