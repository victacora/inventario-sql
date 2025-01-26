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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_categoria`
--

LOCK TABLES `tbl_categoria` WRITE;
/*!40000 ALTER TABLE `tbl_categoria` DISABLE KEYS */;
INSERT INTO `tbl_categoria` VALUES (1,'Suplementos'),(2,'Vitaminas'),(3,'Minerales'),(4,'Naturales'),(6,'Fungicos');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ciudad`
--

LOCK TABLES `tbl_ciudad` WRITE;
/*!40000 ALTER TABLE `tbl_ciudad` DISABLE KEYS */;
INSERT INTO `tbl_ciudad` VALUES (1,'001','Popayán',1),(2,'002','Bogotá',2),(3,'003','Medellín',3),(4,'004','California',4);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cliente`
--

LOCK TABLES `tbl_cliente` WRITE;
/*!40000 ALTER TABLE `tbl_cliente` DISABLE KEYS */;
INSERT INTO `tbl_cliente` VALUES (1,1),(2,2),(3,3),(5,43);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_compra`
--

LOCK TABLES `tbl_compra` WRITE;
/*!40000 ALTER TABLE `tbl_compra` DISABLE KEYS */;
INSERT INTO `tbl_compra` VALUES (1,'2024-01-10',150000),(2,'2024-02-05',200000),(3,'2024-03-20',175000),(4,'2025-01-22',24);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_departamento`
--

LOCK TABLES `tbl_departamento` WRITE;
/*!40000 ALTER TABLE `tbl_departamento` DISABLE KEYS */;
INSERT INTO `tbl_departamento` VALUES (1,'001','Cauca',1),(2,'002','Cundinamarca',1),(3,'003','Antioquia',1),(4,'002','Washington',15),(5,'002','Washington',5);
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
INSERT INTO `tbl_detalle_compraproducto` VALUES (1,1,'FAC001',10,5000),(1,4,'FAC004',2,12),(2,2,'FAC002',20,7000),(3,3,'FAC003',15,6000);
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_empleado`
--

LOCK TABLES `tbl_empleado` WRITE;
/*!40000 ALTER TABLE `tbl_empleado` DISABLE KEYS */;
INSERT INTO `tbl_empleado` VALUES (1,1),(2,2),(3,3),(16,36);
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pais`
--

LOCK TABLES `tbl_pais` WRITE;
/*!40000 ALTER TABLE `tbl_pais` DISABLE KEYS */;
INSERT INTO `tbl_pais` VALUES (1,'COL','Colombia'),(2,'USA','Estados Unidos'),(3,'MEX','México'),(4,'PER','Peru'),(5,'ARG','Argentina'),(6,'CHI','Chile'),(7,'CHI','China'),(8,'JAP','Japon'),(9,'CAN','Canada'),(10,'URU','Uruguay'),(11,'PAN','Panama'),(13,'PAR','Paraguay'),(15,'BRA','Brasil');
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_permiso`
--

LOCK TABLES `tbl_permiso` WRITE;
/*!40000 ALTER TABLE `tbl_permiso` DISABLE KEYS */;
INSERT INTO `tbl_permiso` VALUES (1,'Gestión de dashboard','Permiso para gestion del dashboard'),(2,'Gestión de productos','Permiso para gestionar productos'),(3,'Gestión de ventas','Permiso para gestion de ventas'),(4,'Gestión de compras','Permiso para gestion de compras'),(5,'Gestión  de devoluciones','Permiso para gestion de devoluciones'),(6,'Gestión  de inventario','Permiso para gestion de inventario'),(7,'Gestión  de roles','Permiso para gestion de roles'),(8,'Gestión  de privilegios','Permiso para gestion de privilegios'),(9,'Gestión  de tipos documentos','Permiso para gestion de tipo documentos'),(10,'Gestión  de categorias','Permiso para gestion de categorias'),(11,'Gestión  de presentacion','Permiso para gestion de presentacion'),(12,'Gestión  de unidad de medida','Permiso para gestion de medida'),(13,'Gestión  de paises','Permiso para gestion de paises'),(14,'Gestión  de departamentos','Permiso para gestion de departamentos'),(15,'Gestión  de ciudades','Permiso para gestion de ciudades'),(16,'Gestión  de proveedores','Permiso para gestion de proveedores'),(17,'Gestión  de empleados','Permiso para gestion de empleados'),(18,'Gestión  de clientes','Gestión  de clientes');
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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_persona`
--

LOCK TABLES `tbl_persona` WRITE;
/*!40000 ALTER TABLE `tbl_persona` DISABLE KEYS */;
INSERT INTO `tbl_persona` VALUES (1,'123456789','Juan Pérez','Gómez','3156782345','Calle 123','juan.perez@mail.com',1,1),(2,'987654321','María López','Martínez','3123456789','Carrera 45','maria.lopez@mail.com',2,2),(3,'111222333','Carlos Fernández','Rodríguez','3176543210','Avenida 67','carlos.fernandez@gmail.com',3,1),(36,'4356466556','Victor Alfonso','Puyo Epia','3217299734','Carrera 40 # 4N-58 segundo piso','victoralfonsopuyo@gmail.com',1,1),(43,'1061767207','Karol','Ledezma','3217299734','Carrera 40 # 4N-58 segundo piso','karol@gmail.com',1,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_presentacion`
--

