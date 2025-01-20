DELIMITER //
CREATE PROCEDURE spInsertCliente(
    IN p_fkpersona_id INT
)
BEGIN
    INSERT INTO tbl_cliente (tbl_persona_pers_id)
    VALUES (p_fkpersona_id);
END //
DELIMITER ;