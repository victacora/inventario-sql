DELIMITER //
CREATE PROCEDURE spRoleDDL()
BEGIN
    SELECT rol_id AS Id, rol_nombre AS Rol FROM tbl_rol;
END//
DELIMITER ;