DELIMITER //
CREATE PROCEDURE spInsertDepartamento (
    IN p_codigo VARCHAR(45),
    IN p_nombre VARCHAR(80),
    IN p_fkpais_id INT
)
BEGIN
    INSERT INTO tbl_departamento (dep_codigo, dep_nombre, tbl_pais_pais_id)
    VALUES (p_codigo, p_nombre, p_fkpais_id);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE spSelectDepartamento ()
BEGIN
    SELECT
	dep.dep_id as id,
	dep.dep_codigo as codigo,
	dep.dep_nombre as departamento,
	pai.pais_nombre as pais
	FROM tbl_departamento as dep
    INNER JOIN tbl_pais as pai ON dep.tbl_pais_pais_id=pai.pais_id;
END //
DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_actualizar_departamento (
    IN p_id INT,
    IN p_codigo VARCHAR(45),
    IN p_nombre VARCHAR(80),
    IN p_pais_id INT
)
BEGIN
    UPDATE tbl_departamento
    SET dep_codigo = p_codigo,
        dep_nombre = p_nombre,
        tbl_pais_pais_id = p_pais_id
    WHERE dep_id = p_id;
END //

DELIMITER ;
DELIMITER //

CREATE PROCEDURE sp_eliminar_departamento (
    IN p_id INT
)
BEGIN
    DELETE FROM tbl_departamento WHERE dep_id = p_id;
END //

DELIMITER ;
