-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 04-08-2021 a las 00:06:28
-- Versión del servidor: 5.6.34-log
-- Versión de PHP: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `chat`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amistades`
--

CREATE TABLE `amistades` (
  `id` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `id_contactos` int(11) NOT NULL,
  `idSala` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contactos`
--

CREATE TABLE `contactos` (
  `id` int(11) NOT NULL,
  `Session_id` varchar(255) NOT NULL,
  `ID_CONTACTO` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `contactos`
--

INSERT INTO `contactos` (`id`, `Session_id`, `ID_CONTACTO`) VALUES
(1, '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 'a93e5af441f8636f84062e2aaa1274424b4d526e'),
(2, '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', '6c60d53ff92f3bc86a7aeff31a3053a1cc9a9b37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensaje`
--

CREATE TABLE `mensaje` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `idUsuario` varchar(255) NOT NULL,
  `idSala` int(11) NOT NULL,
  `mensaje` longtext NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idTipo` int(11) NOT NULL,
  `url` varchar(2000) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `mensaje`
--

INSERT INTO `mensaje` (`id`, `nombre`, `idUsuario`, `idSala`, `mensaje`, `fecha`, `idTipo`, `url`) VALUES
(72, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'e la pinga pa to el mundo pa que sepan', '2021-07-29 03:01:02', 1, NULL),
(73, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'hola', '2021-07-29 16:17:44', 1, NULL),
(74, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 2, 'hola', '2021-07-29 16:18:05', 1, NULL),
(75, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'hola, como estás?', '2021-07-29 16:30:13', 1, NULL),
(76, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'asd', '2021-07-29 17:03:41', 1, NULL),
(77, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'oñwieur', '2021-07-29 17:05:25', 1, NULL),
(78, 'Adrian', 'a93e5af441f8636f84062e2aaa1274424b4d526e', 1, 'buenas tardes', '2021-07-29 17:07:52', 1, NULL),
(79, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 2, 'estás ahí?', '2021-07-29 17:46:07', 1, NULL),
(80, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 2, 'dime algo', '2021-07-29 17:47:04', 1, NULL),
(81, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 2, 'dime', '2021-07-29 17:47:25', 1, NULL),
(82, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'hello?', '2021-07-30 16:43:36', 1, NULL),
(83, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'a ver, en serio, wtf con esta gente?', '2021-07-30 16:57:46', 1, NULL),
(84, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'que bola con la fecha?', '2021-07-30 16:58:36', 1, NULL),
(85, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'e?, que bola con ella?', '2021-07-30 16:58:46', 1, NULL),
(86, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'hi?', '2021-07-31 19:34:39', 1, NULL),
(87, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'sad', '2021-07-31 19:40:46', 1, NULL),
(88, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'n', '2021-07-31 19:42:51', 1, NULL),
(89, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'sad', '2021-07-31 19:49:31', 1, NULL),
(90, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'hallen', '2021-07-31 19:52:44', 1, NULL),
(91, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'hjj', '2021-07-31 19:53:37', 1, NULL),
(92, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'hj', '2021-07-31 19:58:35', 1, NULL),
(93, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'AAAAAAAAAA', '2021-07-31 20:03:17', 1, NULL),
(94, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'yo', '2021-07-31 20:06:15', 1, NULL),
(95, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'sad', '2021-07-31 20:07:48', 1, NULL),
(96, 'Adrian', 'a93e5af441f8636f84062e2aaa1274424b4d526e', 1, 'Hola?', '2021-07-31 20:17:03', 1, NULL),
(97, 'Adrian', 'a93e5af441f8636f84062e2aaa1274424b4d526e', 1, 'Jone, por fin esta verga le da por fincionar we', '2021-07-31 20:17:30', 1, NULL),
(98, 'Adrian', 'a93e5af441f8636f84062e2aaa1274424b4d526e', 1, 'Esto no está más atrasado porque no puede ya', '2021-07-31 20:18:54', 1, NULL),
(99, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'ahora como hago para que la página se actualize cuando te llegan mensajes nuevos?', '2021-07-31 20:19:39', 1, NULL),
(100, 'Adrian', 'a93e5af441f8636f84062e2aaa1274424b4d526e', 1, 'Ni idea tío', '2021-07-31 20:19:51', 1, NULL),
(101, 'Adrian', 'a93e5af441f8636f84062e2aaa1274424b4d526e', 1, 'Bueno, lo principal ya está funcionando', '2021-07-31 20:21:27', 1, NULL),
(102, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'a la verga', '2021-08-03 15:50:05', 1, NULL),
(103, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'HI?', '2021-08-03 16:45:44', 1, NULL),
(104, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 's', '2021-08-03 17:04:11', 1, NULL),
(105, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'hola?', '2021-08-03 17:09:28', 1, NULL),
(106, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'what?', '2021-08-03 17:09:42', 1, NULL),
(107, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'hi?', '2021-08-03 17:11:32', 1, NULL),
(108, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'hi?', '2021-08-03 17:12:09', 1, NULL),
(109, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'a ver cual es el texto ahora', '2021-08-03 17:15:08', 1, NULL),
(110, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'ja', '2021-08-03 17:17:05', 1, NULL),
(111, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, ' ', '2021-08-03 17:19:55', 1, NULL),
(112, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, ' ', '2021-08-03 23:40:30', 1, NULL),
(113, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, ' ', '2021-08-03 23:40:50', 1, NULL),
(114, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, ' ', '2021-08-03 23:55:27', 1, NULL),
(115, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'cxv', '2021-08-03 23:55:50', 1, NULL),
(116, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'asd', '2021-08-03 23:56:12', 1, NULL),
(117, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'dfg', '2021-08-03 23:56:41', 1, NULL),
(118, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, ' ', '2021-08-03 23:57:49', 1, NULL),
(119, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'asd', '2021-08-03 23:58:11', 1, NULL),
(120, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'asd', '2021-08-04 00:02:07', 1, NULL),
(121, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'sdf', '2021-08-04 00:06:59', 1, NULL),
(122, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'sdf', '2021-08-04 00:07:27', 1, NULL),
(123, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'fg', '2021-08-04 00:08:24', 1, NULL),
(124, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'fg', '2021-08-04 00:08:48', 1, NULL),
(125, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'vb', '2021-08-04 00:09:13', 1, NULL),
(126, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'ghh', '2021-08-04 00:15:43', 1, NULL),
(127, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'vbnvbn', '2021-08-04 00:16:15', 1, NULL),
(128, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'jhjh', '2021-08-04 00:17:09', 1, NULL),
(129, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'kkk', '2021-08-04 00:18:05', 1, NULL),
(130, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'zxzxc', '2021-08-04 00:18:12', 1, NULL),
(131, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'hola mundo', '2021-08-04 00:22:39', 1, NULL),
(132, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'hoa', '2021-08-04 00:23:07', 1, NULL),
(133, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'y ahora', '2021-08-04 00:24:11', 1, NULL),
(134, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'fd', '2021-08-04 00:26:18', 1, NULL),
(135, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'weyyyyyy', '2021-08-04 00:26:49', 1, NULL),
(136, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'jajjaja', '2021-08-04 00:27:22', 1, NULL),
(137, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'jajajaja', '2021-08-04 00:27:29', 1, NULL),
(138, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, ' ', '2021-08-04 00:27:35', 1, NULL),
(139, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'jajajaja', '2021-08-04 00:27:40', 1, NULL),
(140, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'hora si no?', '2021-08-04 00:31:38', 1, NULL),
(141, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'supone algun problema que yo mande el idUsuario?', '2021-08-04 00:32:29', 1, NULL),
(142, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'y el nombre?', '2021-08-04 00:32:53', 1, NULL),
(143, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'que tal ahora?', '2021-08-04 00:35:38', 1, NULL),
(144, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'funcionara?', '2021-08-04 00:40:42', 1, NULL),
(145, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'df', '2021-08-04 00:47:33', 1, NULL),
(146, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'sdf', '2021-08-04 00:48:15', 1, NULL),
(147, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'sdf', '2021-08-04 00:48:21', 1, NULL),
(148, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'asdasd', '2021-08-04 00:48:46', 1, NULL),
(149, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'asd', '2021-08-04 00:48:59', 1, NULL),
(150, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'dfg', '2021-08-04 00:49:15', 1, NULL),
(151, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'jaja', '2021-08-04 00:50:15', 1, NULL),
(152, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'jajajaja', '2021-08-04 00:50:33', 1, NULL),
(153, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'kkkk', '2021-08-04 00:51:38', 1, NULL),
(154, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'ksksks', '2021-08-04 00:54:45', 1, NULL),
(155, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'asdasdasd', '2021-08-04 00:54:53', 1, NULL),
(156, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'asdasd', '2021-08-04 00:55:17', 1, NULL),
(157, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, ' ', '2021-08-04 00:56:35', 1, NULL),
(158, 'Hallen', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', 1, 'asd', '2021-08-04 00:57:24', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sala`
--

CREATE TABLE `sala` (
  `id` int(11) NOT NULL,
  `idTipo` int(11) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sala`
--

INSERT INTO `sala` (`id`, `idTipo`, `fecha`) VALUES
(1, 1, '2021-07-23 00:00:00'),
(2, 1, '2021-07-27 17:29:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sala_usuario`
--

CREATE TABLE `sala_usuario` (
  `id` int(11) NOT NULL,
  `id_sala` int(11) NOT NULL,
  `id_usuario` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sala_usuario`
--

INSERT INTO `sala_usuario` (`id`, `id_sala`, `id_usuario`) VALUES
(1, 1, 'a93e5af441f8636f84062e2aaa1274424b4d526e'),
(2, 1, '84df607cfe8e0cd1f44e9800ae77dd9e428fb243'),
(3, 2, '84df607cfe8e0cd1f44e9800ae77dd9e428fb243'),
(4, 2, '6c60d53ff92f3bc86a7aeff31a3053a1cc9a9b37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_mensaje`
--

CREATE TABLE `tipo_mensaje` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_mensaje`
--

INSERT INTO `tipo_mensaje` (`id`, `nombre`) VALUES
(1, 'mensaje'),
(2, 'video'),
(3, 'foto'),
(4, 'audio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_sala`
--

CREATE TABLE `tipo_sala` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_sala`
--

INSERT INTO `tipo_sala` (`id`, `nombre`) VALUES
(1, 'privada'),
(2, 'grupo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Password` text NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `Session_id` varchar(255) DEFAULT NULL,
  `COOKIE_ID` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `Nombre`, `Password`, `Correo`, `Session_id`, `COOKIE_ID`) VALUES
(12, 'Hallen', '$2y$10$ZYY1Jjolj0.dUxPiIjxhJeYKePfMZllzKoBi0F7ftR8fbiEDQsiC2', 'hallen412120@gmail.com', '84df607cfe8e0cd1f44e9800ae77dd9e428fb243', '0e7946a9458ae793707096aaad420df942c8a750'),
(15, 'Adrian', '$2y$10$200DqMKfAvjAxkczIvEqQ.B2L85DZHK9W8o8rl/QMIXLCS8lJ03Ly', 'adrianjg97@gmail.com', 'a93e5af441f8636f84062e2aaa1274424b4d526e', 'd2f451f30d8b4c59a0a7f9dacb76936578c21f79'),
(16, 'Mary', '$2y$10$r1BJLDzdZiKskGYL.Mvgd.kO84zNbQ/ZG4OO3q6Y6WEdseA0dGW0y', 'mariabd@mysqli.com', '6c60d53ff92f3bc86a7aeff31a3053a1cc9a9b37', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `amistades`
--
ALTER TABLE `amistades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `contactos`
--
ALTER TABLE `contactos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mensaje`
--
ALTER TABLE `mensaje`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idSala` (`idSala`),
  ADD KEY `idTipo` (`idTipo`);

--
-- Indices de la tabla `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idTipo` (`idTipo`);

--
-- Indices de la tabla `sala_usuario`
--
ALTER TABLE `sala_usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_sala` (`id_sala`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `tipo_mensaje`
--
ALTER TABLE `tipo_mensaje`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_sala`
--
ALTER TABLE `tipo_sala`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `amistades`
--
ALTER TABLE `amistades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `contactos`
--
ALTER TABLE `contactos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `mensaje`
--
ALTER TABLE `mensaje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;
--
-- AUTO_INCREMENT de la tabla `sala`
--
ALTER TABLE `sala`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `sala_usuario`
--
ALTER TABLE `sala_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tipo_mensaje`
--
ALTER TABLE `tipo_mensaje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tipo_sala`
--
ALTER TABLE `tipo_sala`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `mensaje`
--
ALTER TABLE `mensaje`
  ADD CONSTRAINT `mensaje_ibfk_2` FOREIGN KEY (`idSala`) REFERENCES `sala` (`id`),
  ADD CONSTRAINT `mensaje_ibfk_3` FOREIGN KEY (`idTipo`) REFERENCES `tipo_mensaje` (`id`);

--
-- Filtros para la tabla `sala`
--
ALTER TABLE `sala`
  ADD CONSTRAINT `sala_ibfk_1` FOREIGN KEY (`idTipo`) REFERENCES `tipo_sala` (`id`);

--
-- Filtros para la tabla `sala_usuario`
--
ALTER TABLE `sala_usuario`
  ADD CONSTRAINT `sala_usuario_ibfk_1` FOREIGN KEY (`id_sala`) REFERENCES `sala` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
