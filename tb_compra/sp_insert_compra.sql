DELIMITER //
CREATE PROCEDURE spInsertarCompraYDetalle(
    IN p_fecha_compra DATE,
    IN p_total DECIMAL,
    IN p_fkproducto_id INT,
    IN p_numero_factura VARCHAR(50),
    IN p_cantidad INT,
    IN p_precio_unitario DECIMAL
)
BEGIN
    DECLARE p_compra_id INT;

    -- Insertar en tbl_compra
    INSERT INTO tbl_compra (comp_fecha_compra, comp_total)
    VALUES (p_fecha_compra, p_total);

    -- Obtener el último ID insertado en tbl_compra
    SET p_compra_id = LAST_INSERT_ID();

    -- Insertar en tbl_detalle_compraproducto
    INSERT INTO tbl_detalle_compraproducto (tbl_producto_prod_id, tbl_compra_comp_id, detc_numero_factura, detc_cantidad_comprada, detc_precio_unitario)
    VALUES (p_fkproducto_id, p_compra_id, p_numero_factura, p_cantidad, p_precio_unitario);
END //
DELIMITER ;