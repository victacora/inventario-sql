CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrar_ventas`()
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

END