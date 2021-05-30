-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-05-2021 a las 19:14:43
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `workflow`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

CREATE TABLE `documentos` (
  `id` int(11) DEFAULT NULL,
  `nomdoc` varchar(30) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `documentos`
--

INSERT INTO `documentos` (`id`, `nomdoc`) VALUES
(1, 'CI'),
(2, 'Diploma de Bachiller'),
(3, 'Certificado de Habilitacion'),
(4, 'Certificado de Nac'),
(5, 'Deposito');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `ci` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `apellidos` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`ci`, `nombre`, `apellidos`) VALUES
(1, 'user1', 'user11'),
(2, 'user2', 'user22'),
(3, 'user3', 'user33'),
(4, 'user4', 'user44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `iniciales`
--

CREATE TABLE `iniciales` (
  `tipo` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `valor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `iniciales`
--

INSERT INTO `iniciales` (`tipo`, `valor`) VALUES
('nrotramite', 111);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscrito`
--

CREATE TABLE `inscrito` (
  `ci` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `inscrito`
--

INSERT INTO `inscrito` (`ci`, `id`) VALUES
(2, 2),
(2, 3),
(2, 5),
(4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `sigla` varchar(10) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `semestre` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `materia`
--

INSERT INTO `materia` (`id`, `nombre`, `sigla`, `semestre`) VALUES
(1, 'Analsis matematico', 'mat-115', 1),
(2, 'Matematica discreta', 'mat-114', 1),
(3, 'Intro. a la programacion', 'inf-111', 1),
(4, 'Laboratorio de inf-111', 'lab-111', 1),
(5, 'Linguistica', 'mat-116', 1),
(6, 'Logica de progrmacion', 'mat-112', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proceso`
--

CREATE TABLE `proceso` (
  `codFlujo` varchar(5) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `codProceso` varchar(5) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `codProcesoSiguiente` varchar(5) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `tipo` varchar(5) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `rol` varchar(5) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `pantalla` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `proceso`
--

INSERT INTO `proceso` (`codFlujo`, `codProceso`, `codProcesoSiguiente`, `tipo`, `rol`, `pantalla`) VALUES
('F1', 'P1', 'P2', 'I', 'E', 'documentos.php'),
('F1', 'P2', 'P3', 'p', 'E', 'selecsemestre.php'),
('F1', 'P3', 'P4', 'P', 'E', 'selecmaterias.php'),
('F1', 'P4', 'P5', 'P', 'E', 'inscribir.php'),
('F1', 'P5', 'P6', 'C', 'E', 'mensaje.php'),
('F1', 'P6', NULL, 'P', 'E', 'materias_docs.php');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registrodoc`
--

CREATE TABLE `registrodoc` (
  `ciEst` int(11) DEFAULT NULL,
  `idDoc` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `registrodoc`
--

INSERT INTO `registrodoc` (`ciEst`, `idDoc`) VALUES
(2, 4),
(2, 5),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguimiento`
--

CREATE TABLE `seguimiento` (
  `nroTramite` varchar(10) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `codFlujo` varchar(3) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `codProceso` varchar(3) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `estudiante` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `fechaini` date DEFAULT NULL,
  `fechafin` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `seguimiento`
--

INSERT INTO `seguimiento` (`nroTramite`, `codFlujo`, `codProceso`, `estudiante`, `fechaini`, `fechafin`) VALUES
('10', 'F1', 'P1', 'user1', '2018-04-01', '2018-04-10'),
('20', 'F1', 'P2', 'user2', '2018-04-03', NULL),
('30', 'F2', 'P1', 'user3', '2019-04-01', NULL),
('1', 'F1', 'P3', 'user2', '2021-04-19', NULL),
('2', 'F1', 'P3', 'user2', '2021-04-19', NULL),
('1', 'F1', 'P5', 'user2', '2021-04-19', NULL),
('1', 'F1', 'P6', 'user2', '2021-04-19', NULL),
('1', 'F1', 'P6', 'user2', '2021-04-19', NULL),
('1', 'F1', 'P6', 'user2', '2021-04-19', NULL),
('1', 'F1', 'P6', 'user2', '2021-04-19', '2021-05-30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `semestre`
--

CREATE TABLE `semestre` (
  `id` int(11) DEFAULT NULL,
  `semestre` varchar(15) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `semestre`
--

INSERT INTO `semestre` (`id`, `semestre`) VALUES
(1, '1er Sermestre');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`ci`);

--
-- Indices de la tabla `inscrito`
--
ALTER TABLE `inscrito`
  ADD PRIMARY KEY (`ci`,`id`),
  ADD KEY `id` (`id`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `inscrito`
--
ALTER TABLE `inscrito`
  ADD CONSTRAINT `inscrito_ibfk_1` FOREIGN KEY (`id`) REFERENCES `materia` (`id`),
  ADD CONSTRAINT `inscrito_ibfk_2` FOREIGN KEY (`ci`) REFERENCES `estudiante` (`ci`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
