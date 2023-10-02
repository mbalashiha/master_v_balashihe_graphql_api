-- --------------------------------------------------------
-- Хост:                         192.168.0.50
-- Версия сервера:               11.0.3-MariaDB-1:11.0.3+maria~ubu2204 - mariadb.org binary distribution
-- Операционная система:         debian-linux-gnu
-- HeidiSQL Версия:              12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Дамп структуры для процедура master_v_balashihe.user_authenticate
DELIMITER //
CREATE PROCEDURE `user_authenticate`(
	IN `in_login` TEXT,
	IN `in_password` TEXT
)
BEGIN
	DECLARE stored_user_id INT Unsigned DEFAULT NULL;
	DECLARE authenticated_user_id INT Unsigned DEFAULT NULL;
	DECLARE authenticated_login Text DEFAULT NULL;
	DECLARE authenticated_is_admin Boolean DEFAULT NULL;
	DECLARE auth_result Boolean DEFAULT False;
	DECLARE stored_salt TEXT DEFAULT Null;
	DECLARE existing_hash TEXT DEFAULT Null;
	DECLARE input_hash TEXT DEFAULT Null;
	SELECT m.id, 
			IF(m.password Is Not NULL, SUBSTRING(m.password, 1, 8), Null) AS stored_salt, 
			IF(m.password Is Not NULL, Upper(m.password), Null) AS existing_hash,
			m.login,
			m.is_admin
		INTO stored_user_id, stored_salt, existing_hash, authenticated_login, authenticated_is_admin
		FROM managers m WHERE m.login=in_login;
	IF stored_user_id IS NOT NULL
	Then
		SET input_hash := CONCAT(stored_salt, in_password);
		SET input_hash := PASSWORD(input_hash);
		SET input_hash := Upper(CONCAT(stored_salt, input_hash));
		IF input_hash = existing_hash
		Then
			SET authenticated_user_id := stored_user_id;
		Else
			SET authenticated_user_id := Null;
		END IF;
	Else
		SET authenticated_user_id := Null;
	END IF;
	
	If authenticated_user_id IS NOT NULL
	Then
		SELECT TRUE AS authorized, authenticated_user_id AS id, authenticated_login AS login, authenticated_is_admin as is_admin;
	ELSE 
		SELECT 1 failed;
	END IF;
END//
DELIMITER ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
