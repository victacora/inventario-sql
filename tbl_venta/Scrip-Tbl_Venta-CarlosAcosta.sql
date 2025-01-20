DELIMITER $$

CREATE PROCEDURE sp_insertar_venta(
    IN p_vent_fecha DATE,
    IN p_vent_total DECIMAL(10,0),
    IN p_vent_descripcion TEXT,
    IN p_cli_id INT,
    IN p_emp_id INT
)
BEGIN
    INSERT INTO tbl_venta (vent_fecha, vent_total, vent_descripcion, tbl_cliente_cli_id, tbl_empleado_emp_id)
    VALUES (p_vent_fecha, p_vent_total, p_vent_descripcion, p_cli_id, p_emp_id);
END $$

DELIMITER ;tbl_cliente

DELIMITER $$

CREATE  PROCEDURE sp_mostrar_ventas()
BEGIN
   SELECT 
    v.vent_id AS referencia,  
    v.vent_Fecha AS fecha,
    v.vent_total AS total,
    v.vent_descripcion AS descripcion,
    p_e.pers_nombre_razonsocial AS nombre_empleado, 
    p_e.pers_apellido AS apellido_empleado, 
    p_c.pers_identificacion AS identificacion_cliente,
    p_c.pers_nombre_razonsocial AS nombre_cliente, 
    p_c.pers_apellido AS apellido_cliente
FROM 
    tbl_venta v
LEFT JOIN 
    tbl_empleado e ON v.tbl_empleado_emp_id = e.emp_id
LEFT JOIN 
    tbl_persona p_e ON e.tbl_persona_pers_id = p_e.pers_id
LEFT JOIN 
    tbl_cliente c ON v.tbl_cliente_cli_id = c.cli_id
LEFT JOIN 
    tbl_persona p_c ON c.tbl_persona_pers_id = p_c.pers_id;

END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_eliminar_venta(
    IN p_vent_id INT
)
BEGIN
    DELETE FROM tbl_venta WHERE vent_id = p_vent_id;
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE sp_actualizar_venta(
    IN p_vent_id INT,
    IN p_vent_fecha DATE,
    IN p_vent_total DECIMAL(10,0),
    IN p_vent_descripcion TEXT,
    IN p_cli_id INT,
    IN p_emp_id INT
)
BEGIN
    UPDATE tbl_venta
    SET vent_fecha = p_vent_fecha,
        vent_total = p_vent_total,
        vent_descripcion = p_vent_descripcion,
        tbl_cliente_cli_id = p_cli_id,
        tbl_empleado_emp_id = p_emp_id
    WHERE vent_id = p_vent_id;
END $$

DELIMITER ;

