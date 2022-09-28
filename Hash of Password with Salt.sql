SET @typed_password := "23423233243434324324234242343243243";
SET @salt := Upper(LPAD(CONV(FLOOR(RAND() * 0x100000000), 10, 16), 8, '0'));
SET @passwordHash := CONCAT(@salt, Password(CONCAT(@salt, @typed_password)));
SELECT @passwordHash;