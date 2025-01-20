CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrar_devoluciones`()
BEGIN
    SELECT 
        d.dev_id, 
        d.dev_fecha_devolucion, 
        d.dev_motivo, 
        v.vent_id, 
        v.vent_fecha, 
        v.vent_total, 
        v.vent_descripcion,
        -- Información del empleado (quien procesó la venta)
        p_e.pers_identificacion AS identificacion_empleado,  
        p_e.pers_nombre_razonsocial AS nombre_empleado, 
        -- Información del cliente (quien realizó la compra)
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
        tbl_persona p_e ON e.tbl_persona_pers_id = p_e.pers_id  -- Empleado
    LEFT JOIN 
        tbl_cliente c ON v.tbl_cliente_cli_id = c.cli_id
    LEFT JOIN 
        tbl_persona p_c ON c.tbl_persona_pers_id = p_c.pers_id  -- Cliente
    ;
END