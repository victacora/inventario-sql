DELIMITER $$

CREATE PROCEDURE sp_insertar_devolucion(
    IN p_dev_fecha_devolucion DATE,
    IN p_dev_motivo TEXT,
    IN p_vent_id INT
)
BEGIN
    INSERT INTO tbl_devolucion (dev_fecha_devolucion, dev_motivo, tbl_venta_vent_id)
    VALUES (p_dev_fecha_devolucion, p_dev_motivo, p_vent_id);
END $$

DELIMITER ;
DELIMITER $$

CREATE PROCEDURE sp_mostrar_devoluciones()
BEGIN
    SELECT 
        d.dev_fecha_devolucion, 
        d.dev_motivo, 
        v.vent_id, 
        v.vent_fecha, 
        v.vent_total, 
        v.vent_descripcion,
        p_e.pers_identificacion AS identificacion_empleado,
        p_e.pers_nombre_razonsocial AS nombre_empleado, 
        p_c.pers_identificacion AS identificacion_cliente,
        p_c.pers_nombre_razonsocial AS nombre_cliente, 
        p_c.pers_apellido AS apellido_cliente
    FROM 
        tbl_devolucion d
    LEFT JOIN 
        tbl_venta v ON d.tbl_venta_vent_id = v.vent_id
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

CREATE PROCEDURE sp_eliminar_devolucion(
    IN p_dev_id INT
)
BEGIN
    DELETE FROM tbl_devolucion WHERE dev_id = p_dev_id;
END $$

DELIMITER ;
DELIMITER $$

CREATE PROCEDURE sp_actualizar_devolucion(
    IN p_dev_id INT,
    IN p_dev_fecha_devolucion DATE,
    IN p_dev_motivo TEXT,
    IN p_vent_id INT
)
BEGIN
    UPDATE tbl_devolucion
    SET dev_fecha_devolucion = p_dev_fecha_devolucion,
        dev_motivo = p_dev_motivo,
        tbl_venta_vent_id = p_vent_id
    WHERE dev_id = p_dev_id;
END $$

DELIMITER ;
