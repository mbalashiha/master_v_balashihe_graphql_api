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

-- Дамп структуры для процедура github-next-js.update_page_navigation
DELIMITER //
CREATE PROCEDURE `update_page_navigation`(
	IN `in_page_path` TEXT,
	IN `in_page_name` TEXT,
	IN `in_parent_path` TEXT
)
BEGIN
	DECLARE s_page_id INT UNSIGNED DEFAULT NULL;
	DECLARE s_parent_page_id INT UNSIGNED DEFAULT NULL;	
	SELECT page_id INTO s_parent_page_id FROM navigation WHERE page_path=in_parent_path;
	If s_parent_page_id IS NULL
	Then 
		INSERT INTO navigation(page_path) VALUES(in_parent_path);
		SET s_parent_page_id := LAST_INSERT_ID();
	END if;
	SELECT page_id INTO s_page_id FROM navigation WHERE page_path=in_page_path;
	If s_page_id IS NULL
	Then 
		INSERT INTO navigation(page_path, page_name, parent_page_id) VALUES(in_page_path, in_page_name, s_parent_page_id);
		SET s_page_id := LAST_INSERT_ID();
	Else
		UPDATE navigation SET page_name=in_page_name, parent_page_id=s_parent_page_id WHERE page_id=s_page_id;
	END IF;
	SELECT * FROM navigation WHERE page_id=s_page_id;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
