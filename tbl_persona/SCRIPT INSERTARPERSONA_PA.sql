DELIMITER //

CREATE PROCEDURE spInsertPersona(
    IN p_documento VARCHAR(45),
    IN p_nombres VARCHAR(45),
    IN p_apellidos VARCHAR(45),
    IN p_direccion VARCHAR(100),
    IN p_telefono VARCHAR(20),
    IN p_email VARCHAR(45),
    IN p_tipo_documento_id INT,
    IN p_pais_id INT,
    IN p_departamento_id INT,
    IN p_ciudad_id INT
)
BEGIN
    -- Validar que el país, departamento y ciudad existen
    IF NOT EXISTS (SELECT 1 FROM tbl_pais WHERE pais_id = p_pais_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El país seleccionado no existe';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM tbl_departamento WHERE dep_id = p_departamento_id AND tbl_pais_pais_id = p_pais_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El departamento seleccionado no existe para el país especificado';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM tbl_ciudad WHERE ciu_id = p_ciudad_id AND tbl_departamento_dep_id = p_departamento_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La ciudad seleccionada no existe para el departamento especificado';
    END IF;

    -- Insertar los datos de la persona
    INSERT INTO tbl_persona (
        pers_identificacion, pers_nombre_razonsocial, pers_apellido, 
		pers_telefono, pers_direccion, pers_correo_electronico, tbl_tipo_documento_doc_id, tbl_ciudad_ciu_id
    ) 
    VALUES (
        p_documento, p_nombres, p_apellidos, 
        p_telefono, p_direccion, p_email, p_tipo_documento_id, p_ciudad_id
    );
END//
DELIMITER ;