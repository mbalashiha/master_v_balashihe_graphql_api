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

-- Дамп структуры для процедура github-next-js.cursor_test
DELIMITER //
CREATE PROCEDURE `cursor_test`()
BEGIN

  DECLARE cursor_ID INT UNSIGNED;
  DECLARE cursor_VAL INT Unsigned DEFAULT NULL;
  DECLARE done Boolean DEFAULT FALSE;
  DECLARE i INT Unsigned DEFAULT 0;
  DECLARE productsArray JSON;
  DECLARE cursorJ JSON;
  
 SELECT JSON_ArrayAGG(JSON_OBJECT('productId', p.productId, 'orderNumber', p.orderNumber)) INTO productsArray FROM product p ORDER BY Coalesce(p.orderNumber, p.updatedAt, p.createdAt, p.productId) ASC;
 
 SET i=0;
 REPEAT
        SET cursorJ = JSON_EXTRACT(productsArray, CONCAT("$[", i, "]"));
        # use txt
        SET cursor_ID = JSON_UNQUOTE(JSON_EXTRACT(cursorJ, "$.productId"));
        SET cursor_VAL = JSON_UNQUOTE(JSON_EXTRACT(cursorJ, "$.orderNumber"));
        SET cursor_Val := IF(cursor_val IS NULL OR cursor_val <= 0, NULL, cursor_val);
        SET i = i + 1;
		  IF cursor_val != i
		 	Then 
			 	UPDATE product p SET p.orderNumber = i
			 		WHERE p.productId=cursor_ID;
			END IF;
        SELECT i, cursor_id, cursor_val, JSON_LENGTH(productsArray);
        UNTIL i >= JSON_LENGTH(productsArray)
   END REPEAT;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
