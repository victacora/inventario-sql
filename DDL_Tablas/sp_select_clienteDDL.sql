DELIMITER //
CREATE PROCEDURE spSelectClienteDDL()
BEGIN
    SELECT 
        cli.cli_id AS Id,
        CONCAT(per.pers_identificacion,' - ', per.pers_nombre_razonsocial, ' ', per.pers_apellido) AS NombreCompleto
    FROM tbl_cliente as cli
    INNER JOIN tbl_persona AS per ON cli.tbl_persona_pers_id = per.pers_id;
END //
DELIMITER ;