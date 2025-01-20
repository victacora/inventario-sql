DELIMITER //

CREATE PROCEDURE sp_insertar_presentacion (
    IN p_pres_descripcion VARCHAR(45)
)
BEGIN
    INSERT INTO tbl_presentacion (pres_descripcion) 
    VALUES (p_pres_descripcion);
END //

DELIMITER ;
DELIMITER //

CREATE PROCEDURE sp_mostrar_presentacion ()
BEGIN
    SELECT pres_descripcion FROM tbl_presentacion;
END //

DELIMITER ;
DELIMITER //

CREATE PROCEDURE sp_actualizar_presentacion (
    IN p_pres_id INT,
    IN p_pres_descripcion VARCHAR(45)
)
BEGIN
    UPDATE tbl_presentacion
    SET pres_descripcion = p_pres_descripcion
    WHERE pres_id = p_pres_id;
END //

DELIMITER ;
DELIMITER //

CREATE PROCEDURE sp_eliminar_presentacion (
    IN p_pres_id INT
)
BEGIN
    DELETE FROM tbl_presentacion
    WHERE pres_id = p_pres_id;
END //

DELIMITER ;
