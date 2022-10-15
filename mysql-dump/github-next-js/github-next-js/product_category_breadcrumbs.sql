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

-- Дамп структуры для представление github-next-js.product_category_breadcrumbs
-- Удаление временной таблицы и создание окончательной структуры представления
DROP TABLE IF EXISTS `product_category_breadcrumbs`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `product_category_breadcrumbs` AS select `c1`.`product_category_id` AS `id`,`c1`.`category_name` AS `category_name`,`c1`.`parent_id` AS `parent_id`,`c1`.`category_slug` AS `category_slug`,concat_ws('/',`c18`.`category_name`,`c17`.`category_name`,`c16`.`category_name`,`c15`.`category_name`,`c14`.`category_name`,`c13`.`category_name`,`c12`.`category_name`,`c11`.`category_name`,`c10`.`category_name`,`c9`.`category_name`,`c8`.`category_name`,`c7`.`category_name`,`c6`.`category_name`,`c5`.`category_name`,`c4`.`category_name`,`c3`.`category_name`,`c2`.`category_name`,`c1`.`category_name`) AS `breadcrumbs`,`c1`.`updatedAt` AS `updatedAt`,`c1`.`createdAt` AS `createdAt`,`c1`.`product_category_id` AS `product_category_id`,count(distinct `pr`.`productId`) + count(distinct `categorychilds`.`product_category_id`) AS `productsCount`,`c1`.`parent_id` AS `parentId`,`c1`.`category_name` AS `name`,`c1`.`category_slug` AS `slug` from (((((((((((((((((((`product_category` `c1` left join `product_category` `categorychilds` on(`categorychilds`.`parent_id` = `c1`.`product_category_id`)) left join `product` `pr` on(`pr`.`product_category_id` = `c1`.`product_category_id`)) left join `product_category` `c2` on(`c1`.`product_category_id` is not null and `c1`.`parent_id` = `c2`.`product_category_id`)) left join `product_category` `c3` on(`c2`.`product_category_id` is not null and `c2`.`parent_id` = `c3`.`product_category_id`)) left join `product_category` `c4` on(`c3`.`product_category_id` is not null and `c3`.`parent_id` = `c4`.`product_category_id`)) left join `product_category` `c5` on(`c4`.`product_category_id` is not null and `c4`.`parent_id` = `c5`.`product_category_id`)) left join `product_category` `c6` on(`c5`.`product_category_id` is not null and `c5`.`parent_id` = `c6`.`product_category_id`)) left join `product_category` `c7` on(`c6`.`product_category_id` is not null and `c6`.`parent_id` = `c7`.`product_category_id`)) left join `product_category` `c8` on(`c7`.`product_category_id` is not null and `c7`.`parent_id` = `c8`.`product_category_id`)) left join `product_category` `c9` on(`c8`.`product_category_id` is not null and `c8`.`parent_id` = `c9`.`product_category_id`)) left join `product_category` `c10` on(`c9`.`product_category_id` is not null and `c9`.`parent_id` = `c10`.`product_category_id`)) left join `product_category` `c11` on(`c10`.`product_category_id` is not null and `c10`.`parent_id` = `c11`.`product_category_id`)) left join `product_category` `c12` on(`c11`.`product_category_id` is not null and `c11`.`parent_id` = `c12`.`product_category_id`)) left join `product_category` `c13` on(`c12`.`product_category_id` is not null and `c12`.`parent_id` = `c13`.`product_category_id`)) left join `product_category` `c14` on(`c13`.`product_category_id` is not null and `c13`.`parent_id` = `c14`.`product_category_id`)) left join `product_category` `c15` on(`c14`.`product_category_id` is not null and `c14`.`parent_id` = `c15`.`product_category_id`)) left join `product_category` `c16` on(`c15`.`product_category_id` is not null and `c15`.`parent_id` = `c16`.`product_category_id`)) left join `product_category` `c17` on(`c16`.`product_category_id` is not null and `c16`.`parent_id` = `c17`.`product_category_id`)) left join `product_category` `c18` on(`c17`.`product_category_id` is not null and `c17`.`parent_id` = `c18`.`product_category_id`)) group by `c1`.`product_category_id`;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
