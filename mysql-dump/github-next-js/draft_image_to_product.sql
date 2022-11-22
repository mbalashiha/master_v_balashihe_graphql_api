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

-- Дамп структуры для таблица github-next-js.draft_image_to_product
CREATE TABLE IF NOT EXISTS `draft_image_to_product` (
  `draftProductId` binary(16) NOT NULL,
  `draftImageId` binary(16) NOT NULL,
  `orderNumber` tinyint(3) unsigned NOT NULL,
  KEY `FK_draft_image_to_product_draft_product` (`draftProductId`),
  KEY `FK_draft_image_to_product_draft_image` (`draftImageId`),
  CONSTRAINT `FK_draft_image_to_product_draft_image` FOREIGN KEY (`draftImageId`) REFERENCES `draft_image` (`draftImageId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_draft_image_to_product_draft_product` FOREIGN KEY (`draftProductId`) REFERENCES `draft_product` (`draftProductId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Дамп данных таблицы github-next-js.draft_image_to_product: ~6 rows (приблизительно)
/*!40000 ALTER TABLE `draft_image_to_product` DISABLE KEYS */;
INSERT IGNORE INTO `draft_image_to_product` (`draftProductId`, `draftImageId`, `orderNumber`) VALUES
	(_binary 0xA005640A629B11EDB37460A44C4F528E, _binary 0x764BCA1C629B11EDB37460A44C4F528E, 1),
	(_binary 0x75267585629311EDB37460A44C4F528E, _binary 0x7EAFC2F062A311EDB37460A44C4F528E, 1),
	(_binary 0x7A1C7E20637111EDB3B560A44C4F528E, _binary 0x439875CF612111EDB34760A44C4F528E, 1),
	(_binary 0x7A1C7E20637111EDB3B560A44C4F528E, _binary 0x4399761A612111EDB34760A44C4F528E, 2),
	(_binary 0x1F4F5FF968FE11EDB24160A44C4F528E, _binary 0xB806586A68FE11EDB24160A44C4F528E, 1),
	(_binary 0x8C9B604C6A8111EDB2D960A44C4F528E, _binary 0xB806586A68FE11EDB24160A44C4F528E, 1);
/*!40000 ALTER TABLE `draft_image_to_product` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
