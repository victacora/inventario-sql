DELIMITER //

CREATE PROCEDURE spDeleteCompraYDetalle(
    IN p_compra_id INT,
    IN p_fkproducto_id INT
)
BEGIN
    DECLARE p_cantidad_eliminada INT;

    -- Iniciar la transacción
    START TRANSACTION;

    -- Obtener la cantidad comprada del detalle de compra para ajustar el stock correctamente
    SELECT detc_cantidad_comprada INTO p_cantidad_eliminada
    FROM tbl_detalle_compraproducto
    WHERE tbl_compra_comp_id = p_compra_id
      AND tbl_producto_prod_id = p_fkproducto_id;

    -- Eliminar el detalle de compra en tbl_detalle_compraproducto
    DELETE FROM tbl_detalle_compraproducto
    WHERE tbl_compra_comp_id = p_compra_id
      AND tbl_producto_prod_id = p_fkproducto_id;

    -- Eliminar la compra en tbl_compra
    DELETE FROM tbl_compra
    WHERE compra_id = p_compra_id;

    -- Actualizar el stock del producto en tbl_producto
    -- Restar la cantidad eliminada del inventario
    UPDATE tbl_producto
    SET prod_cantidad_inventario = prod_cantidad_inventario - p_cantidad_eliminada
    WHERE prod_id = p_fkproducto_id;

    -- Confirmar la transacción
    COMMIT;

END //

DELIMITER ;