-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: naturales_db
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_categoria`
--

DROP TABLE IF EXISTS `tbl_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_categoria` (
  `cat_id` int NOT NULL AUTO_INCREMENT,
  `cat_descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_categoria`
--

LOCK TABLES `tbl_categoria` WRITE;
/*!40000 ALTER TABLE `tbl_categoria` DISABLE KEYS */;
INSERT INTO `tbl_categoria` VALUES (1,'Suplementos'),(2,'Vitaminas'),(3,'Minerales');
/*!40000 ALTER TABLE `tbl_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ciudad`
--

DROP TABLE IF EXISTS `tbl_ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ciudad` (
  `ciu_id` int NOT NULL AUTO_INCREMENT,
  `ciu_codigo` varchar(45) NOT NULL,
  `ciu_nombre` varchar(80) NOT NULL,
  `tbl_departamento_dep_id` int NOT NULL,
  PRIMARY KEY (`ciu_id`,`tbl_departamento_dep_id`),
  KEY `fk_tbl_ciudad_tbl_departamento1_idx` (`tbl_departamento_dep_id`),
  CONSTRAINT `fk_tbl_ciudad_tbl_departamento1` FOREIGN KEY (`tbl_departamento_dep_id`) REFERENCES `tbl_departamento` (`dep_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ciudad`
--

LOCK TABLES `tbl_ciudad` WRITE;
/*!40000 ALTER TABLE `tbl_ciudad` DISABLE KEYS */;
INSERT INTO `tbl_ciudad` VALUES (1,'001','Popayán',1),(2,'002','Bogotá',2),(3,'003','Medellín',3);
/*!40000 ALTER TABLE `tbl_ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cliente`
--

DROP TABLE IF EXISTS `tbl_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_cliente` (
  `cli_id` int NOT NULL AUTO_INCREMENT,
  `tbl_persona_pers_id` int NOT NULL,
  PRIMARY KEY (`cli_id`,`tbl_persona_pers_id`),
  KEY `fk_tbl_cliente_tbl_persona1_idx` (`tbl_persona_pers_id`),
  CONSTRAINT `fk_tbl_cliente_tbl_persona1` FOREIGN KEY (`tbl_persona_pers_id`) REFERENCES `tbl_persona` (`pers_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cliente`
--

LOCK TABLES `tbl_cliente` WRITE;
/*!40000 ALTER TABLE `tbl_cliente` DISABLE KEYS */;
INSERT INTO `tbl_cliente` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `tbl_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_compra`
--

DROP TABLE IF EXISTS `tbl_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_compra` (
  `comp_id` int NOT NULL AUTO_INCREMENT,
  `comp_fecha_compra` date NOT NULL,
  `comp_total` decimal(10,0) NOT NULL,
  PRIMARY KEY (`comp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_compra`
--

LOCK TABLES `tbl_compra` WRITE;
/*!40000 ALTER TABLE `tbl_compra` DISABLE KEYS */;
INSERT INTO `tbl_compra` VALUES (1,'2024-01-10',150000),(2,'2024-02-05',200000),(3,'2024-03-20',175000);
/*!40000 ALTER TABLE `tbl_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_departamento`
--

DROP TABLE IF EXISTS `tbl_departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_departamento` (
  `dep_id` int NOT NULL AUTO_INCREMENT,
  `dep_codigo` varchar(45) NOT NULL,
  `dep_nombre` varchar(80) NOT NULL,
  `tbl_pais_pais_id` int NOT NULL,
  PRIMARY KEY (`dep_id`,`tbl_pais_pais_id`),
  KEY `fk_tbl_departamento_tbl_pais1_idx` (`tbl_pais_pais_id`),
  CONSTRAINT `fk_tbl_departamento_tbl_pais1` FOREIGN KEY (`tbl_pais_pais_id`) REFERENCES `tbl_pais` (`pais_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_departamento`
--

LOCK TABLES `tbl_departamento` WRITE;
/*!40000 ALTER TABLE `tbl_departamento` DISABLE KEYS */;
INSERT INTO `tbl_departamento` VALUES (1,'001','Cauca',1),(2,'002','Cundinamarca',1),(3,'003','Antioquia',1);
/*!40000 ALTER TABLE `tbl_departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_detalle_compraproducto`
--

DROP TABLE IF EXISTS `tbl_detalle_compraproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_detalle_compraproducto` (
  `tbl_producto_prod_id` int NOT NULL,
  `tbl_compra_comp_id` int NOT NULL,
  `detc_numero_factura` varchar(45) NOT NULL,
  `detc_cantidad_comprada` int NOT NULL,
  `detc_precio_unitario` decimal(10,0) NOT NULL,
  PRIMARY KEY (`tbl_producto_prod_id`,`tbl_compra_comp_id`),
  KEY `fk_tbl_producto_has_tbl_compra_tbl_compra1_idx` (`tbl_compra_comp_id`),
  KEY `fk_tbl_producto_has_tbl_compra_tbl_producto1_idx` (`tbl_producto_prod_id`),
  CONSTRAINT `fk_tbl_producto_has_tbl_compra_tbl_compra1` FOREIGN KEY (`tbl_compra_comp_id`) REFERENCES `tbl_compra` (`comp_id`),
  CONSTRAINT `fk_tbl_producto_has_tbl_compra_tbl_producto1` FOREIGN KEY (`tbl_producto_prod_id`) REFERENCES `tbl_producto` (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_detalle_compraproducto`
