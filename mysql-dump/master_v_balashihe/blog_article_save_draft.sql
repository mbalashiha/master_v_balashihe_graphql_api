-- --------------------------------------------------------
-- Хост:                         192.168.0.50
-- Версия сервера:               11.0.3-MariaDB-1:11.0.3+maria~ubu2204 - mariadb.org binary distribution
-- Операционная система:         debian-linux-gnu
-- HeidiSQL Версия:              12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Дамп структуры для процедура master_v_balashihe.blog_article_save_draft
DELIMITER //
CREATE PROCEDURE `blog_article_save_draft`(
	IN `in_managerId` TEXT,
	IN `in_existingArticleId` TEXT,
	IN `in_title` TEXT,
	IN `in_handle` TEXT,
	IN `in_autoHandleSlug` TEXT,
	IN `in_blogCategoryId` TEXT,
	IN `in_orderNumber` TEXT,
	IN `in_imageId` TEXT,
	IN `in_unPublished` TEXT,
	IN `in_notSearchable` TEXT,
	IN `in_notInList` TEXT,
	IN `in_absURL` TEXT,
	IN `in_publishedAt` DATETIME,
	IN `in_h2` VARCHAR(150),
	IN `in_secondImageId` TEXT,
	IN `in_templateId` TINYTEXT,
	IN `in_description` VARCHAR(150)
)
BEGIN
	DECLARE stored_draftArticleId BINARY(16) DEFAULT Null;
	if (in_publishedAt > NOW())
	Then 
		SET in_publishedAt := NOW();
	END IF;
	Set in_existingArticleId := If(in_existingArticleId='' OR in_existingArticleId IS NULL,NULL, in_existingArticleId);
	Set in_managerId := If(in_managerId='' OR in_managerId IS NULL,NULL, in_managerId);
	Set in_templateId := If(in_templateId='' OR in_templateId IS NULL,NULL, in_templateId);	
	Set in_title := If(in_title='' OR in_title IS NULL,NULL,TRIM(in_title));
	Set in_handle := If(in_handle='' OR in_handle IS NULL,NULL,TRIM(in_handle));
	Set in_absURL := If(in_absURL='' OR in_absURL IS NULL,NULL,TRIM(in_absURL));	
	SET in_autoHandleSlug := If(in_autoHandleSlug='' OR in_autoHandleSlug IS NULL,NULL,TRIM(in_autoHandleSlug));
	Set in_blogCategoryId := If(in_blogCategoryId='' OR in_blogCategoryId IS NULL,NULL, in_blogCategoryId);
	Set in_unPublished := If(in_unPublished='' OR in_unPublished IS NULL,NULL, in_unPublished);
	Set in_notSearchable := If(in_notSearchable='' OR in_notSearchable IS NULL,NULL, in_notSearchable);
	Set in_notInList := If(in_notInList='' OR in_notInList IS NULL,NULL, in_notInList);
	Set in_orderNumber := If(in_orderNumber='' OR in_orderNumber IS NULL,NULL, in_orderNumber);
	Set in_imageId := If(in_imageId='' OR in_imageId IS NULL,NULL, in_imageId);
	Set in_secondImageId := If(in_secondImageId='' OR in_secondImageId IS NULL,NULL, in_secondImageId);
	Set in_h2 := If(in_h2='' OR in_h2 IS NULL,NULL, in_h2);
	
	Set in_autoHandleSlug := TRIM(BOTH '/' FROM in_autoHandleSlug);
	Set in_handle := TRIM(BOTH '/' FROM in_handle);	
	Set in_absURL := TRIM(BOTH '/' FROM in_absURL);
	
	SELECT draftArticleId INTO stored_draftArticleId FROM draft_blog_article d
		WHERE in_managerId=d.managerId AND d.isDraftSaved IS NULL And
				IFNULL(in_title, '')=IFNULL(d.title,'') And
				IFNULL(in_handle, '')=IFNULL(d.handle,'') and
				IFNULL(in_absURL, '')=IFNULL(d.absURL,'') and
				IFNULL(in_autoHandleSlug, '')=IFNULL(d.autoHandleSlug,'') And
				IFNULL(in_blogCategoryId, '')=IFNULL(d.blogCategoryId,'') And
				IFNULL(in_unPublished,'')=IFNULL(d.unPublished,'') And
				IFNULL(in_notSearchable,'')=IFNULL(d.notSearchable,'') And
				IFNULL(in_notInList,'')=IFNULL(d.notInList,'') And
				IFNULL(in_orderNumber,'')=IFNULL(d.orderNumber,'') And
				IFNULL(in_existingArticleId,'')=IFNULL(d.existingArticleId,'') And
				IFNULL(in_imageId,'')=IFNULL(d.imageId,'') And
				IfNUll(in_publishedAt,'')=IfNULL(d.publishedAt,'') And
				IFNULL(in_h2,'')=IFNULL(d.h2,'') And
				IfNUll(in_secondImageId,'')=IfNULL(d.secondImageId,'') And
				IfNUll(in_templateId,'')=IFNULL(d.templateId,'');
	
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
										IFNULL(in_title, '')=IFNULL(d.title,'') And
										IFNULL(in_handle, '')=IFNULL(d.handle,'') and
										IFNULL(in_absURL, '')=IFNULL(d.absURL,'') and
										IFNULL(in_autoHandleSlug, '')=IFNULL(d.autoHandleSlug,'') And
										IFNULL(in_blogCategoryId, '')=IFNULL(d.blogCategoryId,'') And
										IFNULL(in_unPublished,'')=IFNULL(d.unPublished,'') And
										IFNULL(in_notSearchable,'')=IFNULL(d.notSearchable,'') And
										IFNULL(in_notInList,'')=IFNULL(d.notInList,'') And
										IFNULL(in_orderNumber,'')=IFNULL(d.orderNumber,'') And
										IFNULL(in_imageId,'')=IFNULL(d.imageId,'') And
										IfNUll(in_publishedAt,'')=IfNULL(d.publishedAt,'') And
										IFNULL(in_h2,'')=IFNULL(d.h2,'') And
										IfNUll(in_secondImageId,'')=IfNULL(d.secondImageId,'') And
										IfNUll(in_templateId,'')=IFNULL(d.templateId,'')
									)
			Then
				SELECT 'No need to create draft' AS message, null AS draftArticleId;			
			Else
				INSERT INTO draft_blog_article(existingArticleId, managerId, title, handle, absURL, autoHandleSlug, blogCategoryId, 
				unPublished, 
				notSearchable,
				notInList,
				orderNumber, imageId,
				publishedAt,
				h2, secondImageId, templateId)
					VALUES(				
						in_existingArticleId,
						in_managerId,
						in_title,
						in_handle,
						in_absURL,
						in_autoHandleSlug,
						in_blogCategoryId,
				in_unPublished, 
				in_notSearchable,
				in_notInList,
						in_orderNumber,
						in_imageId,
						in_publishedAt,
						in_h2, in_secondImageId,
						in_templateId
					);
				SET stored_draftArticleId := @last_draftArticleId;
				SELECT d.publishedAt, 'Draft has been created' AS message, Lower(Hex(stored_draftArticleId)) AS draftArticleId FROM draft_blog_article d WHERE d.draftArticleId=stored_draftArticleId;
			END IF;
		Else
			UPDATE draft_blog_article SET 
				title=in_title,
				handle=in_handle,
				absURL=in_absURL,
				autoHandleSlug=in_autoHandleSlug,
				blogCategoryId=in_blogCategoryId,
				unPublished=in_unPublished,
				notSearchable=in_notSearchable,
				notInList=in_notInList,
				orderNumber=in_orderNumber,
				imageId=in_imageId,
				publishedAt=in_publishedAt,
				h2=in_h2,
				secondImageId=in_secondImageId,
				templateId=in_templateId
				WHERE draftArticleId=stored_draftArticleId;
			SELECT d.publishedAt, 'Draft was updated' AS message, Lower(Hex(stored_draftArticleId)) AS draftArticleId FROM draft_blog_article d WHERE d.draftArticleId=stored_draftArticleId;
		END IF;
	END IF;
END//
DELIMITER ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
