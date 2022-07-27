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

-- Дамп данных таблицы github-next-js.draft_image_to_product: ~19 rows (приблизительно)
/*!40000 ALTER TABLE `draft_image_to_product` DISABLE KEYS */;
INSERT IGNORE INTO `draft_image_to_product` (`draftProductId`, `draftImageId`, `orderNumber`) VALUES
	(_binary 0x14BE44EAE8FA11ECB6DE02004C4F4F50, _binary 0x9B64B22BECEC11ECB71202004C4F4F50, 0),
	(_binary 0x14BE44EAE8FA11ECB6DE02004C4F4F50, _binary 0x8870E720EDBA11ECB87B02004C4F4F50, 0),
	(_binary 0xB35DA010EF3D11ECB66302004C4F4F50, _binary 0x8870E720EDBA11ECB87B02004C4F4F50, 0),
	(_binary 0xB35DA010EF3D11ECB66302004C4F4F50, _binary 0x9B64B22BECEC11ECB71202004C4F4F50, 1),
	(_binary 0xB4722910EF3D11ECB66302004C4F4F50, _binary 0x9B64B22BECEC11ECB71202004C4F4F50, 0),
	(_binary 0xB4722910EF3D11ECB66302004C4F4F50, _binary 0x8870E720EDBA11ECB87B02004C4F4F50, 1),
	(_binary 0xB84AB3F2EF3D11ECB66302004C4F4F50, _binary 0xB84AEF55EF3D11ECB66302004C4F4F50, 0),
	(_binary 0xBE4735D9EF3D11ECB66302004C4F4F50, _binary 0xBE480E3AEF3D11ECB66302004C4F4F50, 0),
	(_binary 0xA816E6A5EF3E11ECB66302004C4F4F50, _binary 0xA8170F99EF3E11ECB66302004C4F4F50, 0),
	(_binary 0xAD0D0A83EF3E11ECB66302004C4F4F50, _binary 0x8870E720EDBA11ECB87B02004C4F4F50, 0),
	(_binary 0xB41D0B69EF3E11ECB66302004C4F4F50, _binary 0xB41D392FEF3E11ECB66302004C4F4F50, 0),
	(_binary 0xB630BDF6EF3E11ECB66302004C4F4F50, _binary 0xA8170F99EF3E11ECB66302004C4F4F50, 0),
	(_binary 0x71CE7675EF3F11ECB66302004C4F4F50, _binary 0xA8170F99EF3E11ECB66302004C4F4F50, 0),
	(_binary 0xA09E2FFEEF3F11ECB66302004C4F4F50, _binary 0x9B64B22BECEC11ECB71202004C4F4F50, 0),
	(_binary 0x64B03930EF4211ECB66302004C4F4F50, _binary 0x8870E720EDBA11ECB87B02004C4F4F50, 0),
	(_binary 0xF038DEC8037111ED85C102004C4F4F50, _binary 0x8870E720EDBA11ECB87B02004C4F4F50, 0),
	(_binary 0xF038DEC8037111ED85C102004C4F4F50, _binary 0x3811ACC8095111ED846D60A44C4F528E, 1);
/*!40000 ALTER TABLE `draft_image_to_product` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
