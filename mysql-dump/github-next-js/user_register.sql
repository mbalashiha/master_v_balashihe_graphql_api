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

-- Дамп структуры для процедура github-next-js.user_register
DELIMITER //
CREATE PROCEDURE `user_register`(
	IN `new_user_name` TEXT,
	IN `typed_password` TEXT
)
BEGIN
	DECLARE salt TEXT;
	DECLARE passwordHash TEXT;
	DECLARE inserted_id INT UNSIGNED DEFAULT NULL;
	
	IF new_user_name = '' OR new_user_name='null'
	Then
		SET new_user_name := NULL;
	END IF;
	IF typed_password = '' OR typed_password='null'
	Then
		SET typed_password := NULL;
	END IF;
	IF new_user_name IS NULL
	Then
		SIGNAL SQLSTATE
		    'ERR0R'
		SET
		    MESSAGE_TEXT = 'User name is empty or null',
		    MYSQL_ERRNO = 'errno';
	END IF;
	IF typed_password IS NULL
	Then
		SIGNAL SQLSTATE
		    'ERR0R'
		SET
		    MESSAGE_TEXT = 'User password is empty or null',
		    MYSQL_ERRNO = 'errno';
	END IF;
	SET salt := Upper(LPAD(CONV(FLOOR(RAND() * 0x100000000), 10, 16), 8, '0'));
	SET passwordHash := CONCAT(salt, Password(CONCAT(salt, typed_password)));
	SELECT id INTO inserted_id FROM managers WHERE login=new_user_name;
	IF inserted_id IS NOT NULL
	then
		UPDATE managers SET PASSWORD=passwordHash WHERE id=inserted_id;
	ELSE 
		INSERT INTO managers(login, `password`) VALUES(new_user_name, passwordHash);
		SET inserted_id := LAST_INSERT_ID();
	END IF;
	SELECT inserted_id AS 'id';
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
