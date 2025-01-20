###########################
#### Insert Procedure #####
###########################

DELIMITER //
CREATE PROCEDURE spInsertCliente(
    IN p_fkpersona_id INT
)
BEGIN
    -- Verificar si la persona ya está registrada como cliente
    IF NOT EXISTS (SELECT 1 FROM tbl_cliente WHERE tbl_persona_pers_id = p_fkpersona_id) THEN
        -- Si no está registrada, se inserta
        INSERT INTO tbl_cliente (tbl_persona_pers_id)
        VALUES (p_fkpersona_id);
    ELSE
        -- Si ya está registrada, se puede devolver un mensaje o código de error personalizado
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'La persona ya está registrada como cliente.';
    END IF;
END //
DELIMITER ;

###########################
#### Select Procedure #####
###########################

DELIMITER //
CREATE PROCEDURE spSelectCliente()
BEGIN
    SELECT 
		cli.cli_id AS ClienteID,
		per.pers_identificacion AS Identificacion,
        per.pers_nombre_razonsocial AS Nombre,
        per.pers_apellido AS Apellido,
        per.pers_telefono AS Telefono,
        per.pers_correo_electronico AS Email
    FROM tbl_cliente as cli
    INNER JOIN tbl_persona AS per ON cli.tbl_persona_pers_id = per.pers_id;
END //
DELIMITER ;

###########################
#### Update Procedure #####
###########################

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

###########################
#### Delete Procedure #####
###########################

DELIMITER //
CREATE PROCEDURE spDeleteCliente(
    IN p_cliente_id INT
)
BEGIN
    DELETE FROM tbl_cliente
    WHERE cliente_id = p_cliente_id;
END //
DELIMITER ;

###########################
#### Select Procedure DDL #
###########################

DELIMITER //
CREATE PROCEDURE spSelectClienteDDL()
BEGIN
    SELECT 
        cli.cli_id AS Id,
        CONCAT(per.pers_nombre_razonsocial, ' ', per.pers_apellido) AS NombreCompleto
    FROM tbl_cliente as cli
    INNER JOIN tbl_persona AS per ON cli.cli_id = per.pers_id;
END //
DELIMITER ;