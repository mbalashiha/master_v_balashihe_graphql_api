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

-- Дамп структуры для процедура github-next-js.create_selected_options
DELIMITER //
CREATE PROCEDURE `create_selected_options`(
	IN `in_selectedOptions` LONGTEXT,
	OUT `out_optionId_json_array` LONGTEXT
)
BEGIN
	DECLARE selected_option Json;
	DECLARE i INT Unsigned DEFAULT 0;
	DECLARE in_name TEXT DEFAULT NULL;
	DECLARE in_value Text DEFAULT NULL;
	DECLARE q_nameId INT UNSIGNED DEFAULT NULL;
	DECLARE q_valueId INT UNSIGNED DEFAULT NULL;
	DECLARE q_optionId INT UNSIGNED DEFAULT NULL;
	SET out_optionId_json_array := '[]';
	SET i := 0;
	SELECT JSON_EXTRACT(in_selectedOptions,CONCAT('$[',i,']')) INTO selected_option;	
	WHILE JSON_LENGTH(selected_option) 
	DO
		SET q_nameId := NULL;
		SET q_valueId := NULL;
		SET q_optionId := NULL;
		SET in_name := Json_unquote(JSON_extract(selected_option, "$.name"));
		SET in_name := IF(in_name = '' OR in_name = 'null', NULL, in_name);	
		SET in_value := Json_unquote(JSON_extract(selected_option, "$.value"));
		SET in_value := IF(in_value = '' OR in_value = 'null', NULL, in_value);	
		IF in_name IS NOT NULL AND in_value IS NOT Null
		Then
			SELECT `nameId` INTO q_nameId FROM product_option_name WHERE `name`=in_name;
			IF q_nameId IS NULL 
			Then
				INSERT INTO product_option_name(`name`) VALUES(in_name);
				SET q_nameId := LAST_INSERT_ID();
			END IF;
			SELECT `valueId` INTO q_valueId FROM product_option_name_value WHERE `value`=in_value;
			IF q_valueId IS NULL 
			Then
				INSERT INTO product_option_name_value(`value`) VALUES(in_value);
				SET q_valueId := LAST_INSERT_ID();
			END IF;
			SELECT `optionId` INTO q_optionId FROM product_option WHERE `nameId`=q_nameId AND `valueId`=q_valueId;
			IF q_optionId IS NULL
			Then
				INSERT INTO product_option(`nameId`,`valueId`) VALUES(q_nameId, q_valueId);
				SET q_optionId := LAST_INSERT_ID();
			END IF;
			SET out_optionId_json_array := JSON_ARRAY_APPEND(out_optionId_json_array, '$', q_optionId);
		END IF;
		Set i := i + 1;
		SELECT JSON_EXTRACT(in_selectedOptions,CONCAT('$[',i,']')) INTO selected_option;
	END WHILE;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
