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

-- Дамп структуры для процедура github-next-js.save_product_variant
DELIMITER //
CREATE PROCEDURE `save_product_variant`(
	IN `product_variant_json` LONGTEXT,
	IN `in_productId` INT
)
BEGIN

DECLARE c_selectedOptions JSON DEFAULT NULL;
DECLARE out_optionId_json_array JSON DEFAULT NULL;

DECLARE variant_option_id_1 TEXT DEFAULT NULL;
DECLARE variant_option_id_2 TEXT DEFAULT NULL;
DECLARE variant_option_id_3 TEXT DEFAULT NULL;
DECLARE variant_option_id_4 TEXT DEFAULT NULL;
DECLARE variant_option_id_5 TEXT DEFAULT NULL;
DECLARE variant_option_id_6 TEXT DEFAULT NULL;
DECLARE variant_option_id_7 TEXT DEFAULT NULL;
DECLARE variant_option_id_8 TEXT DEFAULT NULL;

DECLARE variant_price TEXT DEFAULT NULL;
DECLARE variant_compareAtPrice TEXT DEFAULT NULL;
DECLARE variant_sku TEXT DEFAULT NULL;

DECLARE options_array_length INT UNSIGNED DEFAULT NULL;
DECLARE out_imageId INT UNSIGNED DEFAULT NULL;
DECLARE image_in_json JSON DEFAULT NULL;
DECLARE priceV2_json JSON DEFAULT NULL;
DECLARE compareAtPriceV2_json JSON DEFAULT NULL;
DECLARE priceV2_amount TEXT DEFAULT NULL;
DECLARE compareAtPriceV2_amount TEXT DEFAULT NULL;
DECLARE priceV2_currencyCode TEXT DEFAULT NULL;
DECLARE q_currencyCodeId TEXT DEFAULT NULL;

DECLARE test_variantId INT Unsigned DEFAULT NULL;
 DECLARE defaultOptionNameId INT UNSIGNED DEFAULT NULL;
 DECLARE defaultOptionValueId INT UNSIGNED DEFAULT NULL;
 DECLARE defaultOptionId INT UNSIGNED DEFAULT NULL;
 
 SELECT v.valueId INTO defaultOptionValueId FROM product_option_name_value v WHERE v.value='';
 IF defaultOptionValueId IS NULL
 Then
 	INSERT INTO product_option_name_value(`value`) VALUES('');
 	SET defaultOptionValueId := LAST_INSERT_ID();
 END IF;
 
 SELECT n.nameId INTO defaultOptionNameId FROM product_option_name n WHERE n.name='default';
 IF defaultOptionNameId IS NULL
 Then
 	INSERT INTO product_option_name(`name`) VALUES('default');
 	SET defaultOptionNameId := LAST_INSERT_ID();
 END IF;
 
 SELECT o.optionId INTO defaultOptionId FROM product_option o WHERE o.nameId=defaultOptionNameId AND o.valueId=defaultOptionValueId;
 IF defaultOptionId IS NULL
 Then
 	INSERT INTO product_option(nameId, valueID) VALUES(defaultOptionNameId, defaultOptionValueId);
 	SET defaultOptionId := LAST_INSERT_ID();
 END IF;
 

