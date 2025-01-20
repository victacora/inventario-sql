DELIMITER //
CREATE PROCEDURE spPermitDDL()
BEGIN
    SELECT perm_id AS Id, perm_nombre AS Permiso FROM tbl_permiso;
END//
DELIMITER ;