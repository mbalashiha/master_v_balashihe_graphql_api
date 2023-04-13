-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               10.6.11-MariaDB-0ubuntu0.22.04.1 - Ubuntu 22.04
-- Операционная система:         debian-linux-gnu
-- HeidiSQL Версия:              12.4.0.6659
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
	IN `in_absURL` TEXT,
	IN `in_blogCategoryId` TEXT,
	IN `in_orderNumber` TEXT,
	IN `in_text` LONGTEXT,
	IN `in_textHtml` LONGTEXT,
	IN `in_textRawDraftContentState` LONGTEXT,
	IN `in_renderHtml` LONGTEXT,
	IN `in_imageId` TEXT,
	IN `in_unPublished` TEXT,
	IN `in_notSearchable` TEXT,
	IN `in_notInList` TEXT,
	IN `in_keyTextHtml` TEXT
)
BEGIN
	DECLARE stored_articleId INT(10) unsigned DEFAULT Null;
	DECLARE stored_handleId INT(10) unsigned DEFAULT Null;
	DECLARE stored_autoHandleSlugId INT(10) unsigned DEFAULT Null;
	DECLARE stored_absURLid INT(10) unsigned DEFAULT Null;
	DECLARE stored_draftArticleId BINARY(16) DEFAULT Null;
	DECLARE test_handle Text DEFAULT Null;
	Set in_existingArticleId := If(in_existingArticleId='' OR in_existingArticleId IS NULL,NULL, in_existingArticleId);
	Set in_managerId := If(in_managerId='' OR in_managerId IS NULL,NULL, in_managerId);
	Set in_title := If(in_title='' OR in_title IS NULL,NULL,TRIM(in_title));
	Set in_handle := If(in_handle='' OR in_handle IS NULL,NULL,TRIM(in_handle));
	SET in_autoHandleSlug := If(in_autoHandleSlug='' OR in_autoHandleSlug IS NULL,NULL,TRIM(in_autoHandleSlug));
	SET in_absURL := If(in_absURL='' OR in_absURL IS NULL,NULL,TRIM(in_absURL));
	Set in_blogCategoryId := If(in_blogCategoryId='' OR in_blogCategoryId IS NULL,NULL, in_blogCategoryId);
	
	Set in_unPublished := If(in_unPublished='' OR in_unPublished IS NULL,NULL, in_unPublished);
	Set in_notSearchable := If(in_notSearchable='' OR in_notSearchable IS NULL,NULL, in_notSearchable);
	Set in_notInList := If(in_notInList='' OR in_notInList IS NULL,NULL, in_notInList);
	
	Set in_orderNumber := If(in_orderNumber='' OR in_orderNumber IS NULL,NULL, in_orderNumber);
	Set in_text := If(in_text='' OR in_text IS NULL,NULL, in_text);
	Set in_textHtml := If(in_textHtml='' OR in_textHtml IS NULL,NULL, in_textHtml);
	Set in_keyTextHtml := If(in_keyTextHtml='' OR in_keyTextHtml IS NULL,NULL, in_keyTextHtml);
	Set in_renderHtml := If(in_renderHtml='' OR in_renderHtml IS NULL,NULL, in_renderHtml);
	Set in_imageId := If(in_imageId='' OR in_imageId IS NULL,NULL, in_imageId);
	Set in_textRawDraftContentState := If(in_textRawDraftContentState='' OR in_textRawDraftContentState IS NULL,NULL, TRIM(in_textRawDraftContentState));
	
	SET in_handle := IF(in_handle IS NULL OR in_handle ='', in_autoHandleSlug, in_handle);
	
	If in_existingArticleId IS NOT NULL
	Then
			SELECT handle INTO test_handle FROM blog_article_handle
				WHERE id=in_existingArticleId;
			IF test_handle IS NOT NULL AND TRIM(test_handle) != ''
			Then 
				SET in_handle := test_handle;
			END IF;
	SELECT id INTO stored_articleId FROM blog_article_handle d
		WHERE d.id=in_existingArticleId And
				IFNULL(in_title, '')=IFNULL(d.title,'') And
				IFNULL(in_handle, '')=IFNULL(d.handle,'') and
				IFNULL(in_autoHandleSlug, '')=IFNULL(d.autoHandleSlug,'') And
				IFNULL(in_absURL, '')=IFNULL(d.absURL,'') And
				IFNULL(in_blogCategoryId, '')=IFNULL(d.blogCategoryId,'') And
				IFNULL(in_unPublished,'')=IFNULL(d.unPublished,'') And
				IFNULL(in_notSearchable,'')=IFNULL(d.notSearchable,'') And
				IFNULL(in_notInList,'')=IFNULL(d.notInList,'') And
				IFNULL(in_orderNumber,'')=IFNULL(d.orderNumber,'') And
				IFNULL(in_text,'')=IFNULL(d.`text`,'') And
				IFNULL(in_textHtml,'')=IFNULL(d.`textHtml`,'') And
				IFNULL(in_keyTextHtml,'')=IFNULL(d.`keyTextHtml`,'') And
				IFNULL(in_renderHtml,'')=IFNULL(d.`renderHtml`,'') And
				IFNULL(in_imageId,'')=IFNULL(d.`imageId`,'') And
				IFNULL(in_textRawDraftContentState,'')=IFNULL(d.`textRawDraftContentState`,'');
	END IF;
	If stored_articleId IS NOT null
	Then
		SELECT stored_articleId AS articleId, false as success, 'Nothing to save' AS message;
	Else
		if in_handle IS NOT NULL
		Then
			SELECT id INTO stored_handleId FROM page_handle WHERE handle=in_handle;
			if stored_handleId IS NULL
			Then
				INSERT INTO page_handle(handle) VALUES(in_handle);
				Set stored_handleId := LAST_INSERT_ID();
			END IF;
		END if;
		if in_autoHandleSlug IS NOT NULL
		Then
			SELECT id INTO stored_autoHandleSlugId FROM page_handle WHERE handle=in_autoHandleSlug;
			if stored_autoHandleSlugId IS NULL
			Then
				INSERT INTO page_handle(handle) VALUES(in_autoHandleSlug);
				Set stored_autoHandleSlugId := LAST_INSERT_ID();
			END IF;
		END if;
		if in_absURL IS NOT NULL
		Then
			SELECT id INTO stored_absURLId FROM page_handle WHERE handle=in_absURL;
			if stored_absURLId IS NULL
			Then
				INSERT INTO page_handle(handle) VALUES(in_absURL);
				Set stored_absURLId := LAST_INSERT_ID();
			END IF;
		END if;
		
		If in_existingArticleId IS Null
		Then
			INSERT INTO blog_article(managerId, createdByManagerId, title, handleId, autoHandleSlugId, absURLid, blogCategoryId, 
			unPublished, 
			notSearchable,
			notInList,
			orderNumber, 
			`text`, `textHtml`,`renderHtml`, `imageId`, `textRawDraftContentState`, `keyTextHtml`)
				VALUES(
					in_managerId,					
					in_managerId,
					in_title,
					stored_handleId,
					stored_autoHandleSlugId,
					stored_absURLId,
					in_blogCategoryId,
					in_unPublished,
					in_notSearchable,
					in_notInList,					
					in_orderNumber,
					IFNULL(in_text, ''), 
				   in_textHtml,
					in_renderHtml,
					in_imageId,
					in_textRawDraftContentState,
					in_keyTextHtml
				);
			SET stored_articleId := LAST_INSERT_ID();
			SELECT stored_articleId AS articleId, true as success, 'Article has been created' AS message, stored_articleId AS articleId;
		Else
			UPDATE blog_article SET 
				managerId=in_managerId,
				title=in_title,
				handleId=stored_handleId,
				autoHandleSlugId=stored_autoHandleSlugId,
				absURLId=stored_absURLId,
				blogCategoryId=in_blogCategoryId,
				unPublished=in_unPublished,
				notSearchable=in_notSearchable,
				notInList=in_notInList,
				orderNumber=in_orderNumber,
				`text`=IFNULL(in_text,''), 
				`textHtml`=in_textHtml, 
				`renderHtml`=in_renderHtml,
				`imageId`=in_imageId,
				`textRawDraftContentState`=in_textRawDraftContentState,
				`keyTextHtml`=in_keyTextHtml
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
				imageId=in_imageId,
				unPublished=in_unPublished,
				notSearchable=in_notSearchable,
				notInList=in_notInList,
				orderNumber=in_orderNumber,
				`text`=IFNULL(in_text,''), 
				textHtml=in_textHtml,
				textRawDraftContentState=in_textRawDraftContentState,
				`keyTextHtml`=in_keyTextHtml
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
