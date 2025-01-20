-- Insertar datos en la tabla tbl_categoria
INSERT INTO naturales_db.tbl_categoria (cat_descripcion) 
VALUES 
('Suplementos'), 
('Vitaminas'), 
('Minerales');

-- Insertar datos en la tabla tbl_compra
INSERT INTO naturales_db.tbl_compra (comp_fecha_compra, comp_total) 
VALUES 
('2024-01-10', 150000), 
('2024-02-05', 200000), 
('2024-03-20', 175000);

-- Insertar datos en la tabla tbl_rol
INSERT INTO naturales_db.tbl_rol (rol_nombre, rol_descripcion) 
VALUES 
('Administrador', 'Rol con acceso completo al sistema'), 
('Empleado', 'Rol con acceso limitado a la gestión de productos'), 
('Cliente', 'Rol con acceso solo a la compra de productos');


-- Insertar datos en la tabla tbl_permiso
INSERT INTO naturales_db.tbl_permiso (perm_nombre, perm_descripcion) 
VALUES 
('Gestión de Usuarios', 'Permiso para gestionar usuarios'), 
('Gestión de Productos', 'Permiso para gestionar productos'), 
('Gestión de Ventas', 'Permiso para gestionar ventas');

-- Insertar datos en la tabla tbl_pais
INSERT INTO naturales_db.tbl_pais (pais_codigo, pais_nombre) 
VALUES 
('COL', 'Colombia'), 
('USA', 'Estados Unidos'), 
('MEX', 'México');

-- Insertar datos en la tabla tbl_departamento
INSERT INTO naturales_db.tbl_departamento (dep_codigo, dep_nombre, tbl_pais_pais_id) 
VALUES 
('001', 'Cauca', 1), 
('002', 'Cundinamarca', 1), 
('003', 'Antioquia', 1);

-- Insertar datos en la tabla tbl_ciudad
INSERT INTO naturales_db.tbl_ciudad (ciu_codigo, ciu_nombre, tbl_departamento_dep_id) 
VALUES 
('001', 'Popayán', 1), 
('002', 'Bogotá', 2), 
('003', 'Medellín', 3);

-- Insertar datos en la tabla tbl_tipo_documento
INSERT INTO naturales_db.tbl_tipo_documento (doc_tipo_documento) 
VALUES 
('Cédula'), 
('Pasaporte'), 
('NIT');

-- Insertar datos en la tabla tbl_persona
INSERT INTO naturales_db.tbl_persona (pers_identificacion, pers_nombre_razonsocial, pers_apellido, pers_telefono, pers_direccion, pers_correo_electronico, tbl_tipo_documento_doc_id, tbl_ciudad_ciu_id) 
VALUES 
('123456789', 'Juan Pérez', 'Gómez', '3156782345', 'Calle 123', 'juan.perez@mail.com', 1, '001'), 
('987654321', 'María López', 'Martínez', '3123456789', 'Carrera 45', 'maria.lopez@mail.com', 2, '002'), 
('111222333', 'Carlos Fernández', 'Rodríguez', '3176543210', 'Avenida 67', 'carlos.fernandez@mail.com', 3, '003');

-- Insertar datos en la tabla tbl_proveedor
INSERT INTO naturales_db.tbl_proveedor (tbl_persona_pers_id) 
VALUES 
(1), 
(2), 
(3);

-- Insertar datos en la tabla tbl_cliente
INSERT INTO naturales_db.tbl_cliente (tbl_persona_pers_id) 
VALUES 
(1), 
(2), 
(3);

-- Insertar datos en la tabla tbl_empleado
INSERT INTO naturales_db.tbl_empleado (tbl_persona_pers_id) 
VALUES 
(1), 
(2), 
(3);

-- Insertar datos en la tabla tbl_rolpermiso
INSERT INTO naturales_db.tbl_rolpermiso (tbl_rol_rol_id, tbl_permiso_perm_id) 
VALUES 
(1, 1), 
(2, 2), 
(3, 3);

