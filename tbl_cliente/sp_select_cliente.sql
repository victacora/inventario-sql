DELIMITER //
CREATE PROCEDURE spSelectCliente()
BEGIN
    SELECT 
		per.pers_identificacion AS Identificacion,
        per.pers_nombre_razonsocial AS Nombre,
        per.pers_apellido AS Apellido,
        per.pers_telefono AS Telefono,
        per.pers_correo_electronico AS Email
    FROM tbl_cliente as cli
    INNER JOIN tbl_persona AS per ON cli.cli_id = per.pers_id;
END //
DELIMITER ;