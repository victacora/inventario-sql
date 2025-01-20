DELIMITER //
CREATE PROCEDURE spCheckPersonRegisteredAsClient(IN p_fkpersona_id INT)
BEGIN
    SELECT COUNT(*) > 0 INTO @exists
    FROM tbl_cliente
    WHERE fk_persona = p_fkpersona_id;

    SELECT @exists;
END //
DELIMITER ;
