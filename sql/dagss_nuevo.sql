-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-12-2017 a las 20:28:41
-- Versión del servidor: 10.1.28-MariaDB
-- Versión de PHP: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dagss`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `ID` bigint(20) NOT NULL,
  `FECHAALTA` datetime DEFAULT NULL,
  `LOGIN` varchar(25) DEFAULT NULL,
  `NOMBRE` varchar(75) DEFAULT NULL,
  `PASSWORD` varchar(64) DEFAULT NULL,
  `TIPO_USUARIO` varchar(20) DEFAULT NULL,
  `ULTIMOACCESO` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`ID`, `FECHAALTA`, `LOGIN`, `NOMBRE`, `PASSWORD`, `TIPO_USUARIO`, `ULTIMOACCESO`) VALUES
(1, '2017-11-11 01:04:42', 'admin', 'Administrador inicial', 'ggm44T97GWJ6Rryx3do4yvl1bZ+gmUfG', 'ADMINISTRADOR', '2017-11-11 01:04:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centrosalud`
--

CREATE TABLE `centrosalud` (
  `ID` bigint(20) NOT NULL,
  `NOMBRE` varchar(50) NOT NULL,
  `TELEFONO` varchar(9) DEFAULT NULL,
  `CODIGOPOSTAL` varchar(5) NOT NULL,
  `DOMICILIO` varchar(75) NOT NULL,
  `LOCALIDAD` varchar(30) NOT NULL,
  `PROVINCIA` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `centrosalud`
--

INSERT INTO `centrosalud` (`ID`, `NOMBRE`, `TELEFONO`, `CODIGOPOSTAL`, `DOMICILIO`, `LOCALIDAD`, `PROVINCIA`) VALUES
(1, 'Centro salud pepe', '988888888', '12345', 'C/. Pepe, nº 3', 'Ourense', 'Ourense');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE `cita` (
  `ID` bigint(20) NOT NULL,
  `DURACION` int(11) DEFAULT NULL,
  `ESTADO` varchar(255) DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  `HORA` time DEFAULT NULL,
  `MEDICO_ID` bigint(20) DEFAULT NULL,
  `PACIENTE_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cita`
--

INSERT INTO `cita` (`ID`, `DURACION`, `ESTADO`, `FECHA`, `HORA`, `MEDICO_ID`, `PACIENTE_ID`) VALUES
(1, 15, 'AUSENTE', '2017-11-23', '09:00:00', 2, 3),
(2, 15, 'COMPLETADA', '2017-12-22', '12:10:00', 2, 3),
(3, 10, 'PLANIFICADA', '2017-12-20', '08:15:00', 2, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `farmacia`
--

CREATE TABLE `farmacia` (
  `ID` bigint(20) NOT NULL,
  `FECHAALTA` datetime DEFAULT NULL,
  `NIF` varchar(9) NOT NULL,
  `NOMBREFARMACIA` varchar(75) NOT NULL,
  `PASSWORD` varchar(64) DEFAULT NULL,
  `TIPO_USUARIO` varchar(20) DEFAULT NULL,
  `ULTIMOACCESO` datetime DEFAULT NULL,
  `CODIGOPOSTAL` varchar(5) NOT NULL,
  `DOMICILIO` varchar(75) NOT NULL,
  `LOCALIDAD` varchar(30) NOT NULL,
  `PROVINCIA` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `farmacia`
--

INSERT INTO `farmacia` (`ID`, `FECHAALTA`, `NIF`, `NOMBREFARMACIA`, `PASSWORD`, `TIPO_USUARIO`, `ULTIMOACCESO`, `CODIGOPOSTAL`, `DOMICILIO`, `LOCALIDAD`, `PROVINCIA`) VALUES
(4, '2017-11-11 01:04:42', '33333333C', 'Farmacia de prueba', '/QpUw+ZRH3ndoNb3N4gRpT5cz0C7pT9v', 'FARMACIA', '2017-11-11 01:04:42', '12345', 'C/. Farmacia, nº 2, 4º N', 'Coruña', 'Coruña');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamento`
--

CREATE TABLE `medicamento` (
  `ID` bigint(20) NOT NULL,
  `FABRICANTE` varchar(50) NOT NULL,
  `FAMILIA` varchar(50) NOT NULL,
  `NOMBRE` varchar(50) NOT NULL,
  `NUMERODOSIS` int(11) DEFAULT NULL,
  `PRINCIPIOACTIVO` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `medicamento`
--

INSERT INTO `medicamento` (`ID`, `FABRICANTE`, `FAMILIA`, `NOMBRE`, `NUMERODOSIS`, `PRINCIPIOACTIVO`) VALUES
(1, 'Neobufren', 'Ibuprofeno', 'Neobufren', NULL, 'Ibuprofeno'),
(2, 'Cinfa', 'Paracetamol', 'Paracetamol', NULL, 'Paracetamol');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medico`
--

CREATE TABLE `medico` (
  `ID` bigint(20) NOT NULL,
  `APELLIDOS` varchar(50) NOT NULL,
  `DNI` varchar(9) NOT NULL,
  `EMAIL` varchar(25) DEFAULT NULL,
  `FECHAALTA` datetime DEFAULT NULL,
  `NOMBRE` varchar(30) NOT NULL,
  `NUMEROCOLEGIADO` varchar(10) NOT NULL,
  `PASSWORD` varchar(64) DEFAULT NULL,
  `TELEFONO` varchar(9) DEFAULT NULL,
  `TIPO_USUARIO` varchar(20) DEFAULT NULL,
  `ULTIMOACCESO` datetime DEFAULT NULL,
  `CENTROSALUD_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `medico`
--

INSERT INTO `medico` (`ID`, `APELLIDOS`, `DNI`, `EMAIL`, `FECHAALTA`, `NOMBRE`, `NUMEROCOLEGIADO`, `PASSWORD`, `TELEFONO`, `TIPO_USUARIO`, `ULTIMOACCESO`, `CENTROSALUD_ID`) VALUES
(2, 'Gomez Gomez', '11111111A', 'a@a.com', '2017-11-11 01:04:42', 'Antonio', '11111', 'lUTQ2zg2voe4Z5OqpITFIjcBziNH10d6', '988123456', 'MEDICO', '2017-12-26 20:28:07', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `ID` bigint(20) NOT NULL,
  `APELLIDOS` varchar(50) NOT NULL,
  `DNI` varchar(9) NOT NULL,
  `EMAIL` varchar(25) DEFAULT NULL,
  `FECHAALTA` datetime DEFAULT NULL,
  `NOMBRE` varchar(30) NOT NULL,
  `NUMEROSEGURIDADSOCIAL` varchar(13) NOT NULL,
  `NUMEROTARJETASANITARIA` varchar(10) NOT NULL,
  `PASSWORD` varchar(64) DEFAULT NULL,
  `TELEFONO` varchar(9) DEFAULT NULL,
  `TIPO_USUARIO` varchar(20) DEFAULT NULL,
  `ULTIMOACCESO` datetime DEFAULT NULL,
  `CODIGOPOSTAL` varchar(5) NOT NULL,
  `DOMICILIO` varchar(75) NOT NULL,
  `LOCALIDAD` varchar(30) NOT NULL,
  `PROVINCIA` varchar(30) NOT NULL,
  `MEDICO_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`ID`, `APELLIDOS`, `DNI`, `EMAIL`, `FECHAALTA`, `NOMBRE`, `NUMEROSEGURIDADSOCIAL`, `NUMEROTARJETASANITARIA`, `PASSWORD`, `TELEFONO`, `TIPO_USUARIO`, `ULTIMOACCESO`, `CODIGOPOSTAL`, `DOMICILIO`, `LOCALIDAD`, `PROVINCIA`, `MEDICO_ID`) VALUES
(3, 'Benito Carmona', '22222222B', 'b@b.com', '2017-11-11 01:04:42', 'Ana', '2222222222222', '2222222222', 'auJIfVxFAN0IKkDVovGmzfUENiABIC5g', '981123456', 'PACIENTE', '2017-11-11 01:04:42', '12345', 'C/. Benito, nº 2, 4º N', 'Coruña', 'Coruña', 2),
(4, 'Martínez Pérez', '12345678J', 'maca@gmail.com', '2017-12-19 12:00:00', 'Macarena', '', '', NULL, NULL, NULL, NULL, '', 'Avd. Buenos Aires, 45', 'Ourense', '', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prescripcion`
--

CREATE TABLE `prescripcion` (
  `ID` bigint(20) NOT NULL,
  `DOSIS` int(11) DEFAULT NULL,
  `FECHAFIN` date DEFAULT NULL,
  `FECHAINICIO` date DEFAULT NULL,
  `INDICACIONES` varchar(255) DEFAULT NULL,
  `MEDICAMENTO_ID` bigint(20) DEFAULT NULL,
  `MEDICO_ID` bigint(20) DEFAULT NULL,
  `PACIENTE_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `prescripcion`
--

INSERT INTO `prescripcion` (`ID`, `DOSIS`, `FECHAFIN`, `FECHAINICIO`, `INDICACIONES`, `MEDICAMENTO_ID`, `MEDICO_ID`, `PACIENTE_ID`) VALUES
(1, 3, '2017-12-31', '2017-12-01', 'Después de cada comida', 1, 2, 3),
(3, 3, '2018-01-31', '2017-12-26', 'Mañana, tarde y noche', 2, 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receta`
--

CREATE TABLE `receta` (
  `ID` bigint(20) NOT NULL,
  `CANTIDAD` int(11) DEFAULT NULL,
  `ESTADORECETA` varchar(20) DEFAULT NULL,
  `FINVALIDEZ` date DEFAULT NULL,
  `INICIOVALIDEZ` date DEFAULT NULL,
  `FARMACIADISPENSADORA_ID` bigint(20) DEFAULT NULL,
  `PRESCRIPCION_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_gen`
--

CREATE TABLE `usuario_gen` (
  `GEN_NAME` varchar(50) NOT NULL,
  `GEN_VAL` decimal(38,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario_gen`
--

INSERT INTO `usuario_gen` (`GEN_NAME`, `GEN_VAL`) VALUES
('USUARIO_GEN', '100');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `centrosalud`
--
ALTER TABLE `centrosalud`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_CITA_PACIENTE_ID` (`PACIENTE_ID`),
  ADD KEY `FK_CITA_MEDICO_ID` (`MEDICO_ID`);

--
-- Indices de la tabla `farmacia`
--
ALTER TABLE `farmacia`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `medicamento`
--
ALTER TABLE `medicamento`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_MEDICO_CENTROSALUD_ID` (`CENTROSALUD_ID`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_PACIENTE_MEDICO_ID` (`MEDICO_ID`);

--
-- Indices de la tabla `prescripcion`
--
ALTER TABLE `prescripcion`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_PRESCRIPCION_MEDICO_ID` (`MEDICO_ID`),
  ADD KEY `FK_PRESCRIPCION_PACIENTE_ID` (`PACIENTE_ID`),
  ADD KEY `FK_PRESCRIPCION_MEDICAMENTO_ID` (`MEDICAMENTO_ID`);

--
-- Indices de la tabla `receta`
--
ALTER TABLE `receta`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_RECETA_FARMACIADISPENSADORA_ID` (`FARMACIADISPENSADORA_ID`),
  ADD KEY `FK_RECETA_PRESCRIPCION_ID` (`PRESCRIPCION_ID`);

--
-- Indices de la tabla `usuario_gen`
--
ALTER TABLE `usuario_gen`
  ADD PRIMARY KEY (`GEN_NAME`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `centrosalud`
--
ALTER TABLE `centrosalud`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cita`
--
ALTER TABLE `cita`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `medicamento`
--
ALTER TABLE `medicamento`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `prescripcion`
--
ALTER TABLE `prescripcion`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `receta`
--
ALTER TABLE `receta`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cita`
--
ALTER TABLE `cita`
  ADD CONSTRAINT `FK_CITA_MEDICO_ID` FOREIGN KEY (`MEDICO_ID`) REFERENCES `medico` (`ID`),
  ADD CONSTRAINT `FK_CITA_PACIENTE_ID` FOREIGN KEY (`PACIENTE_ID`) REFERENCES `paciente` (`ID`);

--
-- Filtros para la tabla `medico`
--
ALTER TABLE `medico`
  ADD CONSTRAINT `FK_MEDICO_CENTROSALUD_ID` FOREIGN KEY (`CENTROSALUD_ID`) REFERENCES `centrosalud` (`ID`);

--
-- Filtros para la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD CONSTRAINT `FK_PACIENTE_MEDICO_ID` FOREIGN KEY (`MEDICO_ID`) REFERENCES `medico` (`ID`);

--
-- Filtros para la tabla `prescripcion`
--
ALTER TABLE `prescripcion`
  ADD CONSTRAINT `FK_PRESCRIPCION_MEDICAMENTO_ID` FOREIGN KEY (`MEDICAMENTO_ID`) REFERENCES `medicamento` (`ID`),
  ADD CONSTRAINT `FK_PRESCRIPCION_MEDICO_ID` FOREIGN KEY (`MEDICO_ID`) REFERENCES `medico` (`ID`),
  ADD CONSTRAINT `FK_PRESCRIPCION_PACIENTE_ID` FOREIGN KEY (`PACIENTE_ID`) REFERENCES `paciente` (`ID`);

--
-- Filtros para la tabla `receta`
--
ALTER TABLE `receta`
  ADD CONSTRAINT `FK_RECETA_FARMACIADISPENSADORA_ID` FOREIGN KEY (`FARMACIADISPENSADORA_ID`) REFERENCES `farmacia` (`ID`),
  ADD CONSTRAINT `FK_RECETA_PRESCRIPCION_ID` FOREIGN KEY (`PRESCRIPCION_ID`) REFERENCES `prescripcion` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
