DELIMITER //
CREATE PROCEDURE spGetAllUsers()
BEGIN
    SELECT 
        u.usu_usuario AS Usuario,
        u.usu_contrasena AS Contrasenia,
        u.usu_estado AS Estado,
        u.usu_fecha_creacion AS FechaCreacion,
        p.pers_nombre_razonsocial AS Nombre,
        p.pers_apellido AS Apellido,
        p.pers_identificacion AS Identificacion,
        p.pers_telefono AS Telefono,
        p.pers_correo_electronico AS Email,
        r.rol_nombre AS Rol
    FROM 
        tbl_usuario u
    INNER JOIN 
        tbl_empleado e ON u.tbl_empleado_emp_id = e.emp_id
    INNER JOIN 
        tbl_persona p ON e.tbl_persona_pers_id = p.pers_id
    INNER JOIN 
        tbl_rol r ON u.tbl_rol_rol_id = r.rol_id;
END//
DELIMITER ;