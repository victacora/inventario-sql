-- MySQL Workbench Synchronization
-- Generated: 2024-09-28 18:06
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: PC30-CCA

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `naturales_db` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `naturales_db`.`tbl_categoria` (
  `cat_id` INT(11) NOT NULL AUTO_INCREMENT,
  `cat_descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cat_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `naturales_db`.`tbl_producto` (
  `prod_id` INT(11) NOT NULL AUTO_INCREMENT,
  `prod_cod_producto` VARCHAR(45) NOT NULL,
  `prod_nombre` VARCHAR(45) NOT NULL,
  `prod_descripcion` VARCHAR(80) NOT NULL,
  `prod_cantidad_inventario` INT(11) NOT NULL,
  `prod_numerolote` VARCHAR(15) NOT NULL,
  `prod_fecha_vencimiento` DATE NOT NULL,
  `prod_precio_venta` DECIMAL NOT NULL,
  `prod_precio_compra` DECIMAL NOT NULL,
  `prod_medida` INT(11) NOT NULL,
  `tbl_categoria_cat_id` INT(11) NOT NULL,
  `tbl_proveedor_prov_id` INT(11) NOT NULL,
  `tbl_unidad_medida_und_id` INT(11) NOT NULL,
  `tbl_presentacion_pres_id` INT(11) NOT NULL,
  PRIMARY KEY (`prod_id`, `tbl_categoria_cat_id`, `tbl_proveedor_prov_id`, `tbl_unidad_medida_und_id`, `tbl_presentacion_pres_id`),
  UNIQUE INDEX `prod_cod_producto_UNIQUE` (`prod_cod_producto` ASC) VISIBLE,
  INDEX `fk_tbl_producto_tbl_categoria_idx` (`tbl_categoria_cat_id` ASC) VISIBLE,
  INDEX `fk_tbl_producto_tbl_proveedor1_idx` (`tbl_proveedor_prov_id` ASC) VISIBLE,
  INDEX `fk_tbl_producto_tbl_unidad_medida1_idx` (`tbl_unidad_medida_und_id` ASC) VISIBLE,
  INDEX `fk_tbl_producto_tbl_presentacion1_idx` (`tbl_presentacion_pres_id` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_producto_tbl_categoria`
    FOREIGN KEY (`tbl_categoria_cat_id`)
    REFERENCES `naturales_db`.`tbl_categoria` (`cat_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_producto_tbl_proveedor1`
    FOREIGN KEY (`tbl_proveedor_prov_id`)
    REFERENCES `naturales_db`.`tbl_proveedor` (`prov_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_producto_tbl_unidad_medida1`
    FOREIGN KEY (`tbl_unidad_medida_und_id`)
    REFERENCES `naturales_db`.`tbl_unidad_medida` (`und_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_producto_tbl_presentacion1`
    FOREIGN KEY (`tbl_presentacion_pres_id`)
    REFERENCES `naturales_db`.`tbl_presentacion` (`pres_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `naturales_db`.`tbl_tipo_documento` (
  `doc_id` INT(11) NOT NULL AUTO_INCREMENT,
  `doc_tipo_documento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`doc_id`),
  UNIQUE INDEX `doc_tipo_documento_UNIQUE` (`doc_tipo_documento` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `naturales_db`.`tbl_compra` (
  `comp_id` INT(11) NOT NULL AUTO_INCREMENT,
  `comp_fecha_compra` DATE NOT NULL,
  `comp_total` DECIMAL NOT NULL,
  PRIMARY KEY (`comp_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `naturales_db`.`tbl_venta` (
  `vent_id` INT(11) NOT NULL AUTO_INCREMENT,
  `vent_fecha` DATE NOT NULL,
  `vent_total` DECIMAL NOT NULL,
  `vent_descripcion` TEXT NOT NULL,
  `tbl_cliente_cli_id` INT(11) NOT NULL,
  `tbl_empleado_emp_id` INT(11) NOT NULL,
  PRIMARY KEY (`vent_id`, `tbl_cliente_cli_id`, `tbl_empleado_emp_id`),
  INDEX `fk_tbl_venta_tbl_cliente1_idx` (`tbl_cliente_cli_id` ASC) VISIBLE,
  INDEX `fk_tbl_venta_tbl_empleado1_idx` (`tbl_empleado_emp_id` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_venta_tbl_cliente1`
    FOREIGN KEY (`tbl_cliente_cli_id`)
    REFERENCES `naturales_db`.`tbl_cliente` (`cli_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_venta_tbl_empleado1`
    FOREIGN KEY (`tbl_empleado_emp_id`)
    REFERENCES `naturales_db`.`tbl_empleado` (`emp_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `naturales_db`.`tbl_rol` (
  `rol_id` INT(11) NOT NULL AUTO_INCREMENT,
  `rol_nombre` VARCHAR(45) NOT NULL,
  `rol_descripcion` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`rol_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `naturales_db`.`tbl_usuario` (
  `usu_id` INT(11) NOT NULL AUTO_INCREMENT,
  `usu_usuario` VARCHAR(45) NOT NULL,
  `usu_contrasena` TEXT NOT NULL,
  `usu_estado` VARCHAR(15) NOT NULL,
  `usu_fecha_creacion` DATE NOT NULL,
  `tbl_empleado_emp_id` INT(11) NOT NULL,
  `tbl_rol_rol_id` INT(11) NOT NULL,
  PRIMARY KEY (`usu_id`, `tbl_empleado_emp_id`, `tbl_rol_rol_id`),
  UNIQUE INDEX `usu_usuario_UNIQUE` (`usu_usuario` ASC) VISIBLE,
  INDEX `fk_tbl_usuario_tbl_empleado1_idx` (`tbl_empleado_emp_id` ASC) VISIBLE,
  INDEX `fk_tbl_usuario_tbl_rol1_idx` (`tbl_rol_rol_id` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_usuario_tbl_empleado1`
    FOREIGN KEY (`tbl_empleado_emp_id`)
    REFERENCES `naturales_db`.`tbl_empleado` (`emp_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_usuario_tbl_rol1`
    FOREIGN KEY (`tbl_rol_rol_id`)
    REFERENCES `naturales_db`.`tbl_rol` (`rol_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `naturales_db`.`tbl_permiso` (
  `perm_id` INT(11) NOT NULL AUTO_INCREMENT,
  `perm_nombre` VARCHAR(45) NOT NULL,
  `perm_descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`perm_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `naturales_db`.`tbl_devolucion` (
  `dev_id` INT(11) NOT NULL AUTO_INCREMENT,
  `dev_fecha_devolucion` DATE NOT NULL,
  `dev_motivo` TEXT NOT NULL,
  `tbl_venta_vent_id` INT(11) NOT NULL,
  PRIMARY KEY (`dev_id`, `tbl_venta_vent_id`),
  INDEX `fk_tbl_devolucion_tbl_venta1_idx` (`tbl_venta_vent_id` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_devolucion_tbl_venta1`
    FOREIGN KEY (`tbl_venta_vent_id`)
    REFERENCES `naturales_db`.`tbl_venta` (`vent_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `naturales_db`.`tbl_persona` (
  `pers_id` INT(11) NOT NULL AUTO_INCREMENT,
  `pers_identificacion` VARCHAR(45) NOT NULL,
  `pers_nombre_razonsocial` VARCHAR(45) NOT NULL,
  `pers_apellido` VARCHAR(45) NULL DEFAULT NULL,
  `pers_telefono` VARCHAR(15) NOT NULL,
  `pers_direccion` VARCHAR(80) NOT NULL,
  `pers_correo_electronico` VARCHAR(80) NOT NULL,
  `tbl_tipo_documento_doc_id` INT(11) NOT NULL,
  `tbl_pais_pais_id` INT(11) NOT NULL,
  PRIMARY KEY (`pers_id`, `tbl_tipo_documento_doc_id`, `tbl_pais_pais_id`),
  UNIQUE INDEX `pers_correo_electronico_UNIQUE` (`pers_correo_electronico` ASC) VISIBLE,
  INDEX `fk_tbl_persona_tbl_tipo_documento1_idx` (`tbl_tipo_documento_doc_id` ASC) VISIBLE,
  INDEX `fk_tbl_persona_tbl_pais1_idx` (`tbl_pais_pais_id` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_persona_tbl_tipo_documento1`
    FOREIGN KEY (`tbl_tipo_documento_doc_id`)
    REFERENCES `naturales_db`.`tbl_tipo_documento` (`doc_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_persona_tbl_pais1`
    FOREIGN KEY (`tbl_pais_pais_id`)
    REFERENCES `naturales_db`.`tbl_pais` (`pais_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `naturales_db`.`tbl_pais` (
  `pais_id` INT(11) NOT NULL AUTO_INCREMENT,
  `pais_codigo` VARCHAR(45) NOT NULL,
  `pais_nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`pais_id`),
  UNIQUE INDEX `pais_nombre_UNIQUE` (`pais_nombre` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `naturales_db`.`tbl_departamento` (
  `dep_id` INT(11) NOT NULL AUTO_INCREMENT,
  `dep_codigo` VARCHAR(45) NOT NULL,
  `dep_nombre` VARCHAR(80) NOT NULL,
  `tbl_pais_pais_id` INT(11) NOT NULL,
  PRIMARY KEY (`dep_id`, `tbl_pais_pais_id`),
  INDEX `fk_tbl_departamento_tbl_pais1_idx` (`tbl_pais_pais_id` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_departamento_tbl_pais1`
    FOREIGN KEY (`tbl_pais_pais_id`)
    REFERENCES `naturales_db`.`tbl_pais` (`pais_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `naturales_db`.`tbl_ciudad` (
  `ciu_id` INT(11) NOT NULL AUTO_INCREMENT,
  `ciu_codigo` VARCHAR(45) NOT NULL,
  `ciu_nombre` VARCHAR(80) NOT NULL,
  `tbl_departamento_dep_id` INT(11) NOT NULL,
  PRIMARY KEY (`ciu_id`, `tbl_departamento_dep_id`),
  INDEX `fk_tbl_ciudad_tbl_departamento1_idx` (`tbl_departamento_dep_id` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_ciudad_tbl_departamento1`
    FOREIGN KEY (`tbl_departamento_dep_id`)
    REFERENCES `naturales_db`.`tbl_departamento` (`dep_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `naturales_db`.`tbl_proveedor` (
  `prov_id` INT(11) NOT NULL AUTO_INCREMENT,
  `tbl_persona_pers_id` INT(11) NOT NULL,
  PRIMARY KEY (`prov_id`, `tbl_persona_pers_id`),
  INDEX `fk_tbl_proveedor_tbl_persona1_idx` (`tbl_persona_pers_id` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_proveedor_tbl_persona1`
    FOREIGN KEY (`tbl_persona_pers_id`)
    REFERENCES `naturales_db`.`tbl_persona` (`pers_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `naturales_db`.`tbl_cliente` (
  `cli_id` INT(11) NOT NULL AUTO_INCREMENT,
  `tbl_persona_pers_id` INT(11) NOT NULL,
  PRIMARY KEY (`cli_id`, `tbl_persona_pers_id`),
  INDEX `fk_tbl_cliente_tbl_persona1_idx` (`tbl_persona_pers_id` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_cliente_tbl_persona1`
    FOREIGN KEY (`tbl_persona_pers_id`)
    REFERENCES `naturales_db`.`tbl_persona` (`pers_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `naturales_db`.`tbl_empleado` (
  `emp_id` INT(11) NOT NULL AUTO_INCREMENT,
  `tbl_persona_pers_id` INT(11) NOT NULL,
  PRIMARY KEY (`emp_id`, `tbl_persona_pers_id`),
  INDEX `fk_tbl_empleado_tbl_persona1_idx` (`tbl_persona_pers_id` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_empleado_tbl_persona1`
    FOREIGN KEY (`tbl_persona_pers_id`)
    REFERENCES `naturales_db`.`tbl_persona` (`pers_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `naturales_db`.`tbl_detalle_compraproducto` (
  `tbl_producto_prod_id` INT(11) NOT NULL,
  `tbl_compra_comp_id` INT(11) NOT NULL,
  `detc_numero_factura` VARCHAR(45) NOT NULL,
  `detc_cantidad_comprada` INT(11) NOT NULL,
  `detc_precio_unitario` DECIMAL NOT NULL,
  PRIMARY KEY (`tbl_producto_prod_id`, `tbl_compra_comp_id`),
  INDEX `fk_tbl_producto_has_tbl_compra_tbl_compra1_idx` (`tbl_compra_comp_id` ASC) VISIBLE,
  INDEX `fk_tbl_producto_has_tbl_compra_tbl_producto1_idx` (`tbl_producto_prod_id` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_producto_has_tbl_compra_tbl_producto1`
    FOREIGN KEY (`tbl_producto_prod_id`)
    REFERENCES `naturales_db`.`tbl_producto` (`prod_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_producto_has_tbl_compra_tbl_compra1`
    FOREIGN KEY (`tbl_compra_comp_id`)
    REFERENCES `naturales_db`.`tbl_compra` (`comp_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `naturales_db`.`tbl_detalle_ventaproducto` (
  `tbl_producto_prod_id` INT(11) NOT NULL,
  `tbl_venta_vent_id` INT(11) NOT NULL,
  `detv_numero_factura` VARCHAR(45) NOT NULL,
  `detv_cantidad_vendida` INT(11) NOT NULL,
  `detv_precio_unitario` DECIMAL NOT NULL,
  PRIMARY KEY (`tbl_producto_prod_id`, `tbl_venta_vent_id`),
  INDEX `fk_tbl_producto_has_tbl_venta_tbl_venta1_idx` (`tbl_venta_vent_id` ASC) VISIBLE,
  INDEX `fk_tbl_producto_has_tbl_venta_tbl_producto1_idx` (`tbl_producto_prod_id` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_producto_has_tbl_venta_tbl_producto1`
    FOREIGN KEY (`tbl_producto_prod_id`)
    REFERENCES `naturales_db`.`tbl_producto` (`prod_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_producto_has_tbl_venta_tbl_venta1`
    FOREIGN KEY (`tbl_venta_vent_id`)
    REFERENCES `naturales_db`.`tbl_venta` (`vent_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `naturales_db`.`tbl_rolpermiso` (
  `tbl_rol_rol_id` INT(11) NOT NULL,
  `tbl_permiso_perm_id` INT(11) NOT NULL,
  PRIMARY KEY (`tbl_rol_rol_id`, `tbl_permiso_perm_id`),
  INDEX `fk_tbl_rol_has_tbl_permiso_tbl_permiso1_idx` (`tbl_permiso_perm_id` ASC) VISIBLE,
  INDEX `fk_tbl_rol_has_tbl_permiso_tbl_rol1_idx` (`tbl_rol_rol_id` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_rol_has_tbl_permiso_tbl_rol1`
    FOREIGN KEY (`tbl_rol_rol_id`)
    REFERENCES `naturales_db`.`tbl_rol` (`rol_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_rol_has_tbl_permiso_tbl_permiso1`
    FOREIGN KEY (`tbl_permiso_perm_id`)
    REFERENCES `naturales_db`.`tbl_permiso` (`perm_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `naturales_db`.`tbl_presentacion` (
  `pres_id` INT(11) NOT NULL AUTO_INCREMENT,
  `pres_descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`pres_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `naturales_db`.`tbl_unidad_medida` (
  `und_id` INT(11) NOT NULL AUTO_INCREMENT,
  `und_descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`und_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `naturales_db`.`tbl_inventario` (
  `inv_id` INT(11) NOT NULL AUTO_INCREMENT,
  `inv_cantidad` INT(11) NOT NULL,
  `inv_fecha_realizacion` DATE NOT NULL,
  `inv_observacion` TEXT NULL DEFAULT NULL,
  `tbl_producto_prod_id` INT(11) NOT NULL,
  `tbl_empleado_emp_id` INT(11) NOT NULL,
  PRIMARY KEY (`inv_id`, `tbl_producto_prod_id`, `tbl_empleado_emp_id`),
  INDEX `fk_tbl_inventario_tbl_producto1_idx` (`tbl_producto_prod_id` ASC) VISIBLE,
  INDEX `fk_tbl_inventario_tbl_empleado1_idx` (`tbl_empleado_emp_id` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_inventario_tbl_producto1`
    FOREIGN KEY (`tbl_producto_prod_id`)
    REFERENCES `naturales_db`.`tbl_producto` (`prod_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_inventario_tbl_empleado1`
    FOREIGN KEY (`tbl_empleado_emp_id`)
    REFERENCES `naturales_db`.`tbl_empleado` (`emp_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
