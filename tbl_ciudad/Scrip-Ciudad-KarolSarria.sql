DELIMITER //
CREATE PROCEDURE spInsertCiudad (
    IN p_codigo VARCHAR(45),
    IN p_nombre VARCHAR(80),
    IN p_dep_id INT
)
BEGIN
    INSERT INTO tbl_ciudad (ciu_codigo, ciu_nombre, tbl_departamento_dep_id)
    VALUES (p_codigo, p_nombre, p_dep_id);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE spSelectCiudad ()
BEGIN
    SELECT
	ciu.ciu_id as id,
	ciu.ciu_codigo as codigo,
	ciu.ciu_nombre as ciudad,
	dep.dep_nombre as departamento
	FROM tbl_ciudad as ciu
    INNER JOIN tbl_departamento as dep ON ciu.tbl_departamento_dep_id=dep.dep_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE spUpdateCiudad (
    IN p_id INT,
    IN p_codigo VARCHAR(45),
    IN p_nombre VARCHAR(80),
    IN p_dep_id INT
)
BEGIN
    UPDATE tbl_ciudad
    SET ciu_codigo = p_codigo,
        ciu_nombre = p_nombre,
        tbl_departamento_dep_id = p_dep_id
    WHERE ciu_id = p_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE spDeleteCiudad (
    IN p_id INT
)
BEGIN
    DELETE FROM tbl_ciudad WHERE ciu_id = p_id;
END //
DELIMITER ;