--

LOCK TABLES `tbl_detalle_compraproducto` WRITE;
/*!40000 ALTER TABLE `tbl_detalle_compraproducto` DISABLE KEYS */;
INSERT INTO `tbl_detalle_compraproducto` VALUES (1,1,'FAC001',10,5000),(2,2,'FAC002',20,7000),(3,3,'FAC003',15,6000);
/*!40000 ALTER TABLE `tbl_detalle_compraproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_detalle_ventaproducto`
--

DROP TABLE IF EXISTS `tbl_detalle_ventaproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_detalle_ventaproducto` (
  `tbl_producto_prod_id` int NOT NULL,
  `tbl_venta_vent_id` int NOT NULL,
  `detv_numero_factura` varchar(45) NOT NULL,
  `detv_cantidad_vendida` int NOT NULL,
  `detv_precio_unitario` decimal(10,0) NOT NULL,
  PRIMARY KEY (`tbl_producto_prod_id`,`tbl_venta_vent_id`),
  KEY `fk_tbl_producto_has_tbl_venta_tbl_venta1_idx` (`tbl_venta_vent_id`),
  KEY `fk_tbl_producto_has_tbl_venta_tbl_producto1_idx` (`tbl_producto_prod_id`),
  CONSTRAINT `fk_tbl_producto_has_tbl_venta_tbl_producto1` FOREIGN KEY (`tbl_producto_prod_id`) REFERENCES `tbl_producto` (`prod_id`),
  CONSTRAINT `fk_tbl_producto_has_tbl_venta_tbl_venta1` FOREIGN KEY (`tbl_venta_vent_id`) REFERENCES `tbl_venta` (`vent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_detalle_ventaproducto`
--

LOCK TABLES `tbl_detalle_ventaproducto` WRITE;
/*!40000 ALTER TABLE `tbl_detalle_ventaproducto` DISABLE KEYS */;
INSERT INTO `tbl_detalle_ventaproducto` VALUES (1,1,'FACV001',5,10000),(2,2,'FACV002',10,15000),(3,3,'FACV003',8,12000);
/*!40000 ALTER TABLE `tbl_detalle_ventaproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_devolucion`
--

DROP TABLE IF EXISTS `tbl_devolucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_devolucion` (
  `dev_id` int NOT NULL AUTO_INCREMENT,
  `dev_fecha_devolucion` date NOT NULL,
  `dev_motivo` text NOT NULL,
  `tbl_venta_vent_id` int NOT NULL,
  PRIMARY KEY (`dev_id`,`tbl_venta_vent_id`),
  KEY `fk_tbl_devolucion_tbl_venta1_idx` (`tbl_venta_vent_id`),
  CONSTRAINT `fk_tbl_devolucion_tbl_venta1` FOREIGN KEY (`tbl_venta_vent_id`) REFERENCES `tbl_venta` (`vent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_devolucion`
--

LOCK TABLES `tbl_devolucion` WRITE;
/*!40000 ALTER TABLE `tbl_devolucion` DISABLE KEYS */;
INSERT INTO `tbl_devolucion` VALUES (1,'2024-07-15','Producto defectuoso',1),(2,'2024-08-10','Error en el pedido',2),(3,'2024-09-05','Producto dañado en el envío',3);
/*!40000 ALTER TABLE `tbl_devolucion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_empleado`
--

DROP TABLE IF EXISTS `tbl_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_empleado` (
  `emp_id` int NOT NULL AUTO_INCREMENT,
  `tbl_persona_pers_id` int NOT NULL,
  PRIMARY KEY (`emp_id`,`tbl_persona_pers_id`),
  KEY `fk_tbl_empleado_tbl_persona1_idx` (`tbl_persona_pers_id`),
  CONSTRAINT `fk_tbl_empleado_tbl_persona1` FOREIGN KEY (`tbl_persona_pers_id`) REFERENCES `tbl_persona` (`pers_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_empleado`
--

LOCK TABLES `tbl_empleado` WRITE;
/*!40000 ALTER TABLE `tbl_empleado` DISABLE KEYS */;
INSERT INTO `tbl_empleado` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `tbl_empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_inventario`
--

