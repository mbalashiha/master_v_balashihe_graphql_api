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

-- Дамп структуры для процедура github-next-js.draft_save_product
DELIMITER //
CREATE PROCEDURE `draft_save_product`(
	IN `in_draftProductId` TEXT,
	IN `in_managerId` TEXT,
	IN `in_productId` TEXT,
	IN `in_category_id` TEXT,
	IN `in_title` TEXT,
	IN `in_handle` TEXT,
	IN `in_manufacturerId` TEXT,
	IN `in_price_amount` TEXT,
	IN `in_price_currencyCodeId` TEXT,
	IN `in_published` TINYINT,
	IN `in_orderNumber` INT
)
BEGIN
DECLARE stored_priceAmount DECIMAL(16, 4) DEFAULT NULL;
DECLARE stored_nullOptionsCount INT UNSIGNED DEFAULT NULL;
DECLARE stored_draftProductId BINARY(16) DEFAULT NULL;
DECLARE defaultOptionNameId INT UNSIGNED DEFAULT NULL;
DECLARE defaultOptionValueId INT UNSIGNED DEFAULT NULL;
SELECT v.valueId INTO defaultOptionValueId
FROM product_option_name_value v
WHERE v.value = '';
IF defaultOptionValueId IS NULL Then
INSERT INTO product_option_name_value(`value`)
VALUES('');
SET defaultOptionValueId := LAST_INSERT_ID();
END IF;
SELECT n.nameId INTO defaultOptionNameId
FROM product_option_name n
WHERE n.name = 'default';
IF defaultOptionNameId IS NULL Then
INSERT INTO product_option_name(`name`)
VALUES('default');
SET defaultOptionNameId := LAST_INSERT_ID();
END IF;
SET in_managerId := IF(
        in_managerId = ''
        OR in_managerId = 'null',
        NULL,
        in_managerId
    );
SET in_productId := IF(
        in_productId = ''
        OR in_productId = 'null',
        NULL,
        in_productId
    );
SET in_title := IF(
        in_title = ''
        OR in_title = 'null',
        NULL,
        in_title
    );
SET in_handle := IF(
        in_handle = ''
        OR in_handle = 'null',
        NULL,
        in_handle
    );
SET in_manufacturerId := IF(
        in_manufacturerId = ''
        OR in_manufacturerId = 'null',
        NULL,
        in_manufacturerId
    );
SET in_price_amount := IF(
        in_price_amount = ''
        OR in_price_amount = 'null',
        NULL,
        in_price_amount
    );
SET in_price_currencyCodeId := IF(
        in_price_currencyCodeId = ''
        OR in_price_currencyCodeId = 'null',
        NULL,
        in_price_currencyCodeId
    );
SET in_category_id := IF(
        in_category_id = ''
        OR in_category_id = 'null',
        NULL,
        in_category_id
    );
SELECT draftProductId INTO stored_draftProductId
FROM draft_product d
WHERE d.draftProductId = UNHEX(in_draftProductId)
    AND d.managerId = in_managerId
ORDER BY d.updatedAt DESC
LIMIT 1;
IF stored_draftProductId IS NULL THEN signal sqlstate '45000'
set message_text = 'No draftProductId: it can not be Null.';
ELSE
UPDATE draft_product
SET productId = in_productId,
    handle = in_handle,
    title = in_title,
    product_category_id = in_category_id,
    manufacturerId = in_manufacturerId,
    published = in_published,
    orderNumber = in_orderNumber
WHERE draftProductId = stored_draftProductId;
END IF;
SELECT COUNT(*),
    MIN(v.price) INTO stored_nullOptionsCount,
    stored_priceAmount
FROM draft_product_variant v
WHERE v.draftProductId = stored_draftProductId
GROUP BY v.draftProductId;
If stored_nullOptionsCount > 1 THEN DELETE v
FROM draft_product_variant v
WHERE v.draftProductId = stored_draftProductId;
SET stored_priceAmount := NULL;
END IF;
IF stored_priceAmount IS NULL THEN
INSERT INTO draft_product_variant(draftProductId, price, currencyCodeId)
VALUES(
        stored_draftProductId,
        in_price_amount,
        in_price_currencyCodeId
    );
ELSE
UPDATE draft_product_variant v
SET v.price = in_price_amount,
    v.currencyCodeId = in_price_currencyCodeId
WHERE v.draftProductId = stored_draftProductId;
END IF;
DELETE dv,
dip,
p
FROM draft_product_variant dv
    JOIN draft_product p ON dv.draftProductId = p.draftProductId
    JOIN draft_image_to_product dip ON p.draftProductId = dip.draftProductId
WHERE p.draftProductId != stored_draftProductId
    AND p.managerId = in_managerId
    AND (
        (
            in_productId IS NULL
            AND p.productId IS NULL
        )
        OR (
            in_productId IS NOT NULL
            AND p.productId = in_productId
        )
    );
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
