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

-- Дамп структуры для таблица github-next-js.product_variant
CREATE TABLE IF NOT EXISTS `product_variant` (
  `variantId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productId` int(10) unsigned NOT NULL,
  `option_id_1` int(10) unsigned DEFAULT NULL,
  `option_id_2` int(10) unsigned DEFAULT NULL,
  `option_id_3` int(10) unsigned DEFAULT NULL,
  `option_id_4` int(10) unsigned DEFAULT NULL,
  `price` int(10) unsigned DEFAULT NULL,
  `compareAtPrice` int(10) unsigned DEFAULT NULL,
  `currencyCodeId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`variantId`),
  KEY `FK_product_variant_product_option` (`option_id_1`),
  KEY `FK_product_variant_product` (`productId`),
  KEY `FK_product_variant_product_option_2` (`option_id_2`),
  KEY `FK_product_variant_product_option_3` (`option_id_3`),
  KEY `FK_product_variant_product_option_4` (`option_id_4`),
  KEY `FK_product_variant_price_currency_code` (`currencyCodeId`),
  CONSTRAINT `FK_product_variant_price_currency_code` FOREIGN KEY (`currencyCodeId`) REFERENCES `price_currency_code` (`currencyCodeId`),
  CONSTRAINT `FK_product_variant_product` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`),
  CONSTRAINT `FK_product_variant_product_option` FOREIGN KEY (`option_id_1`) REFERENCES `product_option` (`optionId`),
  CONSTRAINT `FK_product_variant_product_option_2` FOREIGN KEY (`option_id_2`) REFERENCES `product_option` (`optionId`),
  CONSTRAINT `FK_product_variant_product_option_3` FOREIGN KEY (`option_id_3`) REFERENCES `product_option` (`optionId`),
  CONSTRAINT `FK_product_variant_product_option_4` FOREIGN KEY (`option_id_4`) REFERENCES `product_option` (`optionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Дамп данных таблицы github-next-js.product_variant: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `product_variant` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_variant` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
