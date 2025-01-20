DELIMITER //
CREATE PROCEDURE spSelectCompraYDetalle()
BEGIN
    SELECT 
        c.comp_id AS CompraID,
        c.comp_fecha_compra AS FechaCompra,
        c.comp_total AS TotalCompra,
        d.detc_numero_factura AS NumeroFactura,
        d.detc_cantidad_comprada AS CantidadComprada,
        d.detc_precio_unitario AS PrecioUnitario,
        p.prod_nombre AS NombreProducto
    FROM tbl_compra AS c
    INNER JOIN tbl_detalle_compraproducto AS d ON c.comp_id = d.tbl_compra_comp_id
    INNER JOIN tbl_producto AS p ON d.tbl_producto_prod_id = p.prod_id
    ORDER BY c.comp_id;
END //
DELIMITER ;
