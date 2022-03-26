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

-- Дамп структуры для процедура github-next-js.save_image
DELIMITER //
CREATE PROCEDURE `save_image`(
	IN `image_in_json` LONGTEXT,
	OUT `out_imageId` INT
)
BEGIN
	DECLARE in_originalSrc TEXT;
	DECLARE altText TEXT;
	DECLARE width TEXT;
	DECLARE height TEXT;
	SET out_imageId := NULL;
	SET in_originalSrc := JSON_UNQUOTE(JSON_EXTRACT(image_in_json, '$.originalSrc'));
	SET in_originalSrc := If(in_originalSrc='' OR in_originalSrc='null', NULL, in_originalSrc);
	
	SET altText := JSON_UNQUOTE(JSON_EXTRACT(image_in_json, '$.altText'));
	SET altText := If(altText='' OR altText='null', NULL, altText);
	
	SET width := JSON_UNQUOTE(JSON_EXTRACT(image_in_json, '$.width'));
	SET width := If(width='' OR width='null', NULL, width);
	
	SET height := JSON_UNQUOTE(JSON_EXTRACT(image_in_json, '$.height'));
	SET height := If(height='' OR height='null', NULL, height);
	
	If in_originalSrc IS NOT NULL
	Then
		SELECT `imageId` INTO out_imageId FROM image WHERE `originalSrc`=in_originalSrc;
		If out_imageId IS Null
		Then
			INSERT INTO image(originalSrc, altText, width, height) VALUES(in_originalSrc, altText, width, height);
			SET out_imageId := LAST_INSERT_ID();
		END IF;
	END If;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
