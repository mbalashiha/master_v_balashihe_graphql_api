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
  UNIQUE KEY `uniq_imgSrc` (`imgSrc`(512)) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=523 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Дамп данных таблицы master_v_balashihe.image: ~205 rows (приблизительно)
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(64, '/image/upload/webp/avatar-nnm-another-copy-pinguine-pirate-1644835997144-299703.webp', 678, 678, NULL, NULL, '2023-03-13 18:06:05', '2023-10-18 17:56:05', 678, 678, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(65, '/image/upload/webp/$$-clipart-freebsd-freebsd-devil-1585413601569-373803.webp', 920, 1113, NULL, NULL, '2023-03-13 18:07:20', '2023-10-18 17:56:05', 920, 1113, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(66, '/image/upload/webp/$$-devil-pngfuel-cutted-avatar-1671787729862-53935.webp', 821, 795, NULL, NULL, '2023-03-13 19:18:38', '2023-10-18 17:56:05', 821, 795, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(67, '/image/upload/webp/avatar-dsc03438-1611251798645-30908-png.webp', 120, 120, NULL, NULL, '2023-03-13 19:20:37', '2023-10-18 17:56:05', 120, 120, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(68, '/image/upload/webp/kisspng-bsd-daemon-berkeley-1609757841238-116702-jpg.webp', 530, 530, NULL, NULL, '2023-03-13 19:34:25', '2023-10-18 17:56:05', 530, 530, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(69, '/image/upload/webp/dollardollar-devil-pngfuel-com-1585413620282-488653-png.webp', 1000, 1032, NULL, NULL, '2023-03-13 19:55:31', '2023-10-18 17:56:05', 1000, 1032, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(71, '/image/upload/webp/avatar-kartinka-policejskij-smajlik-1614103989630-7372-jpg.webp', 225, 225, NULL, NULL, '2023-03-13 20:01:18', '2023-10-18 17:56:05', 225, 225, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(74, '/image/upload/webp/avatar-nnm-another-copy-pinguine-pirate-1644835997144-299703-png.webp', 678, 678, NULL, NULL, '2023-03-13 20:10:07', '2023-10-18 17:56:05', 678, 678, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(75, '/image/upload/webp/dollardollar-devil-pngfuel-jpeg-avatar-1671787432551-79883-jpg.webp', 1000, 1032, NULL, NULL, '2023-03-13 20:10:59', '2023-10-18 17:56:05', 1000, 1032, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(77, '/image/upload/webp/nnm-avatar-1644230939702-59712-png.webp', 274, 274, NULL, NULL, '2023-03-14 00:36:31', '2023-10-18 17:56:05', 274, 274, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(83, '/image/upload/webp/kisspng-bsd-daemon-berkeley-1585413536140-69971-jpg.webp', 900, 580, NULL, NULL, '2023-03-14 14:58:58', '2023-10-18 17:56:05', 900, 580, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(91, '/image/upload/webp/dollardollar-devil-pngfuel-cutted-avatar-1671787729862-53935-jpg.webp', 821, 795, NULL, NULL, '2023-03-14 15:18:05', '2023-10-18 17:56:05', 821, 795, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(93, '/image/upload/webp/dollardollar-clipart-freebsd-freebsd-devil-1585413601569-373803-png.webp', 920, 1113, NULL, NULL, '2023-03-14 15:18:06', '2023-10-18 17:56:05', 920, 1113, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(94, '/image/upload/webp/100x100-avatar-rutracker-pirate-penguin-1666608244482-14169-png.webp', 100, 100, NULL, NULL, '2023-03-14 15:18:06', '2023-10-18 17:56:05', 100, 100, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(96, '/image/upload/webp/avatar-nnm-small-120x120-pirate-penguin-1644835286015-12208-jpg.webp', 120, 120, NULL, NULL, '2023-03-14 15:18:06', '2023-10-18 17:56:05', 120, 120, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(97, '/image/upload/webp/avatar-nnm-120x120-pirate-penguin-1644836043083-17486-png.webp', 120, 120, NULL, NULL, '2023-03-14 15:18:06', '2023-10-18 17:56:05', 120, 120, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(99, '/image/upload/webp/avatar-nnm-cutted-to-squere-pirate-penguin-1644835172956-121540-jpg.webp', 683, 683, NULL, NULL, '2023-03-14 15:18:07', '2023-10-18 17:56:05', 683, 683, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(101, '/image/upload/webp/f1a10725ac9e3847469761d6e058129dc122b2f7327b022884pimgpsh-fullsize-distr-1461589367184-5588046-png.webp', 2560, 1600, NULL, NULL, '2023-03-14 15:42:40', '2023-10-16 20:15:31', 2560, 1600, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(111, '/image/upload/webp/avatar-nnm-pirate-penguin-1644574095000-71638-jpg.webp', 750, 1000, NULL, NULL, '2023-03-14 16:13:55', '2023-10-18 17:56:05', 750, 1000, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(112, '/image/upload/webp/dsc03438-1611251723520-1684654-jpg.webp', 1600, 1600, NULL, NULL, '2023-03-14 16:13:57', '2023-10-18 17:56:05', 1600, 1600, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(113, '/image/upload/webp/gosuslugi-1571928636256-3843558-png.webp', 1250, 1023, NULL, NULL, '2023-03-14 16:13:57', '2023-10-18 17:56:05', 1250, 1023, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(115, '/image/upload/webp/nnm-avatar-120x120-1644231061776-15135-png.webp', 120, 120, NULL, NULL, '2023-03-14 16:13:57', '2023-10-18 17:56:05', 120, 120, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(117, '/image/upload/webp/000-1592655581337-105468-webp.webp', 1287, 712, NULL, NULL, '2023-03-14 16:13:58', '2023-10-18 17:56:05', 1287, 712, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(147, '/image/upload/webp/balashiha-remont-compute-hardware-1673206155883-54592-webp.webp', 1029, 740, NULL, NULL, '2023-03-26 19:36:44', '2023-10-18 17:56:05', 1029, 740, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(149, '/image/upload/webp/virus-1673192124984-112217-png.webp', 750, 750, NULL, NULL, '2023-03-26 22:24:24', '2023-10-18 17:56:05', 750, 750, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(150, '/image/upload/webp/another-2-square-motherboard-dolls-board-1673288192849-916821-jpg.webp', 1600, 1600, NULL, NULL, '2023-04-15 19:05:31', '2023-10-18 17:56:05', 1600, 1600, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(151, '/image/upload/webp/beatiful-micro-chip-background-obrabotano-1681234813669-1987245-jpg.webp', 2187, 1447, NULL, NULL, '2023-04-15 19:07:11', '2023-10-16 20:15:31', 2187, 1447, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(152, '/image/upload/webp/1619084348-16-phonoteka-org-p-remont-kompyuterov-fon-16-1673192290673-484764-webp.webp', 2400, 1600, NULL, NULL, '2023-04-15 19:08:13', '2023-10-16 20:54:32', 2400, 1600, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(153, '/image/upload/webp/kisspng-computer-cases-housings-power-supply-unit-cooler-top-bench-5b2ccd4c4f5428-955011561529662796325-1673210180958-475972-png.webp', 567, 847, NULL, NULL, '2023-04-15 19:10:13', '2023-10-18 17:56:05', 567, 847, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(154, '/image/upload/webp/computer-master-photo-balashikha-obrabotano-1684174021276-446383-jpg.webp', 714, 817, NULL, NULL, '2023-06-15 15:18:02', '2023-10-18 17:56:05', 714, 817, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(159, '/image/upload/webp/balashiha-os-mirosoft-windows-7-10-1687986729105-328338-png.webp', 898, 883, NULL, NULL, '2023-06-28 21:13:32', '2023-10-18 17:56:05', 898, 883, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(160, '/image/upload/webp/blue-screen-of-death-1687801635520-106333-png.webp', 512, 512, NULL, NULL, '2023-07-05 12:53:25', '2023-10-18 17:56:05', 512, 512, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(161, '/image/upload/webp/programs-computer-1688561818301-207862-png.webp', 500, 503, NULL, NULL, '2023-07-05 12:57:57', '2023-10-18 17:56:05', 500, 503, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(162, '/image/upload/webp/virus-danger-1687543510386-1073197-png.webp', 1920, 1654, NULL, NULL, '2023-07-05 12:59:11', '2023-10-18 17:56:05', 1920, 1654, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(163, '/image/upload/webp/laptop-1673210850945-1147358-png.webp', 1040, 1067, NULL, NULL, '2023-07-05 13:47:19', '2023-10-18 17:56:05', 1040, 1067, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(164, '/image/upload/webp/png-transparent-car-repairing-location-service-location-car-service-location-location-pin-service-3d-icon-1688563481795-74902-png.webp', 920, 920, NULL, NULL, '2023-07-05 15:05:06', '2023-10-18 17:56:05', 920, 920, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(165, '/image/upload/webp/prozrachnyj-fon-png-transparent-car-repairing-location-service-location-car-service-location-location-pin-service-3d-icon-obrabotano-1688569468213-186296-png.webp', 920, 920, NULL, NULL, '2023-07-05 15:07:30', '2023-10-18 17:56:05', 920, 920, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(166, '/image/upload/webp/gear-screw-master-1688564087966-1369037-png.webp', 1680, 1680, NULL, NULL, '2023-07-05 15:11:46', '2023-10-18 17:56:05', 1680, 1680, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(167, '/image/upload/webp/pc-repair-man-1688563916729-497671-png.webp', 1438, 1402, NULL, NULL, '2023-07-05 15:15:54', '2023-10-18 17:56:05', 1438, 1402, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(168, '/image/upload/webp/vecteezy-a-3d-icon-of-a-computer-in-critical-error-due-to-a-virus-25003644-828-1688562227116-5189235-png.webp', 2500, 2500, NULL, NULL, '2023-07-05 15:16:48', '2023-10-18 17:56:05', 2500, 2500, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(169, '/image/upload/webp/modeling-social-media-in-computer-1688562505251-1619736-png.webp', 2200, 2200, NULL, NULL, '2023-07-09 23:20:07', '2023-10-18 17:56:05', 2200, 2200, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(268, '/images/random/computer_master_balashikha_hero.webp', 515, 392, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 515, 392, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(269, '/images/random/IMG_20230927_182127.jpg', 2133, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:08:02', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(270, '/images/random/IMG_20230927_152211.jpg', 2133, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:08:06', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(271, '/images/random/IMG_20230921_220356.jpg', 1589, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:08:09', 1589, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(272, '/images/random/IMG_20230913_165825_BURST19.jpg', 2004, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:08:40', 2004, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(273, '/images/random/IMG_20230911_162856.jpg', 2217, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:08:54', 2217, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(274, '/images/random/IMG_20230911_161313.jpg', 1813, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:09:02', 1813, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(275, '/images/random/IMG_20230911_161211.jpg', 1975, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:09:11', 1975, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(276, '/images/random/IMG_20230911_160558_edited.jpg', 2107, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:09:22', 2107, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(277, '/images/random/IMG_20230909_184513.jpg', 2133, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:09:53', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(278, '/images/random/IMG_20230909_184234.jpg', 2133, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:10:06', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(279, '/images/random/IMG_20230908_153251.jpg', 2125, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:10:16', 2125, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(280, '/images/random/IMG_20230908_152934.jpg', 1865, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:10:24', 1865, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(281, '/images/random/IMG_20230908_144331.jpg', 2332, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:10:32', 2332, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(282, '/images/random/IMG_20230908_143135.jpg', 2394, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:10:39', 2394, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(283, '/images/random/IMG_20230903_173758.jpg', 2133, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:10:54', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(284, '/images/random/IMG_20230903_171608.jpg', 1649, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:10:58', 1649, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(285, '/images/random/IMG_20230903_165612.jpg', 2133, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:11:06', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(286, '/images/random/IMG_20230901_002045.jpg', 2133, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:11:10', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(287, '/images/random/IMG_20230901_002001.jpg', 2133, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:11:16', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(288, '/images/random/IMG_20230831_232050.jpg', 1769, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:11:21', 1769, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(289, '/images/random/IMG_20230831_232043.jpg', 1806, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:11:26', 1806, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(290, '/images/random/IMG_20230831_232011.jpg', 2133, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:11:35', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(291, '/images/random/IMG_20230831_231836.jpg', 1857, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:11:46', 1857, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(292, '/images/random/IMG_20230831_231603.jpg', 2133, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:12:00', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(293, '/images/random/IMG_20230831_224313.jpg', 1744, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:12:05', 1744, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(294, '/images/random/IMG_20230830_230604.jpg', 2133, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:12:11', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(295, '/images/random/IMG_20230830_225945.jpg', 2133, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:12:19', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(296, '/images/random/IMG_20230830_223738.jpg', 1673, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:12:32', 1673, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(297, '/images/random/IMG_20230830_220753.jpg', 1659, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:12:35', 1659, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(298, '/images/random/IMG_20230830_215515.jpg', 1291, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:12:41', 1291, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(299, '/images/random/IMG_20230830_215240.jpg', 2133, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:12:53', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(300, '/images/random/IMG_20230801_190718.jpg', 1857, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:12:58', 1857, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(301, '/images/random/20190411_095819.jpg', 2133, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:13:07', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(302, '/images/random/20190218_093925.jpg', 2133, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:13:20', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(303, '/images/random/20190218_093707.jpg', 2133, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:13:36', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(304, '/images/random/20190217_174729.jpg', 2133, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:13:44', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(305, '/images/random/20190216_211715.jpg', 2133, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:14:05', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(306, '/images/random/20190216_192955.jpg', 2133, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:14:24', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(307, '/images/random/20190123_130742.jpg', 2133, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:14:30', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(308, '/images/random/20190122_194920.jpg', 2133, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:14:39', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(309, '/images/random/20181210_205230.jpg', 1836, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:14:43', 1836, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(310, '/images/random/20181210_205156.jpg', 1858, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:14:46', 1858, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(311, '/images/random/20181024_083259.jpg', 1882, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:14:52', 1882, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(312, '/images/random/20181013_112140.jpg', 1708, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:15:02', 1708, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(313, '/images/random/20181013_112105.jpg', 1331, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:15:06', 1331, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(314, '/images/random/20180411_121847.jpg', 1940, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:15:12', 1940, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(315, '/images/random/20180411_121622.jpg', 1907, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:15:16', 1907, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(316, '/images/random/20170913_090052.jpg', 2133, 1600, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:15:31', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(317, '/images/map.png', 1920, 580, NULL, NULL, '2023-10-16 20:07:13', '2023-10-16 20:07:13', 1920, 580, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(318, '/images/wizard/laptop.png', 835, 835, NULL, NULL, '2023-10-16 20:07:13', '2023-10-16 20:07:13', 835, 835, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(319, '/images/wizard/computer-desktop.png', 835, 835, NULL, NULL, '2023-10-16 20:07:13', '2023-10-16 20:07:13', 835, 835, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(320, '/images/wizard/imac.png', 769, 727, NULL, NULL, '2023-10-16 20:07:13', '2023-10-16 20:07:13', 769, 727, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(321, '/images/pages/computer-cases-housings-thermaltake.webp', 1920, 1600, NULL, NULL, '2023-10-16 20:07:13', '2023-10-16 20:07:13', 1920, 1600, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(376, '/images/random/DSC03176.JPG', 2133, 1600, NULL, NULL, '2023-10-16 21:01:28', '2023-10-16 21:01:28', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(377, '/images/random/DSC03156.JPG', 2133, 1600, NULL, NULL, '2023-10-16 21:01:41', '2023-10-16 21:01:41', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(378, '/images/random/DSC03131.JPG', 2133, 1600, NULL, NULL, '2023-10-16 21:02:29', '2023-10-16 21:02:29', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(379, '/images/random/DSC01956.JPG', 2133, 1600, NULL, NULL, '2023-10-16 21:02:36', '2023-10-16 21:02:36', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(380, '/images/random/DSC01946.JPG', 2133, 1600, NULL, NULL, '2023-10-16 21:02:46', '2023-10-16 21:02:46', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(381, '/images/random/DSC00446.JPG', 2133, 1600, NULL, NULL, '2023-10-16 21:02:51', '2023-10-16 21:02:51', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(386, '/rect111611.webp', 1903, 520, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 1903, 520, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(387, '/rect111611.svg', 1903, 520, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 1903, 520, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(388, '/mir-logo.svg', 253, 253, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 253, 253, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(389, '/images/whatsapp.svg', 800, 800, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 800, 800, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(390, '/images/tiny_computer_master_balashikha.webp', 60, 60, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 60, 60, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(391, '/images/svg-dummy.svg', 1920, 1600, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 1920, 1600, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(392, '/images/services_004.webp', 480, 360, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 480, 360, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(393, '/images/services_003.webp', 415, 360, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 415, 360, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(394, '/images/services_002.webp', 491, 360, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 491, 360, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(395, '/images/services_001.webp', 582, 600, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 582, 600, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(396, '/images/pre_computer-master-landing-balashiha.webp', 477, 610, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 477, 610, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(397, '/images/pc-1-msi-computer-cases-landing-1.webp', 567, 847, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 567, 847, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(398, '/images/other_try_computer-master-landing-balashiha.png', 478, 618, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 478, 618, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(399, '/images/older_pre_computer-master-landing-balashiha.webp', 470, 610, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 470, 610, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(400, '/images/older_computer-master-landing-balashiha.webp', 437, 600, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 437, 600, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(401, '/images/old_og_landing_hero.jpg', 545, 658, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 545, 658, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(402, '/images/og_landing_hero.jpg', 545, 658, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 545, 658, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(403, '/images/my-computer-repair-bg.webp', 1498, 784, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 1498, 784, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(404, '/images/monoblock_asus.png', 334, 307, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 334, 307, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(405, '/images/mfc-balashikha.webp', 1024, 1024, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 1024, 1024, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(406, '/images/master_v_balashihe.jpg', 1197, 1600, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 1197, 1600, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(407, '/images/master-v-balashihe-rf-screwdriver.svg', 380, 380, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 380, 380, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(408, '/images/map.webp', 1920, 580, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 1920, 580, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(409, '/images/map-russia-moskva-balashiha.png', 880, 500, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 880, 500, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(410, '/images/logo-master-v-balashihe-rf-screwdriver.png', 380, 380, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 380, 380, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(411, '/images/laptop-macbook.png', 416, 427, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 416, 427, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(412, '/images/landing-banner-background-3.webp', 1477, 240, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 1477, 240, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(413, '/images/landing-banner-background-3.svg', 1477, 240, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 1477, 240, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(414, '/images/landing-banner-background-2.webp', 1477, 240, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 1477, 240, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(415, '/images/landing-banner-background-2.svg', 1477, 240, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 1477, 240, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(416, '/images/landing-banner-background-1.webp', 1477, 240, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 1477, 240, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(417, '/images/landing-banner-background-1.svg', 1477, 240, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 1477, 240, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(418, '/images/computer_master_photo_balashikha.webp', 715, 969, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 715, 969, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(419, '/images/computer_master_photo_balashikha.jpg.processed.jpg', 716, 916, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 716, 916, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(420, '/images/computer_master_photo_balashikha.jpg', 716, 916, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 716, 916, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(421, '/images/computer_master_balashikha_hero.webp', 600, 392, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 600, 392, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(422, '/images/computer-master-landing-balashiha.webp', 475, 615, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 475, 615, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(423, '/images/computer-master-landing-balashiha.png', 475, 618, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 475, 618, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(424, '/images/computer-master-circuit.webp', 1200, 848, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 1200, 848, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(425, '/images/circuite-5.webp', 1200, 675, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 1200, 675, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(426, '/images/circuit.webp', 1000, 716, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 1000, 716, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(427, '/images/circuit-4.webp', 1200, 674, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 1200, 674, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(428, '/images/circuit-3.webp', 1200, 817, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 1200, 817, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(429, '/images/circuit-2.webp', 1200, 817, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 1200, 817, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(430, '/images/busy-business-woman-balashikha.webp', 1034, 1017, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 1034, 1017, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(431, '/images/backup_computer_master_photo_balashikha.webp', 716, 916, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 716, 916, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(432, '/images/backup_computer_master_photo_balashikha.jpg.processed.jpg', 716, 916, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 716, 916, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(433, '/images/backup_computer_master_photo_balashikha.jpg', 716, 916, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 716, 916, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(434, '/images/back2_computer_master_photo_balashikha.webp', 716, 916, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 17:56:04', 716, 916, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(435, '/images/back2_computer_master_photo_balashikha.jpg', 716, 916, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 716, 916, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(436, '/icons/whatsapp.svg', 800, 800, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 800, 800, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(437, '/icons/telegram-icon.svg', 240, 240, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 240, 240, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(438, '/icons/rect001.svg', 762, 792, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 762, 792, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(439, '/icons/phone-call-icon.svg', 1000, 1000, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 1000, 1000, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(440, '/icons/badge-discount.svg', 40, 40, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 40, 40, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(441, '/images/wizard/question-mark.png', 654, 903, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 654, 903, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(442, '/images/pages/windows-repair-jpeg-2.jpg', 800, 776, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 800, 776, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(443, '/images/pages/virus.png', 750, 750, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 750, 750, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(444, '/images/pages/ustanovka-po-na-noutbook-balashikha.jpg', 800, 527, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 800, 527, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(445, '/images/pages/kompyuternye-komplektuyushie.webp', 1920, 1428, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 1920, 1428, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(446, '/images/pages/install-windows-jpeg.jpg', 1280, 640, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 1280, 640, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(447, '/images/pages/balashiha-remont-compute-hardware.webp', 1029, 740, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 1029, 740, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(448, '/images/landing/portfolio004.webp', 1293, 900, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 1293, 900, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(449, '/images/landing/portfolio003.webp', 1448, 900, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 1448, 900, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(450, '/images/landing/portfolio002.webp', 1200, 774, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 1200, 774, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(451, '/images/landing/portfolio001.webp', 1518, 900, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 1518, 900, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(452, '/images/landing/pc-1-msi-computer-cases.webp', 567, 847, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 567, 847, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(453, '/images/landing/mouse.png', 256, 228, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 256, 228, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(454, '/images/landing/icon_two.svg', 346, 346, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 346, 346, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(455, '/images/landing/icon_three.svg', 347, 346, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 347, 346, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(456, '/images/landing/icon_one.svg', 346, 346, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 346, 346, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(457, '/images/landing/icon_fooe.svg', 346, 346, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 346, 346, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(458, '/images/landing/card_background_gradient_1.svg', 557, 588, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 557, 588, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(459, '/images/icons/image-placeholder.svg', 1417, 1134, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 1417, 1134, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(460, '/images/icons/icon_phone.svg', 100, 100, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 100, 100, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(461, '/images/icons/icon_location.svg', 100, 100, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 100, 100, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(462, '/images/icons/icon_email.svg', 100, 100, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 100, 100, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(463, '/images/gradients/list-card-head-gradient-4.svg', 437, 85, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 437, 85, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(464, '/images/gradients/list-card-head-gradient-3.svg', 437, 85, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 437, 85, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(465, '/images/gradients/list-card-head-gradient-2.svg', 437, 85, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 437, 85, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(466, '/images/gradients/list-card-head-gradient-1.svg', 437, 85, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 437, 85, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(467, '/images/gradients/gradient-background-3.svg', 1477, 250, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 1477, 250, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(468, '/images/gradients/gradient-background-2.svg', 1477, 250, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 1477, 250, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(469, '/images/gradients/gradient-background-1.svg', 1477, 250, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 1477, 250, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(470, '/images/about/computer_master_photo_balashikha.jpg', 1087, 1600, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 1087, 1600, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(471, '/icons/client/step004.webp', 256, 256, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 256, 256, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(472, '/icons/client/step004.png', 256, 256, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 256, 256, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(473, '/icons/client/step003_alt.webp', 256, 256, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 256, 256, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(474, '/icons/client/step003_alt.png', 256, 256, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 256, 256, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(475, '/icons/client/step003.webp', 256, 256, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 256, 256, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(476, '/icons/client/step003.png', 256, 256, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 256, 256, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(477, '/icons/client/step002.webp', 256, 256, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 256, 256, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(478, '/icons/client/step002.png', 256, 256, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 256, 256, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(479, '/icons/client/step001.webp', 256, 256, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 256, 256, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(480, '/icons/client/step001.png', 256, 256, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 256, 256, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(511, '/image/upload/webp/avatar-nnm-120x120-pirate-penguin-1644836043083-17486.webp', 120, 120, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 17:56:05', 120, 120, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(520, '/image/upload/originals/avatar-nnm-120x120-pirate-penguin-1644836043083-17486.png', 120, 120, NULL, NULL, '2023-10-18 17:56:06', '2023-10-18 17:56:06', 120, 120, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(521, '/image/upload/originals/002-pc2-1671662663613-23577.png', 360, 223, NULL, NULL, '2023-10-18 17:56:06', '2023-10-18 17:56:06', 360, 223, NULL, 0);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(522, '/image/upload/originals/002-pc1-1671662148118-58466.png', 360, 223, NULL, NULL, '2023-10-18 17:56:06', '2023-10-18 17:56:06', 360, 223, NULL, 0);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