SET priceV2_json := Json_unquote(JSON_extract(product_variant_json, "$.priceV2"));
SET compareAtPriceV2_json := Json_unquote(JSON_extract(product_variant_json, "$.compareAtPriceV2"));
			SET priceV2_amount := Json_unquote(JSON_extract(priceV2_json, "$.amount"));
			SET priceV2_amount := IF(priceV2_amount = '' OR priceV2_amount = 'null', NULL, priceV2_amount);
			SET priceV2_currencyCode := Json_unquote(JSON_extract(priceV2_json, "$.currencyCode"));
			SET priceV2_currencyCode := IF(priceV2_currencyCode = '' OR priceV2_currencyCode = 'null', NULL, priceV2_currencyCode);
			SET priceV2_currencyCode := IF(priceV2_currencyCode IS NULL, 'RUB', priceV2_currencyCode);
			
			SET compareAtPriceV2_amount := Json_unquote(JSON_extract(compareAtPriceV2_json, "$.amount"));
			SET compareAtPriceV2_amount := IF(compareAtPriceV2_amount = '' OR compareAtPriceV2_amount = 'null', NULL, compareAtPriceV2_amount);
			
			
	    ####SELECT JSON_EXTRACT(in_hide_positions,CONCAT('$[',i,']')) INTO pos;
	    SET c_selectedOptions := Json_unquote(JSON_extract(product_variant_json, "$.selectedOptions"));
	    IF JSON_LENGTH(c_selectedOptions)
	    Then
			CALL create_selected_options(c_selectedOptions, out_optionId_json_array);
	    END if;
			SET options_array_length := JSON_LENGTH(out_optionId_json_array);
         SET variant_option_id_1 := IF(options_array_length >= 1, JSON_UNQUOTE(JSON_EXTRACT(out_optionId_json_array, '$[0]')), NULL);
         SET variant_option_id_2 := IF(options_array_length >= 2, JSON_UNQUOTE(JSON_EXTRACT(out_optionId_json_array, '$[1]')), NULL);
         SET variant_option_id_3 := IF(options_array_length >= 3, JSON_UNQUOTE(JSON_EXTRACT(out_optionId_json_array, '$[2]')), NULL);
         SET variant_option_id_4 := IF(options_array_length >= 4, JSON_UNQUOTE(JSON_EXTRACT(out_optionId_json_array, '$[3]')), NULL);
         SET variant_option_id_5 := IF(options_array_length >= 5, JSON_UNQUOTE(JSON_EXTRACT(out_optionId_json_array, '$[4]')), NULL);
         SET variant_option_id_6 := IF(options_array_length >= 6, JSON_UNQUOTE(JSON_EXTRACT(out_optionId_json_array, '$[5]')), NULL);
         SET variant_option_id_7 := IF(options_array_length >= 7, JSON_UNQUOTE(JSON_EXTRACT(out_optionId_json_array, '$[6]')), NULL);
         SET variant_option_id_8 := IF(options_array_length >= 8, JSON_UNQUOTE(JSON_EXTRACT(out_optionId_json_array, '$[7]')), NULL);
         
         SET variant_price := Json_unquote(JSON_extract(product_variant_json, "$.priceV2"));
			SET variant_price := IF(variant_price = '' OR variant_price = 'null', NULL, variant_price);	
			SET variant_compareAtPrice := Json_unquote(JSON_extract(product_variant_json, "$.compareAtPriceV2"));
			SET variant_compareAtPrice := IF(variant_compareAtPrice = '' OR variant_compareAtPrice = 'null', NULL, variant_compareAtPrice);	
			SET variant_sku := Json_unquote(JSON_extract(product_variant_json, "$.sku"));
			SET variant_sku := IF(variant_sku = '' OR variant_sku = 'null', NULL, variant_sku);	
			
			SET image_in_json := JSON_EXTRACT(product_variant_json, "$.image");
			If JSON_LENGTH(image_in_json)
			Then
				CALL save_image(image_in_json, out_imageId);
			END IF;
         SELECT co.currencyCodeId INTO q_currencyCodeId FROM price_currency_code co WHERE co.currencyCode=priceV2_currencyCode;
         IF q_currencyCodeId IS Null
         Then
         	INSERT INTO price_currency_code(currencyCode) VALUES(price_currency_code);
         	SET q_currencyCodeId := LAST_INSERT_ID();
         END IF;
         SELECT `variantId` INTO test_variantId FROM product_variant WHERE productId=in_productId AND 
							IFNULL(`option_id_1`, 'null')=IFNULL(variant_option_id_1, 'null') And
							IFNULL(`option_id_2`, 'null')=IFNULL(variant_option_id_2, 'null') And
							IFNULL(`option_id_3`, 'null')=IFNULL(variant_option_id_3, 'null') And
							IFNULL(`option_id_4`, 'null')=IFNULL(variant_option_id_4, 'null') And
							IFNULL(`option_id_5`, 'null')=IFNULL(variant_option_id_5, 'null') And
							IFNULL(`option_id_6`, 'null')=IFNULL(variant_option_id_6, 'null') And
							IFNULL(`option_id_7`, 'null')=IFNULL(variant_option_id_7, 'null') And
							IFNULL(`option_id_8`, 'null')=IFNULL(variant_option_id_8, 'null');
			If test_variantId IS NOT NULL
			Then
				UPDATE product_variant SET price=priceV2_amount, compareAtPrice=compareAtPriceV2_amount, currencyCodeId=q_currencyCodeId, 
				sku=variant_sku, imageId=out_imageId
						WHERE variantId=test_variantId;						
			Else
	         INSERT INTO product_variant(`productId`, 
					`option_id_1`, `option_id_2`, `option_id_3`, `option_id_4`, `option_id_5`, `option_id_6`, `option_id_7`, `option_id_8`,
	         	price, compareAtPrice, currencyCodeId, 
					sku, imageId
				)
	         		VALUES(in_productId, 
					variant_option_id_1, variant_option_id_2, variant_option_id_3, variant_option_id_4, variant_option_id_5, variant_option_id_6, variant_option_id_7, variant_option_id_8,
					priceV2_amount, compareAtPriceV2_amount, q_currencyCodeId, 
					variant_sku, out_imageId);
			END IF;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
