-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               10.10.2-MariaDB - mariadb.org binary distribution
-- Операционная система:         Win64
-- HeidiSQL Версия:              12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Дамп структуры для таблица github-next-js.product_variant_id_to_option_id
CREATE TABLE IF NOT EXISTS `product_variant_id_to_option_id` (
  `variantId` int(10) unsigned NOT NULL,
  `nameId` int(12) unsigned NOT NULL,
  `valueId` int(12) unsigned NOT NULL,
  PRIMARY KEY (`variantId`,`nameId`,`valueId`),
  UNIQUE KEY `uniq_parameter_name_for_each_variant` (`variantId`,`nameId`),
  KEY `FK_product_variant_id_to_option_id_product_option_name` (`nameId`),
  KEY `FK_product_variant_id_to_option_id_product_option_name_value` (`valueId`),
  CONSTRAINT `FK_product_variant_id_to_option_id_product_option_name` FOREIGN KEY (`nameId`) REFERENCES `product_option_name` (`nameId`),
  CONSTRAINT `FK_product_variant_id_to_option_id_product_option_name_value` FOREIGN KEY (`valueId`) REFERENCES `product_option_name_value` (`valueId`),
  CONSTRAINT `FK_product_variant_id_to_option_id_product_variant` FOREIGN KEY (`variantId`) REFERENCES `product_variant` (`variantId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Дамп данных таблицы github-next-js.product_variant_id_to_option_id: ~0 rows (приблизительно)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
