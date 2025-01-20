DELIMITER //
CREATE PROCEDURE spDeleteCliente(
    IN p_cliente_id INT
)
BEGIN
    DELETE FROM tbl_cliente
    WHERE cliente_id = p_cliente_id;
END //
DELIMITER ;
