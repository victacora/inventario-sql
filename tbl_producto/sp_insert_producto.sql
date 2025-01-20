DELIMITER //
create procedure spInsertProduct(
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
    IN p_fkpresentacion INT)
BEGIN
	INSERT INTO tbl_producto(
		prod_cod_producto, prod_nombre, prod_descripcion, prod_cantidad_inventario,
		prod_numerolote, prod_fecha_vencimiento, prod_precio_venta, prod_precio_compra, prod_medida,
		tbl_categoria_cat_id, tbl_proveedor_prov_id, tbl_unidad_medida_und_id, tbl_presentacion_pres_id
	)values(
		p_cod_producto,p_nombre,p_descripcion,p_cantidad_inventario,p_numerolote, p_fecha_vencimiento,
		p_precio_venta, p_precio_compra, p_medida, p_fkcategoria, p_fkproveedor, p_fkunidadmedida, p_fkpresentacion
    );
END//
DELIMITER ;