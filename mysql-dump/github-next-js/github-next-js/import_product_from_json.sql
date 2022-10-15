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

-- Дамп структуры для процедура github-next-js.import_product_from_json
DELIMITER //
CREATE PROCEDURE `import_product_from_json`(
	IN `product_as_json_object` LONGTEXT
)
BEGIN
	
DECLARE product_handle Text DEFAULT NULL;	
DECLARE q_productId INT Unsigned DEFAULT NULL;
DECLARE product_vendor Text DEFAULT NULL;	
DECLARE product_title Text DEFAULT NULL;
DECLARE product_description Text DEFAULT NULL;
DECLARE product_descriptionHtml Text DEFAULT NULL;

DECLARE in_manufacturerId INT Unsigned DEFAULT NULL;
DECLARE in_product_variants JSON DEFAULT NULL;
DECLARE product_variant JSON DEFAULT NULL;

Declare in_product_images JSON DEFAULT NULL;
DECLARE in_image JSON DEFAULT NULL;
DECLARE out_imageId INT UNSIGNED Default NULL;

DECLARE pre_text_position_is_hidden Text DEFAULT NULL;
DECLARE i INT Unsigned DEFAULT 0;
DECLARE error_message TEXT DEFAULT NULL;
#DECLARE inserted_product_id Int Unsigned DEFAULT NULL;

SET product_handle := Json_unquote(JSON_extract(product_as_json_object, "$.handle"));
SET product_handle := IF(product_handle = '' OR product_handle = 'null', NULL, product_handle);
If product_handle IS NOT NULL
Then 
	SELECT c.`productId` INTO q_productId FROM product c WHERE c.handle = product_handle;
	If q_productId IS Null
	Then
	 	SET product_vendor := Json_unquote(JSON_extract(product_as_json_object, "$.vendor"));
		SET product_vendor := IF(product_vendor = '' OR product_vendor = 'null', NULL, product_vendor);	
		SET product_title := Json_unquote(JSON_extract(product_as_json_object, "$.title"));
		SET product_title := IF(product_title = '' OR product_title = 'null', NULL, product_title);	
		SET product_description := Json_unquote(JSON_extract(product_as_json_object, "$.description"));
		SET product_description := IF(product_description = '' OR product_description = 'null', NULL, product_description);	
		SET product_descriptionHtml := Json_unquote(JSON_extract(product_as_json_object, "$.descriptionHtml"));
		SET product_descriptionHtml := IF(product_descriptionHtml = '' OR product_descriptionHtml = 'null', NULL, product_descriptionHtml);
		If product_vendor IS NOT NULL
		Then
			SELECT manufacturerId INTO in_manufacturerId FROM manufacturer m WHERE m.manufacturerName = product_vendor;
			IF in_manufacturerId IS NULL
			Then
				INSERT INTO manufacturer(manufacturerName) VALUES(product_vendor);
				SET in_manufacturerId := LAST_INSERT_ID();
			END IF;
		END IF;
		INSERT INTO product(handle, title, manufacturerId, description, descriptionHtml) VALUES(product_handle, product_title, in_manufacturerId, product_description, product_descriptionHtml);
		SET q_productId := LAST_INSERT_ID();
	END if;
	Set i := 0;
	SELECT JSON_EXTRACT(product_as_json_object,"$.variants") INTO in_product_variants;
	SELECT JSON_EXTRACT(in_product_variants,CONCAT('$[',i,']')) INTO product_variant;	
	WHILE JSON_LENGTH(product_variant) 
	DO
		CALL save_product_variant(product_variant, q_productId);
		Set i := i + 1;
		SELECT JSON_EXTRACT(in_product_variants,CONCAT('$[',i,']')) INTO product_variant;
	END WHILE;
	
	Set i := 0;
	SELECT JSON_EXTRACT(product_as_json_object,"$.images") INTO in_product_images;
	SELECT JSON_EXTRACT(in_product_images, CONCAT('$[',i,']')) INTO in_image;	
	WHILE JSON_LENGTH(in_image) 
	DO
		SET out_imageId := NULL;
		CALL save_image(in_image, out_imageId);
		SELECT out_imageId, q_productId;
		IF out_imageId Is NOT NULL AND NOT EXISTS (SELECT 1 FROM image_to_product WHERE image_to_product.`productId`=q_productId AND image_to_product.`imageId`=out_imageId)
		Then
			INSERT INTO image_to_product(`productId`, `imageId`, `orderNumber`) VALUES(q_productId, out_imageId, i);
		END If;
		Set i := i + 1;
		SELECT JSON_EXTRACT(in_product_images, CONCAT('$[',i,']')) INTO in_image;
	END WHILE;
SELECT q_productId;
END IF;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
