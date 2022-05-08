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

-- Дамп структуры для таблица github-next-js.checkout_line_item
CREATE TABLE IF NOT EXISTS `checkout_line_item` (
  `checkoutId` binary(16) NOT NULL,
  `variantId` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  UNIQUE KEY `Индекс 3` (`checkoutId`,`variantId`),
  KEY `FK_checkout_line_items_product_variant` (`variantId`),
  CONSTRAINT `FK_checkout_line_item_checkout` FOREIGN KEY (`checkoutId`) REFERENCES `checkout` (`checkoutId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_checkout_line_items_product_variant` FOREIGN KEY (`variantId`) REFERENCES `product_variant` (`variantId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Дамп данных таблицы github-next-js.checkout_line_item: ~5 rows (приблизительно)
/*!40000 ALTER TABLE `checkout_line_item` DISABLE KEYS */;
INSERT IGNORE INTO `checkout_line_item` (`checkoutId`, `variantId`, `quantity`) VALUES
	(_binary 0x44AD91D4CA4611ECB72102004C4F4F50, 33, 1),
	(_binary 0x44AD91D4CA4611ECB72102004C4F4F50, 34, 1),
	(_binary 0x44AD91D4CA4611ECB72102004C4F4F50, 35, 1),
	(_binary 0x44AD91D4CA4611ECB72102004C4F4F50, 36, 1),
	(_binary 0x44AD91D4CA4611ECB72102004C4F4F50, 40, 1);
/*!40000 ALTER TABLE `checkout_line_item` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
