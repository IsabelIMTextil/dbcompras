-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 13-11-2023 a las 21:10:51
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbcompras`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Clientes`
--

CREATE TABLE `Clientes` (
  `dni` varchar(20) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Clientes`
--

INSERT INTO `Clientes` (`dni`, `nombre`, `apellido`) VALUES
('12589654', 'Juan', 'Pérez'),
('16987562', 'Mercedes', 'Pérez'),
('19587456', 'María E.', 'Vazquez'),
('24789456', 'Miguel', 'Sorrente'),
('25478932', 'Susana', 'Sanchez'),
('25874123', 'María ', 'Gonzalez'),
('26548974', 'José', 'Vulcano'),
('37456896', 'Soledad', 'Fernandez'),
('39852147', 'Julia', 'Solé'),
('93214587', 'Esteban', 'Durán');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Compras`
--

CREATE TABLE `Compras` (
  `id_compras` int(11) NOT NULL,
  `concepto` varchar(20) NOT NULL,
  `dni_clientes` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Compras`
--

INSERT INTO `Compras` (`id_compras`, `concepto`, `dni_clientes`) VALUES
(1, 'mayorista', '12589654'),
(2, 'consumFinal', '16987562'),
(3, 'consumFinal', '19587456'),
(4, 'minorista', '24789456'),
(5, 'mayorista', '25478932'),
(6, 'mayorista', '25874123'),
(7, 'minorista', '26548974'),
(8, 'mayorista', '37456896'),
(9, 'consumFinal', '39852147'),
(10, 'consumFinal', '93214587');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `LineasCompra`
--

CREATE TABLE `LineasCompra` (
  `id_numero` int(20) NOT NULL,
  `compras_id` int(20) NOT NULL,
  `producto` varchar(20) NOT NULL,
  `importe` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `LineasCompra`
--

INSERT INTO `LineasCompra` (`id_numero`, `compras_id`, `producto`, `importe`) VALUES
(1, 10, 'alfombra top baño', 4235),
(2, 9, 'alfombra microf/baño', 6666),
(3, 1, 'lavandina', 978),
(4, 2, 'franela', 660),
(5, 3, 'bolsa residuos', 1016),
(6, 4, 'toalla intercalada', 5798),
(7, 5, 'jabón líquido', 2868),
(8, 6, 'líquido piso', 1355),
(9, 7, 'papel higiénico', 5823),
(10, 8, 'alcohol etílico', 6207);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Clientes`
--
ALTER TABLE `Clientes`
  ADD PRIMARY KEY (`dni`),
  ADD UNIQUE KEY `dni` (`dni`),
  ADD KEY `dni_2` (`dni`);

--
-- Indices de la tabla `Compras`
--
ALTER TABLE `Compras`
  ADD PRIMARY KEY (`id_compras`),
  ADD KEY `clientes_dni` (`dni_clientes`),
  ADD KEY `dni_clientes` (`dni_clientes`);

--
-- Indices de la tabla `LineasCompra`
--
ALTER TABLE `LineasCompra`
  ADD PRIMARY KEY (`id_numero`,`compras_id`),
  ADD KEY `compras_id` (`compras_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Compras`
--
ALTER TABLE `Compras`
  MODIFY `id_compras` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `LineasCompra`
--
ALTER TABLE `LineasCompra`
  MODIFY `id_numero` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Compras`
--
ALTER TABLE `Compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`dni_clientes`) REFERENCES `Clientes` (`dni`);

--
-- Filtros para la tabla `LineasCompra`
--
ALTER TABLE `LineasCompra`
  ADD CONSTRAINT `lineascompra_ibfk_1` FOREIGN KEY (`compras_id`) REFERENCES `Compras` (`id_compras`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
