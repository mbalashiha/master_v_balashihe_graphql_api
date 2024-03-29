-- --------------------------------------------------------
-- Хост:                         192.168.0.50
-- Версия сервера:               11.0.3-MariaDB-1:11.0.3+maria~ubu2204 - mariadb.org binary distribution
-- Операционная система:         debian-linux-gnu
-- HeidiSQL Версия:              12.6.0.6765
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
  `title` varchar(150) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=387254 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Дамп данных таблицы master_v_balashihe.image: ~357 rows (приблизительно)
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(64, '/image/upload/webp/avatar-nnm-another-copy-pinguine-pirate-1644835997144-299703.webp', 678, 678, NULL, NULL, NULL, '2023-03-13 18:06:05', '2023-10-18 19:19:32', 678, 678, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(68, '/image/upload/webp/kisspng-bsd-daemon-berkeley-1609757841238-116702-jpg.webp', 530, 530, NULL, NULL, NULL, '2023-03-13 19:34:25', '2023-10-18 19:19:32', 530, 530, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(69, '/image/upload/webp/dollardollar-devil-pngfuel-com-1585413620282-488653-png.webp', 1000, 1032, NULL, NULL, NULL, '2023-03-13 19:55:31', '2023-10-18 19:19:32', 1000, 1032, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(71, '/image/upload/webp/avatar-kartinka-policejskij-smajlik-1614103989630-7372-jpg.webp', 225, 225, NULL, NULL, NULL, '2023-03-13 20:01:18', '2023-10-18 19:19:32', 225, 225, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(74, '/image/upload/webp/avatar-nnm-another-copy-pinguine-pirate-1644835997144-299703-png.webp', 678, 678, NULL, NULL, NULL, '2023-03-13 20:10:07', '2023-10-18 19:19:32', 678, 678, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(75, '/image/upload/webp/dollardollar-devil-pngfuel-jpeg-avatar-1671787432551-79883-jpg.webp', 1000, 1032, NULL, NULL, NULL, '2023-03-13 20:10:59', '2023-10-18 19:19:32', 1000, 1032, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(77, '/image/upload/webp/nnm-avatar-1644230939702-59712-png.webp', 274, 274, NULL, NULL, NULL, '2023-03-14 00:36:31', '2023-10-18 19:19:31', 274, 274, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(83, '/image/upload/webp/kisspng-bsd-daemon-berkeley-1585413536140-69971-jpg.webp', 900, 580, NULL, NULL, NULL, '2023-03-14 14:58:58', '2023-10-18 19:19:32', 900, 580, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(91, '/image/upload/webp/dollardollar-devil-pngfuel-cutted-avatar-1671787729862-53935-jpg.webp', 821, 795, NULL, NULL, NULL, '2023-03-14 15:18:05', '2023-10-18 19:19:32', 821, 795, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(93, '/image/upload/webp/dollardollar-clipart-freebsd-freebsd-devil-1585413601569-373803-png.webp', 920, 1113, NULL, NULL, NULL, '2023-03-14 15:18:06', '2023-10-18 19:19:32', 920, 1113, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(94, '/image/upload/webp/100x100-avatar-rutracker-pirate-penguin-1666608244482-14169-png.webp', 100, 100, NULL, NULL, NULL, '2023-03-14 15:18:06', '2023-10-18 19:19:32', 100, 100, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(96, '/image/upload/webp/avatar-nnm-small-120x120-pirate-penguin-1644835286015-12208-jpg.webp', 120, 120, NULL, NULL, NULL, '2023-03-14 15:18:06', '2023-10-18 19:19:32', 120, 120, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(97, '/image/upload/webp/avatar-nnm-120x120-pirate-penguin-1644836043083-17486-png.webp', 120, 120, NULL, NULL, NULL, '2023-03-14 15:18:06', '2023-10-18 19:19:32', 120, 120, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(99, '/image/upload/webp/avatar-nnm-cutted-to-squere-pirate-penguin-1644835172956-121540-jpg.webp', 683, 683, NULL, NULL, NULL, '2023-03-14 15:18:07', '2023-10-18 19:19:32', 683, 683, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(101, '/image/upload/webp/f1a10725ac9e3847469761d6e058129dc122b2f7327b022884pimgpsh-fullsize-distr-1461589367184-5588046-png.webp', 2560, 1600, NULL, NULL, NULL, '2023-03-14 15:42:40', '2023-10-18 19:19:32', 2560, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(111, '/image/upload/webp/avatar-nnm-pirate-penguin-1644574095000-71638-jpg.webp', 750, 1000, NULL, NULL, NULL, '2023-03-14 16:13:55', '2023-10-18 19:19:32', 750, 1000, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(112, '/image/upload/webp/dsc03438-1611251723520-1684654-jpg.webp', 1600, 1600, NULL, NULL, NULL, '2023-03-14 16:13:57', '2023-10-18 19:19:32', 1600, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(147, '/image/upload/webp/balashiha-remont-compute-hardware-1673206155883-54592-webp.webp', 1029, 740, NULL, NULL, NULL, '2023-03-26 19:36:44', '2023-10-18 19:19:32', 1029, 740, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(149, '/image/upload/webp/virus-1673192124984-112217-png.webp', 750, 750, NULL, NULL, NULL, '2023-03-26 22:24:24', '2023-10-18 19:19:31', 750, 750, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(150, '/image/upload/webp/another-2-square-motherboard-dolls-board-1673288192849-916821-jpg.webp', 1600, 1600, NULL, NULL, NULL, '2023-04-15 19:05:31', '2023-10-18 19:19:32', 1600, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(151, '/image/upload/webp/beatiful-micro-chip-background-obrabotano-1681234813669-1987245-jpg.webp', 2187, 1447, NULL, NULL, NULL, '2023-04-15 19:07:11', '2023-10-18 19:19:32', 2187, 1447, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(152, '/image/upload/webp/1619084348-16-phonoteka-org-p-remont-kompyuterov-fon-16-1673192290673-484764-webp.webp', 2400, 1600, NULL, NULL, NULL, '2023-04-15 19:08:13', '2023-10-18 19:19:32', 2400, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(153, '/image/upload/webp/kisspng-computer-cases-housings-power-supply-unit-cooler-top-bench-5b2ccd4c4f5428-955011561529662796325-1673210180958-475972-png.webp', 567, 847, NULL, NULL, NULL, '2023-04-15 19:10:13', '2023-10-18 19:19:32', 567, 847, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(154, '/image/upload/webp/computer-master-photo-balashikha-obrabotano-1684174021276-446383-jpg.webp', 714, 817, NULL, NULL, NULL, '2023-06-15 15:18:02', '2023-10-18 19:19:32', 714, 817, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(159, '/image/upload/webp/balashiha-os-mirosoft-windows-7-10-1687986729105-328338-png.webp', 898, 883, NULL, NULL, NULL, '2023-06-28 21:13:32', '2023-10-18 19:19:32', 898, 883, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(160, '/image/upload/webp/blue-screen-of-death-1687801635520-106333-png.webp', 512, 512, NULL, NULL, NULL, '2023-07-05 12:53:25', '2023-10-18 19:19:32', 512, 512, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(161, '/image/upload/webp/programs-computer-1688561818301-207862-png.webp', 500, 503, NULL, NULL, NULL, '2023-07-05 12:57:57', '2023-10-18 19:19:31', 500, 503, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(162, '/image/upload/webp/virus-danger-1687543510386-1073197-png.webp', 1920, 1654, NULL, NULL, NULL, '2023-07-05 12:59:11', '2023-10-18 19:19:31', 1920, 1654, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(163, '/image/upload/webp/laptop-1673210850945-1147358-png.webp', 1040, 1067, NULL, NULL, NULL, '2023-07-05 13:47:19', '2023-10-18 19:19:32', 1040, 1067, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(164, '/image/upload/webp/png-transparent-car-repairing-location-service-location-car-service-location-location-pin-service-3d-icon-1688563481795-74902-png.webp', 920, 920, NULL, NULL, NULL, '2023-07-05 15:05:06', '2023-10-18 19:19:31', 920, 920, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(165, '/image/upload/webp/prozrachnyj-fon-png-transparent-car-repairing-location-service-location-car-service-location-location-pin-service-3d-icon-obrabotano-1688569468213-186296-png.webp', 920, 920, NULL, NULL, NULL, '2023-07-05 15:07:30', '2023-10-18 19:19:31', 920, 920, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(166, '/image/upload/webp/gear-screw-master-1688564087966-1369037-png.webp', 1680, 1680, NULL, NULL, NULL, '2023-07-05 15:11:46', '2023-10-18 19:19:32', 1680, 1680, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(167, '/image/upload/webp/pc-repair-man-1688563916729-497671-png.webp', 1438, 1402, NULL, NULL, NULL, '2023-07-05 15:15:54', '2023-10-18 19:19:31', 1438, 1402, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(168, '/image/upload/webp/vecteezy-a-3d-icon-of-a-computer-in-critical-error-due-to-a-virus-25003644-828-1688562227116-5189235-png.webp', 2500, 2500, NULL, NULL, NULL, '2023-07-05 15:16:48', '2023-10-18 19:19:31', 2500, 2500, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(169, '/image/upload/webp/modeling-social-media-in-computer-1688562505251-1619736-png.webp', 2200, 2200, NULL, NULL, NULL, '2023-07-09 23:20:07', '2023-10-18 19:19:32', 2200, 2200, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(268, '/images/random/computer_master_balashikha_hero.webp', 515, 392, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-02 14:46:17', 515, 392, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(269, '/images/random/IMG_20230927_182127.jpg', 2133, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:08:02', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(270, '/images/random/IMG_20230927_152211.jpg', 2133, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:08:06', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(271, '/images/random/IMG_20230921_220356.jpg', 1589, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:08:09', 1589, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(272, '/images/random/IMG_20230913_165825_BURST19.jpg', 2004, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:08:40', 2004, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(273, '/images/random/IMG_20230911_162856.jpg', 2217, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:08:54', 2217, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(274, '/images/random/IMG_20230911_161313.jpg', 1813, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:09:02', 1813, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(275, '/images/random/IMG_20230911_161211.jpg', 1975, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:09:11', 1975, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(276, '/images/random/IMG_20230911_160558_edited.jpg', 2107, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:09:22', 2107, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(277, '/images/random/IMG_20230909_184513.jpg', 2133, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:09:53', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(278, '/images/random/IMG_20230909_184234.jpg', 2133, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:10:06', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(279, '/images/random/IMG_20230908_153251.jpg', 2125, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:10:16', 2125, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(280, '/images/random/IMG_20230908_152934.jpg', 1865, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:10:24', 1865, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(281, '/images/random/IMG_20230908_144331.jpg', 2332, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:10:32', 2332, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(282, '/images/random/IMG_20230908_143135.jpg', 2394, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:10:39', 2394, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(283, '/images/random/IMG_20230903_173758.jpg', 2133, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:10:54', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(284, '/images/random/IMG_20230903_171608.jpg', 1649, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:10:58', 1649, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(285, '/images/random/IMG_20230903_165612.jpg', 2133, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:11:06', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(286, '/images/random/IMG_20230901_002045.jpg', 2133, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:11:10', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(287, '/images/random/IMG_20230901_002001.jpg', 2133, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:11:16', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(288, '/images/random/IMG_20230831_232050.jpg', 1769, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:11:21', 1769, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(289, '/images/random/IMG_20230831_232043.jpg', 1806, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:11:26', 1806, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(290, '/images/random/IMG_20230831_232011.jpg', 2133, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:11:35', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(291, '/images/random/IMG_20230831_231836.jpg', 1857, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:11:46', 1857, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(292, '/images/random/IMG_20230831_231603.jpg', 2133, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:12:00', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(293, '/images/random/IMG_20230831_224313.jpg', 1744, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:12:05', 1744, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(294, '/images/random/IMG_20230830_230604.jpg', 2133, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:12:11', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(295, '/images/random/IMG_20230830_225945.jpg', 2133, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:12:19', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(296, '/images/random/IMG_20230830_223738.jpg', 1673, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:12:32', 1673, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(297, '/images/random/IMG_20230830_220753.jpg', 1659, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:12:35', 1659, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(298, '/images/random/IMG_20230830_215515.jpg', 1291, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:12:41', 1291, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(299, '/images/random/IMG_20230830_215240.jpg', 2133, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:12:53', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(300, '/images/random/IMG_20230801_190718.jpg', 1857, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:12:58', 1857, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(301, '/images/random/20190411_095819.jpg', 2133, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:13:07', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(302, '/images/random/20190218_093925.jpg', 2133, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:13:20', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(303, '/images/random/20190218_093707.jpg', 2133, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:13:36', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(304, '/images/random/20190217_174729.jpg', 2133, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:13:44', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(305, '/images/random/20190216_211715.jpg', 2133, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:14:05', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(306, '/images/random/20190216_192955.jpg', 2133, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:14:24', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(307, '/images/random/20190123_130742.jpg', 2133, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:14:30', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(308, '/images/random/20190122_194920.jpg', 2133, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:14:39', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(309, '/images/random/20181210_205230.jpg', 1836, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:14:43', 1836, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(310, '/images/random/20181210_205156.jpg', 1858, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:14:46', 1858, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(311, '/images/random/20181024_083259.jpg', 1882, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:14:52', 1882, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(312, '/images/random/20181013_112140.jpg', 1708, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:15:02', 1708, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(313, '/images/random/20181013_112105.jpg', 1331, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:15:06', 1331, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(314, '/images/random/20180411_121847.jpg', 1129, 1128, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-12-27 19:02:08', 1129, 1128, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(315, '/images/random/20180411_121622.jpg', 1907, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:15:16', 1907, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(316, '/images/random/20170913_090052.jpg', 2133, 1600, NULL, NULL, NULL, '2023-10-02 14:46:17', '2023-10-16 20:15:31', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(317, '/images/map.png', 1920, 580, NULL, NULL, NULL, '2023-10-16 20:07:13', '2023-10-18 19:19:30', 1920, 580, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(318, '/images/wizard/laptop.png', 1600, 1600, NULL, NULL, NULL, '2023-10-16 20:07:13', '2023-10-21 19:54:10', 1600, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(319, '/images/wizard/computer-desktop.png', 1148, 1148, NULL, NULL, NULL, '2023-10-16 20:07:13', '2023-10-21 19:58:31', 1148, 1148, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(320, '/images/wizard/imac.png', 1518, 1518, NULL, NULL, NULL, '2023-10-16 20:07:13', '2023-10-21 19:57:10', 1518, 1518, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(321, '/images/pages/computer-cases-housings-thermaltake.webp', 1920, 1600, NULL, NULL, NULL, '2023-10-16 20:07:13', '2023-10-18 19:19:31', 1920, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(386, '/rect111611.webp', 1903, 520, NULL, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 19:19:09', 1903, 520, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(387, '/rect111611.svg', 1903, 520, NULL, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 19:19:09', 1903, 520, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(388, '/mir-logo.svg', 253, 253, NULL, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 19:19:09', 253, 253, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(389, '/images/whatsapp.svg', 800, 800, NULL, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 19:19:09', 800, 800, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(390, '/images/tiny_computer_master_balashikha.webp', 60, 60, NULL, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 19:19:09', 60, 60, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(391, '/images/svg-dummy.svg', 1920, 1600, NULL, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 19:19:09', 1920, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(397, '/images/pc-1-msi-computer-cases-landing-1.webp', 567, 847, NULL, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 19:19:30', 567, 847, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(399, '/images/older_pre_computer-master-landing-balashiha.webp', 470, 610, NULL, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 19:19:30', 470, 610, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(401, '/images/old_og_landing_hero.jpg', 545, 658, NULL, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 19:19:30', 545, 658, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(402, '/images/og_landing_hero.jpg', 545, 658, NULL, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 19:19:30', 545, 658, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(403, '/images/my-computer-repair-bg.webp', 1498, 784, NULL, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 19:19:30', 1498, 784, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(404, '/images/monoblock_asus.png', 334, 307, NULL, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 19:19:30', 334, 307, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(405, '/images/mfc-balashikha.webp', 1024, 1024, NULL, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 19:19:30', 1024, 1024, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(406, '/images/master_v_balashihe.jpg', 1544, 2160, NULL, NULL, NULL, '2023-10-18 17:56:04', '2023-12-08 18:49:59', 1544, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(407, '/images/master-v-balashihe-rf-screwdriver.svg', 380, 380, NULL, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 19:19:30', 380, 380, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(408, '/images/map.webp', 1920, 580, NULL, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 19:19:30', 1920, 580, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(410, '/images/logo-master-v-balashihe-rf-screwdriver.png', 380, 380, NULL, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 19:19:30', 380, 380, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(411, '/images/laptop-macbook.png', 416, 427, NULL, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 19:19:30', 416, 427, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(412, '/images/landing-banner-background-3.webp', 1477, 240, NULL, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 19:19:30', 1477, 240, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(413, '/images/landing-banner-background-3.svg', 1477, 240, NULL, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 19:19:30', 1477, 240, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(414, '/images/landing-banner-background-2.webp', 1477, 240, NULL, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 19:19:30', 1477, 240, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(415, '/images/landing-banner-background-2.svg', 1477, 240, NULL, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 19:19:30', 1477, 240, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(416, '/images/landing-banner-background-1.webp', 1477, 240, NULL, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 19:19:30', 1477, 240, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(417, '/images/landing-banner-background-1.svg', 1477, 240, NULL, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 19:19:30', 1477, 240, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(421, '/images/computer_master_balashikha_hero.webp', 600, 392, NULL, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 19:19:30', 600, 392, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(424, '/images/computer-master-circuit.webp', 1200, 848, NULL, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 19:19:30', 1200, 848, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(425, '/images/circuite-5.webp', 1200, 675, NULL, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 19:19:30', 1200, 675, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(426, '/images/circuit.webp', 1000, 716, NULL, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 19:19:30', 1000, 716, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(427, '/images/circuit-4.webp', 1200, 674, NULL, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 19:19:30', 1200, 674, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(428, '/images/circuit-3.webp', 1200, 817, NULL, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 19:19:30', 1200, 817, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(429, '/images/circuit-2.webp', 1200, 817, NULL, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 19:19:30', 1200, 817, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(434, '/images/back2_computer_master_photo_balashikha.webp', 716, 916, NULL, NULL, NULL, '2023-10-18 17:56:04', '2023-10-18 19:19:30', 716, 916, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(436, '/icons/whatsapp.svg', 800, 800, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:30', 800, 800, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(437, '/icons/telegram-icon.svg', 240, 240, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:30', 240, 240, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(439, '/icons/phone-call-icon.svg', 1000, 1000, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:30', 1000, 1000, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(440, '/icons/badge-discount.svg', 40, 40, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:31', 40, 40, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(441, '/images/wizard/question-mark.png', 1600, 1600, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-21 19:53:40', 1600, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(442, '/images/pages/windows-repair-jpeg-2.jpg', 800, 776, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:31', 800, 776, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(443, '/images/pages/virus.png', 750, 750, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:31', 750, 750, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(444, '/images/pages/ustanovka-po-na-noutbook-balashikha.jpg', 800, 527, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:31', 800, 527, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(445, '/images/pages/kompyuternye-komplektuyushie.webp', 1920, 1428, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:31', 1920, 1428, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(446, '/images/pages/install-windows-jpeg.jpg', 1280, 640, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:31', 1280, 640, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(447, '/images/pages/balashiha-remont-compute-hardware.webp', 1029, 740, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:31', 1029, 740, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(448, '/images/landing/portfolio004.webp', 1293, 900, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:31', 1293, 900, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(449, '/images/landing/portfolio003.webp', 1448, 900, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:31', 1448, 900, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(450, '/images/landing/portfolio002.webp', 1200, 774, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:31', 1200, 774, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(451, '/images/landing/portfolio001.webp', 1518, 900, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:31', 1518, 900, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(452, '/images/landing/pc-1-msi-computer-cases.webp', 567, 847, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:31', 567, 847, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(453, '/images/landing/mouse.png', 256, 228, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:31', 256, 228, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(454, '/images/landing/icon_two.svg', 346, 346, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:31', 346, 346, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(455, '/images/landing/icon_three.svg', 347, 346, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:31', 347, 346, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(456, '/images/landing/icon_one.svg', 346, 346, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:31', 346, 346, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(457, '/images/landing/icon_fooe.svg', 346, 346, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:31', 346, 346, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(458, '/images/landing/card_background_gradient_1.svg', 557, 588, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:31', 557, 588, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(459, '/images/icons/image-placeholder.svg', 1417, 1134, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:31', 1417, 1134, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(460, '/images/icons/icon_phone.svg', 100, 100, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:31', 100, 100, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(461, '/images/icons/icon_location.svg', 100, 100, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:31', 100, 100, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(462, '/images/icons/icon_email.svg', 100, 100, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:31', 100, 100, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(463, '/images/gradients/list-card-head-gradient-4.svg', 437, 85, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:31', 437, 85, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(464, '/images/gradients/list-card-head-gradient-3.svg', 437, 85, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:31', 437, 85, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(465, '/images/gradients/list-card-head-gradient-2.svg', 437, 85, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:31', 437, 85, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(466, '/images/gradients/list-card-head-gradient-1.svg', 437, 85, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:31', 437, 85, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(467, '/images/gradients/gradient-background-3.svg', 1477, 250, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:31', 1477, 250, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(468, '/images/gradients/gradient-background-2.svg', 1477, 250, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:31', 1477, 250, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(469, '/images/gradients/gradient-background-1.svg', 1477, 250, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:31', 1477, 250, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(470, '/images/about/computer_master_photo_balashikha.jpg', 1504, 2057, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-12-09 22:19:50', 1504, 2057, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(471, '/icons/client/step004.webp', 256, 256, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:31', 256, 256, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(472, '/icons/client/step004.png', 256, 256, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:31', 256, 256, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(473, '/icons/client/step003_alt.webp', 256, 256, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:31', 256, 256, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(474, '/icons/client/step003_alt.png', 256, 256, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:31', 256, 256, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(475, '/icons/client/step003.webp', 256, 256, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:31', 256, 256, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(476, '/icons/client/step003.png', 256, 256, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:31', 256, 256, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(477, '/icons/client/step002.webp', 256, 256, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:31', 256, 256, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(478, '/icons/client/step002.png', 256, 256, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:31', 256, 256, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(479, '/icons/client/step001.webp', 256, 256, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:31', 256, 256, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(480, '/icons/client/step001.png', 256, 256, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:31', 256, 256, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(511, '/image/upload/webp/avatar-nnm-120x120-pirate-penguin-1644836043083-17486.webp', 120, 120, NULL, NULL, NULL, '2023-10-18 17:56:05', '2023-10-18 19:19:32', 120, 120, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(1257, '/images/wizard/question-mark.webp', 1600, 1600, NULL, NULL, NULL, '2023-10-21 19:53:40', '2023-10-21 19:53:40', 1600, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(1259, '/images/wizard/laptop.webp', 1600, 1600, NULL, NULL, NULL, '2023-10-21 19:54:10', '2023-10-21 19:54:10', 1600, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(1261, '/images/wizard/imac.webp', 1518, 1518, NULL, NULL, NULL, '2023-10-21 19:57:10', '2023-10-21 19:57:10', 1518, 1518, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(1263, '/images/wizard/computer-desktop.webp', 1148, 1148, NULL, NULL, NULL, '2023-10-21 19:58:31', '2023-10-21 19:58:31', 1148, 1148, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(14082, '/images/random/IMG_20230831_225023.jpg', 2562, 2160, NULL, NULL, NULL, '2023-10-29 19:55:55', '2023-10-29 19:55:55', 2562, 2160, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(14083, '/images/random/IMG_20230831_211739.jpg', 1051, 1080, NULL, NULL, NULL, '2023-10-29 19:55:56', '2023-10-29 19:55:56', 1051, 1080, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(19017, '/image/upload/webp/pngwing-com-24-1697916770777-488261-png.webp', 1280, 905, NULL, NULL, NULL, '2023-11-01 21:12:16', '2023-11-01 21:12:16', 1280, 905, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(19019, '/image/upload/webp/888b0d3304eaf88478a133c53616c9af-1698597320684-123523-jpg.webp', 736, 1472, NULL, NULL, NULL, '2023-11-01 21:20:20', '2023-11-01 21:20:20', 736, 1472, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(19020, '/image/upload/webp/pngwing-com-22-1697916745910-570918-png.webp', 1014, 1024, 'Ещё портфолио - компьютерный мастер', NULL, NULL, '2023-11-01 21:23:23', '2023-11-10 12:34:37', 1014, 1024, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(19021, '/image/upload/webp/pngwing-com-21-1697916734762-286620-png.webp', 597, 483, NULL, NULL, NULL, '2023-11-01 21:27:52', '2023-11-01 21:27:52', 597, 483, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(19023, '/image/upload/webp/question-mark-1697917249453-792903-png.webp', 2572, 2572, NULL, NULL, NULL, '2023-11-01 21:47:49', '2023-11-01 21:47:49', 2572, 2572, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(19024, '/image/upload/webp/001-1697916401897-243691-png.webp', 800, 618, NULL, NULL, NULL, '2023-11-01 21:54:40', '2023-11-01 21:54:40', 800, 618, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(19025, '/image/upload/webp/pngwing-com-14-1697916611512-421057-png.webp', 960, 960, NULL, NULL, NULL, '2023-11-01 22:06:51', '2023-11-01 22:06:51', 960, 960, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(19494, '/image/upload/webp/pngwing-com-23-1697916754642-1095525-png.webp', 1000, 1000, 'Моё портфолио - компьютерный мастер', NULL, NULL, '2023-11-02 14:13:51', '2023-11-10 12:34:37', 1000, 1000, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(20038, '/images/services/services_004.jpg', 3840, 2160, NULL, NULL, NULL, '2023-11-02 20:47:11', '2023-11-12 23:45:48', 3840, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(20135, '/images/services/services_003.jpg', 2696, 1898, NULL, NULL, NULL, '2023-11-02 21:49:40', '2023-11-02 22:47:48', 2696, 1898, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(20198, '/images/services/services_002.jpg', 2133, 1600, NULL, NULL, NULL, '2023-11-02 21:49:41', '2023-11-02 21:49:41', 2133, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(20199, '/images/services/services_001.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-02 21:49:41', '2023-11-12 23:45:59', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(20460, '/images/services_003.webp', 415, 360, NULL, NULL, NULL, '2023-11-02 22:47:50', '2023-11-02 22:47:50', 415, 360, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(20461, '/images/services_002.webp', 491, 360, NULL, NULL, NULL, '2023-11-02 22:47:50', '2023-11-02 22:47:50', 491, 360, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(20462, '/images/services_001.webp', 582, 600, NULL, NULL, NULL, '2023-11-02 22:47:50', '2023-11-02 22:47:50', 582, 600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(20529, '/images/landing/portfolio004.jpg', 2133, 1600, NULL, NULL, NULL, '2023-11-02 22:47:51', '2023-11-02 22:47:51', 2133, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(30176, '/images/computer_master_landing_balashiha.webp', 600, 902, NULL, NULL, NULL, '2023-11-06 12:57:53', '2023-12-08 18:49:59', 600, 902, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(42489, '/image/upload/webp/computer-desktop-2-1697917515323-1613807-png.webp', 1148, 1148, NULL, NULL, NULL, '2023-11-07 19:31:53', '2023-11-07 19:31:53', 1148, 1148, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(42490, '/image/upload/webp/laptop-2-1697917379513-3931362-png.webp', 2160, 2160, NULL, NULL, NULL, '2023-11-07 19:32:19', '2023-11-10 16:07:29', 2160, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(42505, '/image/upload/webp/pngwing-com-15-1697916629771-189161-png.webp', 500, 500, NULL, NULL, NULL, '2023-11-07 20:31:14', '2023-11-07 20:31:14', 500, 500, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(42512, '/image/upload/webp/older-dsc04494-1698959951922-2628444-jpg.webp', 2880, 2160, NULL, NULL, NULL, '2023-11-07 22:00:01', '2023-11-08 00:59:19', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(42518, '/image/upload/webp/imac-1697917678533-1457164-png.webp', 1518, 1518, NULL, NULL, NULL, '2023-11-07 22:08:28', '2023-11-07 22:08:28', 1518, 1518, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(42533, '/image/upload/webp/pngwing-com-16-1697916647478-1541835-png.webp', 1600, 1163, NULL, NULL, NULL, '2023-11-07 23:08:07', '2023-11-07 23:08:07', 1600, 1163, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(42535, '/image/upload/webp/2023-10-01-14-22-45-1696160213825-1591755-png.webp', 2342, 2829, NULL, NULL, NULL, '2023-11-07 23:19:13', '2023-11-07 23:19:13', 2342, 2829, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(42536, '/image/upload/webp/final-tiny-new-editing-img-20230922-191950-1699276347696-455203-png.webp', 600, 802, NULL, NULL, NULL, '2023-11-07 23:58:19', '2023-11-07 23:58:19', 600, 802, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(42537, '/image/upload/webp/older-002-dsc04520-1698960054182-2755478-jpg.webp', 2880, 2160, NULL, NULL, NULL, '2023-11-07 23:58:21', '2023-11-08 00:59:27', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(42538, '/image/upload/webp/old-dsc04498-1698959996492-2606604-jpg.webp', 2880, 2160, NULL, NULL, NULL, '2023-11-07 23:58:22', '2023-11-08 00:59:33', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(42540, '/image/upload/webp/interest-next-img-20230911-174242-1698597833764-2477947-jpg.webp', 1520, 2160, NULL, NULL, NULL, '2023-11-07 23:58:25', '2023-11-08 00:59:41', 1520, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(42541, '/image/upload/webp/interest-img-20230911-174242-1698597732724-2919227-jpg.webp', 2880, 2160, NULL, NULL, NULL, '2023-11-07 23:58:27', '2023-11-08 00:59:47', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(42551, '/image/upload/webp/pngwing-com-18-1697916667540-488261-png.webp', 1280, 905, NULL, NULL, NULL, '2023-11-07 23:58:35', '2023-11-07 23:58:35', 1280, 905, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(42611, '/image/upload/webp/computer-master-photo-balashikha-1697411861519-264824-jpg.webp', 1087, 1600, NULL, NULL, NULL, '2023-11-08 00:20:31', '2023-11-08 00:20:31', 1087, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(42612, '/image/upload/webp/master-v-balashihe-1697406128668-252532-jpg.webp', 1197, 1600, NULL, NULL, NULL, '2023-11-08 00:20:32', '2023-11-08 00:20:32', 1197, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(42613, '/image/upload/webp/logo-master-v-balashihe-rf-screwdriver-1697404865478-33490-png.webp', 380, 380, NULL, NULL, NULL, '2023-11-08 00:20:32', '2023-11-08 00:20:32', 380, 380, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(42614, '/image/upload/webp/dsc03141-1696191921933-2861876-jpg.webp', 2880, 2160, NULL, NULL, NULL, '2023-11-08 00:20:35', '2023-11-08 01:00:44', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(42615, '/image/upload/webp/dsc03154-1696191902503-2671893-jpg.webp', 2880, 2160, NULL, NULL, NULL, '2023-11-08 00:20:38', '2023-11-09 20:11:35', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(42616, '/image/upload/webp/img-20230825-145755-1696185770659-2850834-jpg.webp', 2880, 2160, NULL, NULL, NULL, '2023-11-08 00:20:41', '2023-11-08 01:00:05', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(42617, '/image/upload/webp/img-20230901-002001-1696184731559-2848184-jpg.webp', 2880, 2160, NULL, NULL, NULL, '2023-11-08 00:20:45', '2023-11-08 00:59:58', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(42618, '/image/upload/webp/img-20230911-174242-1696183859689-2919227-jpg.webp', 2880, 2160, NULL, NULL, NULL, '2023-11-08 00:20:49', '2023-11-08 00:59:53', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(42619, '/image/upload/webp/2023-10-01-18-29-33-1696174183710-364029-png.webp', 545, 658, NULL, NULL, NULL, '2023-11-08 00:20:49', '2023-11-08 00:20:49', 545, 658, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(42620, '/image/upload/webp/small-for-landing-page-1692966627039-good-1696164655507-282307-png.webp', 428, 618, NULL, NULL, NULL, '2023-11-08 00:20:50', '2023-11-08 00:20:50', 428, 618, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(42998, '/image/upload/webp/2023-10-01-14-24-21-1696160413825-1498818-png.webp', 2032, 2829, NULL, NULL, NULL, '2023-11-08 01:26:59', '2023-11-08 01:26:59', 2032, 2829, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(43000, '/image/upload/webp/2023-10-01-14-23-27-1696160382725-1419766-png.webp', 2125, 2829, NULL, NULL, NULL, '2023-11-08 01:27:01', '2023-11-08 01:27:01', 2125, 2829, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(43002, '/image/upload/webp/2023-10-01-14-24-49-1696160336295-1538577-png.webp', 2259, 2829, NULL, NULL, NULL, '2023-11-08 01:27:02', '2023-11-08 01:27:02', 2259, 2829, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(43004, '/image/upload/webp/2023-10-01-14-23-45-1696160254915-1390364-png.webp', 2128, 2829, NULL, NULL, NULL, '2023-11-08 01:27:04', '2023-11-08 01:27:04', 2128, 2829, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(44347, '/image/upload/webp/ultra-small-img-20230922-191950-1695490024181-297132-png.webp', 478, 618, NULL, NULL, NULL, '2023-11-09 23:28:11', '2023-11-09 23:28:11', 478, 618, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(49370, '/images/services/older_services_001.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-12 23:46:08', '2023-11-12 23:46:08', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(49436, '/images/services/older_services_004.jpg', 582, 600, NULL, NULL, NULL, '2023-11-12 23:46:08', '2023-11-12 23:46:08', 582, 600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(49438, '/images/services/__services_001.jpg', 1293, 900, NULL, NULL, NULL, '2023-11-12 23:46:08', '2023-11-12 23:46:08', 1293, 900, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(51872, '/images/before_computer_master_landing_balashiha.webp', 600, 802, NULL, NULL, NULL, '2023-11-19 21:54:27', '2023-11-19 21:54:27', 600, 802, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(51873, '/images/before_computer_master_landing_balashiha.png', 600, 802, NULL, NULL, NULL, '2023-11-19 21:54:27', '2023-11-19 21:54:27', 600, 802, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(53842, '/images/ticker/IMG_20230909_183741.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-20 20:02:26', '2023-11-20 20:02:26', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(53844, '/images/ticker/IMG_20230909_181923.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-20 20:02:50', '2023-11-20 20:02:50', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(53845, '/images/ticker/IMG_20230908_153241.jpg', 3840, 2160, NULL, NULL, NULL, '2023-11-20 20:03:05', '2023-11-20 20:03:05', 3840, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(53853, '/images/ticker/IMG_20230908_144204.jpg', 3840, 2160, NULL, NULL, NULL, '2023-11-20 20:04:59', '2023-11-20 20:04:59', 3840, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(53855, '/images/ticker/IMG_20230903_173622.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-20 20:05:26', '2023-11-20 20:05:26', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(53856, '/images/ticker/IMG_20230901_002044.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-20 20:05:32', '2023-11-20 20:05:32', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(53857, '/images/ticker/IMG_20230901_002001.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-20 20:05:36', '2023-11-20 20:05:36', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(53858, '/images/ticker/IMG_20230831_232011.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-20 20:05:48', '2023-11-20 20:05:48', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(53860, '/images/ticker/IMG_20230831_224313.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-20 20:06:15', '2023-11-20 20:06:15', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(53861, '/images/ticker/IMG_20230831_212511.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-20 20:06:26', '2023-11-20 20:06:26', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(53862, '/images/ticker/IMG_20230830_225945.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-20 20:06:36', '2023-11-20 20:06:36', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(53863, '/images/ticker/IMG_20230830_220753.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-20 20:06:46', '2023-11-20 20:06:46', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(53864, '/images/ticker/IMG_20230830_215515.jpg', 1291, 1081, NULL, NULL, NULL, '2023-11-20 20:06:47', '2023-11-20 20:06:47', 1291, 1081, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(53865, '/images/ticker/IMG_20230830_213600.jpg', 2291, 2160, NULL, NULL, NULL, '2023-11-20 20:07:00', '2023-11-20 20:07:00', 2291, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(53891, '/images/ticker/DSC00428.jpg', 1024, 768, NULL, NULL, NULL, '2023-11-20 20:12:05', '2023-11-20 20:12:05', 1024, 768, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(53892, '/images/ticker/20190218_093925.jpg', 2133, 1600, NULL, NULL, NULL, '2023-11-20 20:12:09', '2023-11-20 20:12:09', 2133, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(53893, '/images/ticker/20190123_130742.jpg', 1600, 1758, NULL, NULL, NULL, '2023-11-20 20:12:12', '2023-11-20 20:12:12', 1600, 1758, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(53957, '/images/ticker/computer_master_balashikha_hero.webp', 600, 392, NULL, NULL, NULL, '2023-11-20 20:12:12', '2023-11-21 00:03:14', 600, 392, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(53963, '/images/ticker/IMG_20230927_182127.jpg', 2133, 1600, NULL, NULL, NULL, '2023-11-20 20:12:12', '2023-11-20 20:12:12', 2133, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(53964, '/images/ticker/IMG_20230927_152211.jpg', 2133, 1600, NULL, NULL, NULL, '2023-11-20 20:12:12', '2023-11-20 20:12:12', 2133, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(53965, '/images/ticker/IMG_20230921_220356.jpg', 1589, 1600, NULL, NULL, NULL, '2023-11-20 20:12:12', '2023-11-20 20:12:12', 1589, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(53966, '/images/ticker/IMG_20230913_165825_BURST19.jpg', 2004, 1600, NULL, NULL, NULL, '2023-11-20 20:12:12', '2023-11-20 20:12:12', 2004, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(53967, '/images/ticker/IMG_20230911_162856.jpg', 2217, 1600, NULL, NULL, NULL, '2023-11-20 20:12:12', '2023-11-20 20:12:12', 2217, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(53968, '/images/ticker/IMG_20230911_161313.jpg', 1813, 1600, NULL, NULL, NULL, '2023-11-20 20:12:12', '2023-11-20 20:12:12', 1813, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(53969, '/images/ticker/IMG_20230911_161211.jpg', 1975, 1600, NULL, NULL, NULL, '2023-11-20 20:12:12', '2023-11-20 20:12:12', 1975, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(53981, '/images/ticker/IMG_20230908_152934.jpg', 1865, 1600, NULL, NULL, NULL, '2023-11-20 20:12:13', '2023-11-20 20:12:13', 1865, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(53989, '/images/ticker/IMG_20230908_143135.jpg', 2394, 1600, NULL, NULL, NULL, '2023-11-20 20:12:13', '2023-11-20 20:12:13', 2394, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(53992, '/images/ticker/IMG_20230903_171608.jpg', 1649, 1600, NULL, NULL, NULL, '2023-11-20 20:12:13', '2023-11-20 20:12:13', 1649, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(53997, '/images/ticker/IMG_20230831_232043.jpg', 1806, 1600, NULL, NULL, NULL, '2023-11-20 20:12:13', '2023-11-20 20:12:13', 1806, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(53999, '/images/ticker/IMG_20230831_231836.jpg', 1857, 1600, NULL, NULL, NULL, '2023-11-20 20:12:13', '2023-11-20 20:12:13', 1857, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(54005, '/images/ticker/IMG_20230830_223738.jpg', 1673, 1600, NULL, NULL, NULL, '2023-11-20 20:12:13', '2023-11-20 20:12:13', 1673, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(54008, '/images/ticker/IMG_20230830_215240.jpg', 2133, 1600, NULL, NULL, NULL, '2023-11-20 20:12:13', '2023-11-20 20:12:13', 2133, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(54010, '/images/ticker/IMG_20230801_190718.jpg', 1857, 1600, NULL, NULL, NULL, '2023-11-20 20:12:13', '2023-11-20 20:12:13', 1857, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(54042, '/images/ticker/20190218_093707.jpg', 2133, 1600, NULL, NULL, NULL, '2023-11-20 20:12:13', '2023-11-20 20:12:13', 2133, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(54043, '/images/ticker/20190217_174729.jpg', 2133, 1600, NULL, NULL, NULL, '2023-11-20 20:12:13', '2023-11-20 20:12:13', 2133, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(54044, '/images/ticker/20190216_211715.jpg', 2133, 1600, NULL, NULL, NULL, '2023-11-20 20:12:13', '2023-11-20 20:12:13', 2133, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(54045, '/images/ticker/20190216_192955.jpg', 2133, 1600, NULL, NULL, NULL, '2023-11-20 20:12:13', '2023-11-20 20:12:13', 2133, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(54047, '/images/ticker/20190122_194920.jpg', 2133, 1600, NULL, NULL, NULL, '2023-11-20 20:12:13', '2023-11-20 20:12:13', 2133, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(54048, '/images/ticker/20181210_205230.jpg', 1836, 1600, NULL, NULL, NULL, '2023-11-20 20:12:13', '2023-11-20 20:12:13', 1836, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(54049, '/images/ticker/20181210_205156.jpg', 1858, 1600, NULL, NULL, NULL, '2023-11-20 20:12:13', '2023-11-20 20:12:13', 1858, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(54050, '/images/ticker/20181024_083259.jpg', 1882, 1600, NULL, NULL, NULL, '2023-11-20 20:12:13', '2023-11-20 20:12:13', 1882, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(54051, '/images/ticker/20181013_112140.jpg', 1708, 1600, NULL, NULL, NULL, '2023-11-20 20:12:13', '2023-11-20 20:12:13', 1708, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(54052, '/images/ticker/20180411_121847.jpg', 1940, 1600, NULL, NULL, NULL, '2023-11-20 20:12:13', '2023-11-20 20:12:13', 1940, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(54054, '/images/ticker/20170913_090052.jpg', 2133, 1600, NULL, NULL, NULL, '2023-11-20 20:12:13', '2023-11-20 20:12:13', 2133, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(70920, '/images/main_landing_seo_image.webp', 1361, 2160, NULL, NULL, NULL, '2023-11-21 22:05:29', '2023-11-21 22:05:29', 1361, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(70962, '/images/before_master_v_balashihe.jpg', 1197, 1600, NULL, NULL, NULL, '2023-11-21 22:05:29', '2023-11-21 22:05:29', 1197, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(77448, '/images/ticker/20190123_130715.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-25 14:32:14', '2023-11-25 14:32:14', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(77449, '/images/ticker/20181104_224102.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-25 14:32:30', '2023-11-25 14:32:30', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(83969, '/images/ticker/cleaning_dust_DSC00415.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:20', '2023-11-26 13:14:20', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(83971, '/images/ticker/another_4_DSC02244.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:20', '2023-11-26 13:14:20', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(83972, '/images/ticker/another_3_DSC02241.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:20', '2023-11-26 13:14:20', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(83973, '/images/ticker/another_2_DSC03172.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:20', '2023-11-26 13:14:20', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84003, '/images/ticker/DSC04858.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:20', '2023-11-26 13:14:20', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84004, '/images/ticker/DSC04385.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:20', '2023-11-26 13:14:20', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84005, '/images/ticker/DSC03156.jpg', 2133, 1600, NULL, NULL, NULL, '2023-11-26 13:14:20', '2023-11-26 13:14:20', 2133, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84006, '/images/ticker/DSC03176.jpg', 2133, 1600, NULL, NULL, NULL, '2023-11-26 13:14:20', '2023-11-26 13:14:20', 2133, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84007, '/images/ticker/DSC03138.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:20', '2023-11-26 13:14:20', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84008, '/images/ticker/DSC03131.jpg', 2133, 1600, NULL, NULL, NULL, '2023-11-26 13:14:20', '2023-11-26 13:14:20', 2133, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84009, '/images/ticker/DSC02823.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:20', '2023-11-26 13:14:20', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84010, '/images/ticker/DSC02820.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:20', '2023-11-26 13:14:20', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84011, '/images/ticker/DSC02814.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:20', '2023-11-26 13:14:20', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84012, '/images/ticker/DSC02797.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:20', '2023-11-26 13:14:20', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84013, '/images/ticker/DSC02792.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:20', '2023-11-26 13:14:20', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84014, '/images/ticker/DSC02791.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:20', '2023-11-26 13:14:20', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84015, '/images/ticker/DSC02766.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:20', '2023-11-26 13:14:20', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84016, '/images/ticker/DSC02749.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:20', '2023-11-26 13:14:20', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84017, '/images/ticker/DSC02731.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:21', '2023-11-26 13:14:21', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84018, '/images/ticker/DSC02649.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:21', '2023-11-26 13:14:21', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84019, '/images/ticker/DSC02646.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:21', '2023-11-26 13:14:21', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84020, '/images/ticker/DSC02634.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:21', '2023-11-26 13:14:21', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84021, '/images/ticker/DSC02629.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:21', '2023-11-26 13:14:21', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84022, '/images/ticker/DSC02628.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:21', '2023-11-26 13:14:21', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84023, '/images/ticker/DSC02627.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:21', '2023-11-26 13:14:21', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84024, '/images/ticker/DSC02605.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:21', '2023-11-26 13:14:21', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84025, '/images/ticker/DSC02563.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:21', '2023-11-26 13:14:21', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84026, '/images/ticker/DSC02532.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:21', '2023-11-26 13:14:21', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84027, '/images/ticker/DSC02524.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:21', '2023-11-26 13:14:21', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84028, '/images/ticker/DSC02267.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:21', '2023-11-26 13:14:21', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84029, '/images/ticker/DSC02260.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:21', '2023-11-26 13:14:21', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84030, '/images/ticker/DSC02252.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:21', '2023-11-26 13:14:21', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84031, '/images/ticker/DSC02247.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:21', '2023-11-26 13:14:21', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84032, '/images/ticker/DSC02241.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:21', '2023-11-26 13:14:21', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84033, '/images/ticker/DSC02239.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:21', '2023-11-26 13:14:21', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84034, '/images/ticker/DSC02225.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:21', '2023-11-26 13:14:21', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84035, '/images/ticker/DSC02223.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:21', '2023-11-26 13:14:21', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84036, '/images/ticker/DSC02211.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:21', '2023-11-26 13:14:21', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84037, '/images/ticker/DSC02204.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:21', '2023-11-26 13:14:21', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84038, '/images/ticker/DSC02034.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:21', '2023-11-26 13:14:21', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84039, '/images/ticker/DSC02015.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:21', '2023-11-26 13:14:21', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84040, '/images/ticker/DSC01956.jpg', 2133, 1600, NULL, NULL, NULL, '2023-11-26 13:14:21', '2023-11-26 13:14:21', 2133, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84041, '/images/ticker/DSC01946.jpg', 1439, 1306, NULL, NULL, NULL, '2023-11-26 13:14:21', '2023-11-26 13:14:21', 1439, 1306, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84042, '/images/ticker/DSC01905.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:21', '2023-11-26 13:14:21', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84043, '/images/ticker/DSC00911.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:21', '2023-11-26 13:14:21', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84044, '/images/ticker/DSC00698.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:21', '2023-11-26 13:14:21', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84045, '/images/ticker/DSC00693.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:21', '2023-11-26 13:14:21', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84046, '/images/ticker/DSC00689.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:21', '2023-11-26 13:14:21', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84047, '/images/ticker/DSC00687.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:21', '2023-11-26 13:14:21', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84048, '/images/ticker/DSC00682.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:21', '2023-11-26 13:14:21', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84049, '/images/ticker/DSC00656.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:21', '2023-11-26 13:14:21', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84050, '/images/ticker/DSC00654.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:21', '2023-11-26 13:14:21', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84051, '/images/ticker/DSC00447.jpg', 2880, 2160, NULL, NULL, NULL, '2023-11-26 13:14:21', '2023-11-26 13:14:21', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84069, '/images/random/DSC03176.jpg', 2133, 1600, NULL, NULL, NULL, '2023-11-26 13:14:21', '2023-11-26 13:14:21', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84070, '/images/random/DSC03156.jpg', 2133, 1600, NULL, NULL, NULL, '2023-11-26 13:14:21', '2023-11-26 13:14:21', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84071, '/images/random/DSC03131.jpg', 2133, 1600, NULL, NULL, NULL, '2023-11-26 13:14:21', '2023-11-26 13:14:21', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84072, '/images/random/DSC01956.jpg', 2133, 1600, NULL, NULL, NULL, '2023-11-26 13:14:21', '2023-11-26 13:14:21', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84073, '/images/random/DSC01946.jpg', 1439, 1388, NULL, NULL, NULL, '2023-11-26 13:14:21', '2023-11-26 13:14:21', 1439, 1388, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(84074, '/images/random/DSC00446.jpg', 2133, 1600, NULL, NULL, NULL, '2023-11-26 13:14:21', '2023-11-26 13:14:21', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(90786, '/images/ticker/20150305_160226.jpg', 3264, 1836, NULL, NULL, NULL, '2023-11-26 18:47:55', '2023-11-26 18:47:55', 3264, 1836, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(90787, '/images/ticker/20150127_174037.jpg', 3264, 1836, NULL, NULL, NULL, '2023-11-26 18:48:07', '2023-11-26 18:48:07', 3264, 1836, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(90947, '/images/ticker/20150305_160226.webp', 3264, 1836, NULL, NULL, NULL, '2023-11-26 18:48:08', '2023-11-26 18:48:08', 3264, 1836, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(90949, '/images/ticker/20150127_174037.webp', 3264, 1836, NULL, NULL, NULL, '2023-11-26 18:48:08', '2023-11-26 18:48:08', 3264, 1836, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(97400, '/images/random/DSC03176_loweredcase_ext.jpg', 2133, 1600, NULL, NULL, NULL, '2023-11-27 22:15:05', '2023-11-27 22:15:05', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(97401, '/images/random/DSC03156_loweredcase_ext.jpg', 2133, 1600, NULL, NULL, NULL, '2023-11-27 22:15:05', '2023-11-27 22:15:05', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(97402, '/images/random/DSC03131_loweredcase_ext.jpg', 2133, 1600, NULL, NULL, NULL, '2023-11-27 22:15:05', '2023-11-27 22:15:05', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(97403, '/images/random/DSC01956_loweredcase_ext.jpg', 2133, 1600, NULL, NULL, NULL, '2023-11-27 22:15:05', '2023-11-27 22:15:05', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(97404, '/images/random/DSC01946_loweredcase_ext.jpg', 1439, 1388, NULL, NULL, NULL, '2023-11-27 22:15:05', '2023-11-27 22:15:05', 1439, 1388, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(97405, '/images/random/DSC00446_loweredcase_ext.jpg', 2133, 1600, NULL, NULL, NULL, '2023-11-27 22:15:05', '2023-11-27 22:15:05', 2133, 1600, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(100419, '/icons/vk.svg', 26, 26, NULL, NULL, NULL, '2023-11-30 00:34:52', '2023-11-30 00:34:52', 26, 26, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(100421, '/icons/telegram-fill.svg', 24, 20, NULL, NULL, NULL, '2023-11-30 00:34:52', '2023-11-30 00:34:52', 24, 20, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(102428, '/image/upload/webp/dollardollar-devil-pngfuel-cutted-avatar-1671787729862-53935.webp', 821, 795, NULL, NULL, NULL, '2023-11-30 02:32:50', '2023-11-30 02:32:50', 821, 795, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(102431, '/image/upload/webp/dollardollar-clipart-freebsd-freebsd-devil-1585413601569-373803.webp', 920, 1113, NULL, NULL, NULL, '2023-11-30 02:32:50', '2023-11-30 02:32:50', 920, 1113, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(125058, '/images/ticker/Foto847.jpg', 2560, 1920, NULL, NULL, NULL, '2023-12-04 17:39:18', '2023-12-04 17:39:18', 2560, 1920, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(125060, '/images/ticker/DSC04882.jpg', 2880, 2160, NULL, NULL, NULL, '2023-12-04 17:40:03', '2023-12-04 17:40:03', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(125061, '/images/ticker/DSC04854.jpg', 2880, 2160, NULL, NULL, NULL, '2023-12-04 17:40:25', '2023-12-04 17:40:25', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(125155, '/images/ticker/Foto847.webp', 2560, 1920, NULL, NULL, NULL, '2023-12-04 17:40:26', '2023-12-04 17:40:26', 2560, 1920, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(125157, '/images/ticker/DSC04882.webp', 2880, 2160, NULL, NULL, NULL, '2023-12-04 17:40:26', '2023-12-04 17:40:26', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(125160, '/images/ticker/DSC04854.webp', 2880, 2160, NULL, NULL, NULL, '2023-12-04 17:40:26', '2023-12-04 17:40:26', 2880, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(140636, '/images/master_v_balashihe.webp', 1544, 2160, NULL, NULL, NULL, '2023-12-08 18:49:59', '2023-12-08 18:49:59', 1544, 2160, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(141397, '/images/about/older_computer_master_photo_balashikha.jpg', 1061, 1600, NULL, NULL, NULL, '2023-12-09 16:41:23', '2023-12-09 16:41:23', 1061, 1600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(141398, '/images/about/computer_master_photo_balashikha.webp', 1504, 2057, NULL, NULL, NULL, '2023-12-09 16:41:23', '2023-12-09 22:19:52', 1504, 2057, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(142654, '/images/older_computer-master-landing-balashiha.webp', 437, 600, NULL, NULL, NULL, '2023-12-09 22:57:17', '2023-12-09 22:57:17', 437, 600, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(142665, '/images/main_landing_cutted.webp', 600, 909, NULL, NULL, NULL, '2023-12-09 22:57:17', '2023-12-09 22:57:17', 600, 909, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(181375, '/images/random/20180411_121847.webp', 1129, 1128, NULL, NULL, NULL, '2023-12-27 19:02:10', '2023-12-27 19:02:10', 1129, 1128, NULL, 1);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(181786, '/image/upload/webp/b1210908-5817-4758-8b29-6cdf9eebf202-1702931165520-243307-jfif.webp', 1024, 1024, NULL, NULL, NULL, '2023-12-27 21:01:55', '2023-12-27 21:01:55', 1024, 1024, NULL, NULL);
INSERT IGNORE INTO `image` (`imageId`, `imgSrc`, `width`, `height`, `title`, `altText`, `format`, `createdAt`, `updatedAt`, `originalWidth`, `originalHeight`, `pathOfOriginal`, `useAsRandom`) VALUES
	(349844, '/image/upload/webp/3be4840c-05a7-4090-a531-5e29ffb8dc45-1702931260249-265669-jfif.webp', 1024, 1024, NULL, NULL, NULL, '2024-01-04 21:25:02', '2024-01-04 21:25:02', 1024, 1024, NULL, NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
