DELIMITER //
CREATE PROCEDURE spUpdateProducto(
    IN p_prod_id INT, 
    IN p_cod_producto VARCHAR(45),
    IN p_nombre VARCHAR(45),
    IN p_descripcion VARCHAR(80), 
    IN p_cantidad_inventario INT, 
    IN p_numerolote VARCHAR(15), 
    IN p_fecha_vencimiento DATE,
    IN p_precio_venta DECIMAL,
    IN p_precio_compra DECIMAL,
    IN p_medida INT,
    IN p_fkcategoria INT,
    IN p_fkproveedor INT,
    IN p_fkunidadmedida INT,
    IN p_fkpresentacion INT
)
BEGIN
    UPDATE tbl_producto
    SET 
        prod_cod_producto = p_cod_producto,
        prod_nombre = p_nombre,
        prod_descripcion = p_descripcion,
        prod_cantidad_inventario = p_cantidad_inventario,
        prod_numerolote = p_numerolote,
        prod_fecha_vencimiento = p_fecha_vencimiento,
        prod_precio_venta = p_precio_venta,
        prod_precio_compra = p_precio_compra,
        prod_medida = p_medida,
        tbl_categoria_cat_id = p_fkcategoria,
        tbl_proveedor_prov_id = p_fkproveedor,
        tbl_unidad_medida_und_id = p_fkunidadmedida,
        tbl_presentacion_pres_id = p_fkpresentacion
    WHERE 
        prod_id = p_prod_id;
END //
DELIMITER ;