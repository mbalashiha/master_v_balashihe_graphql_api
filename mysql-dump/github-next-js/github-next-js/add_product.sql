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

-- Дамп структуры для процедура github-next-js.add_product
DELIMITER //
CREATE PROCEDURE `add_product`(
	IN `in_imagesMapArray` JSON,
	IN `in_product_category_id` INT,
	IN `in_manufacturer_id` INT,
	IN `in_product_name` TEXT,
	IN `in_product_price` INT
)
BEGIN
	
DECLARE cposition_is_hidden Boolean DEFAULT NULL;
DECLARE pre_text_position_is_hidden Text DEFAULT NULL;

DECLARE c_imgSrc Text DEFAULT NULL;
DECLARE c_width Int Unsigned DEFAULT NULL;
DECLARE c_height Int Unsigned DEFAULT NULL;
DECLARE c_format TinyText DEFAULT NULL;
DECLARE c_order TinyInt Unsigned DEFAULT NULL;
DECLARE cposition_module_name_id Text DEFAULT NULL;
DECLARE s_position_is_hidden Boolean DEFAULT NULL;
DECLARE s_position_id Int Unsigned DEFAULT NULL;
DECLARE inserted_image_id Int Unsigned DEFAULT NULL;
DECLARE image Json;
DECLARE i INT Unsigned DEFAULT 0;
DECLARE error_message TEXT DEFAULT NULL;
DECLARE inserted_product_id Int Unsigned DEFAULT NULL;

If NOT EXISTS(SELECT 1 FROM product_category c WHERE c.product_category_id = in_product_category_id)
Then 
	Set error_message := CONCAT('product_category with id ', in_product_category_id, " doesn't exists!");
	SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = error_message;
END IF;
If NOT EXISTS(SELECT 1 FROM manufacturer m WHERE m.manufacturer_id = in_manufacturer_id)
Then 
	Set error_message := CONCAT('manufacturer with id ', in_manufacturer_id, " doesn't exists!");
	SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = error_message;
END IF;

If EXISTS(SELECT 1 FROM product p WHERE p.product_category_id=in_product_category_id AND p.product_name=in_product_name)
Then 
	Set error_message := CONCAT('product with product_category_id ', in_product_category_id, " and product_name ", in_product_name, ' already exists!');
	SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = error_message;
END IF;

INSERT INTO product(product_name, product_price, product_category_id, manufacturer_id) 
	VALUES( in_product_name, in_product_price, in_product_category_id, in_manufacturer_id);
SET inserted_product_id := LAST_INSERT_ID();

Set i := 0;
SELECT JSON_EXTRACT(in_imagesMapArray,CONCAT('$[',i,']')) INTO image;

WHILE JSON_LENGTH(image) 
DO
    ####SELECT JSON_EXTRACT(in_hide_positions,CONCAT('$[',i,']')) INTO pos;
    SET c_imgSrc := Json_unquote(JSON_extract(image, "$.imgSrc"));
    SET c_format := Json_unquote(JSON_extract(image, "$.format"));
    SET c_width := Json_unquote(JSON_extract(image, "$.width"));
    SET c_height := Json_unquote(JSON_extract(image, "$.height"));
    SET c_order := Json_unquote(JSON_extract(image, "$.order_number"));
    #SET cposition_module_name_id := Json_unquote(JSON_extract(image, "$.position_module_name_id"));
    #SET cposition_module_name_id := IF(cposition_module_name_id = 'null' OR cposition_module_name_id = '', NULL, cposition_module_name_id);
    SELECT image_id INTO inserted_image_id FROM image im WHERE im.imgSrc=c_imgSrc;
    if inserted_image_id IS Null
    Then
    	 INSERT INTO image(imgSrc, FORMAT, width, height) VALUES(c_imgSrc, c_format, c_width, c_height);
    	 SET inserted_image_id := LAST_INSERT_ID();
    Else
    	UPDATE image SET FORMAT=c_format, width=c_width, height=c_height WHERE image_id=inserted_image_id;
    END IF;
    If NOT EXISTS(SELECT 1 FROM image_to_product WHERE image_id=inserted_image_id AND product_id=inserted_product_id)
    Then
    	INSERT INTO image_to_product(image_id, product_id, order_number) Values(inserted_image_id, inserted_product_id, c_order);
    Else
    	UPDATE image_to_product SET order_number=c_order WHERE image_id=inserted_image_id AND product_id=inserted_product_id;
    END If;
    
	 Set i := i + 1;
	 SELECT JSON_EXTRACT(in_imagesMapArray,CONCAT('$[',i,']')) INTO image;
END WHILE;
SELECT inserted_product_id;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
