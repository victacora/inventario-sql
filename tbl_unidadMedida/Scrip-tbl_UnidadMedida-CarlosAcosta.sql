DELIMITER //

CREATE PROCEDURE sp_insertar_unidad_medida (
    IN p_und_descripcion VARCHAR(45)
)
BEGIN
    INSERT INTO tbl_unidad_medida (und_descripcion) 
    VALUES (p_und_descripcion);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_mostrar_unidad_medida()
BEGIN
    SELECT und_descripcion FROM tbl_unidad_medida;
END//

DELIMITER ;
DELIMITER //

CREATE PROCEDURE sp_actualizar_unidad_medida (
    IN p_und_id INT,
    IN p_und_descripcion VARCHAR(45)
)
BEGIN
    UPDATE tbl_unidad_medida
    SET und_descripcion = p_und_descripcion
    WHERE und_id = p_und_id;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_eliminar_unidad_medida (
    IN p_und_id INT
)
BEGIN
    DELETE FROM tbl_unidad_medida
    WHERE und_id = p_und_id;
END //

DELIMITER ;