-- Insertar datos en la tabla tbl_presentacion
INSERT INTO naturales_db.tbl_presentacion (pres_descripcion) 
VALUES 
('Caja'), 
('Botella'), 
('Sobre');

-- Insertar datos en la tabla tbl_unidad_medida
INSERT INTO naturales_db.tbl_unidad_medida (und_descripcion) 
VALUES 
('Gramos'), 
('Mililitros'), 
('Tabletas');

-- Insertar datos en la tabla tbl_producto
INSERT INTO naturales_db.tbl_producto (prod_cod_producto, prod_nombre, prod_descripcion, prod_cantidad_inventario, prod_numerolote, prod_fecha_vencimiento, prod_precio_venta, prod_precio_compra, prod_medida, tbl_categoria_cat_id, tbl_proveedor_prov_id, tbl_unidad_medida_und_id, tbl_presentacion_pres_id) 
VALUES 
('SUP001', 'Proteína', 'Suplemento de proteína en polvo', 100, 'L0001', '2025-12-31', 50000, 30000, 1, 1, 1, 1, 1),
('VIT001', 'Vitamina C', 'Complemento de vitamina C', 200, 'L0002', '2024-06-30', 10000, 7000, 2, 2, 2, 2, 2),
('MIN001', 'Magnesio', 'Suplemento de magnesio', 150, 'L0003', '2023-12-31', 15000, 12000, 3, 3, 3, 3, 3);

-- Insertar datos en la tabla tbl_inventario
INSERT INTO naturales_db.tbl_inventario (inv_fecha_realizacion, inv_observacion, tbl_empleado_emp_id) 
VALUES 
( '2024-06-15', 'Inventario inicial',  1), 
( '2024-07-20', 'Inventario actualizado',  2), 
( '2024-08-25', 'Inventario revisado',  3);

-- Insertar datos en la tabla tbl_venta
INSERT INTO naturales_db.tbl_venta (vent_fecha, vent_total, vent_descripcion, tbl_cliente_cli_id, tbl_empleado_emp_id) 
VALUES 
('2024-04-15', 180000, 'Venta de proteínas y vitaminas', 1, 1), 
('2024-05-10', 220000, 'Venta de minerales y suplementos', 2, 2), 
('2024-06-01', 200000, 'Venta de vitaminas', 3, 3);

-- Insertar datos en la tabla tbl_detalle_compraproducto
INSERT INTO naturales_db.tbl_detalle_compraproducto (tbl_producto_prod_id, tbl_compra_comp_id, detc_numero_factura, detc_cantidad_comprada, detc_precio_unitario) 
VALUES 
(1, 1, 'FAC001', 10, 5000), 
(2, 2, 'FAC002', 20, 7000), 
(3, 3, 'FAC003', 15, 6000);

-- Insertar datos en la tabla tbl_detalle_ventaproducto
INSERT INTO naturales_db.tbl_detalle_ventaproducto (tbl_producto_prod_id, tbl_venta_vent_id, detv_numero_factura, detv_cantidad_vendida, detv_precio_unitario) 
VALUES 
(1, 1, 'FACV001', 5, 10000), 
(2, 2, 'FACV002', 10, 15000), 
(3, 3, 'FACV003', 8, 12000);

-- Insertar datos en la tabla tbl_devolucion
INSERT INTO naturales_db.tbl_devolucion (dev_fecha_devolucion, dev_motivo, tbl_venta_vent_id) 
VALUES 
('2024-07-15', 'Producto defectuoso', 1), 
('2024-08-10', 'Error en el pedido', 2), 
('2024-09-05', 'Producto dañado en el envío', 3);



-- Insertar datos en la tabla tbl_usuario
INSERT INTO naturales_db.tbl_usuario (usu_usuario, usu_contrasena, usu_estado, usu_fecha_creacion, tbl_empleado_emp_id, tbl_rol_rol_id) 
VALUES 
('admin', 'd74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1', 'activo', '2024-01-01', 1, 1), 
('empleado1', 'd74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1', 'activo', '2024-01-02', 2, 2), 
('cliente1', 'd74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1', 'activo', '2024-01-03', 3, 3);



