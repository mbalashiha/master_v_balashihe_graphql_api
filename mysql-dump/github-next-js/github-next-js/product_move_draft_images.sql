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

-- Дамп структуры для процедура github-next-js.product_move_draft_images
DELIMITER //
CREATE PROCEDURE `product_move_draft_images`(
	IN `in_insertedProductId` INT,
	IN `in_draftProductId` BINARY(16),
	IN `in_images` JSON
)
BEGIN
	DECLARE loop_imageId INT Unsigned DEFAULT NULL;
	DECLARE test_imgSrc Text DEFAULT NULL;
	DECLARE i INT UNSIGNED DEFAULT 0;
	DECLARE loop_image JSON DEFAULT NULL;
	DECLARE loop_imgSrc TINYTEXT DEFAULT NULL;
	DECLARE loop_width TINYTEXT DEFAULT NULL;
	DECLARE loop_height TINYTEXT DEFAULT NULL;
	DECLARE loop_format TINYTEXT DEFAULT NULL;
	DECLARE loop_orderNumber TINYTEXT DEFAULT NULL;
	DECLARE loop_draftImageId TINYTEXT DEFAULT NULL;
	Set i := 0;
	SELECT JSON_EXTRACT(in_images, CONCAT('$[',i,']')) INTO loop_image;	
	WHILE JSON_LENGTH(loop_image)		
	DO
		SET loop_imgSrc := Json_unquote(JSON_extract(loop_image, "$.imgSrc"));
		SET loop_imgSrc := IF(loop_imgSrc = '' OR loop_imgSrc = 'null', NULL, loop_imgSrc);	
		
		SET loop_width := Json_unquote(JSON_extract(loop_image, "$.width"));
		SET loop_width := IF(loop_width = '' OR loop_width = 'null', NULL, loop_width);	
		
		SET loop_height := Json_unquote(JSON_extract(loop_image, "$.height"));
		SET loop_height := IF(loop_height = '' OR loop_height = 'null', NULL, loop_height);	
			
		SET loop_format := Json_unquote(JSON_extract(loop_image, "$.format"));
		SET loop_format := IF(loop_format = '' OR loop_format = 'null', NULL, loop_format);	
				
		SET loop_orderNumber := Json_unquote(JSON_extract(loop_orderNumber, "$.orderNumber"));
		SET loop_orderNumber := IF(loop_orderNumber = '' OR loop_orderNumber = 'null', NULL, loop_orderNumber);	
		
		SET test_imgSrc := NULL;
		SET loop_imageId := NULL;
		IF loop_imgSrc IS NOT NULL
		Then
			SELECT imageId INTO loop_imageId FROM image WHERE originalSrc=loop_imgSrc;
			if loop_imageId IS NULL 
			Then
				INSERT INTO image(originalSrc, width, height, `FORMAT`) VALUES(loop_imgSrc, loop_width, loop_height,loop_format);
				SET loop_imageId := LAST_INSERT_ID();
			END if;
			
			IF loop_orderNumber IS NULL
			Then
			   SET loop_orderNumber := i;
			END IF;
		
			if NOT EXISTS(SELECT 1 FROM image_to_product d WHERE d.productId=in_insertedProductId AND d.imageId=loop_imageId)
			Then
				INSERT INTO image_to_product(productId, imageId, orderNumber) VALUES(in_insertedProductId, loop_imageId, loop_orderNumber);
			Else
				UPDATE image_to_product d SET d.orderNumber=loop_orderNumber WHERE d.productId=in_insertedProductId AND d.imageId=loop_imageId;
			END IF;
			IF in_draftProductId IS NOT NULL
			Then
				DELETE dip, i
					FROM draft_image_to_product dip
					INNER JOIN draft_image i ON dip.draftImageId=i.draftImageId AND i.originalSrc=loop_imgSrc
					WHERE dip.draftProductId=in_draftProductId;
			END IF;
		END If;
		Set i := i + 1;
	SELECT JSON_EXTRACT(in_images, CONCAT('$[',i,']')) INTO loop_image;
	END WHILE;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
