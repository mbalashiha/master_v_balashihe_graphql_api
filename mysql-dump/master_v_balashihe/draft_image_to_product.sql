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

-- Дамп структуры для таблица master_v_balashihe.draft_image_to_product
CREATE TABLE IF NOT EXISTS `draft_image_to_product` (
  `draftProductId` binary(16) NOT NULL,
  `draftImageId` binary(16) NOT NULL,
  `orderNumber` tinyint(3) unsigned NOT NULL,
  KEY `FK_draft_image_to_product_draft_product` (`draftProductId`),
  KEY `FK_draft_image_to_product_draft_image` (`draftImageId`),
  CONSTRAINT `FK_draft_image_to_product_draft_image` FOREIGN KEY (`draftImageId`) REFERENCES `draft_image` (`draftImageId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_draft_image_to_product_draft_product` FOREIGN KEY (`draftProductId`) REFERENCES `draft_product` (`draftProductId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Дамп данных таблицы master_v_balashihe.draft_image_to_product: ~6 rows (приблизительно)
INSERT IGNORE INTO `draft_image_to_product` (`draftProductId`, `draftImageId`, `orderNumber`) VALUES
	(_binary 0xa005640a629b11edb37460a44c4f528e, _binary 0x764bca1c629b11edb37460a44c4f528e, 1);
INSERT IGNORE INTO `draft_image_to_product` (`draftProductId`, `draftImageId`, `orderNumber`) VALUES
	(_binary 0x75267585629311edb37460a44c4f528e, _binary 0x7eafc2f062a311edb37460a44c4f528e, 1);
INSERT IGNORE INTO `draft_image_to_product` (`draftProductId`, `draftImageId`, `orderNumber`) VALUES
	(_binary 0x7a1c7e20637111edb3b560a44c4f528e, _binary 0x439875cf612111edb34760a44c4f528e, 1);
INSERT IGNORE INTO `draft_image_to_product` (`draftProductId`, `draftImageId`, `orderNumber`) VALUES
	(_binary 0x7a1c7e20637111edb3b560a44c4f528e, _binary 0x4399761a612111edb34760a44c4f528e, 2);
INSERT IGNORE INTO `draft_image_to_product` (`draftProductId`, `draftImageId`, `orderNumber`) VALUES
	(_binary 0x1f4f5ff968fe11edb24160a44c4f528e, _binary 0xb806586a68fe11edb24160a44c4f528e, 1);
INSERT IGNORE INTO `draft_image_to_product` (`draftProductId`, `draftImageId`, `orderNumber`) VALUES
	(_binary 0xabd4a7b86dd411edb23e60a44c4f528e, _binary 0xb806586a68fe11edb24160a44c4f528e, 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
