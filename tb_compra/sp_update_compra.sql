DELIMITER //

CREATE PROCEDURE spUpdateCompraYDetalle(
    IN p_compra_id INT,
    IN p_fecha_compra DATE,
    IN p_fkproducto_id INT,
    IN p_cantidad INT,
    IN p_precio_unitario DECIMAL(10,2),
    IN p_numero_factura VARCHAR(50)
)
BEGIN
    DECLARE p_total DECIMAL(10,2);
    DECLARE p_cantidad_anterior INT;

    -- Calcular el total multiplicando la cantidad por el precio unitario
    SET p_total = p_cantidad * p_precio_unitario;

    -- Iniciar la transacción
    START TRANSACTION;

    -- Obtener la cantidad anterior del detalle de compra para ajustar el stock correctamente
    SELECT detc_cantidad_comprada INTO p_cantidad_anterior
    FROM tbl_detalle_compraproducto
    WHERE tbl_compra_comp_id = p_compra_id
      AND tbl_producto_prod_id = p_fkproducto_id;

    -- Actualizar la tabla tbl_compra
    UPDATE tbl_compra
    SET comp_fecha_compra = p_fecha_compra, 
        comp_total = p_total
    WHERE compra_id = p_compra_id;

    -- Actualizar la tabla tbl_detalle_compraproducto
    UPDATE tbl_detalle_compraproducto
    SET detc_cantidad_comprada = p_cantidad, 
        detc_precio_unitario = p_precio_unitario,
        detc_numero_factura = p_numero_factura
    WHERE tbl_compra_comp_id = p_compra_id
      AND tbl_producto_prod_id = p_fkproducto_id;

    -- Actualizar el stock del producto en tbl_producto:
    -- Restar la cantidad anterior y agregar la nueva cantidad
    UPDATE tbl_producto
    SET prod_cantidad_inventario = prod_cantidad_inventario - p_cantidad_anterior + p_cantidad
    WHERE prod_id = p_fkproducto_id;

    -- Confirmar la transacción
    COMMIT;

END //

DELIMITER ;