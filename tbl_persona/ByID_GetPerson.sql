DELIMITER //
CREATE PROCEDURE spSelectPersonaById(IN p_persona_id INT)
BEGIN
    SELECT per.pers_identificacion AS Identificacion, 
    per.pers_nombre_razonsocial AS Nombre, 
    per.pers_apellido AS Apellido, 
    per.pers_telefono AS Telefono, 
    per.pers_correo_electronico AS Email
    FROM tbl_persona per
    WHERE per.pers_id = p_persona_id;
END //
DELIMITER ;
