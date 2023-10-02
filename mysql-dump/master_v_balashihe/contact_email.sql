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

-- Дамп структуры для процедура master_v_balashihe.contact_email
DELIMITER //
CREATE PROCEDURE `contact_email`(
	IN `in_ip` TINYTEXT,
	IN `in_timestamp` BIGINT,
	IN `in_valuesText` TEXT
)
BEGIN
   DECLARE client_timestamp TIMESTAMP;
   DECLARE ip_binary VARBINARY(16);
   SET client_timestamp := FROM_UNIXTIME(in_timestamp * 0.001);
   SET ip_binary := INET6_ATON(in_ip);
   IF client_timestamp NOT BETWEEN SUBDATE(NOW(),1) AND AddDATE(NOW(),1)
   Then   	
      SELECT 'incorrect timestamp from client' AS `error`;
	ELSEIF EXISTS(SELECT 1 FROM contact_emails e WHERE e.timestamp=client_timestamp AND e.ip=ip_binary)
   Then
      SELECT 'already has ip and timestamp row' AS `error`;
   ELSEIF EXISTS(SELECT 1 FROM contact_emails e WHERE e.createdAt >= SUBDATE(NOW(),1) And e.valuesText=in_valuesText)
   Then
		SELECT 'already has valuesText row' AS `error`;
   END IF;
END//
DELIMITER ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
