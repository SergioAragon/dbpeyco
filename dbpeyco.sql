-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 29-10-2017 a las 19:55:56
-- Versión del servidor: 5.7.19
-- Versión de PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbfinalpeyco`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agenda`
--

DROP TABLE IF EXISTS `agenda`;
CREATE TABLE IF NOT EXISTS `agenda` (
  `id_agenda` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  `empleado_id` int(11) NOT NULL,
  `detalle_fase_id_df` int(11) NOT NULL,
  PRIMARY KEY (`id_agenda`),
  KEY `fk_agen_emple` (`empleado_id`),
  KEY `fk_agenda_detalle_fase1_idx` (`detalle_fase_id_df`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clasificacion`
--

DROP TABLE IF EXISTS `clasificacion`;
CREATE TABLE IF NOT EXISTS `clasificacion` (
  `id_clasifi` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  PRIMARY KEY (`id_clasifi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clasificacion`
--

INSERT INTO `clasificacion` (`id_clasifi`, `descripcion`) VALUES
(1, 'sillas'),
(2, 'mesas'),
(3, 'muebles');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(20) NOT NULL,
  `apellidos` varchar(20) NOT NULL,
  `cedula` int(11) DEFAULT NULL,
  `telefono` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password_hash` varchar(60) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `access_token` varchar(250) DEFAULT NULL,
  `activate` int(11) NOT NULL DEFAULT '1',
  `status` int(11) DEFAULT '10',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `role` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombres`, `apellidos`, `cedula`, `telefono`, `username`, `email`, `password_hash`, `auth_key`, `access_token`, `activate`, `status`, `created_at`, `updated_at`, `role`) VALUES
(10, 'Lola', 'Lopez', NULL, 8775869, 'lola', 'lola@yahoo.com', '$2y$13$WNrtvOTibzH4a3CC.yxLSOwrEXz3emcGu6OZUwvtmC838CFzX54Ai', 'T52xQEIP-wnSFPHlH-yLqAaS47pYNvEt', NULL, 1, 10, '2017-10-22 07:16:24', '2017-10-22 07:16:24', 1),
(11, 'Admin', 'Administrador', NULL, 444, 'admin', 'admin@yahoo.com', '$2y$13$WXuAXZl0ADdat4LBrjremOEQHvY2x/0jX7.oGHw.HS0/LhRaIRuyW', 'OAOHMbZXfkfo3e2t9YMs_EFHL6LZAvwQ', NULL, 1, 10, '2017-10-22 08:39:04', '2017-10-22 08:39:04', 2),
(12, 'Juan Jose', 'Torres', NULL, 6748, 'juan', 'juan@yahoo.com', '$2y$13$I2Z0bIlixNOWEC7GOS0ddeGCxfVTTu6S5PUnIGEaDlArTmXciqBSO', 'OnSlzY5KK72IwiahrOdXQYKOrM6xLove', NULL, 1, 10, '2017-10-22 10:39:50', '2017-10-22 10:39:50', 1),
(13, 'Carlos', 'Fuentes', NULL, 9089, 'carlos', 'carlos@yahoo.com', '$2y$13$r.gw2kuKp8hesh4Pb1tsWOXXNtG6ON6lKpaKrg6rCVyippF/LHNEW', 'xujd8eo3fBSg9O4AIUDcfC5tGv-WPca9', NULL, 1, 10, '2017-10-22 12:13:30', '2017-10-22 12:13:30', 1),
(14, 'Tata', 'Grass', NULL, 36578, 'tata', 'tata@yahoo.com', '$2y$13$RaEl5KX66nkge9V2C6WhfepXtj2mW0eS7qRYWmhHumH.Ax93pI8nq', 'lgUqHcj2v-c1V1FaYjKgvsqIsNIxTm9E', NULL, 1, 10, '2017-10-22 15:37:39', '2017-10-22 15:37:39', 1),
(15, 'Juaquin', 'Jaramillo', NULL, 678900, 'juaco', 'juaco@yahoo.com', '$2y$13$kwCLZCz/CNDT2tUPr.07gufvc.aTks1zvVTDi.9CoBwY/36HLw6T6', 'lpFwxMriToOYy9e6bjmIc4kYKDEQHlxG', NULL, 1, 10, '2017-10-22 21:06:03', '2017-10-22 21:06:03', 1),
(16, 'Manuel', 'Martinez', NULL, 78790, 'manu', 'manu@yahoo.com', '$2y$13$tgv8HBxaltCrig4IHSHHse8oLjOh05HpUhqaQFsBimRTgR/qxS4Qq', 'V3RsSWEO3WwiXANUDx_qvD-Yak2xYML9', NULL, 1, 10, '2017-10-25 23:58:17', '2017-10-25 23:58:17', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `color`
--

DROP TABLE IF EXISTS `color`;
CREATE TABLE IF NOT EXISTS `color` (
  `id_color` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `num_color` varchar(20) NOT NULL,
  PRIMARY KEY (`id_color`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `color`
--

INSERT INTO `color` (`id_color`, `nombre`, `num_color`) VALUES
(1, 'verde', '5894859'),
(2, 'azul', '398390'),
(3, 'rojo', '39032'),
(4, 'amarillo', '498094');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion`
--

DROP TABLE IF EXISTS `cotizacion`;
CREATE TABLE IF NOT EXISTS `cotizacion` (
  `id_cotizacion` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_cotizacion`),
  KEY `fk_coti_client` (`cliente_id`),
  KEY `productos_id` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

DROP TABLE IF EXISTS `departamento`;
CREATE TABLE IF NOT EXISTS `departamento` (
  `id_departamento` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  PRIMARY KEY (`id_departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`id_departamento`, `descripcion`) VALUES
(1, 'dep1'),
(2, 'dep2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_cotizacion_productos`
--

DROP TABLE IF EXISTS `detalle_cotizacion_productos`;
CREATE TABLE IF NOT EXISTS `detalle_cotizacion_productos` (
  `id_dcp` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) NOT NULL,
  `cotizacion_id` int(11) NOT NULL,
  `total_cotizacion` int(11) NOT NULL,
  PRIMARY KEY (`id_dcp`),
  KEY `fk_dcp_pro` (`producto_id`),
  KEY `fk_dcp_co` (`cotizacion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_fase`
--

DROP TABLE IF EXISTS `detalle_fase`;
CREATE TABLE IF NOT EXISTS `detalle_fase` (
  `id_df` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_e` date NOT NULL,
  `fecha_s` date NOT NULL,
  `fecha_cambioF` date NOT NULL,
  `fase_id` int(11) NOT NULL,
  `dStand_id` int(11) NOT NULL,
  `estado_id` int(11) NOT NULL,
  PRIMARY KEY (`id_df`),
  KEY `fk_df_fa` (`fase_id`),
  KEY `fase_id` (`fase_id`),
  KEY `estado_id` (`estado_id`),
  KEY `dStand_id` (`dStand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_material_pedido`
--

DROP TABLE IF EXISTS `detalle_material_pedido`;
CREATE TABLE IF NOT EXISTS `detalle_material_pedido` (
  `id_dmp` int(11) NOT NULL AUTO_INCREMENT,
  `material_id` int(11) NOT NULL,
  `costo` varchar(25) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  PRIMARY KEY (`id_dmp`),
  KEY `fk_dmds_mate` (`material_id`),
  KEY `fk_detalle_material_detalle_stand_pedido1_idx` (`pedido_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_producto_color`
--

DROP TABLE IF EXISTS `detalle_producto_color`;
CREATE TABLE IF NOT EXISTS `detalle_producto_color` (
  `id_dpc` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `estado_id` int(11) NOT NULL,
  PRIMARY KEY (`id_dpc`),
  KEY `fk_dpc_color` (`color_id`),
  KEY `fk_dpc_producto` (`producto_id`),
  KEY `estado_id` (`estado_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_producto_color`
--

INSERT INTO `detalle_producto_color` (`id_dpc`, `producto_id`, `color_id`, `cantidad`, `estado_id`) VALUES
(27, 112, 1, 4, 1),
(28, 112, 2, 4, 1),
(29, 21, 2, 6, 1),
(30, 21, 3, 6, 1),
(31, 22, 2, 14, 1),
(32, 22, 4, 14, 1),
(33, 23, 1, 4, 2),
(34, 23, 4, 4, 2),
(35, 24, 1, 14, 1),
(36, 24, 2, 14, 1),
(37, 25, 1, 9, 2),
(38, 25, 4, 9, 2),
(39, 10, 2, 4, 1),
(40, 26, 1, 16, 2),
(41, 26, 4, 16, 2),
(42, 27, 3, 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_producto_material`
--

DROP TABLE IF EXISTS `detalle_producto_material`;
CREATE TABLE IF NOT EXISTS `detalle_producto_material` (
  `id_dpm` int(11) NOT NULL AUTO_INCREMENT,
  `materiales_id` int(11) NOT NULL,
  `producto_id_producto` int(11) NOT NULL,
  `estado_id` int(11) NOT NULL,
  PRIMARY KEY (`id_dpm`),
  KEY `fk_dpm_mateId` (`materiales_id`),
  KEY `fk_detalle_producto_material_producto1_idx` (`producto_id_producto`),
  KEY `estado_id` (`estado_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_producto_material`
--

INSERT INTO `detalle_producto_material` (`id_dpm`, `materiales_id`, `producto_id_producto`, `estado_id`) VALUES
(13, 2, 112, 1),
(14, 2, 21, 1),
(15, 2, 22, 1),
(16, 1, 23, 2),
(17, 2, 24, 1),
(18, 2, 25, 2),
(19, 2, 10, 1),
(20, 2, 26, 2),
(21, 1, 27, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_stand`
--

DROP TABLE IF EXISTS `detalle_stand`;
CREATE TABLE IF NOT EXISTS `detalle_stand` (
  `id_ds` int(11) NOT NULL,
  `detalleMP_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `estado_id` int(11) NOT NULL,
  PRIMARY KEY (`id_ds`),
  KEY `fk_ds_produc` (`producto_id`),
  KEY `fk_ds_dms` (`detalleMP_id`),
  KEY `estado_id` (`estado_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_stand_producto`
--

DROP TABLE IF EXISTS `detalle_stand_producto`;
CREATE TABLE IF NOT EXISTS `detalle_stand_producto` (
  `id_dsp` int(11) NOT NULL AUTO_INCREMENT,
  `ds_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `total_productos` int(11) NOT NULL,
  PRIMARY KEY (`id_dsp`),
  KEY `ds_id` (`ds_id`),
  KEY `producto_id` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

DROP TABLE IF EXISTS `empleado`;
CREATE TABLE IF NOT EXISTS `empleado` (
  `id_empleado` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `estado_id` int(11) NOT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `estado_id` (`estado_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

DROP TABLE IF EXISTS `estado`;
CREATE TABLE IF NOT EXISTS `estado` (
  `id_estado` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_estado`, `descripcion`) VALUES
(1, 'activo'),
(2, 'inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_stand`
--

DROP TABLE IF EXISTS `factura_stand`;
CREATE TABLE IF NOT EXISTS `factura_stand` (
  `id_fs` int(11) NOT NULL AUTO_INCREMENT,
  `dsp_id` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  PRIMARY KEY (`id_fs`),
  KEY `dsp_id` (`dsp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fase`
--

DROP TABLE IF EXISTS `fase`;
CREATE TABLE IF NOT EXISTS `fase` (
  `id_fase` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  PRIMARY KEY (`id_fase`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fase`
--

INSERT INTO `fase` (`id_fase`, `descripcion`) VALUES
(1, 'cotizacion'),
(2, 'diseño'),
(3, 'fabricacion'),
(4, 'montaje');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materiales`
--

DROP TABLE IF EXISTS `materiales`;
CREATE TABLE IF NOT EXISTS `materiales` (
  `id_mate` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`id_mate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `materiales`
--

INSERT INTO `materiales` (`id_mate`, `nombre`) VALUES
(1, 'madera'),
(2, 'acero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipio`
--

DROP TABLE IF EXISTS `municipio`;
CREATE TABLE IF NOT EXISTS `municipio` (
  `id_municipio` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(20) NOT NULL,
  `departamento_id` int(11) NOT NULL,
  PRIMARY KEY (`id_municipio`),
  KEY `departamento_id` (`departamento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `municipio`
--

INSERT INTO `municipio` (`id_municipio`, `descripcion`, `departamento_id`) VALUES
(1, 'mun1', 1),
(2, 'mun1', 1),
(3, 'mun2', 2),
(4, 'mun2', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

DROP TABLE IF EXISTS `pedido`;
CREATE TABLE IF NOT EXISTS `pedido` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) DEFAULT NULL,
  `fecha_pedido` datetime NOT NULL,
  `estado_id` int(11) DEFAULT '1',
  `municipio_id` int(11) DEFAULT '1',
  `direccion` varchar(20) NOT NULL,
  `medidas` varchar(20) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `estado_id` (`estado_id`),
  KEY `municipio_id` (`municipio_id`),
  KEY `cliente_id` (`cliente_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `cod_clasifi` int(11) NOT NULL,
  `dimension_producto` varchar(20) NOT NULL,
  `imag_adju` varchar(20) NOT NULL,
  `unidades` int(11) NOT NULL,
  `costo` varchar(20) NOT NULL,
  `estado_id` int(11) NOT NULL,
  `color_id` int(11) DEFAULT NULL,
  `cantidad_color` int(11) NOT NULL,
  `materiales_id` int(11) NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `fk_producto_clas` (`cod_clasifi`),
  KEY `estado_id` (`estado_id`),
  KEY `color_id` (`color_id`),
  KEY `materiales_id` (`materiales_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `nombre`, `cod_clasifi`, `dimension_producto`, `imag_adju`, `unidades`, `costo`, `estado_id`, `color_id`, `cantidad_color`, `materiales_id`) VALUES
(10, 'Logo', 2, '4x4', 'logo.jpg', 4, '400000', 1, NULL, 4, 2),
(21, 'SillaLight', 1, '4567', 'silla2.jpg', 8, '34000', 1, NULL, 6, 2),
(22, 'Silla Giratoria', 1, '3547', 'silla3.jpg', 32, '26000', 1, NULL, 14, 2),
(23, 'Sillon', 3, '4567', 'mueble.jpg', 8, '345000', 2, NULL, 4, 1),
(24, 'Mueble Par', 3, '3456', 'mueble2.jpg', 32, '45000', 1, NULL, 14, 2),
(25, 'Torre', 2, '5678', 'torre.jpg', 32, '56000', 2, NULL, 9, 2),
(26, 'Mesa Light', 2, '3575', 'mesa.jpg', 24, '45000', 2, NULL, 16, 2),
(27, 'Silla Roja', 1, '4567', 'sillaRoja.jpg', 12, '26000', 1, NULL, 4, 1),
(112, 'SillaP&C', 1, '76', 'silla.jpg', 5, '30000', 1, NULL, 4, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(20) CHARACTER SET latin1 NOT NULL,
  `apellidos` varchar(20) CHARACTER SET latin1 NOT NULL,
  `telefono` int(11) NOT NULL,
  `username` varchar(20) CHARACTER SET latin1 NOT NULL,
  `email` varchar(30) CHARACTER SET latin1 NOT NULL,
  `password_hash` varchar(60) CHARACTER SET latin1 NOT NULL,
  `auth_key` varchar(32) CHARACTER SET latin1 NOT NULL,
  `access_token` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `activate` int(11) NOT NULL DEFAULT '1',
  `status` int(11) DEFAULT '10',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `role` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `nombres`, `apellidos`, `telefono`, `username`, `email`, `password_hash`, `auth_key`, `access_token`, `activate`, `status`, `created_at`, `updated_at`, `role`) VALUES
(6, 'Maria', 'Mora', 7869, 'nana', 'nana@yahoo.com', '$2y$13$BsYHX8UrSsLXYbZ/PLuI..WH6rDX.UcE85JsKOt9//x1MIg5mL6pi', 'x38BWyULGpnDPzShrsPX0FVy-MckAUJc', NULL, 1, 10, '2017-10-21 22:50:30', '2017-10-21 22:50:30', 1),
(7, 'Andres', 'Arboleda', 4567, 'andres', 'andres@yahoo.com', '$2y$13$5CCNUBw4BhmZ354ZMHuxceSVUoZRxyNJb6gcfR98PIE7Qvm2Nte02', 'zW1X54fnzXRHrQPn2XiIuMD8_nGFRBnf', NULL, 1, 10, '2017-10-21 23:00:56', '2017-10-21 23:00:56', 2),
(8, 'Admin', 'Administrador', 64367, 'admin', 'admin@admin.com', '$2y$13$9Cr8Ozub3G82STggEyecDeLediqOdLxnGrICJLG/hrJaajJd9Hixm', '3lqBUDijmMpa4EhhIfdzLeVpMyDLNI17', NULL, 1, 10, '2017-10-22 00:10:30', '2017-10-22 00:10:30', 2),
(9, 'Clara', 'Gomez', 6789, 'clara', 'clara@yahoo.com', '$2y$13$MK/ZyeXlCPEYocD4JmFp.u6K0Ct/hcW6Ri9DL5.gLgLbNnM7cRbRi', 'BjozpWqqVzkwLtqbNwjVOehmjJ4uOSrp', NULL, 1, 10, '2017-10-22 20:19:33', '2017-10-22 20:19:33', 1),
(10, 'Francy', 'Parra', 3456768, 'francy', 'francy@yahoo.com', '$2y$13$qgReBL7LvB29MG8J/fhjY.LBKLzMZgyPSCAGIsXpNBzsQhkKxBaRW', 'qiNX8xVec9GHKRxZ7qh06DZh_G8wjTG6', NULL, 1, 10, '2017-10-23 00:33:01', '2017-10-23 00:33:01', 1),
(11, 'Rosa', 'Ramirez', 465789, 'rosa', 'rosa@yahoo.com', '$2y$13$tftkMn05DefqFJkjszj6UuRr.pF7XvY/CAhbP0VibZOC2Z8Lf9CFW', '7RC4VOzR6rPUZTjZ99l8_jn8srdgwBOw', NULL, 1, 10, '2017-10-23 13:21:31', '2017-10-23 13:21:31', 1),
(12, 'Dora', 'Fruta', 5678, 'dora', 'dora@yahoo.com', '$2y$13$cyhmRXPVvG1Qt1Mz7XuUquou5wV.EvmHsTZ9qe35NxWlHAvojvzqe', 'Eeu0T7NASLFH_Bb0TsOkEpgN0LpXJGNK', NULL, 1, 10, '2017-10-25 01:08:50', '2017-10-25 01:08:50', 1),
(13, 'Koko', 'Korn', 45678, 'koko', 'koko@yahoo.com', '$2y$13$ziFlvlQJHur7jZaPkkgZKOyQvp.0iWOiTB3A7J8aO/fPr91sCjAi6', '1n3CXEZSkg_UYlfRYerxwMaadiftGew6', NULL, 1, 10, '2017-10-27 01:54:55', '2017-10-27 01:54:55', 1),
(14, 'Sofia', 'Moreno', 657879809, 'sofi', 'sofi@yahoo.c', '$2y$13$LZTwDHNd4PP7SKOJSsTCF.wnJYxCOGvTVVg/wJclddFoCz.a49/1a', '0hje_m1x9lF_sdfksYXF4BgZeDTVlG8h', NULL, 1, 10, '2017-10-27 06:22:50', '2017-10-27 06:22:50', 1),
(15, 'Pedro', 'Garcia', 53478, 'pepe', 'pepe@yahoo.com', '$2y$13$jxBDqCdJGWZ2ojerC6WYkeIaHmKOHRF258bx62B713JGaVwCP3JsG', 'PhLwQ8KWHl9nW7jF6vjPxWNY8Pb1J0GY', NULL, 1, 10, '2017-10-27 19:24:22', '2017-10-27 19:24:22', 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `agenda`
--
ALTER TABLE `agenda`
  ADD CONSTRAINT `fk_agen_emple` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`id_empleado`),
  ADD CONSTRAINT `fk_agenda_detalle_fase1` FOREIGN KEY (`detalle_fase_id_df`) REFERENCES `detalle_fase` (`id_df`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  ADD CONSTRAINT `fk_coti_produc` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `detalle_cotizacion_productos`
--
ALTER TABLE `detalle_cotizacion_productos`
  ADD CONSTRAINT `fk_dcp_co` FOREIGN KEY (`cotizacion_id`) REFERENCES `cotizacion` (`id_cotizacion`),
  ADD CONSTRAINT `fk_dcp_pro` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `detalle_fase`
--
ALTER TABLE `detalle_fase`
  ADD CONSTRAINT `detalle_fase_ibfk_1` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id_estado`),
  ADD CONSTRAINT `fk_df_ds` FOREIGN KEY (`dStand_id`) REFERENCES `detalle_fase` (`id_df`),
  ADD CONSTRAINT `fk_df_fa` FOREIGN KEY (`fase_id`) REFERENCES `fase` (`id_fase`);

--
-- Filtros para la tabla `detalle_material_pedido`
--
ALTER TABLE `detalle_material_pedido`
  ADD CONSTRAINT `fk_dmds_mate` FOREIGN KEY (`material_id`) REFERENCES `materiales` (`id_mate`);

--
-- Filtros para la tabla `detalle_producto_color`
--
ALTER TABLE `detalle_producto_color`
  ADD CONSTRAINT `detalle_producto_color_ibfk_1` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id_estado`),
  ADD CONSTRAINT `fk_dpc_color` FOREIGN KEY (`color_id`) REFERENCES `color` (`id_color`),
  ADD CONSTRAINT `fk_dpc_producto` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `detalle_producto_material`
--
ALTER TABLE `detalle_producto_material`
  ADD CONSTRAINT `detalle_producto_material_ibfk_1` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id_estado`),
  ADD CONSTRAINT `fk_detalle_producto_material_producto1` FOREIGN KEY (`producto_id_producto`) REFERENCES `producto` (`id_producto`),
  ADD CONSTRAINT `fk_dpm_mateId` FOREIGN KEY (`materiales_id`) REFERENCES `materiales` (`id_mate`);

--
-- Filtros para la tabla `detalle_stand`
--
ALTER TABLE `detalle_stand`
  ADD CONSTRAINT `detalle_stand_ibfk_1` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id_estado`),
  ADD CONSTRAINT `fk_ds_dmp` FOREIGN KEY (`detalleMP_id`) REFERENCES `detalle_material_pedido` (`id_dmp`),
  ADD CONSTRAINT `fk_stand_producto` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `detalle_stand_producto`
--
ALTER TABLE `detalle_stand_producto`
  ADD CONSTRAINT `fk_sp_ds` FOREIGN KEY (`ds_id`) REFERENCES `detalle_stand` (`id_ds`),
  ADD CONSTRAINT `fk_sp_p` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id_estado`);

--
-- Filtros para la tabla `factura_stand`
--
ALTER TABLE `factura_stand`
  ADD CONSTRAINT `fk_fs_dsp` FOREIGN KEY (`dsp_id`) REFERENCES `detalle_stand_producto` (`id_dsp`);

--
-- Filtros para la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD CONSTRAINT `municipio_ibfk_1` FOREIGN KEY (`departamento_id`) REFERENCES `departamento` (`id_departamento`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`municipio_id`) REFERENCES `municipio` (`id_municipio`),
  ADD CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id_estado`),
  ADD CONSTRAINT `pedido_ibfk_4` FOREIGN KEY (`cliente_id`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_clas` FOREIGN KEY (`cod_clasifi`) REFERENCES `clasificacion` (`id_clasifi`),
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id_estado`),
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`materiales_id`) REFERENCES `materiales` (`id_mate`),
  ADD CONSTRAINT `producto_ibfk_3` FOREIGN KEY (`color_id`) REFERENCES `color` (`id_color`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;