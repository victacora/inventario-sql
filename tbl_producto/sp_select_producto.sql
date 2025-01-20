CREATE DEFINER=`root`@`localhost` PROCEDURE `spSelectProductos`()
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
END