DROP TABLE IF EXISTS `tbl_inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_inventario` (
  `inv_id` int NOT NULL AUTO_INCREMENT,
  `inv_fecha_realizacion` date NOT NULL,
  `inv_observacion` text NOT NULL,
  `tbl_empleado_emp_id` int NOT NULL,
  PRIMARY KEY (`inv_id`,`tbl_empleado_emp_id`),
  KEY `fk_tbl_inventario_tbl_empleado1_idx` (`tbl_empleado_emp_id`),
  CONSTRAINT `fk_tbl_inventario_tbl_empleado1` FOREIGN KEY (`tbl_empleado_emp_id`) REFERENCES `tbl_empleado` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_inventario`
--

LOCK TABLES `tbl_inventario` WRITE;
/*!40000 ALTER TABLE `tbl_inventario` DISABLE KEYS */;
INSERT INTO `tbl_inventario` VALUES (1,'2024-06-15','Inventario inicial',1),(2,'2024-07-20','Inventario actualizado',2),(3,'2024-08-25','Inventario revisado',3);
/*!40000 ALTER TABLE `tbl_inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_inventario_producto`
--

DROP TABLE IF EXISTS `tbl_inventario_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_inventario_producto` (
  `invp_id` int NOT NULL AUTO_INCREMENT,
  `invp_cantidad_nueva` int NOT NULL,
  `tbl_producto_prod_id` int NOT NULL,
  `tbl_inventario_inv_id` int NOT NULL,
  PRIMARY KEY (`invp_id`,`tbl_producto_prod_id`,`tbl_inventario_inv_id`),
  KEY `fk_tbl_inventario_producto_tbl_producto1_idx` (`tbl_producto_prod_id`),
  KEY `fk_tbl_inventario_producto_tbl_inventario1_idx` (`tbl_inventario_inv_id`),
  CONSTRAINT `fk_tbl_inventario_producto_tbl_inventario1` FOREIGN KEY (`tbl_inventario_inv_id`) REFERENCES `tbl_inventario` (`inv_id`),
  CONSTRAINT `fk_tbl_inventario_producto_tbl_producto1` FOREIGN KEY (`tbl_producto_prod_id`) REFERENCES `tbl_producto` (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_inventario_producto`
--

LOCK TABLES `tbl_inventario_producto` WRITE;
/*!40000 ALTER TABLE `tbl_inventario_producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_inventario_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pais`
--

DROP TABLE IF EXISTS `tbl_pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_pais` (
  `pais_id` int NOT NULL AUTO_INCREMENT,
  `pais_codigo` varchar(45) NOT NULL,
  `pais_nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`pais_id`),
  UNIQUE KEY `pais_nombre_UNIQUE` (`pais_nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pais`
--

LOCK TABLES `tbl_pais` WRITE;
/*!40000 ALTER TABLE `tbl_pais` DISABLE KEYS */;
INSERT INTO `tbl_pais` VALUES (1,'COL','Colombia'),(2,'USA','Estados Unidos'),(3,'MEX','México');
/*!40000 ALTER TABLE `tbl_pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_permiso`
--

DROP TABLE IF EXISTS `tbl_permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_permiso` (
  `perm_id` int NOT NULL AUTO_INCREMENT,
  `perm_nombre` varchar(45) NOT NULL,
  `perm_descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`perm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_permiso`
--

LOCK TABLES `tbl_permiso` WRITE;
/*!40000 ALTER TABLE `tbl_permiso` DISABLE KEYS */;
INSERT INTO `tbl_permiso` VALUES (1,'Gestión de Usuarios','Permiso para gestionar usuarios'),(2,'Gestión de Productos','Permiso para gestionar productos'),(3,'Gestión de Ventas','Permiso para gestionar ventas');
/*!40000 ALTER TABLE `tbl_permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_persona`
--

DROP TABLE IF EXISTS `tbl_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_persona` (
  `pers_id` int NOT NULL AUTO_INCREMENT,
  `pers_identificacion` varchar(45) NOT NULL,
  `pers_nombre_razonsocial` varchar(45) NOT NULL,
  `pers_apellido` varchar(45) DEFAULT NULL,
  `pers_telefono` varchar(15) NOT NULL,
  `pers_direccion` varchar(80) NOT NULL,
  `pers_correo_electronico` varchar(80) NOT NULL,
  `tbl_tipo_documento_doc_id` int NOT NULL,
  `tbl_ciudad_ciu_id` int NOT NULL,
  PRIMARY KEY (`pers_id`,`tbl_tipo_documento_doc_id`,`tbl_ciudad_ciu_id`),
  UNIQUE KEY `pers_correo_electronico_UNIQUE` (`pers_correo_electronico`),
  KEY `fk_tbl_persona_tbl_tipo_documento1_idx` (`tbl_tipo_documento_doc_id`),
  KEY `fk_tbl_persona_tbl_ciudad1_idx` (`tbl_ciudad_ciu_id`),
  CONSTRAINT `fk_tbl_persona_tbl_ciudad1` FOREIGN KEY (`tbl_ciudad_ciu_id`) REFERENCES `tbl_ciudad` (`ciu_id`),
  CONSTRAINT `fk_tbl_persona_tbl_tipo_documento1` FOREIGN KEY (`tbl_tipo_documento_doc_id`) REFERENCES `tbl_tipo_documento` (`doc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_persona`
--

LOCK TABLES `tbl_persona` WRITE;
/*!40000 ALTER TABLE `tbl_persona` DISABLE KEYS */;
INSERT INTO `tbl_persona` VALUES (1,'123456789','Juan Pérez','Gómez','3156782345','Calle 123','juan.perez@mail.com',1,1),(2,'987654321','María López','Martínez','3123456789','Carrera 45','maria.lopez@mail.com',2,2),(3,'111222333','Carlos Fernández','Rodríguez','3176543210','Avenida 67','carlos.fernandez@mail.com',3,3);
/*!40000 ALTER TABLE `tbl_persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_presentacion`
--

DROP TABLE IF EXISTS `tbl_presentacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_presentacion` (
  `pres_id` int NOT NULL AUTO_INCREMENT,
  `pres_descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`pres_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_presentacion`
--

LOCK TABLES `tbl_presentacion` WRITE;
/*!40000 ALTER TABLE `tbl_presentacion` DISABLE KEYS */;
INSERT INTO `tbl_presentacion` VALUES (1,'Caja'),(2,'Botella'),(3,'Sobre');
/*!40000 ALTER TABLE `tbl_presentacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_producto`
--

DROP TABLE IF EXISTS `tbl_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_producto` (
  `prod_id` int NOT NULL AUTO_INCREMENT,
  `prod_cod_producto` varchar(45) NOT NULL,
  `prod_nombre` varchar(45) NOT NULL,
  `prod_descripcion` varchar(80) NOT NULL,
  `prod_cantidad_inventario` int NOT NULL,
  `prod_numerolote` varchar(15) NOT NULL,
  `prod_fecha_vencimiento` date NOT NULL,
  `prod_precio_venta` decimal(10,0) NOT NULL,
  `prod_precio_compra` decimal(10,0) NOT NULL,
  `prod_medida` int NOT NULL,
  `tbl_categoria_cat_id` int NOT NULL,
  `tbl_proveedor_prov_id` int NOT NULL,
  `tbl_unidad_medida_und_id` int NOT NULL,
  `tbl_presentacion_pres_id` int NOT NULL,
  PRIMARY KEY (`prod_id`,`tbl_categoria_cat_id`,`tbl_proveedor_prov_id`,`tbl_unidad_medida_und_id`,`tbl_presentacion_pres_id`),
  UNIQUE KEY `prod_cod_producto_UNIQUE` (`prod_cod_producto`),
  KEY `fk_tbl_producto_tbl_categoria_idx` (`tbl_categoria_cat_id`),
  KEY `fk_tbl_producto_tbl_proveedor1_idx` (`tbl_proveedor_prov_id`),
  KEY `fk_tbl_producto_tbl_unidad_medida1_idx` (`tbl_unidad_medida_und_id`),
  KEY `fk_tbl_producto_tbl_presentacion1_idx` (`tbl_presentacion_pres_id`),
  CONSTRAINT `fk_tbl_producto_tbl_categoria` FOREIGN KEY (`tbl_categoria_cat_id`) REFERENCES `tbl_categoria` (`cat_id`),
  CONSTRAINT `fk_tbl_producto_tbl_presentacion1` FOREIGN KEY (`tbl_presentacion_pres_id`) REFERENCES `tbl_presentacion` (`pres_id`),
  CONSTRAINT `fk_tbl_producto_tbl_proveedor1` FOREIGN KEY (`tbl_proveedor_prov_id`) REFERENCES `tbl_proveedor` (`prov_id`),
  CONSTRAINT `fk_tbl_producto_tbl_unidad_medida1` FOREIGN KEY (`tbl_unidad_medida_und_id`) REFERENCES `tbl_unidad_medida` (`und_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_producto`
--

LOCK TABLES `tbl_producto` WRITE;
/*!40000 ALTER TABLE `tbl_producto` DISABLE KEYS */;
INSERT INTO `tbl_producto` VALUES (1,'SUP001','Proteína','Suplemento de proteína en polvo',100,'L0001','2025-12-31',50000,30000,1,1,1,1,1),(2,'VIT001','Vitamina C','Complemento de vitamina C',200,'L0002','2024-06-30',10000,7000,2,2,2,2,2),(3,'MIN001','Magnesio','Suplemento de magnesio',150,'L0003','2023-12-31',15000,12000,3,3,3,3,3);
/*!40000 ALTER TABLE `tbl_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_proveedor`
--

DROP TABLE IF EXISTS `tbl_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_proveedor` (
  `prov_id` int NOT NULL AUTO_INCREMENT,
  `tbl_persona_pers_id` int NOT NULL,
  PRIMARY KEY (`prov_id`,`tbl_persona_pers_id`),
  KEY `fk_tbl_proveedor_tbl_persona1_idx` (`tbl_persona_pers_id`),
  CONSTRAINT `fk_tbl_proveedor_tbl_persona1` FOREIGN KEY (`tbl_persona_pers_id`) REFERENCES `tbl_persona` (`pers_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_proveedor`
--

LOCK TABLES `tbl_proveedor` WRITE;
/*!40000 ALTER TABLE `tbl_proveedor` DISABLE KEYS */;
INSERT INTO `tbl_proveedor` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `tbl_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_rol`
--

DROP TABLE IF EXISTS `tbl_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_rol` (
  `rol_id` int NOT NULL AUTO_INCREMENT,
  `rol_nombre` varchar(45) NOT NULL,
  `rol_descripcion` varchar(80) NOT NULL,
  PRIMARY KEY (`rol_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_rol`
--

LOCK TABLES `tbl_rol` WRITE;
/*!40000 ALTER TABLE `tbl_rol` DISABLE KEYS */;
INSERT INTO `tbl_rol` VALUES (1,'Administrador','Rol con acceso completo al sistema'),(2,'Empleado','Rol con acceso limitado a la gestión de productos'),(3,'Cliente','Rol con acceso solo a la compra de productos');
/*!40000 ALTER TABLE `tbl_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_rolpermiso`
--

DROP TABLE IF EXISTS `tbl_rolpermiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_rolpermiso` (
  `tbl_rol_rol_id` int NOT NULL,
  `tbl_permiso_perm_id` int NOT NULL,
  PRIMARY KEY (`tbl_rol_rol_id`,`tbl_permiso_perm_id`),
  KEY `fk_tbl_rol_has_tbl_permiso_tbl_permiso1_idx` (`tbl_permiso_perm_id`),
  KEY `fk_tbl_rol_has_tbl_permiso_tbl_rol1_idx` (`tbl_rol_rol_id`),
  CONSTRAINT `fk_tbl_rol_has_tbl_permiso_tbl_permiso1` FOREIGN KEY (`tbl_permiso_perm_id`) REFERENCES `tbl_permiso` (`perm_id`),
  CONSTRAINT `fk_tbl_rol_has_tbl_permiso_tbl_rol1` FOREIGN KEY (`tbl_rol_rol_id`) REFERENCES `tbl_rol` (`rol_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_rolpermiso`
--

LOCK TABLES `tbl_rolpermiso` WRITE;
/*!40000 ALTER TABLE `tbl_rolpermiso` DISABLE KEYS */;
INSERT INTO `tbl_rolpermiso` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `tbl_rolpermiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipo_documento`
--

DROP TABLE IF EXISTS `tbl_tipo_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_tipo_documento` (
  `doc_id` int NOT NULL AUTO_INCREMENT,
  `doc_tipo_documento` varchar(45) NOT NULL,
  PRIMARY KEY (`doc_id`),
  UNIQUE KEY `doc_tipo_documento_UNIQUE` (`doc_tipo_documento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipo_documento`
--

LOCK TABLES `tbl_tipo_documento` WRITE;
/*!40000 ALTER TABLE `tbl_tipo_documento` DISABLE KEYS */;
INSERT INTO `tbl_tipo_documento` VALUES (1,'Cédula'),(3,'NIT'),(2,'Pasaporte');
/*!40000 ALTER TABLE `tbl_tipo_documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_unidad_medida`
--

DROP TABLE IF EXISTS `tbl_unidad_medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_unidad_medida` (
  `und_id` int NOT NULL AUTO_INCREMENT,
  `und_descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`und_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_unidad_medida`
--

LOCK TABLES `tbl_unidad_medida` WRITE;
/*!40000 ALTER TABLE `tbl_unidad_medida` DISABLE KEYS */;
INSERT INTO `tbl_unidad_medida` VALUES (1,'Gramos'),(2,'Mililitros'),(3,'Tabletas');
/*!40000 ALTER TABLE `tbl_unidad_medida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_usuario`
--

DROP TABLE IF EXISTS `tbl_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_usuario` (
  `usu_id` int NOT NULL AUTO_INCREMENT,
  `usu_usuario` varchar(45) NOT NULL,
  `usu_contrasena` text NOT NULL,
  `usu_estado` varchar(15) NOT NULL,
  `usu_fecha_creacion` date NOT NULL,
  `tbl_empleado_emp_id` int NOT NULL,
  `tbl_rol_rol_id` int NOT NULL,
  PRIMARY KEY (`usu_id`,`tbl_empleado_emp_id`,`tbl_rol_rol_id`),
  UNIQUE KEY `usu_usuario_UNIQUE` (`usu_usuario`),
  KEY `fk_tbl_usuario_tbl_empleado1_idx` (`tbl_empleado_emp_id`),
  KEY `fk_tbl_usuario_tbl_rol1_idx` (`tbl_rol_rol_id`),
  CONSTRAINT `fk_tbl_usuario_tbl_empleado1` FOREIGN KEY (`tbl_empleado_emp_id`) REFERENCES `tbl_empleado` (`emp_id`),
  CONSTRAINT `fk_tbl_usuario_tbl_rol1` FOREIGN KEY (`tbl_rol_rol_id`) REFERENCES `tbl_rol` (`rol_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usuario`
--

LOCK TABLES `tbl_usuario` WRITE;
/*!40000 ALTER TABLE `tbl_usuario` DISABLE KEYS */;
INSERT INTO `tbl_usuario` VALUES (1,'admin','d74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1','activo','2024-01-01',1,1),(2,'empleado1','d74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1','activo','2024-01-02',2,2),(3,'cliente1','d74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1','activo','2024-01-03',3,3);
/*!40000 ALTER TABLE `tbl_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_venta`
--

DROP TABLE IF EXISTS `tbl_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_venta` (
  `vent_id` int NOT NULL AUTO_INCREMENT,
  `vent_fecha` date NOT NULL,
  `vent_total` decimal(10,0) NOT NULL,
  `vent_descripcion` text NOT NULL,
  `tbl_cliente_cli_id` int NOT NULL,
  `tbl_empleado_emp_id` int NOT NULL,
  PRIMARY KEY (`vent_id`,`tbl_cliente_cli_id`,`tbl_empleado_emp_id`),
  KEY `fk_tbl_venta_tbl_cliente1_idx` (`tbl_cliente_cli_id`),
  KEY `fk_tbl_venta_tbl_empleado1_idx` (`tbl_empleado_emp_id`),
  CONSTRAINT `fk_tbl_venta_tbl_cliente1` FOREIGN KEY (`tbl_cliente_cli_id`) REFERENCES `tbl_cliente` (`cli_id`),
  CONSTRAINT `fk_tbl_venta_tbl_empleado1` FOREIGN KEY (`tbl_empleado_emp_id`) REFERENCES `tbl_empleado` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_venta`
--

LOCK TABLES `tbl_venta` WRITE;
/*!40000 ALTER TABLE `tbl_venta` DISABLE KEYS */;
INSERT INTO `tbl_venta` VALUES (1,'2024-04-15',180000,'Venta de proteínas y vitaminas',1,1),(2,'2024-05-10',220000,'Venta de minerales y suplementos',2,2),(3,'2024-06-01',200000,'Venta de vitaminas',3,3);
/*!40000 ALTER TABLE `tbl_venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-20 18:58:06
