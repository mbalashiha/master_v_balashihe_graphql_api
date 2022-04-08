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

-- Дамп структуры для процедура github-next-js.checkout_LineItems_Add
DELIMITER //
CREATE PROCEDURE `checkout_LineItems_Add`(
	IN `in_checkoutId` TINYTEXT,
	IN `in_lineItems` LONGTEXT
)
BEGIN
	DECLARE inserted_checkoutId INT UNSIGNED DEFAULT NULL;
	DECLARE test_main_id INT UNSIGNED DEFAULT NULL;
	DECLARE test_variantId INT UNSIGNED DEFAULT NULL;
	DECLARE test_quantity INT UNSIGNED DEFAULT NULL;
	DECLARE i INT UNSIGNED DEFAULT 0;
	DECLARE loop_lineItem JSON DEFAULT NULL;
	DECLARE loop_variantId TINYTEXT DEFAULT NULL;
	DECLARE loop_quantity TINYTEXT DEFAULT NULL;
	DECLARE try_id INT UNSIGNED DEFAULT NULL;
	DECLARE next_id INT UNSIGNED DEFAULT NULL;
	IF in_checkoutId IS NOT NULL AND in_checkoutId > 0
	Then
		SELECT checkoutId INTO inserted_checkoutId FROM checkout WHERE checkoutId=in_checkoutId;
	END IF;
	If inserted_checkoutId IS Null
	Then
		DELETE ch
			FROM checkout ch
			WHERE ch.checkoutId NOT IN (SELECT i.checkoutId FROM checkout_line_item i GROUP BY i.checkoutId);
		INSERT INTO checkout() VALUES();
		SET inserted_checkoutId := Last_insert_id();
	END IF;
	Set i := 0;
	SELECT JSON_EXTRACT(in_lineItems, CONCAT('$[',i,']')) INTO loop_lineItem;	
	WHILE JSON_LENGTH(loop_lineItem)		
	DO
		SET loop_variantId := Json_unquote(JSON_extract(loop_lineItem, "$.variantId"));
		SET loop_variantId := IF(loop_variantId = '' OR loop_variantId = 'null', NULL, loop_variantId);	
		SET loop_quantity := Json_unquote(JSON_extract(loop_lineItem, "$.quantity"));
		SET loop_quantity := IF(loop_quantity = '' OR loop_quantity = 'null', NULL, loop_quantity);	
		SET test_variantId := NULL;
		SET test_quantity := NULL;
		IF loop_variantId IS NOT NULL AND loop_quantity IS NOT NULL
		Then
			SELECT variantId, quantity INTO test_variantId, test_quantity FROM checkout_line_item WHERE checkoutId=inserted_checkoutId AND variantId=loop_variantId;
			IF (test_variantId IS NULL)
			Then
				INSERT INTO checkout_line_item(checkoutId, variantId, quantity) VALUES(inserted_checkoutId, loop_variantId, loop_quantity);
			ELSEIF test_quantity != loop_quantity
			Then
				UPDATE checkout_line_item SET quantity=loop_quantity 
					WHERE checkoutId=inserted_checkoutId AND variantId=loop_variantId;
			END If;
		END If;
		Set i := i + 1;
	SELECT JSON_EXTRACT(in_lineItems, CONCAT('$[',i,']')) INTO loop_lineItem;
	END WHILE;
	SELECT inserted_checkoutId AS checkoutId;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
