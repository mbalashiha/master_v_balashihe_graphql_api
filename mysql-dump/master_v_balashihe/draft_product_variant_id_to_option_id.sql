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

-- Дамп структуры для таблица master_v_balashihe.draft_product_variant_id_to_option_id
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Дамп данных таблицы master_v_balashihe.draft_product_variant_id_to_option_id: ~0 rows (приблизительно)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
