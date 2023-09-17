# ************************************************************
# Sequel Pro SQL dump
# Versión 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.4.11-MariaDB)
# Base de datos: db_curso
# Tiempo de Generación: 2020-07-21 10:47:01 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Volcado de tabla clientes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `clientes`;

CREATE TABLE `clientes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `identificacion` varchar(50) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;

INSERT INTO `clientes` (`id`, `identificacion`, `nombre`, `telefono`, `correo`, `direccion`, `pais`, `ciudad`)
VALUES
	(1,'99999999','Jimmy A. Castellanos','588883838','micorreo2@dominio.com','Calle 1 # 2 - 4','Colombia','Valledupar'),
	(2,'8888888','Fulano De Tal','5555433','micorreo@dominio.com','Calle 4 # 5 - 6','Colombia','Bogota'),
	(3,'77766663','Comercial las plazas','888377377','comercial@plazas.com','Av XXXX 123','Colombia','Cali');

/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla pedidos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pedidos`;

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) DEFAULT 0,
  `fecha` timestamp NULL DEFAULT NULL,
  `usuario_id` int(11) DEFAULT 0,
  `estado` int(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;

INSERT INTO `pedidos` (`id`, `cliente_id`, `fecha`, `usuario_id`, `estado`)
VALUES
	(1,2,'2020-07-01 00:00:00',2,1),
	(2,3,'2020-07-10 08:24:37',1,0);

/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla pedidos_detalle
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pedidos_detalle`;

CREATE TABLE `pedidos_detalle` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) DEFAULT 0,
  `pedido_id` int(11) DEFAULT 0,
  `cantidad` int(11) DEFAULT 0,
  `precio` decimal(18,2) DEFAULT 0.00,
  PRIMARY KEY (`id`),
  KEY `relacion_pedido` (`pedido_id`),
  CONSTRAINT `relacion_pedido` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `pedidos_detalle` WRITE;
/*!40000 ALTER TABLE `pedidos_detalle` DISABLE KEYS */;

INSERT INTO `pedidos_detalle` (`id`, `producto_id`, `pedido_id`, `cantidad`, `precio`)
VALUES
	(1,1,1,2,12000.00),
	(3,8,2,3,30000.00),
	(4,1,2,4,12000.00);

/*!40000 ALTER TABLE `pedidos_detalle` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla productos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `productos`;

CREATE TABLE `productos` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `stock` int(11) DEFAULT 100,
  `precio` decimal(18,2) DEFAULT 0.00,
  `activo` int(1) DEFAULT 1,
  `imagen` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;

INSERT INTO `productos` (`id`, `codigo`, `nombre`, `stock`, `precio`, `activo`, `imagen`)
VALUES
	(1,'0001','Producto 0001',95,12000.00,1,'imagenes/1595321151.jpg'),
	(7,'0003','Teléfono inalambrico',30,40000.00,1,NULL),
	(8,'0004','Teléfono móvil',100,30000.00,1,NULL),
	(9,'0006','Teléfono Satelital',5,350000.00,1,NULL),
	(10,'0007','Televisor 65\"',90,25000000.00,NULL,NULL),
	(11,'0008','Carro de control',10,56000.00,1,NULL),
	(12,'0009','Prueba 0009',1,1.00,1,NULL),
	(13,'0010','iPhone XS MAX',3,35000000.00,1,'imagenes/1595321533.jpg');

/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla usuarios
# ------------------------------------------------------------

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) DEFAULT NULL,
  `clave` text DEFAULT NULL,
  `nombre` varchar(150) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `activo` int(1) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;

INSERT INTO `usuarios` (`id`, `usuario`, `clave`, `nombre`, `telefono`, `correo`, `activo`)
VALUES
	(1,'usuario1','14e1b600b1fd579f47433b88e8d85291','Jimmy Castellanos','444444','micorreo@dominio.com',1);

/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
