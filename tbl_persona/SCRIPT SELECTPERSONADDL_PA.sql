DELIMITER //
CREATE PROCEDURE spSelectPersonaDDL()
BEGIN
SELECT
	pers_id as Id,
	CONCAT(pers_nombre_razonsocial, ' ', pers_apellido) AS NombreCompleto
    FROM tbl_persona;
END //
DELIMITER ;