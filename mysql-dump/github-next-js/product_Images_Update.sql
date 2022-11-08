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

-- Дамп структуры для процедура github-next-js.product_Images_Update
DELIMITER //
CREATE PROCEDURE `product_Images_Update`(
	IN `in_draftProductId` TEXT,
	IN `in_managerId` INT,
	IN `in_productId` TINYTEXT,
	IN `in_images` JSON
)
BEGIN
	DECLARE inserted_draftProductId BINARY(16) DEFAULT NULL;
	DECLARE in_binary_draftProductId BINARY(16) DEFAULT NULL;
	DECLARE loop_draftImageId BINARY(16) DEFAULT NULL;
	DECLARE test_imgSrc Text DEFAULT NULL;
	DECLARE test_draftProductId INT UNSIGNED DEFAULT NULL;
	DECLARE test_quantity INT UNSIGNED DEFAULT NULL;
	DECLARE i INT UNSIGNED DEFAULT 0;
	DECLARE loop_imgSrc MEDIUMTEXT DEFAULT NULL;
	DECLARE loop_image JSON DEFAULT NULL;
	DECLARE loop_pathOfOriginal MEDIUMTEXT DEFAULT NULL;
	DECLARE loop_width TINYTEXT DEFAULT NULL;
	DECLARE loop_height TINYTEXT DEFAULT NULL;
	DECLARE loop_originalHeight TINYTEXT DEFAULT NULL;
	DECLARE loop_originalWidth TINYTEXT DEFAULT NULL;
	DECLARE loop_format TINYTEXT DEFAULT NULL;
	DECLARE loop_orderNumber TINYTEXT DEFAULT NULL;
	DECLARE try_id INT UNSIGNED DEFAULT NULL;
	DECLARE next_id INT UNSIGNED DEFAULT NULL;
	
	SELECT d.draftProductId INTO inserted_draftProductId FROM draft_product d 
	 	WHERE d.managerId=in_managerId AND d.draftProductId=UNHEX(in_draftProductId);
	
	If inserted_draftProductId IS Null
	Then
		SELECT 1;
	END IF;
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
		SET test_draftProductId := NULL;
		SET loop_draftImageId := NULL;
		IF loop_imgSrc IS NOT NULL
		Then		
			SET loop_orderNumber := Json_unquote(JSON_extract(loop_orderNumber, "$.orderNumber"));
			SET loop_orderNumber := IF(loop_orderNumber = '' OR loop_orderNumber = 'null', NULL, loop_orderNumber);	
			IF loop_orderNumber IS NULL OR Cast(loop_orderNumber AS UNSIGNED) <= 0 OR loop_orderNumber = '0'
			Then				
			   SET loop_orderNumber := i+1;
			END IF;
			SELECT draftImageId INTO loop_draftImageId FROM draft_image WHERE imgSrc=loop_imgSrc;
			if loop_draftImageId IS NULL 
			Then
				INSERT INTO draft_image(imgSrc, width, height, `format`, originalWidth, originalHeight, pathOfOriginal)
					 VALUES(loop_imgSrc, loop_width, loop_height,loop_format, loop_originalWidth, loop_originalHeight, loop_pathOfOriginal);
				SET loop_draftImageId := @last_draftImageId;
			END if;		
			if NOT EXISTS(SELECT 1 FROM draft_image_to_product d WHERE d.draftProductId=inserted_draftProductId AND d.draftImageId=loop_draftImageId)
			Then
				INSERT INTO draft_image_to_product(draftProductId, draftImageId, orderNumber) VALUES(inserted_draftProductId, loop_draftImageId, loop_orderNumber);
			Else
				UPDATE draft_image_to_product d SET d.orderNumber=loop_orderNumber WHERE d.draftProductId=inserted_draftProductId AND d.draftImageId=loop_draftImageId;
			END IF;
			UPDATE draft_image_to_product i2p
							INNER JOIN draft_image dim ON dim.draftImageId=i2p.draftImageId AND dim.imgSrc != loop_imgSrc
								SET i2p.orderNumber=loop_orderNumber+1
								WHERE i2p.draftProductId=inserted_draftProductId And i2p.orderNumber=loop_orderNumber;
		END If;
		Set i := i + 1;
	SELECT JSON_EXTRACT(in_images, CONCAT('$[',i,']')) INTO loop_image;
	END WHILE;
	SELECT LOWER(Hex(inserted_draftProductId)) AS draftProductId;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
