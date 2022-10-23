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

-- Дамп структуры для процедура github-next-js.save_product
DELIMITER //
CREATE PROCEDURE `save_product`(
	IN `in_draftProductId` TINYTEXT,
	IN `in_managerId` TINYTEXT,
	IN `in_productId` TINYTEXT,
	IN `in_category_id` TINYTEXT,
	IN `in_title` TEXT,
	IN `in_handle` TEXT,
	IN `in_manufacturerId` TINYTEXT,
	IN `in_price_amount` TINYTEXT,
	IN `in_price_currencyCodeId` TINYTEXT,
	IN `in_description` LONGTEXT,
	IN `in_descriptionHtml` LONGTEXT,
	IN `in_descriptionRawDraftContentState` LONGTEXT,
	IN `in_images` JSON
)
BEGIN
 DECLARE stored_draftProductId BINARY(16) DEFAULT NULL;
 DECLARE stored_priceAmount DECIMAL(16,4) DEFAULT NULL;
 DECLARE stored_nullOptionsCount INT unsigned DEFAULT NULL;
 DECLARE stored_productId INT unsigned DEFAULT NULL;
 DECLARE stored_handle Text DEFAULT NULL;
 SET in_managerId := IF(in_managerId='' OR in_managerId='null', NULL, in_managerId);
 SET in_productId := IF(in_productId='' OR in_productId='null', NULL, in_productId);
 SET in_title := IF(in_title='' OR in_title='null', NULL, in_title);
 SET in_handle := IF(in_handle='' OR in_handle='null', NULL, in_handle);
 SET in_manufacturerId := IF(in_manufacturerId='' OR in_manufacturerId='null', NULL, in_manufacturerId);
 SET in_price_amount := IF(in_price_amount='' OR in_price_amount='null', NULL, in_price_amount);
 SET in_price_currencyCodeId := IF(in_price_currencyCodeId='' OR in_price_currencyCodeId='null', NULL, in_price_currencyCodeId);
 SET in_category_id := IF(in_category_id='' OR in_category_id='null', NULL, in_category_id);
 SET in_description := IF(in_description='' OR in_description='null', NULL, in_description);
 SET in_descriptionHtml := IF(in_descriptionHtml='' OR in_descriptionHtml='null', NULL, in_descriptionHtml);
 SET in_descriptionRawDraftContentState := IF(in_descriptionRawDraftContentState='' OR in_descriptionRawDraftContentState='null', NULL, in_descriptionRawDraftContentState);
 
 SELECT d.draftProductId INTO stored_draftProductId FROM draft_product d 
	 	WHERE d.managerId=in_managerId AND d.draftProductId=UNHEX(in_draftProductId);

 IF in_category_id IS NOT Null
 Then
 	SELECT handle INTO stored_handle FROM product_category pcat WHERE pcat.product_category_id=in_category_id;
 END IF;
 IF stored_handle IS NOT NULL
 Then
 	SET in_handle := CONCAT(stored_handle, '/', in_handle);
 END IF;
 IF in_productId IS NOT NULL 
 Then
 	SELECT productId INTO stored_productId FROM product WHERE productId=in_productId;
 END IF;
 IF stored_productId IS NULL
 Then
 	INSERT INTO product(handle, title, product_category_id, manufacturerId, description, descriptionHtml, descriptionRawDraftContentState)
 		VALUES(in_handle, in_title, in_category_id, in_manufacturerId, in_description, in_descriptionHtml, in_descriptionRawDraftContentState);
 	SET stored_productId:=LAST_INSERT_ID();
 ELSE 
 	Update product
	  Set handle=in_handle, title=in_title, product_category_id=in_category_id, manufacturerId=in_manufacturerId, 
	  		description=in_description, descriptionHtml=in_descriptionHtml, descriptionRawDraftContentState=in_descriptionRawDraftContentState
	  	WHERE productId=stored_productId;
 END IF;
 SELECT Count(*), MIN(v.price) INTO stored_nullOptionsCount, stored_priceAmount FROM product_variant v WHERE v.productId=stored_productId 
 	And
 	v.option_id_1 IS NULL And
 	v.option_id_2 IS NULL And
 	v.option_id_3 IS NULL And
 	v.option_id_4 IS NULL And
 	v.option_id_5 IS NULL And
 	v.option_id_6 IS NULL And
 	v.option_id_7 IS NULL And
 	v.option_id_8 IS NULL
	 GROUP BY v.productId;
 If stored_nullOptionsCount > 1
 Then
  DELETE v FROM product_variant v WHERE 
   v.productId=stored_productId 
 	And
 	v.option_id_1 IS NULL And
 	v.option_id_2 IS NULL And
 	v.option_id_3 IS NULL And
 	v.option_id_4 IS NULL And
 	v.option_id_5 IS NULL And
 	v.option_id_6 IS NULL And
 	v.option_id_7 IS NULL And
 	v.option_id_8 IS NULL;
 	SET stored_priceAmount := NULL;
 END IF;
 IF stored_priceAmount IS Null
 Then 
 	INSERT INTO product_variant(productId, price, currencyCodeId) VALUES(stored_productId, in_price_amount, in_price_currencyCodeId);
 Else
 	UPDATE product_variant v 
	 SET v.price=in_price_amount, v.currencyCodeId=in_price_currencyCodeId
	 WHERE v.productId=stored_productId 
			 	And
			 	v.option_id_1 IS NULL And
			 	v.option_id_2 IS NULL And
			 	v.option_id_3 IS NULL And
			 	v.option_id_4 IS NULL And
			 	v.option_id_5 IS NULL And
			 	v.option_id_6 IS NULL And
			 	v.option_id_7 IS NULL And
			 	v.option_id_8 IS NULL;
 END IF;
 CALL product_move_draft_images(in_managerId, stored_productId, stored_draftProductId, in_images);
 IF stored_draftProductId IS NOT NULL
 Then
	 DELETE dv FROM draft_product_variant dv WHERE dv.draftProductId=stored_draftProductId;
	 DELETE dip FROM draft_image_to_product dip WHERE dip.draftProductId=stored_draftProductId;
	 DELETE dp FROM draft_product dp WHERE dp.draftProductId=stored_draftProductId;
 END IF;
 
 #DELETE dv, dip, p FROM draft_product_variant dv
 #	JOIN draft_product p ON dv.draftProductId=p.draftProductId
 #	JOIN draft_image_to_product dip ON p.draftProductId=dip.draftProductId
 #	  WHERE p.managerId=in_managerId AND ((in_productId IS NULL AND p.productId IS NULL) OR (in_productId IS NOT NULL AND p.productId=in_productId));
	 
 SELECT stored_productId AS productId, JSON_ARRAYAGG(JSON_OBJECT('imgSrc',i.originalSrc, 'imageId', i.imageId)) AS images 
 	FROM product p
 		LEFT JOIN image_to_product im ON im.productId=p.productId
 		LEFT JOIN image i ON i.imageId=im.imageId
 	WHERE p.productId=stored_productId
	 GROUP BY p.productId;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
