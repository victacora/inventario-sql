
DELIMITER //

CREATE PROCEDURE spDDL_mostrar_ventas()
BEGIN
    SELECT 
        v.vent_id AS id, 
        CONCAT(v.vent_Fecha, ' - ', v.vent_descripcion) AS descripcion
    FROM 
        tbl_venta v;
END //


CREATE PROCEDURE spDDL_mostrar_unidad_medida()
BEGIN
    SELECT und_id, und_descripcion FROM tbl_unidad_medida;
END

CREATE PROCEDURE spDDL_mostrar_presentacion()
BEGIN
    SELECT pres_id, pres_descripcion FROM tbl_presentacion;
END

DELIMITER //

CREATE PROCEDURE spDDL_mostrar_devoluciones()
BEGIN
    SELECT 
        d.dev_id AS id,
        CONCAT('Devolución: ', d.dev_fecha_devolucion, ' - Motivo: ', d.dev_motivo) AS descripcion
    FROM 
        tbl_devolucion d
    ORDER BY 
        d.dev_fecha_devolucion DESC;  -- Ordena por fecha de devolución, ajusta según sea necesario
END //



DELIMITER ;
