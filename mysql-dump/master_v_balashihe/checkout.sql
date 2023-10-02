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

-- Дамп структуры для таблица master_v_balashihe.checkout
CREATE TABLE IF NOT EXISTS `checkout` (
  `checkoutId` binary(16) NOT NULL DEFAULT unhex(replace(uuid(),'-','')),
  `checkoutName` tinytext DEFAULT NULL,
  `taxesIncluded` tinyint(1) unsigned DEFAULT NULL,
  `completedAt` timestamp NULL DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`checkoutId`),
  UNIQUE KEY `Индекс 2` (`checkoutName`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Дамп данных таблицы master_v_balashihe.checkout: ~11 rows (приблизительно)
INSERT IGNORE INTO `checkout` (`checkoutId`, `checkoutName`, `taxesIncluded`, `completedAt`, `createdAt`, `updatedAt`) VALUES
	(_binary 0x25bb06a7d08511ecb6ad02004c4f4f50, NULL, NULL, NULL, '2022-05-10 17:18:05', '2022-05-10 17:18:05');
INSERT IGNORE INTO `checkout` (`checkoutId`, `checkoutName`, `taxesIncluded`, `completedAt`, `createdAt`, `updatedAt`) VALUES
	(_binary 0x2d429edad08511ecb6ad02004c4f4f50, NULL, NULL, NULL, '2022-05-10 17:18:17', '2022-05-10 17:18:17');
INSERT IGNORE INTO `checkout` (`checkoutId`, `checkoutName`, `taxesIncluded`, `completedAt`, `createdAt`, `updatedAt`) VALUES
	(_binary 0x330629ffd08511ecb6ad02004c4f4f50, NULL, NULL, NULL, '2022-05-10 17:18:27', '2022-05-10 17:18:27');
INSERT IGNORE INTO `checkout` (`checkoutId`, `checkoutName`, `taxesIncluded`, `completedAt`, `createdAt`, `updatedAt`) VALUES
	(_binary 0x44ad91d4ca4611ecb72102004c4f4f50, NULL, NULL, NULL, '2022-05-02 18:32:52', '2022-05-02 18:32:52');
INSERT IGNORE INTO `checkout` (`checkoutId`, `checkoutName`, `taxesIncluded`, `completedAt`, `createdAt`, `updatedAt`) VALUES
	(_binary 0x51d36404d08511ecb6ad02004c4f4f50, NULL, NULL, NULL, '2022-05-10 17:19:19', '2022-05-10 17:19:19');
INSERT IGNORE INTO `checkout` (`checkoutId`, `checkoutName`, `taxesIncluded`, `completedAt`, `createdAt`, `updatedAt`) VALUES
	(_binary 0x95432998d08511ecb6ad02004c4f4f50, NULL, NULL, NULL, '2022-05-10 17:21:12', '2022-05-10 17:21:12');
INSERT IGNORE INTO `checkout` (`checkoutId`, `checkoutName`, `taxesIncluded`, `completedAt`, `createdAt`, `updatedAt`) VALUES
	(_binary 0x9bdca560d06911ecb6ad02004c4f4f50, NULL, NULL, NULL, '2022-05-10 14:00:57', '2022-05-10 14:00:57');
INSERT IGNORE INTO `checkout` (`checkoutId`, `checkoutName`, `taxesIncluded`, `completedAt`, `createdAt`, `updatedAt`) VALUES
	(_binary 0x9da3ccb6d06a11ecb6ad02004c4f4f50, NULL, NULL, NULL, '2022-05-10 14:08:09', '2022-05-10 14:08:09');
INSERT IGNORE INTO `checkout` (`checkoutId`, `checkoutName`, `taxesIncluded`, `completedAt`, `createdAt`, `updatedAt`) VALUES
	(_binary 0xb1c3fb06d08411ecb6ad02004c4f4f50, NULL, NULL, NULL, '2022-05-10 17:14:50', '2022-05-10 17:14:50');
INSERT IGNORE INTO `checkout` (`checkoutId`, `checkoutName`, `taxesIncluded`, `completedAt`, `createdAt`, `updatedAt`) VALUES
	(_binary 0xd40d95291bd111edb79f60a44c4f528e, NULL, NULL, NULL, '2022-08-14 13:05:56', '2022-08-14 13:05:56');
INSERT IGNORE INTO `checkout` (`checkoutId`, `checkoutName`, `taxesIncluded`, `completedAt`, `createdAt`, `updatedAt`) VALUES
	(_binary 0xe47a04a5315c11edb74160a44c4f528e, NULL, NULL, NULL, '2022-09-10 23:04:15', '2022-09-10 23:04:15');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
