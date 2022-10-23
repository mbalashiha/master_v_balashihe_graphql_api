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

-- Дамп структуры для процедура github-next-js.existing_or_new_product_draft
DELIMITER //
CREATE PROCEDURE `existing_or_new_product_draft`(
	IN `in_managerId` TINYTEXT,
	IN `in_productId` TINYTEXT
)
BEGIN	
 DECLARE inserted_draftProductId BINARY(16) DEFAULT NULL;
 DECLARE stored_images_has_been_copied TinyInt Unsigned DEFAULT NULL;
 IF in_productId IS NULL
 Then
   SELECT pd.draftProductId INTO inserted_draftProductId FROM draft_product pd
    		WHERE pd.managerId=in_managerId AND pd.productId IS NULL
    			ORDER BY pd.updatedAt DESC LIMIT 1;
				 
				 SELECT * FROM draft_product pd
    		WHERE pd.managerId=in_managerId AND pd.productId IS NULL
    			ORDER BY pd.updatedAt DESC;
    			
   IF inserted_draftProductId IS NULL
   Then
		 INSERT INTO draft_product(managerId, productId, handle, title,
			`product_category_id`,
			`manufacturerId`,
			`description`,
			`descriptionHtml`,
			`descriptionRawDraftContentState`)
		SELECT 
		   in_managerId as managerId, Null as productId, Null as handle, NULL as title,
			NULL AS `product_category_id`,
			NULL AS `manufacturerId`,
			NULL AS `description`,
			NULL AS `descriptionHtml`,
			NULL AS `descriptionRawDraftContentState`;
			
		   Set inserted_draftProductId := @last_draftProductId;
		   			   
		   INSERT INTO draft_product_Variant(
		   draftProductId,
			`option_id_1`,
			`option_id_2`,
			`option_id_3`,
			`option_id_4`,
			`option_id_5`,
			`option_id_6`,
			`option_id_7`,
			`option_id_8`,
			`price`,
			`compareAtPrice`,
			`currencyCodeId`,
			`imageId`,
			`sku`)   
		   SELECT inserted_draftProductId AS draftProductId,
			NULL AS `option_id_1`,
			NULL AS `option_id_2`,
			NULL AS `option_id_3`,
	      NULL AS `option_id_4`,
			NULL AS `option_id_5`,
			NULL AS `option_id_6`,
			NULL AS `option_id_7`,
			NULL AS `option_id_8`,
			0 AS `price`,
			0 AS `compareAtPrice`,
			1 AS `currencyCodeId`,
			NULL AS `imageId`,
			NULL AS `sku`;
			
		   SELECT pd.draftProductId INTO inserted_draftProductId FROM draft_product pd
		    		WHERE pd.managerId=in_managerId AND pd.productId IS NULL
		    			ORDER BY pd.updatedAt DESC LIMIT 1; 
		    			
				 SELECT * FROM draft_product pd
    		WHERE pd.managerId=in_managerId AND pd.productId IS NULL
    			ORDER BY pd.updatedAt DESC;
    			
	 END IF;
 Else
 SELECT 1;
   SELECT pd.draftProductId, pd.images_has_been_copied INTO inserted_draftProductId, stored_images_has_been_copied FROM draft_product pd
    		WHERE pd.managerId=in_managerId AND pd.productId=in_productId
    			ORDER BY pd.updatedAt DESC LIMIT 1;
    			
   SELECT * FROM draft_product pd
    		WHERE pd.managerId=in_managerId AND pd.productId=in_productId
    			ORDER BY pd.updatedAt DESC;
    			
   IF inserted_draftProductId IS NULL
   Then
      SELECT 'IF inserted_draftProductId IS NULL';
		INSERT INTO draft_product(managerId, productId, handle, title,
		`product_category_id`,
		`manufacturerId`,
		`description`,
		`descriptionHtml`,
		`descriptionRawDraftContentState`)
		SELECT 
		   in_managerId as managerId, productId, handle, title,
			`product_category_id`,
			`manufacturerId`,
			`description`,
			`descriptionHtml`,
			`descriptionRawDraftContentState`
		FROM 
		   product p
		WHERE
		   p.productId=in_productId;
		SELECT @last_draftProductId;
		Set inserted_draftProductId := @last_draftProductId;
		
	   INSERT INTO draft_product_Variant(
	   draftProductId,
		`option_id_1`,
		`option_id_2`,
		`option_id_3`,
		`option_id_4`,
		`option_id_5`,
		`option_id_6`,
		`option_id_7`,
		`option_id_8`,
		`price`,
		`compareAtPrice`,
		`currencyCodeId`,
		`createdAt`,
		`updatedAt`,
		`imageId`,
		`sku`)   
	   SELECT inserted_draftProductId AS draftProductId,
			`option_id_1`,
			`option_id_2`,
			`option_id_3`,
			`option_id_4`,
			`option_id_5`,
			`option_id_6`,
			`option_id_7`,
			`option_id_8`,
			`price`,
			`compareAtPrice`,
			`currencyCodeId`,
			`createdAt`,
			`updatedAt`,
			`imageId`,
			`sku`
			 FROM product_variant
			 	WHERE productId=in_productId;
		
	   SELECT pd.draftProductId INTO inserted_draftProductId FROM draft_product pd
	    		WHERE pd.managerId=in_managerId AND pd.productId=in_productId
	    			ORDER BY pd.updatedAt DESC LIMIT 1;
    			
		   SELECT * FROM draft_product pd
		    		WHERE pd.managerId=in_managerId AND pd.productId=in_productId
		    			ORDER BY pd.updatedAt DESC;
    			
	 END IF;
	 
	 IF stored_images_has_been_copied Is NULL And inserted_draftProductId IS NOT NULL
	 Then
	 	
		   SELECT 
		   im.originalSrc,
			im.`width`,
			im.`height`,
			im.`altText`,
			im.`format`,
			im.createdAt
		FROM product p
		   Inner JOIN image_to_product ipr ON ipr.productId=p.productId
		   Inner JOIN image im ON ipr.imageId=im.imageId
		   WHERE p.productId=in_productId;
		   
		INSERT INTO draft_image(originalSrc,
			`width`,
			`height`,
			`altText`,
			`format`,
			`createdAt`)
		SELECT 
		   im.originalSrc,
			im.`width`,
			im.`height`,
			im.`altText`,
			im.`format`,
			im.createdAt
		FROM product p
		   Inner JOIN image_to_product ipr ON ipr.productId=p.productId
		   Inner JOIN image im ON ipr.imageId=im.imageId
		   WHERE p.productId=in_productId AND im.originalSrc NOT IN (SELECT originalSrc FROM draft_image);
	   
		INSERT INTO draft_image_to_product(draftImageId, draftProductId, orderNumber)
		SELECT 
		   drim.draftImageId,
		   inserted_draftProductId AS draftProductId,
		   IF(ipr.orderNumber Is NULL OR ipr.orderNumber <= 0, 1+IFNULL(im.imageId, 1), ipr.orderNumber) AS orderNumber
		FROM product p
		   Inner JOIN image_to_product ipr ON ipr.productId=p.productId
			Inner JOIN image im On ipr.imageId=im.imageId
		   Inner JOIN draft_image drim ON im.originalSrc=drim.originalSrc
		   WHERE p.productId=in_productId;
	   UPDATE draft_product dp SET dp.images_has_been_copied=1 WHERE dp.draftProductId=inserted_draftProductId;
	 END IF;
 END IF;
 SELECT lcase(hex(inserted_draftProductId)) AS draftProductId;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
