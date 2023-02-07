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

-- Дамп структуры для представление master_v_balashihe.product_category_breadcrumbs
-- Удаление временной таблицы и создание окончательной структуры представления
DROP TABLE IF EXISTS `product_category_breadcrumbs`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `product_category_breadcrumbs` AS SELECT
 1 AS `id`,
  1 AS `category_name`,
  1 AS `parent_id`,
  1 AS `handle`,
  1 AS `slug`,
  1 AS `breadcrumbs`,
  1 AS `uri_pathes`,
  1 AS `updatedAt`,
  1 AS `createdAt`,
  1 AS `product_category_id`,
  1 AS `productsCount`,
  1 AS `parentId`,
  1 AS `name` ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
