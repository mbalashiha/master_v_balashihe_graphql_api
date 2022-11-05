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

-- Дамп структуры для процедура github-next-js.delete_product_with_backup
DELIMITER //
CREATE PROCEDURE `delete_product_with_backup`(
	IN `in_productId` TEXT
)
BEGIN
	INSERT INTO deleted_product(`productId`,
	`handle`,
	`title`,
	`sku`,
	`product_category_id`,
	`manufacturerId`,
	`description`,
	`descriptionHtml`,
	`descriptionRawDraftContentState`,
	`createdAt`,
	`updatedAt`,
	`publishedAt`,
	`published`,
	`orderNumber`)
	SELECT `productId`,
	`handle`,
	`title`,
	`sku`,
	`product_category_id`,
	`manufacturerId`,
	`description`,
	`descriptionHtml`,
	`descriptionRawDraftContentState`,
	`createdAt`,
	`updatedAt`,
	`publishedAt`,
	`published`,
	`orderNumber` FROM product WHERE productId=in_productId;
	
	INSERT INTO `deleted_product_variant`(
	`variantId`,
	`productId`,
	`price`,
	`compareAtPrice`,
	`currencyCodeId`,
	`createdAt`,
	`updatedAt`,
	`imageId`,
	`sku`)
	SELECT 
	`variantId`,
	`productId`,
	`price`,
	`compareAtPrice`,
	`currencyCodeId`,
	`createdAt`,
	`updatedAt`,
	`imageId`,
	`sku` FROM product_variant WHERE productId=in_productId;
	
	INSERT INTO `deleted_product_variant_id_to_option_id`(
	`variantId`,
	`nameId`,
	`valueId`)
	SELECT 
	id.`variantId`,
	id.`nameId`,
	id.`valueId` FROM product_variant_id_to_option_id id 
	 INNER JOIN product p ON p.productId=in_productId
	 INNER JOIN product_variant v ON p.productId=v.productId;
		
	INSERT INTO `deleted_image_to_product`(
	`productId`,
	`imageId`,
	`orderNumber`)
	SELECT
	imid.`productId`,
	imid.`imageId`,
	imid.`orderNumber` FROM image_to_product imid 
	 INNER JOIN product p ON p.productId=in_productId AND imid.productId=p.productId;
	 
	DELETE imid FROM image_to_product imid 
	 INNER JOIN product p ON p.productId=in_productId AND imid.productId=p.productId; 
	DELETE id FROM product_variant_id_to_option_id id 
	 INNER JOIN product p ON p.productId=in_productId
	 INNER JOIN product_variant v ON p.productId=v.productId;
	DELETE v FROM product_variant v WHERE v.productId=in_productId;
	DELETE p FROM product p WHERE p.productId=in_productId;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
