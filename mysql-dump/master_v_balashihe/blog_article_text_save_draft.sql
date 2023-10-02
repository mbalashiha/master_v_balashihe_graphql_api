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

-- Дамп структуры для процедура master_v_balashihe.blog_article_text_save_draft
DELIMITER //
CREATE PROCEDURE `blog_article_text_save_draft`(
	IN `in_managerId` TEXT,
	IN `in_existingArticleId` TEXT,
	IN `in_text` MEDIUMTEXT,
	IN `in_textHtml` LONGTEXT,
	IN `in_textRawDraftContentState` LONGTEXT
)
BEGIN
	DECLARE stored_draftArticleId BINARY(16) DEFAULT Null;
	SELECT draftArticleId INTO stored_draftArticleId FROM draft_blog_article d
		WHERE in_managerId=d.managerId AND d.isDraftSaved IS NULL And
				IFNULL(in_existingArticleId,'')=IFNULL(d.existingArticleId,'') And
				IFNULL(in_text, '')=IFNULL(d.`text`,'') And
				IFNULL(in_textHtml, '')=IFNULL(d.textHtml,'') and
				IFNULL(in_textRawDraftContentState, '')=IFNULL(d.textRawDraftContentState,'');
	
	If stored_draftArticleId IS NOT null
	Then
		SELECT 'Nothing to save' AS message, Lower(Hex(stored_draftArticleId)) AS draftArticleId;
	Else
		SELECT draftArticleId INTO stored_draftArticleId FROM draft_blog_article d
		WHERE in_managerId=d.managerId AND d.isDraftSaved IS NULL And
				IFNULL(in_existingArticleId,'')=IFNULL(d.existingArticleId,'');
		If stored_draftArticleId IS Null
		Then
				IF in_existingArticleId is not NULL 
					And Exists(
									SELECT 1 FROM blog_article_handle d
										WHERE 
										d.id=in_existingArticleId And
										IFNULL(in_text,'')=IFNULL(d.`text`,'') And										
										IFNULL(in_textHtml,'')=IFNULL(d.`textHtml`,'')
									)
			Then
				SELECT 'No need to create draft' AS message, null AS draftArticleId;	
			ELSE 	
				INSERT INTO draft_blog_article(existingArticleId, managerId, `text`, textHtml, textRawDraftContentState)
					VALUES(
						If(in_existingArticleId='' OR in_existingArticleId IS NULL,NULL, in_existingArticleId),
						If(in_managerId='' OR in_managerId IS NULL,NULL, in_managerId),
						If(in_text='' OR in_text IS NULL,NULL,TRIM(in_text)),
						If(in_textHtml='' OR in_textHtml IS NULL,NULL,TRIM(in_textHtml)),
						If(in_textRawDraftContentState='' OR in_textRawDraftContentState IS NULL,NULL,TRIM(in_textRawDraftContentState))
					);
				SET stored_draftArticleId := @last_draftArticleId;
				SELECT 'Draft has been created' AS message, Lower(Hex(stored_draftArticleId)) AS draftArticleId;
			END IF;
		Else
			UPDATE draft_blog_article SET 
				`text`=If(in_text='' OR in_text IS NULL,NULL,TRIM(in_text)),
				textHtml=If(in_textHtml='' OR in_textHtml IS NULL,NULL,TRIM(in_textHtml)),
				textRawDraftContentState=If(in_textRawDraftContentState='' OR in_textRawDraftContentState IS NULL,NULL,TRIM(in_textRawDraftContentState))
				WHERE draftArticleId=stored_draftArticleId;
			SELECT 'Draft was updated' AS message, Lower(Hex(stored_draftArticleId)) AS draftArticleId;
		END IF;
	END IF;
END//
DELIMITER ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
