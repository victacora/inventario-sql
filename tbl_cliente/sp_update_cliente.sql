DELIMITER //
CREATE PROCEDURE spUpdateCliente(
    IN p_cliente_id INT,
    IN p_fkpersona_id INT
)
BEGIN
    UPDATE tbl_cliente
    SET tbl_persona_pers_id = p_fkpersona_id
    WHERE cliente_id = p_cliente_id;
END //
DELIMITER ;
