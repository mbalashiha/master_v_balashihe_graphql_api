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

-- Дамп данных таблицы github-next-js.draft_image_to_product: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `draft_image_to_product` DISABLE KEYS */;
INSERT IGNORE INTO `draft_image_to_product` (`draftProductId`, `draftImageId`, `orderNumber`) VALUES
	(_binary 0x2F8ABE5F5F8811EDBD1B60A44C4F528E, _binary 0x2F8C8FA85F8811EDBD1B60A44C4F528E, 2),
	(_binary 0x2F8ABE5F5F8811EDBD1B60A44C4F528E, _binary 0x2F8C97035F8811EDBD1B60A44C4F528E, 2),
	(_binary 0x2F8ABE5F5F8811EDBD1B60A44C4F528E, _binary 0x2F8C98885F8811EDBD1B60A44C4F528E, 2),
	(_binary 0x2F8ABE5F5F8811EDBD1B60A44C4F528E, _binary 0x798BF68B5F9C11EDBD1B60A44C4F528E, 2),
	(_binary 0x2F8ABE5F5F8811EDBD1B60A44C4F528E, _binary 0x9B00EDFC53D711EDB34C60A44C4F528E, 1),
	(_binary 0x44D090D05E7A11EDB3E860A44C4F528E, _binary 0x2F8C97035F8811EDBD1B60A44C4F528E, 4),
	(_binary 0x44D090D05E7A11EDB3E860A44C4F528E, _binary 0x2F8C98885F8811EDBD1B60A44C4F528E, 2),
	(_binary 0x44D090D05E7A11EDB3E860A44C4F528E, _binary 0x9B00EDFC53D711EDB34C60A44C4F528E, 3),
	(_binary 0x44D090D05E7A11EDB3E860A44C4F528E, _binary 0x2F8C8FA85F8811EDBD1B60A44C4F528E, 1);
/*!40000 ALTER TABLE `draft_image_to_product` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
