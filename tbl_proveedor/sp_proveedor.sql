# Procedimiento Insertar Proveedor

DELIMITER //
CREATE PROCEDURE spInsertSupplier(
    IN p_fkpersona_id INT
)
BEGIN
    INSERT INTO tbl_proveedor (tbl_persona_pers_id)
    VALUES (p_fkpersona_id);
END //
DELIMITER ;

#Procedimiento mostrar proveedor

DELIMITER //
CREATE PROCEDURE spGetSupplier()
BEGIN
    SELECT 
		per.pers_identificacion AS Identificacion,
        per.pers_nombre_razonsocial AS Nombre,
        per.pers_apellido AS Apellido,
        per.pers_telefono AS Telefono,
        per.pers_correo_electronico AS Correo
    FROM tbl_proveedor as pro
    INNER JOIN tbl_persona AS per ON pro.prov_id = per.pers_id;
END //
DELIMITER ;

# Procedimiento Actualizar proveedor

DELIMITER //
CREATE PROCEDURE spUpdateSupplier(
    IN p_pro_id INT,
    IN p_persona_id INT
)
BEGIN
    UPDATE tbl_proveedor 
    SET tbl_persona_pers_id = p_persona_id
    WHERE prov_id = p_pro_id;
END //
DELIMITER ;

#Procedimiento eliminar proveedor

DELIMITER //
CREATE PROCEDURE spDeleteSupplier(
    IN p_pro_id INT
)
BEGIN
    DELETE FROM tbl_proveedor
    WHERE prov_id = p_pro_id;
END //
DELIMITER ;

#Procedimiento mostrar proveedor DDL

DELIMITER //
CREATE PROCEDURE spGetSupplierDDL()
BEGIN
    SELECT 
        pro.prov_id AS Id,
        CONCAT(per.pers_nombre_razonsocial, " ", per.pers_apellido) AS "Razon social"
    FROM tbl_proveedor as pro
    INNER JOIN tbl_persona AS per ON pro.prov_id = per.pers_id;
END //
DELIMITER ;