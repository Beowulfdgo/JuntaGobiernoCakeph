-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 10-05-2016 a las 15:26:14
-- Versión del servidor: 5.1.41
-- Versión de PHP: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `JuntaGobierno`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `councilors`
--

CREATE TABLE IF NOT EXISTS `councilors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombres` varchar(45) DEFAULT NULL,
  `Apellido_P` varchar(45) DEFAULT NULL,
  `Apellido_M` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `councilors`
--

INSERT INTO `councilors` (`id`, `Nombres`, `Apellido_P`, `Apellido_M`) VALUES
(1, 'Juan', 'velazquez', ''),
(2, 'veronica ', 'arizpe', 'moreno');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `councilors_councils`
--

CREATE TABLE IF NOT EXISTS `councilors_councils` (
  `councilor_id` int(11) NOT NULL DEFAULT '0',
  `council_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`councilor_id`,`council_id`),
  KEY `fk_councilors_has_councils_councils1_idx` (`council_id`),
  KEY `fk_councilors_has_councils_councilors1_idx` (`councilor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `councilors_councils`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `councils`
--

CREATE TABLE IF NOT EXISTS `councils` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(145) DEFAULT NULL,
  `version` varchar(45) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `archivo` varchar(255) DEFAULT NULL,
  `director` varchar(45) DEFAULT NULL,
  `fecha` date NOT NULL,
  `publicado` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`user_id`),
  KEY `fk_councils_users_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Volcar la base de datos para la tabla `councils`
--

INSERT INTO `councils` (`id`, `descripcion`, `version`, `imagen`, `archivo`, `director`, `fecha`, `publicado`, `user_id`) VALUES
(21, 'esta es una prueba 8', '8', 'Observaciones_y_accionesVF.pdf', '21', 'Cecilio Murillo', '2016-04-07', 1, 1),
(22, 'esta es una prueba 8', '1', 'Gmail - [TEDx Arroyo de la Plata Live] Pago OXXO pendiente.pdf', '22', 'Cecilio Murillo', '2016-05-09', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `nombres` varchar(45) DEFAULT NULL,
  `Apellido_P` varchar(45) DEFAULT NULL,
  `Apellido_M` varchar(45) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  `modified` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcar la base de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `nombres`, `Apellido_P`, `Apellido_M`, `created`, `email`, `role`, `modified`, `status`) VALUES
(1, 'jflores', '3d0f93c607cfe638f9421d4af49a3455a07517bc', 'Antonio', 'flores lara', '', '2016-03-13 01:57:37', 'antonioflores30@gmail.com', 'king', '2016-03-13 02:21:39', 1),
(2, 'otros', '0c24e5209d008bf1a21773352e5555f8dc5f3833', 'veronica', 'arizp', 'moreno', '2016-03-18 01:02:17', 'none@hotmail.com', 'admin', '2016-03-18 01:02:17', 1),
(3, 'fatima', 'e2a5d42b67b14d511fcd67a745b984e55d10c814', 'fatima', 'flores', 'arizpe', '2016-03-18 02:21:46', 'fatima@hotmail.com', 'admin', '2016-03-18 02:21:46', 1);

--
-- Filtros para las tablas descargadas (dump)
--

--
-- Filtros para la tabla `councilors_councils`
--
ALTER TABLE `councilors_councils`
  ADD CONSTRAINT `fk_councilors_has_councils_councilors1` FOREIGN KEY (`councilor_id`) REFERENCES `councilors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_councilors_has_councils_councils1` FOREIGN KEY (`council_id`) REFERENCES `councils` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `councils`
--
ALTER TABLE `councils`
  ADD CONSTRAINT `fk_councils_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
