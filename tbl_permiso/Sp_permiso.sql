-- Insertar un permiso
DELIMITER //
CREATE PROCEDURE spInsertPermit(IN p_perm_Nombre VARCHAR(45), IN p_perm_Descripcion VARCHAR(255))
BEGIN
    INSERT INTO tbl_permiso (perm_nombre, perm_descripcion)
    VALUES (p_perm_Nombre, p_perm_Descripcion);
END//
DELIMITER ;

-- Actualizar un tipo de documento
DELIMITER //
CREATE PROCEDURE spUpdatePermit(IN p_permId INT, IN p_permNombre VARCHAR(45), IN p_permDescripcion VARCHAR(255))
BEGIN
    UPDATE tbl_permiso
    SET perm_nombre = p_permNombre, 
        perm_descripcion = p_permDescripcion
    WHERE perm_id = p_permId;
END//
DELIMITER ;

-- Mostrar todos los tipos de documentos
DELIMITER //
CREATE PROCEDURE spGetAllPermits()
BEGIN
    SELECT * FROM tbl_permiso;
END//
DELIMITER ;

-- Elimiar un tipo de documento
DELIMITER //
CREATE PROCEDURE spDeletePermit(IN p_permId INT)
BEGIN
    DELETE FROM tbl_permiso
    WHERE perm_id = p_permId;
END//
DELIMITER ;