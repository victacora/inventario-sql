###########################
#### Insert Procedure #####
###########################

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

###########################
#### Select Procedure #####
###########################

DELIMITER //
CREATE PROCEDURE spSelectProductos()
BEGIN
    SELECT 
        prod_id,                                     
        prod_cod_producto AS Codigo,                 
        prod_nombre AS Nombre,                       
        prod_descripcion AS Descripcion,             
        prod_cantidad_inventario AS Cantidad,        
        prod_numerolote AS NumeroLote,               
        prod_fecha_vencimiento AS FechaVencimiento,  
        prod_precio_venta AS PrecioVenta,            
        prod_precio_compra AS PrecioCompra,          
        prod_medida AS Medida,                                              
        cat.cat_descripcion AS Categoria,                    
        pers.pers_nombre_razonsocial AS NombreProveedor,
        pers.pers_apellido AS ApellidoProveedor,
        und.und_descripcion AS UnidadMedida,
        present.pres_descripcion AS Presentacion
    FROM tbl_producto AS prod
    INNER JOIN tbl_categoria AS cat
        ON prod.tbl_categoria_cat_id = cat.cat_id
    INNER JOIN tbl_proveedor AS prov
        ON prod.tbl_proveedor_prov_id = prov.prov_id
	INNER JOIN tbl_persona AS pers
		ON prov.tbl_persona_pers_id = pers.pers_id
	INNER JOIN tbl_unidad_medida AS und
		ON prod.tbl_unidad_medida_und_id = und.und_id
	INNER JOIN tbl_presentacion AS present
		ON prod.tbl_presentacion_pres_id = present.pres_id;
END //
DELIMITER ;

###########################
#### Update Procedure #####
###########################

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

###########################
#### Delete Procedure #####
###########################

DELIMITER //
CREATE PROCEDURE spDeleteProduct(IN p_product_id INT)
BEGIN
    DELETE FROM tbl_producto
    WHERE prod_id = p_product_id;
END //
DELIMITER ;