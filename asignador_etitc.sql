-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 02-12-2025 a las 22:01:02
-- Versión del servidor: 9.1.0
-- Versión de PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `asignador_etitc`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaciones_clases`
--

DROP TABLE IF EXISTS `asignaciones_clases`;
CREATE TABLE IF NOT EXISTS `asignaciones_clases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_educacion` varchar(50) NOT NULL,
  `grupo_estudiantes` int NOT NULL,
  `id_docente` int NOT NULL,
  `asignatura` varchar(100) NOT NULL,
  `tipo_asignatura` varchar(50) NOT NULL,
  `id_aula` int NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_docente` (`id_docente`),
  KEY `id_aula` (`id_aula`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `asignaciones_clases`
--

INSERT INTO `asignaciones_clases` (`id`, `tipo_educacion`, `grupo_estudiantes`, `id_docente`, `asignatura`, `tipo_asignatura`, `id_aula`, `fecha_hora`, `created_at`) VALUES
(1, 'Educación Superior', 30, 1, 'php', 'Practica', 6, '2025-06-09 14:00:00', '2025-06-04 16:27:54'),
(3, 'Educación Superior', 23, 1, 'php', 'Practica', 6, '2025-06-09 14:00:00', '2025-06-04 16:30:46'),
(4, 'Educación Superior', 30, 1, 'PHP', 'Practica', 6, '2025-06-04 14:00:00', '2025-06-04 16:38:10'),
(5, 'Educación Básica', 20, 1, 'FILOSOFÍA', 'Teórica', 7, '2025-06-05 08:00:00', '2025-06-04 16:50:40'),
(6, 'Educación Superior', 5, 1, 'PHP', 'Educación Básica', 6, '2025-06-05 17:00:00', '2025-06-04 20:15:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aulas`
--

DROP TABLE IF EXISTS `aulas`;
CREATE TABLE IF NOT EXISTS `aulas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero_aula` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `tipo_aula` enum('salon','laboratorio','auditorio','otro') COLLATE utf8mb4_general_ci NOT NULL,
  `capacidad` int NOT NULL,
  `elementos` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero_aula` (`numero_aula`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aulas`
--

INSERT INTO `aulas` (`id`, `numero_aula`, `tipo_aula`, `capacidad`, `elementos`) VALUES
(1, 'b-457', 'salon', 13, ''),
(6, 'B-204', 'laboratorio', 30, 'Televisor, Pantalla, Computadores'),
(7, 'E-207', 'laboratorio', 30, 'Televisor, Pantalla, Computadores');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elementos`
--

DROP TABLE IF EXISTS `elementos`;
CREATE TABLE IF NOT EXISTS `elementos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `elementos`
--

INSERT INTO `elementos` (`id`, `nombre`) VALUES
(1, 'Televisor'),
(2, 'Video Beam'),
(3, 'Pantalla'),
(4, 'Computadores');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

DROP TABLE IF EXISTS `estudiantes`;
CREATE TABLE IF NOT EXISTS `estudiantes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_educacion` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `nombre_grupo` varchar(6) COLLATE utf8mb4_general_ci NOT NULL,
  `cantidad_es` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`id`, `tipo_educacion`, `nombre_grupo`, `cantidad_es`) VALUES
(1, '', 's4g', 0),
(2, '', 's4g', 0),
(3, '', 'S5F', 15),
(4, '', '11-6', 24),
(5, 'Educación Superior', 'S7T', 23),
(6, 'Educación Básica', '11-5', 40),
(7, 'Educación Superior', 'S5F', 40);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

DROP TABLE IF EXISTS `grupos`;
CREATE TABLE IF NOT EXISTS `grupos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_educacion` enum('Educación Superior','Educación Básica') COLLATE utf8mb4_general_ci NOT NULL,
  `nombre_grupo` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `cantidad_estudiantes` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_grupo` (`nombre_grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_docentes`
--

DROP TABLE IF EXISTS `tb_docentes`;
CREATE TABLE IF NOT EXISTS `tb_docentes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_docente` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `asignaturas` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `inicio_lunes` time DEFAULT NULL,
  `fin_lunes` time DEFAULT NULL,
  `inicio_martes` time DEFAULT NULL,
  `fin_martes` time DEFAULT NULL,
  `inicio_miercoles` time DEFAULT NULL,
  `fin_miercoles` time DEFAULT NULL,
  `inicio_jueves` time DEFAULT NULL,
  `fin_jueves` time DEFAULT NULL,
  `inicio_viernes` time DEFAULT NULL,
  `fin_viernes` time DEFAULT NULL,
  `inicio_sabado` time DEFAULT NULL,
  `fin_sabado` time DEFAULT NULL,
  `fyh_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_docentes`
--

INSERT INTO `tb_docentes` (`id`, `nombre_docente`, `asignaturas`, `inicio_lunes`, `fin_lunes`, `inicio_martes`, `fin_martes`, `inicio_miercoles`, `fin_miercoles`, `inicio_jueves`, `fin_jueves`, `inicio_viernes`, `fin_viernes`, `inicio_sabado`, `fin_sabado`, `fyh_creacion`) VALUES
(1, 'Mariangel Beltrán', 'PHP, Matemáticas Básicas, Inglés II', '00:00:00', '00:00:00', '14:00:00', '16:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '2025-06-02 17:26:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_roles`
--

DROP TABLE IF EXISTS `tb_roles`;
CREATE TABLE IF NOT EXISTS `tb_roles` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `rol` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_roles`
--

INSERT INTO `tb_roles` (`id_rol`, `rol`) VALUES
(1, 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_usuarios`
--

DROP TABLE IF EXISTS `tb_usuarios`;
CREATE TABLE IF NOT EXISTS `tb_usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `id_rol` int NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `password_user` text COLLATE utf8mb4_general_ci NOT NULL,
  `fyh_creacion` datetime NOT NULL,
  `fyh_actualizacion` datetime NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_usuarios`
--

INSERT INTO `tb_usuarios` (`id_usuario`, `nombre`, `id_rol`, `email`, `password_user`, `fyh_creacion`, `fyh_actualizacion`) VALUES
(5, 'Britney Natalia Cifuentes Gallego', 2, 'bncifuentesg@itc.edu.co', '$2y$10$kvv9D.dy1UOvwmQ4C0yulukmnUC/LpAtpo2DVWBO9CKtwerMJCo0K', '2025-12-02 16:57:09', '0000-00-00 00:00:00'),
(4, 'Mariangel Beltrán', 2, 'msbeltrand@itc.edu.co', '$2y$10$TQfstoN5kLEbkPzYECOYhuCxKRNlWVUdk0T7orsrgFlXZ4r1kHbT2', '2025-12-02 16:53:18', '0000-00-00 00:00:00');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
