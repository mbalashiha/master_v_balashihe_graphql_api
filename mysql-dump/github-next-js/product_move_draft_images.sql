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
	IN `in_managerId` INT,
	IN `in_insertedProductId` INT,
	IN `in_draftProductId` BINARY(16),
	IN `in_images` JSON
)
BEGIN
	DECLARE loop_imageId INT Unsigned DEFAULT NULL;
	DECLARE test_imgSrc Text DEFAULT NULL;
	DECLARE i INT UNSIGNED DEFAULT 0;
	DECLARE loop_image JSON DEFAULT NULL;
	DECLARE loop_imgSrc MEDIUMTEXT DEFAULT NULL;
	DECLARE loop_pathOfOriginal MEDIUMTEXT DEFAULT NULL;
	DECLARE loop_width TINYTEXT DEFAULT NULL;
	DECLARE loop_height TINYTEXT DEFAULT NULL;
	DECLARE loop_format TINYTEXT DEFAULT NULL;
	DECLARE loop_originalHeight TINYTEXT DEFAULT NULL;
	DECLARE loop_originalWidth TINYTEXT DEFAULT NULL;
	DECLARE loop_orderNumber TINYTEXT DEFAULT NULL;
	DECLARE loop_draftImageId TINYTEXT DEFAULT NULL;
	DECLARE imageId_set Text DEFAULT NULL;
	SET imageId_set := '';
	Set i := 0;
	SELECT JSON_EXTRACT(in_images, CONCAT('$[',i,']')) INTO loop_image;	
	WHILE JSON_LENGTH(loop_image)		
	DO
		SET loop_imgSrc := Json_unquote(JSON_extract(loop_image, "$.imgSrc"));
		SET loop_imgSrc := IF(loop_imgSrc = '' OR loop_imgSrc = 'null', NULL, loop_imgSrc);	
		
		SET loop_pathOfOriginal := Json_unquote(JSON_extract(loop_image, "$.pathOfOriginal"));
		SET loop_pathOfOriginal := IF(loop_pathOfOriginal = '' OR loop_pathOfOriginal = 'null', NULL, loop_pathOfOriginal);	
		
		SET loop_width := Json_unquote(JSON_extract(loop_image, "$.width"));
		SET loop_width := IF(loop_width = '' OR loop_width = 'null', NULL, loop_width);		
		SET loop_height := Json_unquote(JSON_extract(loop_image, "$.height"));
		SET loop_height := IF(loop_height = '' OR loop_height = 'null', NULL, loop_height);	
		
		SET loop_originalWidth := Json_unquote(JSON_extract(loop_image, "$.originalWidth"));
		SET loop_originalWidth := IF(loop_originalWidth = '' OR loop_originalWidth = 'null', NULL, loop_originalWidth);		
		SET loop_originalHeight := Json_unquote(JSON_extract(loop_image, "$.originalHeight"));
		SET loop_originalHeight := IF(loop_originalHeight = '' OR loop_originalHeight = 'null', NULL, loop_originalHeight);	
				
		SET loop_format := Json_unquote(JSON_extract(loop_image, "$.format"));
		SET loop_format := IF(loop_format = '' OR loop_format = 'null', NULL, loop_format);	
				
		
		SET test_imgSrc := NULL;
		SET loop_imageId := NULL;
		IF loop_imgSrc IS NOT NULL
		Then
			SELECT imageId INTO loop_imageId FROM image WHERE imgSrc=loop_imgSrc;
			if loop_imageId IS NULL 
			Then
				INSERT INTO image(imgSrc, width, height, `format`, originalWidth, originalHeight, pathOfOriginal)
					 VALUES(loop_imgSrc, loop_width, loop_height,loop_format, loop_originalWidth, loop_originalHeight, loop_pathOfOriginal);
				SET loop_imageId := LAST_INSERT_ID();
			END if;
			
			SET imageId_set := CONCAT_WS(',',imageId_set,loop_imageId);			
				
			SET loop_orderNumber := Json_unquote(JSON_extract(loop_orderNumber, "$.orderNumber"));
			SET loop_orderNumber := IF(loop_orderNumber = '' OR loop_orderNumber = 'null', NULL, loop_orderNumber);	
			IF loop_orderNumber IS NULL OR Cast(loop_orderNumber AS UNSIGNED) <= 0 OR loop_orderNumber = '0'
			Then				
			   SET loop_orderNumber := i+1;
			END IF;
		
			if NOT EXISTS(SELECT 1 FROM image_to_product d WHERE d.productId=in_insertedProductId AND d.imageId=loop_imageId)
			Then
				INSERT INTO image_to_product(productId, imageId, orderNumber) VALUES(in_insertedProductId, loop_imageId, loop_orderNumber);
			Else
				UPDATE image_to_product d SET d.orderNumber=loop_orderNumber WHERE d.productId=in_insertedProductId AND d.imageId=loop_imageId;
			END IF;
			UPDATE image_to_product i2p
							INNER JOIN image dim ON dim.imageId=i2p.imageId And dim.imgSrc != loop_imgSrc
								SET i2p.orderNumber=loop_orderNumber+1
								WHERE i2p.productId=in_insertedProductId And i2p.orderNumber=loop_orderNumber;
			IF in_draftProductId IS NOT NULL
			Then
				DELETE dip, i
					FROM draft_image_to_product dip
					INNER JOIN draft_image i ON dip.draftImageId=i.draftImageId AND i.imgSrc=loop_imgSrc
					WHERE dip.draftProductId=in_draftProductId;
			END IF;
		END If;
		Set i := i + 1;
	SELECT JSON_EXTRACT(in_images, CONCAT('$[',i,']')) INTO loop_image;
	END WHILE;
	DELETE ip FROM image_to_product ip WHERE ip.productId=in_insertedProductId And FIND_IN_SET(ip.imageId, imageId_set) <= 0;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