LOCK TABLES `tbl_presentacion` WRITE;
/*!40000 ALTER TABLE `tbl_presentacion` DISABLE KEYS */;
INSERT INTO `tbl_presentacion` VALUES (1,'Caja'),(2,'Botella'),(3,'Sobre'),(4,'Prueba');
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
INSERT INTO `tbl_producto` VALUES (1,'SUP001','Proteína','Suplemento de proteína en polvo',102,'L0001','2025-12-31',50000,30000,1,1,1,1,1),(2,'VIT001','Vitamina C','Complemento de vitamina C',200,'L0002','2024-06-30',10000,7000,2,2,2,2,2),(3,'MIN001','Magnesio','Suplemento de magnesio',150,'L0003','2023-12-31',15000,12000,3,3,3,3,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_rol`
--

LOCK TABLES `tbl_rol` WRITE;
/*!40000 ALTER TABLE `tbl_rol` DISABLE KEYS */;
INSERT INTO `tbl_rol` VALUES (1,'Administrador','Rol con acceso completo al sistema'),(2,'Empleado','Rol con acceso limitado a la gestión de productos'),(3,'Cliente','Rol con acceso solo a la compra de productos'),(9,'Anonimo','Rol anonimo');
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
INSERT INTO `tbl_rolpermiso` VALUES (1,1),(2,1),(1,2),(2,2),(1,3),(2,3),(3,3),(1,4),(2,4),(1,5),(2,5),(1,6),(2,6),(1,7),(2,7),(1,8),(1,9),(1,10),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(2,18);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_unidad_medida`
--

LOCK TABLES `tbl_unidad_medida` WRITE;
/*!40000 ALTER TABLE `tbl_unidad_medida` DISABLE KEYS */;
INSERT INTO `tbl_unidad_medida` VALUES (1,'Gramos'),(2,'Mililitros'),(3,'Tabletas'),(4,'Litros'),(5,'Kilogramos'),(6,'Metros'),(7,'CM3'),(8,'Arroba'),(9,'Libra'),(10,'Tonelada'),(11,'CM'),(12,'Miligramos'),(13,'Miligramos'),(14,'Gramos');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usuario`
--

LOCK TABLES `tbl_usuario` WRITE;
/*!40000 ALTER TABLE `tbl_usuario` DISABLE KEYS */;
INSERT INTO `tbl_usuario` VALUES (1,'admin','01b613da484bee91c3f3806b52a6f40fd61ade874b5ffc0f62a2091cce38158b','Activo','2024-01-01',1,1),(2,'empleado1','d74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1','Activo','2024-01-02',2,2),(3,'cliente1','d74ff0ee8da3b9806b18c877dbf29bbde50b5bd8e4dad7a3a725000feb82e8f1','Activo','2024-01-03',3,3),(16,'admin123','da1a51f975cd750be255d21548eaae1dbaa96ffc997283a6a204f9213a8aca71','Inactivo','2025-01-26',16,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_venta`
--

LOCK TABLES `tbl_venta` WRITE;
/*!40000 ALTER TABLE `tbl_venta` DISABLE KEYS */;
INSERT INTO `tbl_venta` VALUES (1,'2024-04-15',180000,'Venta de proteínas y vitaminas',1,1),(2,'2024-05-10',220000,'Venta de minerales y suplementos',2,2),(3,'2024-06-01',200000,'Venta de vitaminas',3,3),(4,'2025-01-23',180000,'Venta de proteínas y vitaminas',1,1);
/*!40000 ALTER TABLE `tbl_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'naturales_db'
--

--
-- Dumping routines for database 'naturales_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `spCheckPersonRegisteredAsClient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spCheckPersonRegisteredAsClient`(IN p_fkpersona_id INT)
BEGIN
    SELECT COUNT(*) > 0 INTO @exists
    FROM tbl_cliente
    WHERE fk_persona = p_fkpersona_id;

    SELECT @exists;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spCreateCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spCreateCategory`(
    IN p_descripcion VARCHAR(45)
)
BEGIN
    INSERT INTO tbl_categoria (cat_descripcion)
    VALUES (p_descripcion);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spCreatePais` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spCreatePais`(
    IN p_codigo VARCHAR(45),
    IN p_nombre VARCHAR(45)
)
BEGIN
    INSERT INTO tbl_pais (pais_codigo, pais_nombre)
    VALUES (p_codigo, p_nombre);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDDL_mostrar_devoluciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDDL_mostrar_devoluciones`()
BEGIN
    SELECT 
        d.dev_id AS id,
        CONCAT('Devolución: ', d.dev_fecha_devolucion, ' - Motivo: ', d.dev_motivo) AS descripcion
    FROM 
        tbl_devolucion d
    ORDER BY 
        d.dev_fecha_devolucion DESC;  -- Ordena por fecha de devolución, ajusta según sea necesario
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDDL_mostrar_presentacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDDL_mostrar_presentacion`()
BEGIN
    SELECT pres_id, pres_descripcion FROM tbl_presentacion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDDL_mostrar_unidad_medida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDDL_mostrar_unidad_medida`()
BEGIN
    SELECT und_id, und_descripcion FROM tbl_unidad_medida;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDDL_mostrar_ventas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDDL_mostrar_ventas`()
BEGIN
    SELECT 
        v.vent_id AS id, 
        CONCAT(v.vent_Fecha, ' - ', v.vent_descripcion) AS descripcion
    FROM 
        tbl_venta v;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDeleteCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeleteCategory`(
    IN p_cat_id INT
)
BEGIN
    DELETE FROM tbl_categoria
    WHERE cat_id = p_cat_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDeleteCiudad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeleteCiudad`(
    IN p_id INT
)
BEGIN
    DELETE FROM tbl_ciudad WHERE ciu_id = p_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDeleteCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeleteCliente`(
    IN p_cliente_id INT,
    IN p_per_id INT
)
BEGIN
	DELETE FROM tbl_cliente
	WHERE cli_id = p_cliente_id;
	DELETE FROM tbl_persona
	WHERE pers_id = p_per_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDeleteCompraYDetalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeleteCompraYDetalle`(
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

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDeleteEmployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeleteEmployee`(
    IN p_emp_id INT,
    IN p_per_id INT,
	IN p_user_id INT
)
BEGIN
	DELETE FROM tbl_usuario
	WHERE usu_id = p_user_id;
	DELETE FROM tbl_empleado
	WHERE emp_id = p_emp_id;
	DELETE FROM tbl_persona
	WHERE pers_id = p_per_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDeleteInventario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeleteInventario`(
    IN p_inv_id INT,
    IN p_prod_id INT
)
BEGIN
    -- Verificar si el registro existe en tbl_inventario
    IF EXISTS (SELECT 1 FROM tbl_inventario WHERE inv_id = p_inv_id) THEN
        -- Ajustar la cantidad del producto a 0, ya que eliminamos el registro
        UPDATE tbl_producto
        SET prod_cantidad_inventario = 0
        WHERE prod_id = p_prod_id;

        -- Eliminar el registro de inventario
        DELETE FROM tbl_inventario
        WHERE inv_id = p_inv_id;
    ELSE
        -- Si no existe el registro de inventario, lanzar un error
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El registro de inventario especificado no existe.';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDeletepais` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeletepais`(
    IN p_id INT
)
BEGIN
    DELETE FROM tbl_pais WHERE pais_id = p_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDeletePermit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeletePermit`(IN p_permId INT)
BEGIN
    DELETE FROM tbl_permiso
    WHERE perm_id = p_permId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDeletePermitByRolId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeletePermitByRolId`(IN p_permId int, IN p_rolId int)
BEGIN
    DELETE from tbl_rolpermiso where tbl_rol_rol_id=p_rolId and  tbl_permiso_perm_id=p_permId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDeleteProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeleteProduct`(IN p_product_id INT)
BEGIN
    DELETE FROM tbl_producto
    WHERE prod_id = p_product_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDeleteRol` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeleteRol`(IN p_role_id INT)
BEGIN
    DELETE FROM tbl_rol
    WHERE rol_id = p_role_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDeleteSupplier` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeleteSupplier`(
    IN p_pro_id INT,
    IN p_per_id INT
)
BEGIN
	DELETE FROM tbl_proveedor
	WHERE prov_id = p_pro_id;
	DELETE FROM tbl_persona
	WHERE pers_id = p_per_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDeleteTypeDoc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeleteTypeDoc`(IN p_docId INT)
BEGIN
    DELETE FROM tbl_tipo_documento
    WHERE doc_id = p_docId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetAllPermits` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spGetAllPermits`()
BEGIN
    SELECT * FROM tbl_permiso;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetAllPermitsByRolId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spGetAllPermitsByRolId`( IN p_rolId int)
BEGIN
    SELECT p.* FROM tbl_permiso p
    INNER JOIN tbl_rolpermiso as rp on rp.tbl_permiso_perm_id=p.perm_id where rp.tbl_rol_rol_id=p_rolId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetAllRoles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spGetAllRoles`()
BEGIN
    SELECT * FROM tbl_rol;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetAllTypeDoc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spGetAllTypeDoc`()
BEGIN
    SELECT doc_id, doc_tipo_documento FROM tbl_tipo_documento;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetAllUsers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spGetAllUsers`()
BEGIN
    SELECT 
        u.usu_usuario AS Usuario,
        u.usu_contrasena AS Contrasenia,
        u.usu_estado AS Estado,
        u.usu_fecha_creacion AS FechaCreacion,
        p.pers_nombre_razonsocial AS Nombre,
        p.pers_apellido AS Apellido,
        p.pers_identificacion AS Identificacion,
        p.pers_telefono AS Telefono,
        p.pers_correo_electronico AS Email,
        r.rol_nombre AS Rol
    FROM 
        tbl_usuario u
    INNER JOIN 
        tbl_empleado e ON u.tbl_empleado_emp_id = e.emp_id
    INNER JOIN 
        tbl_persona p ON e.tbl_persona_pers_id = p.pers_id
    INNER JOIN 
        tbl_rol r ON u.tbl_rol_rol_id = r.rol_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetCategoriesId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spGetCategoriesId`(
    IN p_id int
)
BEGIN
	SELECT cat_id, cat_descripcion from tbl_categoria where cat_id = p_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spGetCategory`()
BEGIN
    SELECT 
		cat_id AS Id,
        cat_descripcion AS Descripcion
    FROM tbl_categoria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetCategoryDDL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spGetCategoryDDL`()
BEGIN
    SELECT 
		cat_id AS Id,
        cat_descripcion AS Descripcion
    FROM tbl_categoria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetEmployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spGetEmployee`()
BEGIN
    SELECT 
		per.pers_id as PersonaID,
        emp.emp_id AS EmpleadoID,
         td.doc_id as TipoDocumentoID,
        td.doc_tipo_documento as TipoDocumento,
        per.pers_identificacion AS Identificacion,
        per.pers_nombre_razonsocial AS Nombre,
        per.pers_apellido AS Apellido,
        per.pers_telefono AS Telefono,
        per.pers_correo_electronico AS Correo,
         pa.pais_id as PaisId,
        pa.pais_nombre as Pais,
         d.dep_id as DepartamentoId,
        d.dep_nombre as Departamento,
         c.ciu_id as CiudadId,
        c.ciu_nombre as Ciudad,
        per.pers_direccion as Direccion,
        usu.usu_id,
        usu.usu_usuario as usuario,
        usu.usu_contrasena as contrasena,
        usu.tbl_rol_rol_id as rol_id, 
        rol.rol_nombre as rol,
        usu.usu_estado as estado,
        usu_fecha_creacion as registro
    FROM tbl_empleado AS emp
	INNER JOIN tbl_usuario as usu ON emp.emp_id = usu.tbl_empleado_emp_id
	INNER JOIN tbl_persona as per ON per.pers_id = emp.tbl_persona_pers_id
	INNER JOIN tbl_rol as rol ON rol.rol_id = usu.tbl_rol_rol_id
	INNER JOIN tbl_tipo_documento td ON per.tbl_tipo_documento_doc_id = td.doc_id
    INNER JOIN tbl_ciudad c ON per.tbl_ciudad_ciu_id = c.ciu_id
    INNER JOIN tbl_departamento d ON c.tbl_departamento_dep_id = d.dep_id
    INNER JOIN tbl_pais pa ON d.tbl_pais_pais_id = pa.pais_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetEmployeeDDL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spGetEmployeeDDL`()
BEGIN
    SELECT 
        emp.emp_id AS Id,
        CONCAT(per.pers_nombre_razonsocial, ' ', per.pers_apellido) AS NombreCompleto
    FROM tbl_empleado AS emp
    INNER JOIN tbl_persona AS per ON emp.tbl_persona_pers_id = per.pers_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetInventoryDDL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spGetInventoryDDL`()
BEGIN
    SELECT 
		inv.inv_id AS Id,
        concat(inv.inv_fecha_realizacion, " - ",per.pers_nombre_razonsocial, " ", per.pers_apellido) AS Inventario
    FROM tbl_inventario as inv
	INNER JOIN tbl_producto AS pro ON inv.tbl_producto_prod_id = pro.prod_id
	INNER JOIN tbl_persona AS per ON inv.tbl_empleado_emp_id = per.pers_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetSupplier` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spGetSupplier`()
BEGIN
	 SELECT 
		pro.prov_id AS ProveedorID,
		per.pers_id as PersonaID,
		td.doc_id as TipoDocumentoID,
        td.doc_tipo_documento as TipoDocumento,
        per.pers_identificacion AS Identificacion,
        per.pers_nombre_razonsocial AS Nombre,
        per.pers_apellido AS Apellido,
        per.pers_telefono AS Telefono,
        per.pers_correo_electronico AS Correo,
		pa.pais_id as PaisId,
        pa.pais_nombre as Pais,
		d.dep_id as DepartamentoId,
        d.dep_nombre as Departamento,
		c.ciu_id as CiudadId,
        c.ciu_nombre as Ciudad,
        per.pers_direccion as Direccion
    FROM tbl_proveedor as pro
    INNER JOIN tbl_persona AS per ON pro.tbl_persona_pers_id = per.pers_id
	INNER JOIN tbl_tipo_documento td ON per.tbl_tipo_documento_doc_id = td.doc_id
    INNER JOIN tbl_ciudad c ON per.tbl_ciudad_ciu_id = c.ciu_id
    INNER JOIN tbl_departamento d ON c.tbl_departamento_dep_id = d.dep_id
    INNER JOIN tbl_pais pa ON d.tbl_pais_pais_id = pa.pais_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetSupplierDDL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spGetSupplierDDL`()
BEGIN
    SELECT 
        pro.prov_id AS Id,
        CONCAT(per.pers_nombre_razonsocial, " ", per.pers_apellido) AS "Razon social"
    FROM tbl_proveedor as pro
    INNER JOIN tbl_persona AS per ON pro.prov_id = per.pers_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spInsertarCompraYDetalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertarCompraYDetalle`(
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

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spInsertCiudad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertCiudad`(
    IN p_codigo VARCHAR(45),
    IN p_nombre VARCHAR(80),
    IN p_dep_id INT
)
BEGIN
    INSERT INTO tbl_ciudad (ciu_codigo, ciu_nombre, tbl_departamento_dep_id)
    VALUES (p_codigo, p_nombre, p_dep_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spInsertCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertCliente`(
    IN p_fkpersona_id INT
)
BEGIN
    -- Verificar si la persona ya está registrada como cliente
    IF NOT EXISTS (SELECT 1 FROM tbl_cliente WHERE tbl_persona_pers_id = p_fkpersona_id) THEN
        -- Si no está registrada, se inserta
        INSERT INTO tbl_cliente (tbl_persona_pers_id)
        VALUES (p_fkpersona_id);
    ELSE
        -- Si ya está registrada, se puede devolver un mensaje o código de error personalizado
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'La persona ya está registrada como cliente.';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spInsertDepartamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertDepartamento`(
    IN p_codigo VARCHAR(45),
    IN p_nombre VARCHAR(80),
    IN p_fkpais_id INT
)
BEGIN
    INSERT INTO tbl_departamento (dep_codigo, dep_nombre, tbl_pais_pais_id)
    VALUES (p_codigo, p_nombre, p_fkpais_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spInsertEmployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertEmployee`(
    IN p_fkpersona_id INT
)
BEGIN
    -- Verificar si la persona ya está registrada como empleado
    IF NOT EXISTS (SELECT 1 FROM tbl_empleado WHERE tbl_persona_pers_id = p_fkpersona_id) THEN
        -- Si no está registrada, se inserta
        INSERT INTO tbl_empleado (tbl_persona_pers_id)
        VALUES (p_fkpersona_id);
    ELSE
        -- Si ya está registrada, se puede devolver un mensaje o código de error personalizado
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'La persona ya está registrada como empleado.';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spInsertInventario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertInventario`(
    IN p_prod_id INT,
    IN p_inv_cantidad INT,
    IN p_inv_fecha DATE,
    IN p_inv_observacion TEXT,
    IN p_emp_id INT
)
BEGIN
    -- Verificar si el producto existe
    IF EXISTS (SELECT 1 FROM tbl_producto WHERE prod_id = p_prod_id) THEN
        -- Actualizar la cantidad en inventario del producto
        UPDATE tbl_producto
        SET prod_cantidad_inventario = p_inv_cantidad
        WHERE prod_id = p_prod_id;

        -- Insertar el registro en tbl_inventario
        INSERT INTO tbl_inventario (
            inv_cantidad, 
            inv_fecha_realizacion, 
            inv_observacion, 
            tbl_producto_prod_id, 
            tbl_empleado_emp_id
        )
        VALUES (
            p_inv_cantidad, 
            p_inv_fecha, 
            p_inv_observacion, 
            p_prod_id, 
            p_emp_id
        );
    ELSE
        -- Si el producto no existe, lanzar un mensaje de error
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El producto especificado no existe.';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spInsertPermit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertPermit`(IN p_perm_Nombre VARCHAR(45), IN p_perm_Descripcion VARCHAR(255))
BEGIN
    INSERT INTO tbl_permiso (perm_nombre, perm_descripcion)
    VALUES (p_perm_Nombre, p_perm_Descripcion);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spInsertPermitByRolId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertPermitByRolId`(IN p_permId int, IN p_rolId int)
BEGIN
     INSERT INTO tbl_rolpermiso (tbl_rol_rol_id, tbl_permiso_perm_id)
    VALUES (p_rolId, p_permId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spInsertPersona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertPersona`(
    IN p_documento VARCHAR(45),
    IN p_nombres VARCHAR(45),
    IN p_apellidos VARCHAR(45),
    IN p_direccion VARCHAR(100),
    IN p_telefono VARCHAR(20),
    IN p_email VARCHAR(45),
    IN p_tipo_documento_id INT,
    IN p_ciudad_id INT,
    IN p_usuario VARCHAR(45),
	IN p_contrasena text,
    IN p_estado VARCHAR(15),
	IN p_rol_id INT,
	IN p_tipo int
)
BEGIN
    DECLARE last_person_id INT;
	DECLARE last_employee_id INT;
    
    IF NOT EXISTS (SELECT 1 FROM tbl_tipo_documento WHERE doc_id = p_tipo_documento_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El tipo documento seleccionado no existe';
    END IF;

    IF  p_tipo = 1  and NOT EXISTS ( SELECT 1 FROM tbl_rol WHERE rol_id = p_rol_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El rol seleccionado no existe';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM tbl_ciudad WHERE ciu_id = p_ciudad_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La ciudad seleccionada no existe para el departamento especificado';
    END IF;

	IF EXISTS (SELECT 1 FROM tbl_persona WHERE pers_identificacion = p_documento and tbl_tipo_documento_doc_id= p_tipo_documento_id) THEN
       SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El documento de identidad ingresado ya se encuentra registrado';
    END IF;
   
    IF  p_tipo = 1 and EXISTS (SELECT 1 FROM tbl_usuario WHERE usu_usuario = p_usuario)  THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El usuario ingresado ya se encuentra registrado';
    END IF;

    INSERT INTO tbl_persona (
        pers_identificacion, pers_nombre_razonsocial, pers_apellido, 
		pers_telefono, pers_direccion, pers_correo_electronico, tbl_tipo_documento_doc_id, tbl_ciudad_ciu_id
    ) 
    VALUES (
        p_documento, p_nombres, p_apellidos, 
        p_telefono, p_direccion, p_email, p_tipo_documento_id, p_ciudad_id
    );
    
	SET last_person_id = LAST_INSERT_ID();
   
    IF p_tipo = 1 then
		INSERT INTO tbl_empleado (tbl_persona_pers_id) VALUES (last_person_id);
        SET last_employee_id = LAST_INSERT_ID();
        INSERT INTO tbl_usuario(usu_usuario,usu_contrasena,usu_estado,usu_fecha_creacion,tbl_empleado_emp_id,tbl_rol_rol_id)VALUES(p_usuario,p_contrasena,p_estado,CURDATE(), last_employee_id ,p_rol_id);
    ELSEIF p_tipo = 2 THEN
		INSERT INTO tbl_cliente (tbl_persona_pers_id) VALUES ( last_person_id);
    ELSE 
		INSERT INTO tbl_proveedor (tbl_persona_pers_id) VALUES (last_person_id);
    END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spInsertProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertProduct`(
	IN p_cod_producto VARCHAR(45),
    IN p_nombre VARCHAR(45),
    IN p_descripcion VARCHAR(80), 
    IN p_cantidad_inventario INT, 
    IN p_numerolote VARCHAR(15), 
    IN p_fecha_vencimiento DATE,
    IN p_precio_venta DECIMAL,
    IN p_precio_compra DECIMAL,
    IN p_medida INT,
    IN p_fkcategoria INT,
    IN p_fkproveedor INT,
    IN p_fkunidadmedida INT,
    IN p_fkpresentacion INT)
BEGIN
	INSERT INTO tbl_producto(
		prod_cod_producto, prod_nombre, prod_descripcion, prod_cantidad_inventario,
		prod_numerolote, prod_fecha_vencimiento, prod_precio_venta, prod_precio_compra, prod_medida,
		tbl_categoria_cat_id, tbl_proveedor_prov_id, tbl_unidad_medida_und_id, tbl_presentacion_pres_id
	)values(
		p_cod_producto,p_nombre,p_descripcion,p_cantidad_inventario,p_numerolote, p_fecha_vencimiento,
		p_precio_venta, p_precio_compra, p_medida, p_fkcategoria, p_fkproveedor, p_fkunidadmedida, p_fkpresentacion
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spInsertRole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertRole`(
    IN p_role_name VARCHAR(45),
    IN p_role_description VARCHAR(80))
BEGIN
    INSERT INTO tbl_rol (rol_nombre, rol_descripcion)
    VALUES (p_role_name, p_role_description);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spInsertSupplier` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertSupplier`(
    IN p_fkpersona_id INT
)
BEGIN
    INSERT INTO tbl_proveedor (tbl_persona_pers_id)
    VALUES (p_fkpersona_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spInsertTypeDoc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertTypeDoc`(IN p_tipodoc VARCHAR(45))
begin
	insert into tbl_tipo_documento(doc_tipo_documento) 
    values(p_tipodoc);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spPermitDDL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spPermitDDL`()
BEGIN
    SELECT perm_id AS Id, perm_nombre AS Permiso FROM tbl_permiso;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spRoleDDL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spRoleDDL`()
BEGIN
    SELECT rol_id AS Id, rol_nombre AS Rol FROM tbl_rol;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSelectCiudad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSelectCiudad`()
BEGIN
    SELECT
	ciu.ciu_id as id,
	ciu.ciu_codigo as codigo,
	ciu.ciu_nombre as ciudad,
    dep.dep_id as dep_id,
	dep.dep_nombre as departamento
	FROM tbl_ciudad as ciu
    INNER JOIN tbl_departamento as dep ON ciu.tbl_departamento_dep_id=dep.dep_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSelectCiudadDDL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSelectCiudadDDL`(
IN p_depId int
)
BEGIN
    SELECT
	ciu.ciu_id as id,
	ciu.ciu_codigo as codigo,
	ciu.ciu_nombre as ciudad,
	dep.dep_nombre as departamento
	FROM tbl_ciudad as ciu
    INNER JOIN tbl_departamento as dep ON ciu.tbl_departamento_dep_id=dep.dep_id
    where dep.dep_id=p_depId or p_depId = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSelectCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSelectCliente`()
BEGIN
    SELECT 
		cli.cli_id AS ClienteID,
		per.pers_id as PersonaID,
		td.doc_id as TipoDocumentoID,
        td.doc_tipo_documento as TipoDocumento,
        per.pers_identificacion AS Identificacion,
        per.pers_nombre_razonsocial AS Nombre,
        per.pers_apellido AS Apellido,
        per.pers_telefono AS Telefono,
        per.pers_correo_electronico AS Correo,
         pa.pais_id as PaisId,
        pa.pais_nombre as Pais,
         d.dep_id as DepartamentoId,
        d.dep_nombre as Departamento,
		c.ciu_id as CiudadId,
        c.ciu_nombre as Ciudad,
        per.pers_direccion as Direccion
    FROM tbl_cliente as cli
    INNER JOIN tbl_persona AS per ON cli.tbl_persona_pers_id = per.pers_id
	INNER JOIN tbl_tipo_documento td ON per.tbl_tipo_documento_doc_id = td.doc_id
    INNER JOIN tbl_ciudad c ON per.tbl_ciudad_ciu_id = c.ciu_id
    INNER JOIN tbl_departamento d ON c.tbl_departamento_dep_id = d.dep_id
    INNER JOIN tbl_pais pa ON d.tbl_pais_pais_id = pa.pais_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSelectClienteDDL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSelectClienteDDL`()
BEGIN
        SELECT 
        cli.cli_id AS Id,
        CONCAT(per.pers_identificacion,' - ', per.pers_nombre_razonsocial, ' ', per.pers_apellido) AS NombreCompleto
    FROM tbl_cliente as cli
    INNER JOIN tbl_persona AS per ON cli.tbl_persona_pers_id = per.pers_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSelectCompraYDetalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSelectCompraYDetalle`()
BEGIN
    SELECT 
        c.comp_id AS CompraID,
        c.comp_fecha_compra AS FechaCompra,
        c.comp_total AS TotalCompra,
        d.detc_numero_factura AS NumeroFactura,
        d.detc_cantidad_comprada AS CantidadComprada,
        d.detc_precio_unitario AS PrecioUnitario,
        p.prod_id AS fkproduct,
        p.prod_cod_producto AS CodigoProducto,
        p.prod_nombre AS NombreProducto
    FROM tbl_compra AS c
    INNER JOIN tbl_detalle_compraproducto AS d ON c.comp_id = d.tbl_compra_comp_id
    INNER JOIN tbl_producto AS p ON d.tbl_producto_prod_id = p.prod_id
    ORDER BY c.comp_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSelectDepartamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSelectDepartamento`()
BEGIN
    SELECT
	dep.dep_id as id,
	dep.dep_codigo as codigo,
	dep.dep_nombre as departamento,
    pai.pais_id as pais_id,
	pai.pais_nombre as pais
	FROM tbl_departamento as dep
    INNER JOIN tbl_pais as pai ON dep.tbl_pais_pais_id=pai.pais_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSelectDepartamentoDDL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSelectDepartamentoDDL`(
IN p_paisId int
)
BEGIN
    SELECT
	dep.dep_id as id,
	dep.dep_codigo as codigo,
	dep.dep_nombre as departamento,
	pai.pais_nombre as pais
	FROM tbl_departamento as dep
    INNER JOIN tbl_pais as pai ON dep.tbl_pais_pais_id=pai.pais_id
    where pai.pais_id=p_paisId or p_paisId = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSelectInventario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSelectInventario`()
BEGIN
    SELECT 
		inv.inv_id AS Id,
		invpro.invp_cantidad_nueva AS "Cantidad Nueva",
        inv.inv_fecha_realizacion AS FechaInventario,
        inv.inv_observacion AS Observacion,
        pro.prod_id AS fkproducto,
        pro.prod_cod_producto AS CodigoProducto,
        pro.prod_nombre AS Producto,
        pro.prod_descripcion AS Descripcion,
        pro.prod_cantidad_inventario AS "Cantidad actual inventario",
        pro.prod_medida AS Medida,
        und.und_id AS fkunidadmedida,
        und.und_descripcion AS UnidadMedida,
        per.pers_id AS fkpersona,
        CONCAT(per.pers_identificacion," - ",per.pers_nombre_razonsocial, " ", per.pers_apellido) AS NombreEmpleado
    FROM tbl_inventario as inv
	INNER JOIN tbl_inventario_producto AS invpro ON invpro.tbl_inventario_inv_id = inv.inv_id
	INNER JOIN tbl_producto AS pro ON  invpro.tbl_producto_prod_id = pro.prod_id 
	INNER JOIN tbl_persona AS per ON inv.tbl_empleado_emp_id = per.pers_id
    INNER JOIN tbl_unidad_medida AS und ON pro.tbl_unidad_medida_und_id = und.und_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSelectInventarioDetalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSelectInventarioDetalle`(
    IN p_id_inventario INT
)
BEGIN
    -- Seleccionar información básica del inventario
    SELECT 
        inv.inv_id AS id_inventario,
        inv.inv_fecha_realizacion AS fecha,
        inv.inv_observacion AS observacion,
        per.pers_id AS fkempleado,
        CONCAT('Identificación: ',per.pers_identificacion,'.  Nombre: ',per.pers_nombre_razonsocial, ' ', per.pers_apellido) AS responsable
    FROM 
        tbl_inventario inv
    INNER JOIN tbl_empleado emp
        ON inv.tbl_empleado_emp_id = emp.emp_id
	INNER JOIN tbl_persona per
		ON emp.tbl_persona_pers_id = per.pers_id
    WHERE 
        inv.inv_id = p_id_inventario;

    -- Seleccionar productos asociados al inventario
    SELECT 
        prod.prod_id AS id_producto,
        prod.prod_nombre AS nombre_producto,
        prod.prod_descripcion AS descripcion_producto,
        invprod.invp_cantidad_nueva AS cantidad_nueva
    FROM 
        tbl_inventario_producto invprod
    INNER JOIN tbl_producto prod
        ON invprod.tbl_producto_prod_id = prod.prod_id
    WHERE 
        invprod.tbl_inventario_inv_id = p_id_inventario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSelectInventariosResumen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSelectInventariosResumen`()
BEGIN
    SELECT 
        inv.inv_id AS Id,
        inv.inv_fecha_realizacion AS FechaInventario,
        inv.inv_observacion AS Observacion,
        per.pers_id AS fkempleado,
        CONCAT('Identificación: ',per.pers_identificacion,'.  Nombre: ',per.pers_nombre_razonsocial, ' ', per.pers_apellido) AS NombreResponsable
    FROM 
        tbl_inventario inv
    INNER JOIN tbl_empleado emp
        ON inv.tbl_empleado_emp_id = emp.emp_id
	INNER JOIN tbl_persona per
		ON emp.tbl_persona_pers_id = per.pers_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSelectPais` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSelectPais`()
BEGIN
    SELECT 
	pais_id as id,
	pais_codigo as codigo,
	pais_nombre as pais
	FROM tbl_pais;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSelectPaisDDL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSelectPaisDDL`()
BEGIN
    SELECT 
	pais_id as id,
	pais_codigo as codigo,
	pais_nombre as pais
	FROM tbl_pais;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSelectPersona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSelectPersona`()
SELECT 
        p.pers_identificacion AS Identificacion,
        p.pers_nombre_razonsocial AS Nombres,
        p.pers_apellido AS Apellido,
        p.pers_telefono AS Telefono,
        p.pers_direccion AS Direccion,
        p.pers_correo_electronico AS Email,
        td.doc_tipo_documento AS TipoDocumento,
        pa.pais_nombre AS Pais,
        d.dep_nombre AS Departamento,
        c.ciu_nombre AS Ciudad
    FROM tbl_persona p
    INNER JOIN tbl_tipo_documento td ON p.tbl_tipo_documento_doc_id = td.doc_id
    INNER JOIN tbl_ciudad c ON p.tbl_ciudad_ciu_id = c.ciu_id
    INNER JOIN tbl_departamento d ON c.tbl_departamento_dep_id = d.dep_id
    INNER JOIN tbl_pais pa ON d.tbl_pais_pais_id = pa.pais_id ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSelectPersonaById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSelectPersonaById`(IN p_persona_id INT)
BEGIN
    SELECT per.pers_identificacion AS Identificacion, 
    per.pers_nombre_razonsocial AS Nombre, 
    per.pers_apellido AS Apellido, 
    per.pers_telefono AS Telefono, 
    per.pers_correo_electronico AS Email
    FROM tbl_persona per
    WHERE per.pers_id = p_persona_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSelectPersonaDDL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSelectPersonaDDL`()
BEGIN
SELECT
	pers_id as Id,
	CONCAT(pers_nombre_razonsocial, ' ', pers_apellido) AS NombreCompleto
    FROM tbl_persona;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSelectProductDDL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSelectProductDDL`()
BEGIN
    SELECT prod_id AS Id, prod_nombre AS Producto FROM tbl_producto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spSelectProductos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
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
	    cat.cat_id AS fkcategory,        
        cat.cat_descripcion AS Categoria,   
		pers.pers_id as fkproveedor,
        pers.pers_nombre_razonsocial AS NombreProveedor,
        pers.pers_apellido AS ApellidoProveedor,
        und.und_id AS fkunidadmedida,
        und.und_descripcion AS UnidadMedida,
        present.pres_id AS fkpresentacion,
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spTypeDocDDL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spTypeDocDDL`()
BEGIN
    SELECT doc_id AS Id, doc_tipo_documento AS TipoDocumento FROM tbl_tipo_documento;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spUpdateCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdateCategory`(
    IN p_cat_id INT,
    IN p_descripcion VARCHAR(45)
)
BEGIN
    UPDATE tbl_categoria 
    SET cat_descripcion = p_descripcion
    WHERE cat_id = p_cat_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spUpdateCiudad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdateCiudad`(
    IN p_id INT,
    IN p_codigo VARCHAR(45),
    IN p_nombre VARCHAR(80),
    IN p_dep_id INT
)
BEGIN
    UPDATE tbl_ciudad
    SET ciu_codigo = p_codigo,
        ciu_nombre = p_nombre,
        tbl_departamento_dep_id = p_dep_id
    WHERE ciu_id = p_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spUpdateCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdateCliente`(
    IN p_cliente_id INT,
    IN p_fkpersona_id INT
)
BEGIN
    UPDATE tbl_cliente
    SET tbl_persona_pers_id = p_fkpersona_id
    WHERE cliente_id = p_cliente_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spUpdateCompraYDetalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdateCompraYDetalle`(
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

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spUpdateEmployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdateEmployee`(
    IN p_emp_id INT,
    IN p_persona_id INT
)
BEGIN
    UPDATE tbl_empleado 
    SET tbl_persona_pers_id = p_persona_id
    WHERE emp_id = p_emp_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spUpdateInventario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdateInventario`(
    IN p_inv_id INT,
    IN p_prod_id INT,
    IN p_nueva_cantidad INT,
    IN p_inv_fecha DATE,
    IN p_inv_observacion TEXT,
    IN p_emp_id INT
)
BEGIN
    -- Verificar si el registro en tbl_inventario existe
    IF EXISTS (SELECT 1 FROM tbl_inventario WHERE inv_id = p_inv_id) THEN
        -- Actualizar la cantidad en el producto
        UPDATE tbl_producto
        SET prod_cantidad_inventario = p_nueva_cantidad
        WHERE prod_id = p_prod_id;

        -- Actualizar los detalles en tbl_inventario
        UPDATE tbl_inventario
        SET inv_cantidad = p_nueva_cantidad,
            inv_fecha_realizacion = p_inv_fecha,
            inv_observacion = p_inv_observacion,
            tbl_producto_prod_id = p_prod_id,
            tbl_empleado_emp_id = p_emp_id
        WHERE inv_id = p_inv_id;
    ELSE
        -- Si no existe el registro de inventario, lanzar un error
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El registro de inventario especificado no existe.';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spUpdatepais` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdatepais`(
    IN p_id INT,
    IN p_codigo VARCHAR(45),
    IN p_nombre VARCHAR(45)
)
BEGIN
    UPDATE tbl_pais
    SET pais_codigo = p_codigo,
        pais_nombre = p_nombre
    WHERE pais_id = p_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spUpdatePermit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdatePermit`(IN p_permId INT, IN p_permNombre VARCHAR(45), IN p_permDescripcion VARCHAR(255))
BEGIN
    UPDATE tbl_permiso
    SET perm_nombre = p_permNombre, 
        perm_descripcion = p_permDescripcion
    WHERE perm_id = p_permId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spUpdatePersona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdatePersona`(
    IN p_documento VARCHAR(45),
    IN p_nombres VARCHAR(45),
    IN p_apellidos VARCHAR(45),
    IN p_direccion VARCHAR(100),
    IN p_telefono VARCHAR(20),
    IN p_email VARCHAR(45),
    IN p_tipo_documento_id INT,
    IN p_ciudad_id INT,
    IN p_usuario VARCHAR(45),
	IN p_contrasena text,
    IN p_estado VARCHAR(15),
	IN p_rol_id INT,
	IN p_tipo int,
    IN p_usu_id int,
    IN p_pers_id int
)
BEGIN
  
    IF NOT EXISTS (SELECT 1 FROM tbl_tipo_documento WHERE doc_id = p_tipo_documento_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El tipo documento seleccionado no existe';
    END IF;
    
    IF  p_tipo = 1 and NOT EXISTS (SELECT 1 FROM tbl_rol WHERE rol_id = p_rol_id ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El rol seleccionado no existe';
    END IF;
    
    IF NOT EXISTS (SELECT 1 FROM tbl_ciudad WHERE ciu_id = p_ciudad_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La ciudad seleccionada no existe para el departamento especificado';
    END IF;

	IF EXISTS (SELECT 1 FROM tbl_persona WHERE pers_identificacion = p_documento and tbl_tipo_documento_doc_id= p_tipo_documento_id and  pers_id <> p_pers_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El documento de identidad ingresado ya se encuentra registrado';
    END IF;
    
    IF  p_tipo = 1 and EXISTS (SELECT 1 FROM tbl_usuario WHERE usu_usuario = p_usuario and usu_id <> p_usu_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El usuario ingresado ya se encuentra registrado';
    END IF;
        
    UPDATE tbl_persona
    SET 
        pers_identificacion = p_documento,
        pers_nombre_razonsocial = p_nombres,
        pers_apellido = p_apellidos,
        pers_telefono = p_telefono,
        pers_direccion = p_direccion,
        pers_correo_electronico = p_email,
        tbl_tipo_documento_doc_id = p_tipo_documento_id,
        tbl_ciudad_ciu_id = p_ciudad_id
    WHERE 
        pers_id = p_pers_id;
    
    IF p_tipo = 1 then
        UPDATE tbl_usuario
		SET
			usu_usuario = p_usuario,
			usu_contrasena = p_contrasena,
			usu_estado = p_estado,
			tbl_rol_rol_id = p_rol_id
		WHERE usu_id = p_usu_id;
    END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spUpdateProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdateProducto`(
    IN p_prod_id INT, 
    IN p_cod_producto VARCHAR(45),
    IN p_nombre VARCHAR(45),
    IN p_descripcion VARCHAR(80), 
    IN p_cantidad_inventario INT, 
    IN p_numerolote VARCHAR(15), 
    IN p_fecha_vencimiento DATE,
    IN p_precio_venta DECIMAL,
    IN p_precio_compra DECIMAL,
    IN p_medida INT,
    IN p_fkcategoria INT,
    IN p_fkproveedor INT,
    IN p_fkunidadmedida INT,
    IN p_fkpresentacion INT
)
BEGIN
    UPDATE tbl_producto
    SET 
        prod_cod_producto = p_cod_producto,
        prod_nombre = p_nombre,
        prod_descripcion = p_descripcion,
        prod_cantidad_inventario = p_cantidad_inventario,
        prod_numerolote = p_numerolote,
        prod_fecha_vencimiento = p_fecha_vencimiento,
        prod_precio_venta = p_precio_venta,
        prod_precio_compra = p_precio_compra,
        prod_medida = p_medida,
        tbl_categoria_cat_id = p_fkcategoria,
        tbl_proveedor_prov_id = p_fkproveedor,
        tbl_unidad_medida_und_id = p_fkunidadmedida,
        tbl_presentacion_pres_id = p_fkpresentacion
    WHERE 
        prod_id = p_prod_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spUpdateRole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdateRole`(
    IN p_role_id INT,
    IN p_role_name VARCHAR(45),
    IN p_role_description VARCHAR(80))
BEGIN
    UPDATE tbl_rol
    SET 
        rol_nombre = p_role_name,
        rol_descripcion = p_role_description
    WHERE rol_id = p_role_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spUpdateSupplier` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdateSupplier`(
    IN p_pro_id INT,
    IN p_persona_id INT
)
BEGIN
    UPDATE tbl_proveedor 
    SET tbl_persona_pers_id = p_persona_id
    WHERE prov_id = p_pro_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spUpdateTypeDoc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdateTypeDoc`(IN p_docId INT, IN p_tipodoc VARCHAR(45))
BEGIN
    UPDATE tbl_tipo_documento
    SET doc_tipo_documento = p_tipodoc
    WHERE doc_id = p_docId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_actualizar_departamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizar_departamento`(
    IN p_id INT,
    IN p_codigo VARCHAR(45),
    IN p_nombre VARCHAR(80),
    IN p_pais_id INT
)
BEGIN
    UPDATE tbl_departamento
    SET dep_codigo = p_codigo,
        dep_nombre = p_nombre,
        tbl_pais_pais_id = p_pais_id
    WHERE dep_id = p_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_actualizar_devolucion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizar_devolucion`(
    IN p_dev_id INT,
    IN p_dev_fecha_devolucion DATE,
    IN p_dev_motivo TEXT,
    IN p_vent_id INT
)
BEGIN
    UPDATE tbl_devolucion
    SET dev_fecha_devolucion = p_dev_fecha_devolucion,
        dev_motivo = p_dev_motivo,
        tbl_venta_vent_id = p_vent_id
    WHERE dev_id = p_dev_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_actualizar_presentacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizar_presentacion`(
    IN p_pres_id INT,
    IN p_pres_descripcion VARCHAR(45)
)
BEGIN
    UPDATE tbl_presentacion
    SET pres_descripcion = p_pres_descripcion
    WHERE pres_id = p_pres_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_actualizar_unidad_medida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizar_unidad_medida`(
    IN p_und_id INT,
    IN p_und_descripcion VARCHAR(45)
)
BEGIN
    UPDATE tbl_unidad_medida
    SET und_descripcion = p_und_descripcion
    WHERE und_id = p_und_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_actualizar_venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizar_venta`(
    IN p_vent_id INT,
    IN p_vent_fecha DATE,
    IN p_vent_total DECIMAL(10,0),
    IN p_vent_descripcion TEXT,
    IN p_cli_id INT,
    IN p_emp_id INT
)
BEGIN
    UPDATE tbl_venta
    SET vent_fecha = p_vent_fecha,
        vent_total = p_vent_total,
        vent_descripcion = p_vent_descripcion,
        tbl_cliente_cli_id = p_cli_id,
        tbl_empleado_emp_id = p_emp_id
    WHERE vent_id = p_vent_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_eliminar_departamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminar_departamento`(
    IN p_id INT
)
BEGIN
    DELETE FROM tbl_departamento WHERE dep_id = p_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_eliminar_devolucion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminar_devolucion`(
    IN p_dev_id INT
)
BEGIN
    DELETE FROM tbl_devolucion WHERE dev_id = p_dev_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_eliminar_presentacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminar_presentacion`(
    IN p_pres_id INT
)
BEGIN
    DELETE FROM tbl_presentacion
    WHERE pres_id = p_pres_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_eliminar_unidad_medida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminar_unidad_medida`(
    IN p_und_id INT
)
BEGIN
    DELETE FROM tbl_unidad_medida
    WHERE und_id = p_und_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_eliminar_venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminar_venta`(
    IN p_vent_id INT
)
BEGIN
    DELETE FROM tbl_venta WHERE vent_id = p_vent_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertar_devolucion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_devolucion`(
    IN p_dev_fecha_devolucion DATE,
    IN p_dev_motivo TEXT,
    IN p_vent_id INT
)
BEGIN
    INSERT INTO tbl_devolucion (dev_fecha_devolucion, dev_motivo, tbl_venta_vent_id)
    VALUES (p_dev_fecha_devolucion, p_dev_motivo, p_vent_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertar_presentacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_presentacion`(
    IN p_pres_descripcion VARCHAR(45)
)
BEGIN
    INSERT INTO tbl_presentacion (pres_descripcion) 
    VALUES (p_pres_descripcion);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertar_unidad_medida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_unidad_medida`(
    IN p_und_descripcion VARCHAR(45)
)
BEGIN
    INSERT INTO tbl_unidad_medida (und_descripcion) 
    VALUES (p_und_descripcion);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertar_venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_venta`(
    IN p_vent_fecha DATE,
    IN p_vent_total DECIMAL(10,0),
    IN p_vent_descripcion TEXT,
    IN p_cli_id INT,
    IN p_emp_id INT
)
BEGIN
    INSERT INTO tbl_venta (vent_fecha, vent_total, vent_descripcion, tbl_cliente_cli_id, tbl_empleado_emp_id)
    VALUES (p_vent_fecha, p_vent_total, p_vent_descripcion, p_cli_id, p_emp_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_login_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_login_user`(
    IN p_username varchar(500),
    IN p_password varchar(500)
)
BEGIN
  SELECT usu.usu_id,usu.usu_usuario as usuario, per.pers_nombre_razonsocial as nombres, per.pers_apellido as apellidos, per.pers_correo_electronico as correo, usu.tbl_rol_rol_id, rol.rol_nombre, 
    (
        SELECT GROUP_CONCAT(p.tbl_permiso_perm_id SEPARATOR ',')
        FROM tbl_rolpermiso p
        WHERE p.tbl_rol_rol_id = rol.rol_id
    ) as privilegios FROM tbl_usuario as usu 
  INNER JOIN tbl_empleado as emp ON emp.emp_id = usu.tbl_empleado_emp_id
	INNER JOIN tbl_persona as per ON per.pers_id = emp.tbl_persona_pers_id
	INNER JOIN tbl_rol as rol ON rol.rol_id = usu.tbl_rol_rol_id
	WHERE usu_usuario = p_username AND usu_contrasena = p_password AND usu_estado = 'Activo';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mostrar_devoluciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrar_devoluciones`()
BEGIN
      SELECT 
        d.dev_id, 
        d.dev_fecha_devolucion, 
        d.dev_motivo, 
        v.vent_id, 
        v.vent_fecha, 
        v.vent_total, 
        v.vent_descripcion,
        -- Información del empleado (quien procesó la venta)
        p_e.pers_identificacion AS identificacion_empleado,  
        p_e.pers_nombre_razonsocial AS nombre_empleado, 
        -- Información del cliente (quien realizó la compra)
        p_c.pers_identificacion AS identificacion_cliente,
        p_c.pers_nombre_razonsocial AS nombre_cliente, 
        p_c.pers_apellido AS apellido_cliente
    FROM 
        tbl_devolucion d
    LEFT JOIN 
        tbl_venta v ON d.tbl_venta_vent_id = v.vent_id
    LEFT JOIN 
        tbl_empleado e ON v.tbl_empleado_emp_id = e.emp_id
    LEFT JOIN 
        tbl_persona p_e ON e.tbl_persona_pers_id = p_e.pers_id  -- Empleado
    LEFT JOIN 
        tbl_cliente c ON v.tbl_cliente_cli_id = c.cli_id
    LEFT JOIN 
        tbl_persona p_c ON c.tbl_persona_pers_id = p_c.pers_id  -- Cliente
        ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mostrar_presentacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrar_presentacion`()
BEGIN
    SELECT pres_id, pres_descripcion FROM tbl_presentacion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mostrar_unidad_medida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrar_unidad_medida`()
BEGIN
    SELECT und_id, und_descripcion FROM tbl_unidad_medida;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mostrar_ventas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrar_ventas`()
BEGIN
   SELECT 
    v.vent_id AS referencia,  
    v.vent_Fecha AS fecha,
    v.vent_total AS total,
    v.vent_descripcion AS descripcion,
    p_e.pers_nombre_razonsocial AS nombre_empleado, 
    p_e.pers_apellido AS apellido_empleado, 
    p_c.pers_identificacion AS identificacion_cliente,
    p_c.pers_nombre_razonsocial AS nombre_cliente, 
    p_c.pers_apellido AS apellido_cliente
FROM 
    tbl_venta v
LEFT JOIN 
    tbl_empleado e ON v.tbl_empleado_emp_id = e.emp_id
LEFT JOIN 
    tbl_persona p_e ON e.tbl_persona_pers_id = p_e.pers_id
LEFT JOIN 
    tbl_cliente c ON v.tbl_cliente_cli_id = c.cli_id
LEFT JOIN 
    tbl_persona p_c ON c.tbl_persona_pers_id = p_c.pers_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-26 15:21:42
