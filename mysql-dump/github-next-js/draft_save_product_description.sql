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

-- Дамп структуры для процедура github-next-js.draft_save_product_description
DELIMITER //
CREATE PROCEDURE `draft_save_product_description`(
	IN `in_draftProductId` TINYTEXT,
	IN `in_managerId` TINYTEXT,
	IN `in_productId` TINYTEXT,
	IN `in_description` LONGTEXT,
	IN `in_descriptionHtml` LONGTEXT,
	IN `in_descriptionRawDraftContentState` LONGTEXT
)
BEGIN
 DECLARE stored_draftProductId BINARY(16) DEFAULT NULL;
 SET in_managerId := IF(in_managerId='' OR in_managerId='null', NULL, in_managerId);
 SET in_productId := IF(in_productId='' OR in_productId='null', NULL, in_productId);
 SET in_description := IF(in_description='' OR in_description='null', NULL, in_description);
 SET in_descriptionHtml := IF(in_descriptionHtml='' OR in_descriptionHtml='null', NULL, in_descriptionHtml);
 SET in_descriptionRawDraftContentState := IF(in_descriptionRawDraftContentState='' OR in_descriptionRawDraftContentState='null', NULL, in_descriptionRawDraftContentState);
 
 SELECT draftProductId INTO stored_draftProductId FROM draft_product d 
	 	WHERE d.draftProductId=unhex(in_draftProductId)
		ORDER BY d.updatedAt DESC LIMIT 1;
 
 IF stored_draftProductId IS NULL
 Then
 	INSERT INTO draft_product(managerId, productId, description, descriptionHtml, descriptionRawDraftContentState)
 		VALUES(in_managerId, in_productId, in_description, in_descriptionHtml, in_descriptionRawDraftContentState);
 	SET stored_draftProductId:=@last_draftProductId;
 ELSE 
 	Update draft_product
	  Set productId=in_productId, description=in_description, descriptionHtml=in_descriptionHtml, descriptionRawDraftContentState=in_descriptionRawDraftContentState
	  	WHERE draftProductId=stored_draftProductId;
 END IF;
 SELECT LCASE(HEX(stored_draftProductId)) AS draftProductId;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
