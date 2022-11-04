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

-- Дамп структуры для таблица github-next-js.draft_product_variant_id_to_option_id
CREATE TABLE IF NOT EXISTS `draft_product_variant_id_to_option_id` (
  `draftVariantId` binary(16) NOT NULL,
  `nameId` int(12) unsigned NOT NULL,
  `valueId` int(12) unsigned NOT NULL,
  PRIMARY KEY (`draftVariantId`,`nameId`,`valueId`),
  UNIQUE KEY `uniq_parameter_for_each_variant_in_product_draft` (`nameId`,`draftVariantId`),
  KEY `FK_draft_prod_variant_to_option_id_opt_value` (`valueId`),
  CONSTRAINT `FK_draft_prod_variant_to_option_id_opt_value` FOREIGN KEY (`valueId`) REFERENCES `product_option_name_value` (`valueId`),
  CONSTRAINT `FK_draft_product_variant_id_to_option_id_draft_product_variant` FOREIGN KEY (`draftVariantId`) REFERENCES `draft_product_variant` (`draftVariantId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_draft_product_variant_id_to_option_id_product_option_name` FOREIGN KEY (`nameId`) REFERENCES `product_option_name` (`nameId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Дамп данных таблицы github-next-js.draft_product_variant_id_to_option_id: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `draft_product_variant_id_to_option_id` DISABLE KEYS */;
/*!40000 ALTER TABLE `draft_product_variant_id_to_option_id` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
