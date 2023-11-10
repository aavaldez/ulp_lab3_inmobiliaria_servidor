-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-11-2023 a las 17:44:27
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inmo_aavaldez`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contratos`
--

CREATE TABLE `contratos` (
  `id` int(11) NOT NULL,
  `inquilinoId` int(11) NOT NULL,
  `inmuebleId` int(11) NOT NULL,
  `desde` datetime DEFAULT NULL,
  `hasta` datetime DEFAULT NULL,
  `valor` decimal(10,2) NOT NULL DEFAULT 0.00,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `contratos`
--

INSERT INTO `contratos` (`id`, `inquilinoId`, `inmuebleId`, `desde`, `hasta`, `valor`, `estado`) VALUES
(1, 1, 3, '2022-01-01 12:04:49', '2023-12-31 12:04:49', '18000.00', 1),
(2, 2, 2, '2023-01-01 12:04:49', '2024-12-31 12:04:49', '15000.00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inmuebles`
--

CREATE TABLE `inmuebles` (
  `id` int(11) NOT NULL,
  `direccion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uso` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tipo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ambientes` int(11) NOT NULL DEFAULT 1,
  `precio` decimal(10,2) NOT NULL DEFAULT 0.00,
  `propietarioId` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `imagen` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `inmuebles`
--

INSERT INTO `inmuebles` (`id`, `direccion`, `uso`, `tipo`, `ambientes`, `precio`, `propietarioId`, `estado`, `imagen`) VALUES
(1, 'Junin 933', 'Comercial', 'Local', 1, '10000.00', 1, 1, '\\uploads\\casa1.jpg'),
(2, 'San Martin 135', 'Residencial', 'Casa', 2, '15000.00', 1, 1, '\\uploads\\casa2.jpg'),
(3, 'Bolivar 116', 'Residencial', 'Casa', 3, '25000.00', 1, 1, '\\uploads\\casa3.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inquilinos`
--

CREATE TABLE `inquilinos` (
  `id` int(11) NOT NULL,
  `dni` bigint(20) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lugarDeTrabajo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(160) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono` varchar(160) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombreGarante` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telefonoGarante` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `inquilinos`
--

INSERT INTO `inquilinos` (`id`, `dni`, `nombre`, `apellido`, `lugarDeTrabajo`, `email`, `telefono`, `nombreGarante`, `telefonoGarante`, `estado`) VALUES
(1, 30000007, 'Juan Ernesto', 'Perez', 'Home Office', 'jperez@mail.com', '2665780987', 'Luis Fernandez', '2556765431', 1),
(2, 30000008, 'Martin', 'Suarez', 'IncubAR', 'msuarez@mail.com', '2665780956', 'Gabriel Medina', '2556765609', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `contratoId` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `importe` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`id`, `numero`, `contratoId`, `fecha`, `importe`) VALUES
(1, 1, 1, '2022-01-01 16:54:29', '18000.00'),
(2, 2, 1, '2022-02-01 16:54:29', '18000.00'),
(3, 3, 1, '2022-03-01 16:54:29', '18000.00'),
(4, 3, 1, '2022-04-01 16:54:29', '18000.00'),
(5, 1, 2, '2023-01-01 16:54:29', '15000.00'),
(6, 2, 2, '2023-02-01 16:54:29', '15000.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietarios`
--

CREATE TABLE `propietarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dni` bigint(20) NOT NULL,
  `telefono` varchar(160) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(160) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(160) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(160) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `propietarios`
--

INSERT INTO `propietarios` (`id`, `nombre`, `apellido`, `dni`, `telefono`, `email`, `password`, `avatar`, `estado`) VALUES
(1, 'Alberto', 'Valdez', 27822898, '2664659200', 'aavaldez@gmail.com', 'pOjBQ7hZuhRlsXn9P3cmGoibbWuvjSbJjkFgfeVDzQg=', '\\uploads\\juan.png', 1),
(2, 'Mariano', 'Luzza', 27822898, '2664659200', 'mluzza@gmail.com', 'pOjBQ7hZuhRlsXn9P3cmGoibbWuvjSbJjkFgfeVDzQg=', '\\uploads\\juan.png', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `contratos`
--
ALTER TABLE `contratos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contratos_inquilinos_inquilinoId` (`inquilinoId`),
  ADD KEY `contratos_inmuebles_inmuebleId` (`inmuebleId`);

--
-- Indices de la tabla `inmuebles`
--
ALTER TABLE `inmuebles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inmuebles_propietarioId` (`propietarioId`);

--
-- Indices de la tabla `inquilinos`
--
ALTER TABLE `inquilinos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pagos_contratos_contratoId` (`contratoId`);

--
-- Indices de la tabla `propietarios`
--
ALTER TABLE `propietarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `contratos`
--
ALTER TABLE `contratos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `inmuebles`
--
ALTER TABLE `inmuebles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `inquilinos`
--
ALTER TABLE `inquilinos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `propietarios`
--
ALTER TABLE `propietarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `contratos`
--
ALTER TABLE `contratos`
  ADD CONSTRAINT `contratos_inmuebles_inmuebleId` FOREIGN KEY (`inmuebleId`) REFERENCES `inmuebles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contratos_inquilinos_inquilinoId` FOREIGN KEY (`inquilinoId`) REFERENCES `inquilinos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `inmuebles`
--
ALTER TABLE `inmuebles`
  ADD CONSTRAINT `inmuebles_propietarioId` FOREIGN KEY (`propietarioId`) REFERENCES `propietarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_contratos_contratoId` FOREIGN KEY (`contratoId`) REFERENCES `contratos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
