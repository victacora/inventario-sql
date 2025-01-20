# Procedimiento Insertar inventario

DELIMITER //
CREATE PROCEDURE spInsertInventario(
    IN p_prod_id INT,
    IN p_inv_cantidad INT,
    IN p_inv_fecha DATE,
    IN p_inv_observacion TEXT,
    IN p_emp_id INT
)
BEGIN
    -- Verificar si el producto existe
    IF EXISTS (SELECT 1 FROM tbl_producto WHERE prod_id = p_prod_id) THEN
        -- Actualizar la cantidad en inventario del producto
        UPDATE tbl_producto
        SET prod_cantidad_inventario = p_inv_cantidad
        WHERE prod_id = p_prod_id;

        -- Insertar el registro en tbl_inventario
        INSERT INTO tbl_inventario (
            inv_cantidad, 
            inv_fecha_realizacion, 
            inv_observacion, 
            tbl_producto_prod_id, 
            tbl_empleado_emp_id
        )
        VALUES (
            p_inv_cantidad, 
            p_inv_fecha, 
            p_inv_observacion, 
            p_prod_id, 
            p_emp_id
        );
    ELSE
        -- Si el producto no existe, lanzar un mensaje de error
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El producto especificado no existe.';
    END IF;
END//
DELIMITER ;


#Procedimiento mostrar inventario

DELIMITER //
CREATE PROCEDURE spSelectInventario()
BEGIN
    SELECT 
		inv.inv_id AS Id,
		inv.inv_cantidad AS "Cantidad Nueva",
        inv.inv_fecha_realizacion AS FechaInventario,
        inv.inv_observacion AS Observacion,
        pro.prod_id AS fkproducto,
        pro.prod_cod_producto AS CodigoProducto,
        pro.prod_nombre AS Producto,
        pro.prod_descripcion AS Descripcion,
        pro.prod_cantidad_inventario AS "Cantidad actual inventario",
        pro.prod_medida AS Medida,
        und.und_id AS fkunidadmedida,
        und.und_descripcion AS UnidadMedida,
        per.pers_id AS fkpersona,
        CONCAT(per.pers_identificacion," - ",per.pers_nombre_razonsocial, " ", per.pers_apellido) AS NombreEmpleado
    FROM tbl_inventario as inv
	INNER JOIN tbl_producto AS pro ON inv.tbl_producto_prod_id = pro.prod_id
	INNER JOIN tbl_persona AS per ON inv.tbl_empleado_emp_id = per.pers_id
    INNER JOIN tbl_unidad_medida AS und ON pro.tbl_unidad_medida_und_id = und.und_id;
END //
DELIMITER ;

# Procedimiento Actualizar inventario

DELIMITER //
CREATE PROCEDURE spUpdateInventario(
    IN p_inv_id INT,
    IN p_prod_id INT,
    IN p_nueva_cantidad INT,
    IN p_inv_fecha DATE,
    IN p_inv_observacion TEXT,
    IN p_emp_id INT
)
BEGIN
    -- Verificar si el registro en tbl_inventario existe
    IF EXISTS (SELECT 1 FROM tbl_inventario WHERE inv_id = p_inv_id) THEN
        -- Actualizar la cantidad en el producto
        UPDATE tbl_producto
        SET prod_cantidad_inventario = p_nueva_cantidad
        WHERE prod_id = p_prod_id;

        -- Actualizar los detalles en tbl_inventario
        UPDATE tbl_inventario
        SET inv_cantidad = p_nueva_cantidad,
            inv_fecha_realizacion = p_inv_fecha,
            inv_observacion = p_inv_observacion,
            tbl_producto_prod_id = p_prod_id,
            tbl_empleado_emp_id = p_emp_id
        WHERE inv_id = p_inv_id;
    ELSE
        -- Si no existe el registro de inventario, lanzar un error
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El registro de inventario especificado no existe.';
    END IF;
END//

DELIMITER ;


#Procedimiento eliminar inventario

DELIMITER //
CREATE PROCEDURE spDeleteInventario(
    IN p_inv_id INT,
    IN p_prod_id INT
)
BEGIN
    -- Verificar si el registro existe en tbl_inventario
    IF EXISTS (SELECT 1 FROM tbl_inventario WHERE inv_id = p_inv_id) THEN
        -- Ajustar la cantidad del producto a 0, ya que eliminamos el registro
        UPDATE tbl_producto
        SET prod_cantidad_inventario = 0
        WHERE prod_id = p_prod_id;

        -- Eliminar el registro de inventario
        DELETE FROM tbl_inventario
        WHERE inv_id = p_inv_id;
    ELSE
        -- Si no existe el registro de inventario, lanzar un error
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El registro de inventario especificado no existe.';
    END IF;
END//
DELIMITER ;


#Procedimiento mostrar inventario DDL

DELIMITER //
CREATE PROCEDURE spGetInventoryDDL()
BEGIN
    SELECT 
		inv.inv_id AS Id,
        concat(inv.inv_fecha_realizacion, " - ",per.pers_nombre_razonsocial, " ", per.pers_apellido) AS Inventario
    FROM tbl_inventario as inv
	INNER JOIN tbl_producto AS pro ON inv.tbl_producto_prod_id = pro.prod_id
	INNER JOIN tbl_persona AS per ON inv.tbl_empleado_emp_id = per.pers_id;
END //
DELIMITER ;