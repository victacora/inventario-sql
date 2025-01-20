DELIMITER //
CREATE PROCEDURE spCreatePais (
    IN p_codigo VARCHAR(45),
    IN p_nombre VARCHAR(45)
)
BEGIN
    INSERT INTO tbl_pais (pais_codigo, pais_nombre)
    VALUES (p_codigo, p_nombre);
END //

DELIMITER ;

DELIMITER //
CREATE PROCEDURE spSelectPais ()
BEGIN
    SELECT 
	pais_id as id,
	pais_codigo as codigo,
	pais_nombre as pais
	FROM tbl_pais WHERE pais_id = p_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE spUpdatepais (
    IN p_id INT,
    IN p_codigo VARCHAR(45),
    IN p_nombre VARCHAR(45)
)
BEGIN
    UPDATE tbl_pais
    SET pais_codigo = p_codigo,
        pais_nombre = p_nombre
    WHERE pais_id = p_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE spDeletepais (
    IN p_id INT
)
BEGIN
    DELETE FROM tbl_pais WHERE pais_id = p_id;
END //
DELIMITER ;