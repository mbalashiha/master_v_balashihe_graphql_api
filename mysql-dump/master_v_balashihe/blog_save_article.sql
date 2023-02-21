-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               10.6.11-MariaDB-0ubuntu0.22.04.1 - Ubuntu 22.04
-- Операционная система:         debian-linux-gnu
-- HeidiSQL Версия:              12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Дамп структуры для процедура master_v_balashihe.blog_save_article
DELIMITER //
CREATE PROCEDURE `blog_save_article`(
	IN `in_managerId` TEXT,
	IN `in_existingArticleId` TEXT,
	IN `in_title` TEXT,
	IN `in_handle` TEXT,
	IN `in_autoHandleSlug` TEXT,
	IN `in_blogCategoryId` TEXT,
	IN `in_published` TEXT,
	IN `in_orderNumber` TEXT,
	IN `in_text` MEDIUMTEXT,
	IN `in_textHtml` MEDIUMTEXT,
	IN `in_textRawDraftContentState` MEDIUMTEXT
)
BEGIN
	DECLARE stored_articleId INT(10) unsigned DEFAULT Null;
	DECLARE stored_draftArticleId BINARY(16) DEFAULT Null;
	Set in_existingArticleId := If(in_existingArticleId='' OR in_existingArticleId IS NULL,NULL, in_existingArticleId);
	Set in_managerId := If(in_managerId='' OR in_managerId IS NULL,NULL, in_managerId);
	Set in_title := If(in_title='' OR in_title IS NULL,NULL,TRIM(in_title));
	Set in_handle := If(in_handle='' OR in_handle IS NULL,NULL,TRIM(in_handle));
	SET in_autoHandleSlug := If(in_autoHandleSlug='' OR in_autoHandleSlug IS NULL,NULL,TRIM(in_autoHandleSlug));
	Set in_blogCategoryId := If(in_blogCategoryId='' OR in_blogCategoryId IS NULL,NULL, in_blogCategoryId);
	Set in_published := If(in_published='' OR in_published IS NULL,NULL, in_published);
	Set in_orderNumber := If(in_orderNumber='' OR in_orderNumber IS NULL,NULL, in_orderNumber);
	Set in_text := If(in_text='' OR in_text IS NULL,NULL, TRIM(in_text));
	Set in_textHtml := If(in_textHtml='' OR in_textHtml IS NULL,NULL, TRIM(in_textHtml));
	Set in_textRawDraftContentState := If(in_textRawDraftContentState='' OR in_textRawDraftContentState IS NULL,NULL, TRIM(in_textRawDraftContentState));
	
	If in_existingArticleId IS NOT NULL
	Then
	SELECT id INTO stored_articleId FROM blog_article d
		WHERE d.id=in_existingArticleId And
				IFNULL(in_title, '')=IFNULL(d.title,'') And
				IFNULL(in_handle, '')=IFNULL(d.handle,'') and
				IFNULL(in_autoHandleSlug, '')=IFNULL(d.autoHandleSlug,'') And
				IFNULL(in_blogCategoryId, '')=IFNULL(d.blogCategoryId,'') And
				IFNULL(in_published,'')=IFNULL(d.published,'') And
				IFNULL(in_orderNumber,'')=IFNULL(d.orderNumber,'') And
				IFNULL(in_text,'')=IFNULL(d.`text`,'') And
				IFNULL(in_textHtml,'')=IFNULL(d.textHtml,'') And
				IFNULL(in_textRawDraftContentState,'')=IFNULL(d.textRawDraftContentState,'');
	END IF;
	If stored_articleId IS NOT null
	Then
		SELECT stored_articleId AS articleId, false as success, 'Nothing to save' AS message;
	Else
		
		If in_existingArticleId IS Null
		Then
			INSERT INTO blog_article(managerId, createdByManagerId, title, handle, autoHandleSlug, blogCategoryId, published, orderNumber, `text`, textHtml, textRawDraftContentState)
				VALUES(
					in_managerId,					
					in_managerId,
					in_title,
					in_handle,
					in_autoHandleSlug,
					in_blogCategoryId,
					in_published,
					in_orderNumber,
					in_text, 
				   in_textHtml,
					in_textRawDraftContentState
				);
			SET stored_articleId := LAST_INSERT_ID();
			SELECT stored_articleId AS articleId, true as success, 'Article has been created' AS message, stored_articleId AS articleId;
		Else
			UPDATE blog_article SET 
				managerId=in_managerId,
				title=in_title,
				handle=in_handle,
				autoHandleSlug=in_autoHandleSlug,
				blogCategoryId=in_blogCategoryId,
				published=in_published,
				orderNumber=in_orderNumber,
				`text`=in_text, 
				textHtml=in_textHtml,
				textRawDraftContentState=in_textRawDraftContentState
				WHERE id=in_existingArticleId;
			SET stored_articleId := in_existingArticleId;
			SELECT stored_articleId AS articleId, true as success, 'Article was updated' AS message;
		END IF;
		UPDATE draft_blog_article d
		SET 
			d.existingArticleId=stored_articleId,
			d.isDraftSaved=1,
			title=in_title,
				handle=in_handle,
				autoHandleSlug=in_autoHandleSlug,
				blogCategoryId=in_blogCategoryId,
				published=in_published,
				orderNumber=in_orderNumber,
				`text`=in_text, 
				textHtml=in_textHtml,
				textRawDraftContentState=in_textRawDraftContentState
		WHERE in_managerId=d.managerId AND d.isDraftSaved IS NULL And
				IFNULL(in_existingArticleId,'')=IFNULL(d.existingArticleId,'');
	END IF;
END//
DELIMITER ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
