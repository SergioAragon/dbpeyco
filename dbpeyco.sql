-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 01-12-2017 a las 21:47:36
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
-- Base de datos: `dbpeyco`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agenda`
--

DROP TABLE IF EXISTS `agenda`;
CREATE TABLE IF NOT EXISTS `agenda` (
  `id_agenda` int(11) NOT NULL AUTO_INCREMENT,
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
  `id_clasifi` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(20) NOT NULL,
  `parent_id` int(11) NOT NULL,
  PRIMARY KEY (`id_clasifi`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clasificacion`
--

INSERT INTO `clasificacion` (`id_clasifi`, `descripcion`, `parent_id`) VALUES
(1, 'sillas', 0),
(2, 'mesas', 0),
(3, 'muebles', 0),
(4, 'silla plastica ', 1),
(5, 'silla madera ', 1),
(6, 'mueble cubo', 3),
(7, 'puff', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `color`
--

DROP TABLE IF EXISTS `color`;
CREATE TABLE IF NOT EXISTS `color` (
  `id_color` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `num_color` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_color`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `color`
--

INSERT INTO `color` (`id_color`, `nombre`, `num_color`) VALUES
(1, 'Verde', '5894859'),
(2, 'Azul', '398390'),
(3, 'Rojo', '39032'),
(4, 'Amarillo', '498094');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion`
--

DROP TABLE IF EXISTS `cotizacion`;
CREATE TABLE IF NOT EXISTS `cotizacion` (
  `id_cotizacion` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) NOT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `fecha` datetime NOT NULL,
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
  `cantidad` int(11) DEFAULT NULL,
  `estado_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_dpc`),
  KEY `fk_dpc_color` (`color_id`),
  KEY `fk_dpc_producto` (`producto_id`),
  KEY `estado_id` (`estado_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_producto_color`
--

INSERT INTO `detalle_producto_color` (`id_dpc`, `producto_id`, `color_id`, `cantidad`, `estado_id`) VALUES
(1, 21, 1, 0, 2),
(2, 21, 4, 5, 1),
(3, 14, 1, 5, 1),
(4, 14, 3, 5, 1),
(5, 22, 1, 1, 1),
(6, 23, 1, 1, 1),
(7, 23, 2, 1, 1),
(8, 24, 1, 1, 1),
(9, 25, 3, 1, 1),
(10, 8, 1, 3, 1),
(11, 8, 3, 3, 1),
(12, 1, 2, 4, 1),
(13, 1, 3, 4, 1),
(14, 2, 1, 5, 1),
(15, 2, 3, 5, 1),
(16, 32, 2, 12, 1),
(17, 32, 3, 12, 1),
(18, 12, 1, 20, 1),
(19, 12, 2, 20, 1),
(20, 5, 1, 2, 1),
(21, 6, 1, 2, 1),
(22, 7, 2, 5, 1),
(23, 10, 1, 5, 1),
(24, 10, 2, 5, 1),
(25, 10, 3, 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_producto_material`
--

DROP TABLE IF EXISTS `detalle_producto_material`;
CREATE TABLE IF NOT EXISTS `detalle_producto_material` (
  `id_dpm` int(11) NOT NULL AUTO_INCREMENT,
  `materiales_id` int(11) NOT NULL,
  `producto_id_producto` int(11) NOT NULL,
  `estado_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_dpm`),
  KEY `fk_dpm_mateId` (`materiales_id`),
  KEY `fk_detalle_producto_material_producto1_idx` (`producto_id_producto`),
  KEY `estado_id` (`estado_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_producto_material`
--

INSERT INTO `detalle_producto_material` (`id_dpm`, `materiales_id`, `producto_id_producto`, `estado_id`) VALUES
(1, 1, 21, 1),
(2, 7, 14, 1),
(3, 5, 22, 1),
(4, 2, 23, 1),
(5, 1, 24, 1),
(6, 1, 25, 1),
(7, 5, 8, 1),
(8, 3, 1, 1),
(9, 5, 2, 1),
(10, 5, 32, 1),
(11, 4, 12, 1),
(12, 3, 5, 1),
(13, 3, 6, 1),
(14, 1, 7, 1),
(15, 1, 10, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_stand`
--

DROP TABLE IF EXISTS `detalle_stand`;
CREATE TABLE IF NOT EXISTS `detalle_stand` (
  `id_ds` int(11) NOT NULL AUTO_INCREMENT,
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
  `id_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `estado_id` int(11) NOT NULL DEFAULT '1',
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
-- Estructura de tabla para la tabla `event`
--

DROP TABLE IF EXISTS `event`;
CREATE TABLE IF NOT EXISTS `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` varchar(500) NOT NULL,
  `created_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `event`
--

INSERT INTO `event` (`id`, `title`, `description`, `created_date`) VALUES
(8, 'prueba2', 'segundo intento', '2029-11-17'),
(9, 'prueba3', 'tercer intento', '2017-11-29'),
(14, 'prueba8', 'intento 8', '2017-12-02'),
(15, 'prueba9', 'intento 9', '2017-11-30'),
(16, 'prueba10', 'intento 10', '2017-11-29');

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
  `id_mate` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_mate`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `materiales`
--

INSERT INTO `materiales` (`id_mate`, `nombre`, `estado`) VALUES
(1, 'Madera', 1),
(2, 'Acero', 1),
(3, 'Plástico', 1),
(4, 'Cristal', 2),
(5, 'Cuero', 1),
(6, 'Cartón', 2),
(7, 'Aluminio', 1),
(8, '655', 1);

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
  `cliente_id` int(11) NOT NULL,
  `nombre_expo` varchar(40) NOT NULL,
  `nombre_empresa` varchar(40) DEFAULT NULL,
  `frente` int(11) NOT NULL,
  `fondo` int(11) NOT NULL,
  `Referencia_stand` varchar(20) NOT NULL,
  `cantidad_stand` int(11) NOT NULL,
  `direccion` varchar(20) NOT NULL,
  `fecha_pedido` datetime NOT NULL,
  `telefono` int(11) NOT NULL,
  `municipio_id` int(11) DEFAULT '1',
  `estado_id` int(11) DEFAULT '1',
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `estado_id` (`estado_id`),
  KEY `municipio_id` (`municipio_id`),
  KEY `cliente_id` (`cliente_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `cliente_id`, `nombre_expo`, `nombre_empresa`, `frente`, `fondo`, `Referencia_stand`, `cantidad_stand`, `direccion`, `fecha_pedido`, `telefono`, `municipio_id`, `estado_id`, `updated_at`) VALUES
(1, 9, 'moli', 'france', 250, 38, 'letras', 34, 'Cr. 81 # 49', '2017-10-29 00:00:00', 3455426, 4, 1, NULL),
(2, 81, 'molinos', 'togas', 100, 150, 'premium', 3, 'Cr. 81 # 49', '2017-11-30 00:00:00', 463574, 4, 2, '2017-11-30 08:41:33'),
(3, 80, 'dell', 'finca', 340, 250, 'swit', 5, 'Cr. 81 # 50', '2017-11-29 20:15:10', 4635741, 3, 1, '2017-11-30 08:42:00'),
(4, 81, 'Palace', 'Quinta', 235, 246, 'Small', 3, 'Cr. 61 # 90', '2017-11-29 20:30:23', 576748, 2, 1, '2017-11-29 20:30:23'),
(5, 81, 'cross', 'tales', 668, 390, 'long', 4, 'cll 62 # 45', '2017-11-29 22:08:36', 235526, 4, 1, '2017-11-29 22:08:36'),
(6, 83, 'mil', 'tropp', 350, 230, 'Tall', 3, 'Cr. 61 # 90', '2017-11-30 01:26:53', 32556, 3, 1, '2017-11-30 01:26:53'),
(7, 85, 'Moli', 'Cruz', 570, 455, 'Small', 4, 'Cr. 81 # 49', '2017-11-30 08:40:21', 235526, 3, 1, '2017-11-30 08:40:21');

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
(1, 'silla', 4, '120 x 140', 'silla.jpg', 1, '20000', 1, NULL, 4, 3),
(2, 'mueble', 6, '23 x 326', 'silla.jpg', 12, '1000000', 1, NULL, 5, 5),
(5, 'banco', 4, '120 x 140', 'silla2.jpg', 5, '20000', 1, NULL, 2, 3),
(6, 'Sillapc', 1, '76', 'silla3.jpg', 5, '20000', 2, NULL, 2, 3),
(7, 'SillaGiratoria', 4, '12', 'silla2.jpg', 5, '120000', 1, NULL, 5, 1),
(10, 'SillaGiratoria', 4, '120 x 140', 'silla4.jpg', 1, '20000', 1, NULL, 5, 1),
(12, 'mesa', 7, '32', 'silla4.jpg', 6, '200000', 1, NULL, 20, 4),
(32, 'sa', 7, '12x1212', 'silla4.jpg', 12, '20000', 1, NULL, 12, 5);

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
  `password` varchar(60) CHARACTER SET latin1 NOT NULL,
  `authKey` varchar(32) CHARACTER SET latin1 NOT NULL,
  `password_reset_token` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `activate` int(11) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '10',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `role` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `nombres`, `apellidos`, `telefono`, `username`, `email`, `password`, `authKey`, `password_reset_token`, `activate`, `status`, `created_at`, `updated_at`, `role`) VALUES
(8, 'Admin', 'Administrador', 64367, 'admin', 'admin@admin.com', '$2y$13$9Cr8Ozub3G82STggEyecDeLediqOdLxnGrICJLG/hrJaajJd9Hixm', '3lqBUDijmMpa4EhhIfdzLeVpMyDLNI17', NULL, 1, 10, '2017-10-22 00:10:30', '2017-10-22 00:10:30', 2),
(9, 'Clara', 'Gómez', 30123999, 'clara', 'clarita@hotmail.com', '$2y$13$MK/ZyeXlCPEYocD4JmFp.u6K0Ct/hcW6Ri9DL5.gLgLbNnM7cRbRi', 'BjozpWqqVzkwLtqbNwjVOehmjJ4uOSrp', NULL, 1, 10, '2017-10-22 20:19:33', '2017-10-22 20:19:33', 1),
(77, 'Daniel', 'Borda', 5563221, 'daniel', 'daniel@yahoo.com', '$2y$13$QXqxKlWyo/GqpkrJggp0TOyFRCB3moBxxgAsUS8zCtH2wgk6C0IC2', 'Ad9fjMh685A03P9YR3UWDr_8nbCfwlWq', NULL, 1, 10, '2017-11-18 02:37:01', '2017-11-18 02:37:01', 1),
(78, 'Laura', 'Kiros', 4567865, 'laura', 'laura@yahoo.co.t.hum.cruz', '$2y$13$ypjbdNwOW.jNtOwnVOnEuOeu6aD45svmnHDUf1XAenlLX2zuyfKFK', 'uH7aMRowrqRimiBI9sBnst1H0ALsFGAq', NULL, 0, 10, '2017-11-23 21:51:46', '2017-11-23 21:51:46', 1),
(79, 'Maria', 'Perez', 1234567, 'maria', 'maria@hotmail.com', '$2y$13$4IXwA8YsJS4fD4cByNGus.fUn2nM1Om6j4RRnjFHHPliOqkV2USO2', 'GDaaCr2KVs3wl4x5F1icWJ0B693DVnRp', NULL, 1, 10, '2017-11-23 22:00:52', '2017-11-23 22:00:52', 1),
(80, 'Carlos', 'Jaramillo', 1234567, 'carlos', 'carlosjara@gmail.com', '$2y$13$dl2MWcBo/6xSKm5dftaVdewQcf7557.M1qxEsOdkfrnh83981RZL2', 'tgs-UxHaYmu7zFXnx9Lcl12ij-50r8Ny', NULL, 1, 10, '2017-11-23 22:21:39', '2017-11-23 22:21:39', 1),
(81, 'Juaquin', 'Borda', 1234567, 'juaco', 'juaquin@hotmail.com', '$2y$13$3APZiOjR/UEzE40j85r6c.BGK/1bYdurlzNZAHkBe70a9ctSapTCq', 'ka-9H_eo5E2pldxyA1nlemwTBH0Qmiot', 'gdjXQvmNhCd7xVqVRZ-75G0wjOalu0PR_1511929870', 1, 10, '2017-11-26 12:10:03', '2017-11-28 23:31:10', 1),
(82, 'Lola', 'Lopez', 1234567, 'lola', 'lolita@gmail.com', '$2y$13$MUUYvWLJ14lsJMIXGR/Nq.j3.0UWZz6XXZBZIoXluHABI7NI1Ly.6', '76ln9xuo9mgF5WoE3tVH2GoOyKJTgFkK', 'E8thC7qKCh_ECM0km9iT-6B3AhvS7l29_1512021759', 1, 10, '2017-11-29 01:07:56', '2017-11-30 01:02:39', 1),
(83, 'Paola', 'Puerta', 1234567, 'paola', 'rosaameliarestrepo@gmail.com', '$2y$13$4H2B.EFcn.FI23t2PUPP.Od.KBheckgnmJ7FfRE2u9fs.YSYwJtOm', 'Iwo_0F5TeBua9bJyKZfrU3aP36idUqoO', 'fz9aE0Hr37oB9BBgb2I5-E0pCoCE5efT_1512044483', 1, 10, '2017-11-30 01:25:14', '2017-11-30 07:21:23', 1),
(84, 'Andres', 'torres', 1234567, 'Andrez', 'mrfelipe32@gmail.com', '$2y$13$ZqjGF3tdoyAJxJKMSJ2axOlFSKGWTYe6S3keYNEbukfoUbwyVgN1e', 'JQzTGA5umfz0WCT4y1PtHcUErfvnn6z_', NULL, 1, 10, '2017-11-30 08:13:51', '2017-11-30 08:13:51', 1),
(85, 'juana', 'Perez', 2345678, 'juana', 'aragonenator@gmail.com', '$2y$13$s6t6js8zgx1ujPlPNxMrs.WIxmQArdYxPLR.yajdFim.SzCSPHnme', 'jfX3FlK63n_GG2-JzT8XmBHmzFpUh9x6', NULL, 1, 10, '2017-11-30 08:34:52', '2017-11-30 08:34:52', 1);

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
  ADD CONSTRAINT `fk_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `user` (`id`),
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
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`materiales_id`) REFERENCES `materiales` (`id_mate`),
  ADD CONSTRAINT `producto_ibfk_3` FOREIGN KEY (`color_id`) REFERENCES `color` (`id_color`),
  ADD CONSTRAINT `producto_ibfk_4` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id_estado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
