-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               10.6.11-MariaDB-0ubuntu0.22.04.1 - Ubuntu 22.04
-- Операционная система:         debian-linux-gnu
-- HeidiSQL Версия:              12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Дамп структуры для представление master_v_balashihe.draft_product_view
-- Удаление временной таблицы и создание окончательной структуры представления
DROP TABLE IF EXISTS `draft_product_view`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `draft_product_view` AS select 1 AS `handle`,1 AS `managerId`,1 AS `amount`,1 AS `currencyCode`,1 AS `vendor`,1 AS `draftProductId`,1 AS `draftVariantId`,1 AS `productId`,1 AS `published`,1 AS `orderNumber`,1 AS `title`,1 AS `sku`,1 AS `product_category_id`,1 AS `manufacturerId`,1 AS `description`,1 AS `descriptionHtml`,1 AS `descriptionRawDraftContentState`,1 AS `createdAt`,1 AS `updatedAt`,1 AS `publishedAt`,1 AS `currencyCodeId`,1 AS `variantsWithOptions`,1 AS `price`,1 AS `image`,1 AS `images`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
