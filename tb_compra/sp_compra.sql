######################
## Insert Compra #####
######################

DELIMITER //

CREATE PROCEDURE spInsertarCompraYDetalle(
    IN p_fecha_compra DATE,
    IN p_fkproducto_id INT,
    IN p_cantidad INT,
    IN p_precio_unitario DECIMAL(10,2),
    IN p_numero_factura VARCHAR(50)
)
BEGIN
    DECLARE p_compra_id INT;
    DECLARE p_total DECIMAL(10,2);

    -- Calcular el total multiplicando la cantidad por el precio unitario
    SET p_total = p_cantidad * p_precio_unitario;

    -- Iniciar la transacción
    START TRANSACTION;

    -- Insertar en tbl_compra
    INSERT INTO tbl_compra (comp_fecha_compra, comp_total)
    VALUES (p_fecha_compra, p_total);

    -- Obtener el último ID insertado en tbl_compra
    SET p_compra_id = LAST_INSERT_ID();

    -- Insertar en tbl_detalle_compraproducto
    INSERT INTO tbl_detalle_compraproducto (
        tbl_compra_comp_id, 
        tbl_producto_prod_id, 
        detc_cantidad_comprada, 
        detc_precio_unitario, 
        detc_numero_factura
    )
    VALUES (
        p_compra_id, 
        p_fkproducto_id, 
        p_cantidad, 
        p_precio_unitario, 
        p_numero_factura
    );

    -- Actualizar el stock del producto en tbl_producto
    UPDATE tbl_producto
    SET prod_cantidad_inventario = prod_cantidad_inventario + p_cantidad
    WHERE prod_id = p_fkproducto_id;

    -- Confirmar la transacción
    COMMIT;

END //

DELIMITER ;

######################
## Select Compra #####
######################

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

######################
## Update Compra #####
######################

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


######################
## Delete Compra #####
######################

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
