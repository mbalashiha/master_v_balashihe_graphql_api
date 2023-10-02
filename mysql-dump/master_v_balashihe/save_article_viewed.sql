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

-- Дамп структуры для процедура master_v_balashihe.save_article_viewed
DELIMITER //
CREATE PROCEDURE `save_article_viewed`(
	IN `in_ip` TINYTEXT,
	IN `in_timestamp` BIGINT,
	IN `in_articleId` Text,
	IN `IN_OWNER_IP_ADDRESS` TINYTEXT
)
BEGIN
   DECLARE client_timestamp TIMESTAMP;
   DECLARE ip_binary VARBINARY(16);
   DECLARE viewed_count INT UNSIGNED DEFAULT NULL;
   SET client_timestamp := FROM_UNIXTIME(in_timestamp * 0.001);
   SET ip_binary := INET6_ATON(in_ip);
   IF client_timestamp NOT BETWEEN SUBDATE(NOW(),1) AND AddDATE(NOW(),1)
   Then   	
      SELECT a.viewed INTO viewed_count FROM blog_article a WHERE a.id=in_articleId;
      SELECT 'incorrect timestamp from client' AS `error`, COALESCE(viewed_count,0) AS viewed;
	ELSEIF EXISTS(SELECT 1 FROM article_statistic e WHERE IFNUll(e.articleId, 0)=Ifnull(in_articleId,0) AND e.timestamp=client_timestamp AND e.ip=ip_binary)
   Then
      SELECT a.viewed INTO viewed_count FROM blog_article a WHERE a.id=in_articleId;
      SELECT 'already has articleId, ip and timestamp row' AS `error`, COALESCE(viewed_count,0) AS viewed;
      UPDATE article_statistic e SET duplicate=Coalesce(duplicate,1)+1
         WHERE IFNUll(e.articleId, 0)=Ifnull(in_articleId,0) AND e.timestamp=client_timestamp AND e.ip=ip_binary;
   ELSE
      IF (in_ip <> '::1' And in_ip <> '127.0.0.1' AND in_ip <> IN_OWNER_IP_ADDRESS AND in_ip NOT LIKE '192.168.%')
      Then
			INSERT INTO article_statistic(ip, timestamp, articleId) 
                    VALUES(ip_binary, client_timestamp, in_articleId);
      END IF;
      UPDATE blog_article a SET a.viewed=COALESCE(a.viewed,0)+1
      	WHERE a.id=Ifnull(in_articleId,0);
      SELECT a.viewed INTO viewed_count FROM blog_article a WHERE a.id=in_articleId;
      SELECT COALESCE(viewed_count,0) AS viewed;
   END IF;
END//
DELIMITER ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
