-- Insertar un rol
DELIMITER //
CREATE PROCEDURE spInsertRole(
    IN p_role_name VARCHAR(45),
    IN p_role_description VARCHAR(80))
BEGIN
    INSERT INTO tbl_rol (rol_nombre, rol_descripcion)
    VALUES (p_role_name, p_role_description);
END//
DELIMITER ;

-- Actualizar un rol
DELIMITER //
CREATE PROCEDURE spUpdateRole(
    IN p_role_id INT,
    IN p_role_name VARCHAR(45),
    IN p_role_description VARCHAR(80))
BEGIN
    UPDATE tbl_rol
    SET 
        rol_nombre = p_role_name,
        rol_descripcion = p_role_description
    WHERE rol_id = p_role_id;
END//
DELIMITER ;

-- Mostrar todos los roles
DELIMITER //
CREATE PROCEDURE spGetAllRoles()
BEGIN
    SELECT * FROM tbl_rol;
END//
DELIMITER ;

-- Eliminar un rol
DELIMITER //
CREATE PROCEDURE spDeleteRol(IN p_role_id INT)
BEGIN
    DELETE FROM tbl_rol
    WHERE rol_id = p_role_id;
END//
DELIMITER ;


