###########################
#### Insert Procedure #####
###########################

DELIMITER //
CREATE PROCEDURE spInsertEmployee(
    IN p_fkpersona_id INT
)
BEGIN
    -- Verificar si la persona ya está registrada como empleado
    IF NOT EXISTS (SELECT 1 FROM tbl_empleado WHERE tbl_persona_pers_id = p_fkpersona_id) THEN
        -- Si no está registrada, se inserta
        INSERT INTO tbl_empleado (tbl_persona_pers_id)
        VALUES (p_fkpersona_id);
    ELSE
        -- Si ya está registrada, se puede devolver un mensaje o código de error personalizado
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'La persona ya está registrada como empleado.';
    END IF;
END //
DELIMITER ;

###########################
#### Select Procedure #####
###########################

DELIMITER //
CREATE PROCEDURE spGetEmployee()
BEGIN
    SELECT 
        emp.emp_id AS EmpleadoID,
        per.pers_identificacion AS Identificacion,
        per.pers_nombre_razonsocial AS Nombre,
        per.pers_apellido AS Apellido,
        per.pers_telefono AS Telefono,
        per.pers_correo_electronico AS Correo
    FROM tbl_empleado AS emp
    INNER JOIN tbl_persona AS per ON emp.tbl_persona_pers_id = per.pers_id;
END //
DELIMITER ;

###########################
#### Update Procedure #####
###########################

DELIMITER //
CREATE PROCEDURE spUpdateEmployee(
    IN p_emp_id INT,
    IN p_persona_id INT
)
BEGIN
    UPDATE tbl_empleado 
    SET tbl_persona_pers_id = p_persona_id
    WHERE emp_id = p_emp_id;
END //
DELIMITER ;

###########################
#### Delete Procedure #####
###########################

DELIMITER //
CREATE PROCEDURE spDeleteEmployee(
    IN p_emp_id INT
)
BEGIN
    DELETE FROM tbl_empleado
    WHERE emp_id = p_emp_id;
END //
DELIMITER ;

###########################
#### Select Procedure DDL #
###########################

DELIMITER //
CREATE PROCEDURE spGetEmployeeDDL()
BEGIN
    SELECT 
        emp.emp_id AS Id,
        CONCAT(per.pers_nombre_razonsocial, ' ', per.pers_apellido) AS NombreCompleto
    FROM tbl_empleado AS emp
    INNER JOIN tbl_persona AS per ON emp.tbl_persona_pers_id = per.pers_id;
END //
DELIMITER ;
