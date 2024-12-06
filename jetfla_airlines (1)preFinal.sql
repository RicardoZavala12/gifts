-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-12-2024 a las 10:26:06
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `jetfla_airlines`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administradores`
--

CREATE TABLE `administradores` (
  `id_admin` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administradores`
--

INSERT INTO `administradores` (`id_admin`, `nombre`, `apellido`, `email`, `password`) VALUES
(1, 'Juan', 'Pérez', 'juan.perez@example.com', 'contrasena123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aeronaves`
--

CREATE TABLE `aeronaves` (
  `id_aeronave` int(11) NOT NULL,
  `matricula` varchar(10) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `fabricante` varchar(50) DEFAULT NULL,
  `num_asientos` int(11) NOT NULL,
  `tipo` varchar(20) DEFAULT 'Jet'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aeronaves`
--

INSERT INTO `aeronaves` (`id_aeronave`, `matricula`, `modelo`, `fabricante`, `num_asientos`, `tipo`) VALUES
(1, 'XA-ABC', 'Gulfstream G650', 'Gulfstream Aerospace', 16, 'Jet'),
(2, 'XB-DEF', 'Cessna Citation X', 'Cessna', 12, 'Jet'),
(3, 'XC-GHI', 'Embraer Phenom 300', 'Embraer', 9, 'Jet'),
(4, 'XD-JKL', 'Bombardier Challenger 350', 'Bombardier', 20, 'Jet');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asientos`
--

CREATE TABLE `asientos` (
  `id_asiento` int(11) NOT NULL,
  `id_vuelo` int(11) NOT NULL,
  `numero_asiento` varchar(10) NOT NULL,
  `clase` varchar(50) NOT NULL,
  `estado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asientos_reservas`
--

CREATE TABLE `asientos_reservas` (
  `id_asiento` int(11) NOT NULL,
  `id_reserva` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `codigos_promos`
--

CREATE TABLE `codigos_promos` (
  `id_codigo` int(11) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `descuento` int(11) NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `codigos_promos`
--

INSERT INTO `codigos_promos` (`id_codigo`, `codigo`, `descuento`, `fecha_inicio`, `fecha_fin`, `estado`) VALUES
(1, 'JETFLA10MX', 10, '2024-11-01 00:00:00', '2024-12-31 00:00:00', 1),
(2, 'JETFLA15MX', 15, '2024-11-15 00:00:00', '2024-12-15 00:00:00', 1),
(3, 'JETFLA20MX', 20, '2024-12-01 00:00:00', '2025-01-15 00:00:00', 0),
(4, 'JETFLA40MX', 35, '2024-11-20 00:00:00', '2024-12-20 00:00:00', 1),
(5, 'JETFLA50MX', 50, '2024-12-01 00:00:00', '2025-01-31 00:00:00', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `destinos`
--

CREATE TABLE `destinos` (
  `id_destino` int(11) NOT NULL,
  `nombre_destino` varchar(100) NOT NULL,
  `abrev` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `destinos`
--

INSERT INTO `destinos` (`id_destino`, `nombre_destino`, `abrev`) VALUES
(1, 'Mérida, Yucatán (MID)', 'MID'),
(2, 'Cancún, Quintana Roo (CUN)', 'CUN'),
(3, 'Monterrey, Nuevo León (MTY)', 'MTY'),
(4, 'Mazatlán, Sinaloa (MZT)', 'MZT'),
(5, 'Tijuana, Baja California (TIJ)', 'TIJ'),
(6, 'Ciudad de México (CDMX) ', 'CDMX');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `destinos_nuevos`
--

CREATE TABLE `destinos_nuevos` (
  `id_destino_nuevo` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `clima` varchar(50) DEFAULT NULL,
  `costo_promocional` decimal(10,2) DEFAULT NULL,
  `url_imagen` varchar(255) DEFAULT NULL,
  `fecha_publicacion` datetime NOT NULL DEFAULT current_timestamp(),
  `tipo_visualizacion` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `destinos_nuevos`
--

INSERT INTO `destinos_nuevos` (`id_destino_nuevo`, `nombre`, `descripcion`, `clima`, `costo_promocional`, `url_imagen`, `fecha_publicacion`, `tipo_visualizacion`) VALUES
(1, 'CANADA', 'Viaja a Canada', '32°C', 1000.00, './assets/img/bd_img_new_destinos/canada.jpg', '2024-10-31 10:05:36', 1),
(2, 'CANCÚN', 'Viaja a Cancun', '32°C', 1500.00, './assets/img/bd_img_new_destinos/cancun.jpg', '2024-10-31 10:05:36', 1),
(3, 'NEW YORK', 'Viaja a New York', '32°C', 1500.00, './assets/img/bd_img_new_destinos/ny.jpg', '2024-10-31 10:05:36', 1),
(4, 'DUBAI', 'Viaja a Dubai', '32°C', 2000.00, './assets/img/bd_img_new_destinos/dubai.jpg', '2024-10-31 10:05:36', 1),
(5, 'DUBAI', 'Viaja a mty', '38°C', 1000.00, './assets/img/bd_img_new_destinos/dubai.jpg', '2024-10-31 10:37:16', 1),
(6, 'Nuevos Destinos', 'Explora nuevas rutas a destinos exclusivos en todo el mundo.', '25°C', 2000.00, '././assets/img/bd_img_carousel/i1.jpg ', '2024-10-31 11:16:20', 0),
(7, 'Elegancia y Comodidad', 'Disfruta de un servicio de primera clase en vuelos cómodos y lujosos.', '22°C', 2500.00, '././assets/img/bd_img_carousel/im3.jpg', '2024-10-31 11:16:20', 0),
(8, 'Vuelos Directos o Escala', 'Conexiones rápidas y eficientes para llegar a tu destino sin complicaciones.', '28°C', 1800.00, '././assets/img/bd_img_carousel/im2.jpg', '2024-10-31 11:16:20', 0),
(9, 'Jets Privados Exclusivos', 'Viaja con total privacidad y personaliza tu experiencia a bordo.', '30°C', 5000.00, '././assets/img/bd_img_carousel/im4.jpg', '2024-10-31 11:16:20', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipaje`
--

CREATE TABLE `equipaje` (
  `id_equipaje` int(11) NOT NULL,
  `id_reserva` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `peso` decimal(5,2) NOT NULL,
  `dimensiones` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `extras`
--

CREATE TABLE `extras` (
  `id_extra` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `costo` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `extras`
--

INSERT INTO `extras` (`id_extra`, `descripcion`, `costo`) VALUES
(1, 'Más espacio para piernas', 500.00),
(2, 'Embarque prioritario', 300.00),
(3, 'Equipaje adicional + 20 KG', 700.00),
(4, 'Acceso a sala VIP', 1000.00),
(5, 'Seguro de viaje', 250.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `faqs`
--

CREATE TABLE `faqs` (
  `id_faq` int(11) NOT NULL,
  `pregunta` varchar(255) NOT NULL,
  `respuesta` text NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `creado_por` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_compras`
--

CREATE TABLE `historial_compras` (
  `id_historial` int(11) NOT NULL,
  `id_pasajero` int(11) NOT NULL,
  `id_reserva` int(11) NOT NULL,
  `fecha_compra` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes_destinos`
--

CREATE TABLE `imagenes_destinos` (
  `id_imagen` int(11) NOT NULL,
  `id_destino` int(11) NOT NULL,
  `url_imagen` varchar(170) NOT NULL,
  `descripcion` varchar(70) DEFAULT NULL,
  `fecha_subida` datetime NOT NULL,
  `clima` varchar(50) DEFAULT NULL,
  `costo_promedio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasajeros`
--

CREATE TABLE `pasajeros` (
  `id_pasajero` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefono` varchar(18) NOT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pasajeros`
--

INSERT INTO `pasajeros` (`id_pasajero`, `nombre`, `apellidos`, `email`, `telefono`, `password`) VALUES
(1, 'Ricardo', 'Zavala', 'rickyesc1202011@gmail.com', '5511734771', '123456789123'),
(2, 'Mariana', 'Prieto', 'mriana@gmail.com', '5511567282', '1234567890');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasajeros_reserva`
--

CREATE TABLE `pasajeros_reserva` (
  `id_pasajero_reserva` int(11) NOT NULL,
  `id_reserva` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `tipo_pasajero` enum('adulto','menor','bebe') NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `edad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Disparadores `pasajeros_reserva`
--
DELIMITER $$
CREATE TRIGGER `trg_calculate_age` BEFORE INSERT ON `pasajeros_reserva` FOR EACH ROW BEGIN
    IF NEW.fecha_nacimiento IS NOT NULL THEN
        SET NEW.edad = TIMESTAMPDIFF(YEAR, NEW.fecha_nacimiento, CURDATE());
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_update_age` BEFORE UPDATE ON `pasajeros_reserva` FOR EACH ROW BEGIN
    IF NEW.fecha_nacimiento IS NOT NULL THEN
        SET NEW.edad = TIMESTAMPDIFF(YEAR, NEW.fecha_nacimiento, CURDATE());
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `id` int(11) NOT NULL,
  `codigo_reserva` varchar(5) NOT NULL,
  `codigo_boleto` bigint(11) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `genero` varchar(10) NOT NULL,
  `nacionalidad` varchar(3) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `nombres_contact_pasajero` varchar(50) DEFAULT NULL,
  `apellidos_contact_pasajero` varchar(50) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `country_code` varchar(5) DEFAULT NULL,
  `telefono_contact` varchar(15) DEFAULT NULL,
  `selected_seat` varchar(5) DEFAULT NULL,
  `codigo_vuelo` varchar(20) NOT NULL,
  `total_global` decimal(10,2) DEFAULT NULL,
  `tua` decimal(10,2) DEFAULT NULL,
  `iva` decimal(10,2) DEFAULT NULL,
  `costo` decimal(10,2) DEFAULT NULL,
  `costo_escala_sin_iva_tua` decimal(10,2) DEFAULT NULL,
  `costo_directo_sin_iva_tua` decimal(10,2) DEFAULT NULL,
  `porcentaje_desc` decimal(5,2) DEFAULT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `fecha_salida_detail` date DEFAULT NULL,
  `fecha_regreso_detail` varchar(50) DEFAULT NULL,
  `hora_salida` time DEFAULT NULL,
  `hora_llegada` time DEFAULT NULL,
  `origen` varchar(10) DEFAULT NULL,
  `destino` varchar(10) DEFAULT NULL,
  `descripcion_pasajeros` text DEFAULT NULL,
  `estatus` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`id`, `codigo_reserva`, `codigo_boleto`, `nombres`, `apellidos`, `genero`, `nacionalidad`, `fecha_nacimiento`, `nombres_contact_pasajero`, `apellidos_contact_pasajero`, `email`, `country_code`, `telefono_contact`, `selected_seat`, `codigo_vuelo`, `total_global`, `tua`, `iva`, `costo`, `costo_escala_sin_iva_tua`, `costo_directo_sin_iva_tua`, `porcentaje_desc`, `tipo`, `fecha_salida_detail`, `fecha_regreso_detail`, `hora_salida`, `hora_llegada`, `origen`, `destino`, `descripcion_pasajeros`, `estatus`) VALUES
(1, 'D9009', 9269667037, 'prueba', 'prueba', 'femenino', 'mx', '2024-12-13', 'prueba', 'prueaba', 'rickyesc1202011@gmail.com', '+52', '5511734771', '1D', 'MIDMTY008', 5248.00, 260.00, 688.00, 4548.00, 3300.00, 3600.00, 0.00, 'Directo', '0000-00-00', 'Sin fecha de regreso', '13:00:00', '17:00:00', 'MID', 'MTY', '1 Adulto', 1);

--
-- Disparadores `reserva`
--
DELIMITER $$
CREATE TRIGGER `update_reserva_status` AFTER UPDATE ON `reserva` FOR EACH ROW BEGIN
    IF NEW.fecha_salida_detail <= CURDATE() AND NEW.hora_salida <= CURTIME() THEN
        UPDATE reserva
        SET estatus = 0 
        WHERE id = NEW.id;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vuelos`
--

CREATE TABLE `vuelos` (
  `id_vuelo` int(11) NOT NULL,
  `origen` varchar(3) NOT NULL,
  `destino` varchar(3) NOT NULL,
  `fecha_salida` date NOT NULL,
  `fecha_llegada` date DEFAULT NULL,
  `hora_salida` time NOT NULL,
  `hora_llegada` time DEFAULT NULL,
  `costo_directo` decimal(10,2) NOT NULL,
  `costo_escala` decimal(10,2) DEFAULT 0.00,
  `tua` decimal(10,2) NOT NULL,
  `iva` decimal(10,2) NOT NULL,
  `codigo_vuelo` varchar(10) NOT NULL,
  `disponible` tinyint(1) DEFAULT 1,
  `num_asientos` int(11) DEFAULT 0,
  `asientos_ocupados` int(11) DEFAULT 0,
  `id_aeronave` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vuelos`
--

INSERT INTO `vuelos` (`id_vuelo`, `origen`, `destino`, `fecha_salida`, `fecha_llegada`, `hora_salida`, `hora_llegada`, `costo_directo`, `costo_escala`, `tua`, `iva`, `codigo_vuelo`, `disponible`, `num_asientos`, `asientos_ocupados`, `id_aeronave`) VALUES
(3109, 'TIJ', 'MID', '2024-12-03', '2024-12-03', '08:00:00', '12:00:00', 4500.00, 0.00, 300.00, 720.00, 'TIJMID011', 1, 16, 0, 1),
(3110, 'MID', 'TIJ', '2024-12-03', '2024-12-03', '14:00:00', '18:00:00', 4500.00, 0.00, 300.00, 720.00, 'MIDTIJ011', 1, 16, 0, 1),
(3111, 'CUN', 'MTY', '2024-12-03', '2024-12-03', '09:00:00', '13:00:00', 3200.00, 2900.00, 250.00, 608.00, 'CUNMTY011', 1, 12, 0, 2),
(3112, 'MTY', 'CUN', '2024-12-03', '2024-12-03', '15:00:00', '19:00:00', 3200.00, 0.00, 250.00, 608.00, 'MTYCUN011', 1, 12, 0, 2),
(3113, 'CDM', 'MZT', '2024-12-03', '2024-12-03', '07:30:00', '10:00:00', 2800.00, 2400.00, 220.00, 568.00, 'CDMXMZT011', 1, 9, 0, 3),
(3114, 'MZT', 'CDM', '2024-12-03', '2024-12-03', '16:30:00', '19:00:00', 2800.00, 0.00, 220.00, 568.00, 'MZTCDMX011', 1, 9, 0, 3),
(3115, 'MID', 'MZT', '2024-12-03', '2024-12-03', '08:45:00', '11:45:00', 3100.00, 2850.00, 275.00, 658.50, 'MIDMZT011', 1, 20, 0, 4),
(3116, 'MZT', 'MID', '2024-12-03', '2024-12-03', '14:15:00', '17:15:00', 3100.00, 0.00, 275.00, 658.50, 'MZTMID011', 1, 20, 0, 4),
(3117, 'CDM', 'TIJ', '2024-12-03', '2024-12-03', '10:30:00', '15:30:00', 5000.00, 4700.00, 350.00, 855.00, 'CDMXTIJ011', 1, 9, 0, 3),
(3118, 'TIJ', 'CDM', '2024-12-03', '2024-12-03', '18:30:00', '23:30:00', 5000.00, 0.00, 350.00, 855.00, 'TIJCDMX011', 1, 12, 0, 2),
(3119, 'MTY', 'MID', '2024-12-03', '2024-12-03', '07:00:00', '11:00:00', 3600.00, 0.00, 260.00, 688.00, 'MTYMID011', 1, 16, 0, 1),
(3120, 'MID', 'MTY', '2024-12-03', '2024-12-03', '13:00:00', '17:00:00', 3600.00, 3300.00, 260.00, 688.00, 'MIDMTY011', 1, 16, 0, 1),
(3121, 'CUN', 'CDM', '2024-12-03', '2024-12-03', '09:30:00', '11:45:00', 2300.00, 2000.00, 200.00, 460.00, 'CUNCDMX011', 1, 12, 0, 2),
(3122, 'CDM', 'CUN', '2024-12-03', '2024-12-03', '18:00:00', '20:15:00', 2300.00, 0.00, 200.00, 460.00, 'CDMXCUN011', 1, 12, 0, 2),
(3123, 'TIJ', 'MID', '2024-12-04', '2024-12-04', '08:00:00', '12:00:00', 4500.00, 0.00, 300.00, 720.00, 'TIJMID012', 1, 16, 0, 1),
(3124, 'MID', 'TIJ', '2024-12-04', '2024-12-04', '14:00:00', '18:00:00', 4500.00, 0.00, 300.00, 720.00, 'MIDTIJ012', 1, 16, 0, 1),
(3125, 'CUN', 'MTY', '2024-12-04', '2024-12-04', '09:00:00', '13:00:00', 3200.00, 2900.00, 250.00, 608.00, 'CUNMTY012', 1, 12, 0, 2),
(3126, 'MTY', 'CUN', '2024-12-04', '2024-12-04', '15:00:00', '19:00:00', 3200.00, 0.00, 250.00, 608.00, 'MTYCUN012', 1, 12, 0, 2),
(3127, 'CDM', 'MZT', '2024-12-04', '2024-12-04', '07:30:00', '10:00:00', 2800.00, 2400.00, 220.00, 568.00, 'CDMXMZT012', 1, 9, 0, 3),
(3128, 'MZT', 'CDM', '2024-12-04', '2024-12-04', '16:30:00', '19:00:00', 2800.00, 0.00, 220.00, 568.00, 'MZTCDMX012', 1, 9, 0, 3),
(3129, 'MID', 'MZT', '2024-12-04', '2024-12-04', '08:45:00', '11:45:00', 3100.00, 2850.00, 275.00, 658.50, 'MIDMZT012', 1, 20, 0, 4),
(3130, 'MZT', 'MID', '2024-12-04', '2024-12-04', '14:15:00', '17:15:00', 3100.00, 0.00, 275.00, 658.50, 'MZTMID012', 1, 20, 0, 4),
(3131, 'CDM', 'TIJ', '2024-12-04', '2024-12-04', '10:30:00', '15:30:00', 5000.00, 4700.00, 350.00, 855.00, 'CDMXTIJ012', 1, 9, 0, 3),
(3132, 'TIJ', 'CDM', '2024-12-04', '2024-12-04', '18:30:00', '23:30:00', 5000.00, 0.00, 350.00, 855.00, 'TIJCDMX012', 1, 12, 0, 2),
(3133, 'MTY', 'MID', '2024-12-04', '2024-12-04', '07:00:00', '11:00:00', 3600.00, 0.00, 260.00, 688.00, 'MTYMID012', 1, 16, 0, 1),
(3134, 'MID', 'MTY', '2024-12-04', '2024-12-04', '13:00:00', '17:00:00', 3600.00, 3300.00, 260.00, 688.00, 'MIDMTY012', 1, 16, 0, 1),
(3135, 'CUN', 'CDM', '2024-12-04', '2024-12-04', '09:30:00', '11:45:00', 2300.00, 2000.00, 200.00, 460.00, 'CUNCDMX012', 1, 12, 0, 2),
(3136, 'CDM', 'CUN', '2024-12-04', '2024-12-04', '18:00:00', '20:15:00', 2300.00, 0.00, 200.00, 460.00, 'CDMXCUN012', 1, 12, 0, 2),
(3137, 'TIJ', 'MID', '2024-12-05', '2024-12-05', '08:00:00', '12:00:00', 4500.00, 0.00, 300.00, 720.00, 'TIJMID013', 1, 16, 0, 1),
(3138, 'MID', 'TIJ', '2024-12-05', '2024-12-05', '14:00:00', '18:00:00', 4500.00, 0.00, 300.00, 720.00, 'MIDTIJ013', 1, 16, 0, 1),
(3139, 'CUN', 'MTY', '2024-12-05', '2024-12-05', '09:00:00', '13:00:00', 3200.00, 2900.00, 250.00, 608.00, 'CUNMTY013', 1, 12, 0, 2),
(3140, 'MTY', 'CUN', '2024-12-05', '2024-12-05', '15:00:00', '19:00:00', 3200.00, 0.00, 250.00, 608.00, 'MTYCUN013', 1, 12, 0, 2),
(3141, 'CDM', 'MZT', '2024-12-05', '2024-12-05', '07:30:00', '10:00:00', 2800.00, 2400.00, 220.00, 568.00, 'CDMXMZT013', 1, 9, 0, 3),
(3142, 'MZT', 'CDM', '2024-12-05', '2024-12-05', '16:30:00', '19:00:00', 2800.00, 0.00, 220.00, 568.00, 'MZTCDMX013', 1, 9, 0, 3),
(3143, 'MID', 'MZT', '2024-12-05', '2024-12-05', '08:45:00', '11:45:00', 3100.00, 2850.00, 275.00, 658.50, 'MIDMZT013', 1, 20, 0, 4),
(3144, 'MZT', 'MID', '2024-12-05', '2024-12-05', '14:15:00', '17:15:00', 3100.00, 0.00, 275.00, 658.50, 'MZTMID013', 1, 20, 0, 4),
(3145, 'CDM', 'TIJ', '2024-12-05', '2024-12-05', '10:30:00', '15:30:00', 5000.00, 4700.00, 350.00, 855.00, 'CDMXTIJ013', 1, 9, 0, 3),
(3146, 'TIJ', 'CDM', '2024-12-05', '2024-12-05', '18:30:00', '23:30:00', 5000.00, 0.00, 350.00, 855.00, 'TIJCDMX013', 1, 12, 0, 2),
(3147, 'MTY', 'MID', '2024-12-05', '2024-12-05', '07:00:00', '11:00:00', 3600.00, 0.00, 260.00, 688.00, 'MTYMID013', 1, 16, 0, 1),
(3148, 'MID', 'MTY', '2024-12-05', '2024-12-05', '13:00:00', '17:00:00', 3600.00, 3300.00, 260.00, 688.00, 'MIDMTY013', 1, 16, 0, 1),
(3149, 'CUN', 'CDM', '2024-12-05', '2024-12-05', '09:30:00', '11:45:00', 2300.00, 2000.00, 200.00, 460.00, 'CUNCDMX013', 1, 12, 0, 2),
(3150, 'CDM', 'CUN', '2024-12-05', '2024-12-05', '18:00:00', '20:15:00', 2300.00, 0.00, 200.00, 460.00, 'CDMXCUN013', 1, 12, 0, 2),
(3151, 'TIJ', 'MID', '2024-12-06', '2024-12-06', '08:00:00', '12:00:00', 4500.00, 0.00, 300.00, 720.00, 'TIJMID003', 1, 16, 0, 1),
(3152, 'MID', 'TIJ', '2024-12-06', '2024-12-06', '14:00:00', '18:00:00', 4500.00, 0.00, 300.00, 720.00, 'MIDTIJ003', 1, 16, 0, 1),
(3153, 'CUN', 'MTY', '2024-12-06', '2024-12-06', '09:00:00', '13:00:00', 3200.00, 2900.00, 250.00, 608.00, 'CUNMTY003', 1, 12, 0, 2),
(3154, 'MTY', 'CUN', '2024-12-06', '2024-12-06', '15:00:00', '19:00:00', 3200.00, 0.00, 250.00, 608.00, 'MTYCUN003', 1, 12, 0, 2),
(3155, 'CDM', 'MZT', '2024-12-06', '2024-12-06', '07:30:00', '10:00:00', 2800.00, 2400.00, 220.00, 568.00, 'CDMXMZT003', 1, 9, 0, 3),
(3156, 'MZT', 'CDM', '2024-12-06', '2024-12-06', '16:30:00', '19:00:00', 2800.00, 0.00, 220.00, 568.00, 'MZTCDMX003', 1, 9, 0, 3),
(3157, 'MID', 'MZT', '2024-12-06', '2024-12-06', '08:45:00', '11:45:00', 3100.00, 2850.00, 275.00, 658.50, 'MIDMZT003', 1, 20, 0, 4),
(3158, 'MZT', 'MID', '2024-12-06', '2024-12-06', '14:15:00', '17:15:00', 3100.00, 0.00, 275.00, 658.50, 'MZTMID003', 1, 20, 0, 4),
(3159, 'CDM', 'TIJ', '2024-12-06', '2024-12-06', '10:30:00', '15:30:00', 5000.00, 4700.00, 350.00, 855.00, 'CDMXTIJ003', 1, 9, 0, 3),
(3160, 'TIJ', 'CDM', '2024-12-06', '2024-12-06', '18:30:00', '23:30:00', 5000.00, 0.00, 350.00, 855.00, 'TIJCDMX003', 1, 12, 0, 2),
(3161, 'MTY', 'MID', '2024-12-06', '2024-12-06', '07:00:00', '11:00:00', 3600.00, 0.00, 260.00, 688.00, 'MTYMID003', 1, 16, 0, 1),
(3162, 'MID', 'MTY', '2024-12-06', '2024-12-06', '13:00:00', '17:00:00', 3600.00, 3300.00, 260.00, 688.00, 'MIDMTY003', 1, 16, 0, 1),
(3163, 'CUN', 'CDM', '2024-12-06', '2024-12-06', '09:30:00', '11:45:00', 2300.00, 2000.00, 200.00, 460.00, 'CUNCDMX003', 1, 12, 0, 2),
(3164, 'CDM', 'CUN', '2024-12-06', '2024-12-06', '18:00:00', '20:15:00', 2300.00, 0.00, 200.00, 460.00, 'CDMXCUN003', 1, 12, 0, 2),
(3165, 'TIJ', 'MID', '2024-12-07', '2024-12-07', '08:00:00', '12:00:00', 4500.00, 0.00, 300.00, 720.00, 'TIJMID004', 1, 16, 0, 1),
(3166, 'MID', 'TIJ', '2024-12-07', '2024-12-07', '14:00:00', '18:00:00', 4500.00, 0.00, 300.00, 720.00, 'MIDTIJ004', 1, 16, 0, 1),
(3167, 'CUN', 'MTY', '2024-12-07', '2024-12-07', '09:00:00', '13:00:00', 3200.00, 2900.00, 250.00, 608.00, 'CUNMTY004', 1, 12, 0, 2),
(3168, 'MTY', 'CUN', '2024-12-07', '2024-12-07', '15:00:00', '19:00:00', 3200.00, 0.00, 250.00, 608.00, 'MTYCUN004', 1, 12, 0, 2),
(3169, 'CDM', 'MZT', '2024-12-07', '2024-12-07', '07:30:00', '10:00:00', 2800.00, 2400.00, 220.00, 568.00, 'CDMXMZT004', 1, 9, 0, 3),
(3170, 'MZT', 'CDM', '2024-12-07', '2024-12-07', '16:30:00', '19:00:00', 2800.00, 0.00, 220.00, 568.00, 'MZTCDMX004', 1, 9, 0, 3),
(3171, 'MID', 'MZT', '2024-12-07', '2024-12-07', '08:45:00', '11:45:00', 3100.00, 2850.00, 275.00, 658.50, 'MIDMZT004', 1, 20, 0, 4),
(3172, 'MZT', 'MID', '2024-12-07', '2024-12-07', '14:15:00', '17:15:00', 3100.00, 0.00, 275.00, 658.50, 'MZTMID004', 1, 20, 0, 4),
(3173, 'CDM', 'TIJ', '2024-12-07', '2024-12-07', '10:30:00', '15:30:00', 5000.00, 4700.00, 350.00, 855.00, 'CDMXTIJ004', 1, 9, 0, 3),
(3174, 'TIJ', 'CDM', '2024-12-07', '2024-12-07', '18:30:00', '23:30:00', 5000.00, 0.00, 350.00, 855.00, 'TIJCDMX004', 1, 12, 0, 2),
(3175, 'MTY', 'MID', '2024-12-07', '2024-12-07', '07:00:00', '11:00:00', 3600.00, 0.00, 260.00, 688.00, 'MTYMID004', 1, 16, 0, 1),
(3176, 'MID', 'MTY', '2024-12-07', '2024-12-07', '13:00:00', '17:00:00', 3600.00, 3300.00, 260.00, 688.00, 'MIDMTY004', 1, 16, 0, 1),
(3177, 'CUN', 'CDM', '2024-12-07', '2024-12-07', '09:30:00', '11:45:00', 2300.00, 2000.00, 200.00, 460.00, 'CUNCDMX004', 1, 12, 0, 2),
(3178, 'CDM', 'CUN', '2024-12-07', '2024-12-07', '18:00:00', '20:15:00', 2300.00, 0.00, 200.00, 460.00, 'CDMXCUN004', 1, 12, 0, 2),
(3179, 'TIJ', 'MID', '2024-12-08', '2024-12-08', '08:00:00', '12:00:00', 4500.00, 0.00, 300.00, 720.00, 'TIJMID005', 1, 16, 0, 1),
(3180, 'MID', 'TIJ', '2024-12-08', '2024-12-08', '14:00:00', '18:00:00', 4500.00, 0.00, 300.00, 720.00, 'MIDTIJ005', 1, 16, 0, 1),
(3181, 'CUN', 'MTY', '2024-12-08', '2024-12-08', '09:00:00', '13:00:00', 3200.00, 2900.00, 250.00, 608.00, 'CUNMTY005', 1, 12, 0, 2),
(3182, 'MTY', 'CUN', '2024-12-08', '2024-12-08', '15:00:00', '19:00:00', 3200.00, 0.00, 250.00, 608.00, 'MTYCUN005', 1, 12, 0, 2),
(3183, 'CDM', 'MZT', '2024-12-08', '2024-12-08', '07:30:00', '10:00:00', 2800.00, 2400.00, 220.00, 568.00, 'CDMXMZT005', 1, 9, 0, 3),
(3184, 'MZT', 'CDM', '2024-12-08', '2024-12-08', '16:30:00', '19:00:00', 2800.00, 0.00, 220.00, 568.00, 'MZTCDMX005', 1, 9, 0, 3),
(3185, 'MID', 'MZT', '2024-12-08', '2024-12-08', '08:45:00', '11:45:00', 3100.00, 2850.00, 275.00, 658.50, 'MIDMZT005', 1, 20, 0, 4),
(3186, 'MZT', 'MID', '2024-12-08', '2024-12-08', '14:15:00', '17:15:00', 3100.00, 0.00, 275.00, 658.50, 'MZTMID005', 1, 20, 0, 4),
(3187, 'CDM', 'TIJ', '2024-12-08', '2024-12-08', '10:30:00', '15:30:00', 5000.00, 4700.00, 350.00, 855.00, 'CDMXTIJ005', 1, 9, 0, 3),
(3188, 'TIJ', 'CDM', '2024-12-08', '2024-12-08', '18:30:00', '23:30:00', 5000.00, 0.00, 350.00, 855.00, 'TIJCDMX005', 1, 12, 0, 2),
(3189, 'MTY', 'MID', '2024-12-08', '2024-12-08', '07:00:00', '11:00:00', 3600.00, 0.00, 260.00, 688.00, 'MTYMID005', 1, 16, 0, 1),
(3190, 'MID', 'MTY', '2024-12-08', '2024-12-08', '13:00:00', '17:00:00', 3600.00, 3300.00, 260.00, 688.00, 'MIDMTY005', 1, 16, 0, 1),
(3191, 'CUN', 'CDM', '2024-12-08', '2024-12-08', '09:30:00', '11:45:00', 2300.00, 2000.00, 200.00, 460.00, 'CUNCDMX005', 1, 12, 0, 2),
(3192, 'CDM', 'CUN', '2024-12-08', '2024-12-08', '18:00:00', '20:15:00', 2300.00, 0.00, 200.00, 460.00, 'CDMXCUN005', 1, 12, 0, 2),
(3193, 'TIJ', 'MID', '2024-12-09', '2024-12-09', '08:00:00', '12:00:00', 4500.00, 0.00, 300.00, 720.00, 'TIJMID006', 1, 16, 0, 1),
(3194, 'MID', 'TIJ', '2024-12-09', '2024-12-09', '14:00:00', '18:00:00', 4500.00, 0.00, 300.00, 720.00, 'MIDTIJ006', 1, 16, 0, 1),
(3195, 'CUN', 'MTY', '2024-12-09', '2024-12-09', '09:00:00', '13:00:00', 3200.00, 2900.00, 250.00, 608.00, 'CUNMTY006', 1, 12, 0, 2),
(3196, 'MTY', 'CUN', '2024-12-09', '2024-12-09', '15:00:00', '19:00:00', 3200.00, 0.00, 250.00, 608.00, 'MTYCUN006', 1, 12, 0, 2),
(3197, 'CDM', 'MZT', '2024-12-09', '2024-12-09', '07:30:00', '10:00:00', 2800.00, 2400.00, 220.00, 568.00, 'CDMXMZT006', 1, 9, 0, 3),
(3198, 'MZT', 'CDM', '2024-12-09', '2024-12-09', '16:30:00', '19:00:00', 2800.00, 0.00, 220.00, 568.00, 'MZTCDMX006', 1, 9, 0, 3),
(3199, 'MID', 'MZT', '2024-12-09', '2024-12-09', '08:45:00', '11:45:00', 3100.00, 2850.00, 275.00, 658.50, 'MIDMZT006', 1, 20, 0, 4),
(3200, 'MZT', 'MID', '2024-12-09', '2024-12-09', '14:15:00', '17:15:00', 3100.00, 0.00, 275.00, 658.50, 'MZTMID006', 1, 20, 0, 4),
(3201, 'CDM', 'TIJ', '2024-12-09', '2024-12-09', '10:30:00', '15:30:00', 5000.00, 4700.00, 350.00, 855.00, 'CDMXTIJ006', 1, 9, 0, 3),
(3202, 'TIJ', 'CDM', '2024-12-09', '2024-12-09', '18:30:00', '23:30:00', 5000.00, 0.00, 350.00, 855.00, 'TIJCDMX006', 1, 12, 0, 2),
(3203, 'MTY', 'MID', '2024-12-09', '2024-12-09', '07:00:00', '11:00:00', 3600.00, 0.00, 260.00, 688.00, 'MTYMID006', 1, 16, 0, 1),
(3204, 'MID', 'MTY', '2024-12-09', '2024-12-09', '13:00:00', '17:00:00', 3600.00, 3300.00, 260.00, 688.00, 'MIDMTY006', 1, 16, 0, 1),
(3205, 'CUN', 'CDM', '2024-12-09', '2024-12-09', '09:30:00', '11:45:00', 2300.00, 2000.00, 200.00, 460.00, 'CUNCDMX006', 1, 12, 0, 2),
(3206, 'CDM', 'CUN', '2024-12-09', '2024-12-09', '18:00:00', '20:15:00', 2300.00, 0.00, 200.00, 460.00, 'CDMXCUN006', 1, 12, 0, 2),
(3207, 'TIJ', 'MID', '2024-12-10', '2024-12-10', '08:00:00', '12:00:00', 4500.00, 0.00, 300.00, 720.00, 'TIJMID007', 1, 16, 0, 1),
(3208, 'MID', 'TIJ', '2024-12-10', '2024-12-10', '14:00:00', '18:00:00', 4500.00, 0.00, 300.00, 720.00, 'MIDTIJ007', 1, 16, 0, 1),
(3209, 'CUN', 'MTY', '2024-12-10', '2024-12-10', '09:00:00', '13:00:00', 3200.00, 2900.00, 250.00, 608.00, 'CUNMTY007', 1, 12, 0, 2),
(3210, 'MTY', 'CUN', '2024-12-10', '2024-12-10', '15:00:00', '19:00:00', 3200.00, 0.00, 250.00, 608.00, 'MTYCUN007', 1, 12, 0, 2),
(3211, 'CDM', 'MZT', '2024-12-10', '2024-12-10', '07:30:00', '10:00:00', 2800.00, 2400.00, 220.00, 568.00, 'CDMXMZT007', 1, 9, 0, 3),
(3212, 'MZT', 'CDM', '2024-12-10', '2024-12-10', '16:30:00', '19:00:00', 2800.00, 0.00, 220.00, 568.00, 'MZTCDMX007', 1, 9, 0, 3),
(3213, 'MID', 'MZT', '2024-12-10', '2024-12-10', '08:45:00', '11:45:00', 3100.00, 2850.00, 275.00, 658.50, 'MIDMZT007', 1, 20, 0, 4),
(3214, 'MZT', 'MID', '2024-12-10', '2024-12-10', '14:15:00', '17:15:00', 3100.00, 0.00, 275.00, 658.50, 'MZTMID007', 1, 20, 0, 4),
(3215, 'CDM', 'TIJ', '2024-12-10', '2024-12-10', '10:30:00', '15:30:00', 5000.00, 4700.00, 350.00, 855.00, 'CDMXTIJ007', 1, 9, 0, 3),
(3216, 'TIJ', 'CDM', '2024-12-10', '2024-12-10', '18:30:00', '23:30:00', 5000.00, 0.00, 350.00, 855.00, 'TIJCDMX007', 1, 12, 0, 2),
(3217, 'MTY', 'MID', '2024-12-10', '2024-12-10', '07:00:00', '11:00:00', 3600.00, 0.00, 260.00, 688.00, 'MTYMID007', 1, 16, 0, 1),
(3218, 'MID', 'MTY', '2024-12-10', '2024-12-10', '13:00:00', '17:00:00', 3600.00, 3300.00, 260.00, 688.00, 'MIDMTY007', 1, 16, 0, 1),
(3219, 'CUN', 'CDM', '2024-12-10', '2024-12-10', '09:30:00', '11:45:00', 2300.00, 2000.00, 200.00, 460.00, 'CUNCDMX007', 1, 12, 0, 2),
(3220, 'CDM', 'CUN', '2024-12-10', '2024-12-10', '18:00:00', '20:15:00', 2300.00, 0.00, 200.00, 460.00, 'CDMXCUN007', 1, 12, 0, 2),
(3221, 'TIJ', 'MID', '2024-12-11', '2024-12-11', '08:00:00', '12:00:00', 4500.00, 0.00, 300.00, 720.00, 'TIJMID008', 1, 16, 0, 1),
(3222, 'MID', 'TIJ', '2024-12-11', '2024-12-11', '14:00:00', '18:00:00', 4500.00, 0.00, 300.00, 720.00, 'MIDTIJ008', 1, 16, 0, 1),
(3223, 'CUN', 'MTY', '2024-12-11', '2024-12-11', '09:00:00', '13:00:00', 3200.00, 2900.00, 250.00, 608.00, 'CUNMTY008', 1, 12, 0, 2),
(3224, 'MTY', 'CUN', '2024-12-11', '2024-12-11', '15:00:00', '19:00:00', 3200.00, 0.00, 250.00, 608.00, 'MTYCUN008', 1, 12, 0, 2),
(3225, 'CDM', 'MZT', '2024-12-11', '2024-12-11', '07:30:00', '10:00:00', 2800.00, 2400.00, 220.00, 568.00, 'CDMXMZT008', 1, 9, 0, 3),
(3226, 'MZT', 'CDM', '2024-12-11', '2024-12-11', '16:30:00', '19:00:00', 2800.00, 0.00, 220.00, 568.00, 'MZTCDMX008', 1, 9, 0, 3),
(3227, 'MID', 'MZT', '2024-12-11', '2024-12-11', '08:45:00', '11:45:00', 3100.00, 2850.00, 275.00, 658.50, 'MIDMZT008', 1, 20, 0, 4),
(3228, 'MZT', 'MID', '2024-12-11', '2024-12-11', '14:15:00', '17:15:00', 3100.00, 0.00, 275.00, 658.50, 'MZTMID008', 1, 20, 0, 4),
(3229, 'CDM', 'TIJ', '2024-12-11', '2024-12-11', '10:30:00', '15:30:00', 5000.00, 4700.00, 350.00, 855.00, 'CDMXTIJ008', 1, 9, 0, 3),
(3230, 'TIJ', 'CDM', '2024-12-11', '2024-12-11', '18:30:00', '23:30:00', 5000.00, 0.00, 350.00, 855.00, 'TIJCDMX008', 1, 12, 0, 2),
(3231, 'MTY', 'MID', '2024-12-11', '2024-12-11', '07:00:00', '11:00:00', 3600.00, 0.00, 260.00, 688.00, 'MTYMID008', 1, 16, 0, 1),
(3232, 'MID', 'MTY', '2024-12-11', '2024-12-11', '13:00:00', '17:00:00', 3600.00, 3300.00, 260.00, 688.00, 'MIDMTY008', 1, 16, 0, 1),
(3233, 'CUN', 'CDM', '2024-12-11', '2024-12-11', '09:30:00', '11:45:00', 2300.00, 2000.00, 200.00, 460.00, 'CUNCDMX008', 1, 12, 0, 2),
(3234, 'CDM', 'CUN', '2024-12-11', '2024-12-11', '18:00:00', '20:15:00', 2300.00, 0.00, 200.00, 460.00, 'CDMXCUN008', 1, 12, 0, 2),
(3235, 'TIJ', 'MID', '2024-12-12', '2024-12-12', '08:00:00', '12:00:00', 4500.00, 0.00, 300.00, 720.00, 'TIJMID009', 1, 16, 0, 1),
(3236, 'MID', 'TIJ', '2024-12-12', '2024-12-12', '14:00:00', '18:00:00', 4500.00, 0.00, 300.00, 720.00, 'MIDTIJ009', 1, 16, 0, 1),
(3237, 'CUN', 'MTY', '2024-12-12', '2024-12-12', '09:00:00', '13:00:00', 3200.00, 2900.00, 250.00, 608.00, 'CUNMTY009', 1, 12, 0, 2),
(3238, 'MTY', 'CUN', '2024-12-12', '2024-12-12', '15:00:00', '19:00:00', 3200.00, 0.00, 250.00, 608.00, 'MTYCUN009', 1, 12, 0, 2),
(3239, 'CDM', 'MZT', '2024-12-12', '2024-12-12', '07:30:00', '10:00:00', 2800.00, 2400.00, 220.00, 568.00, 'CDMXMZT009', 1, 9, 0, 3),
(3240, 'MZT', 'CDM', '2024-12-12', '2024-12-12', '16:30:00', '19:00:00', 2800.00, 0.00, 220.00, 568.00, 'MZTCDMX009', 1, 9, 0, 3),
(3241, 'MID', 'MZT', '2024-12-12', '2024-12-12', '08:45:00', '11:45:00', 3100.00, 2850.00, 275.00, 658.50, 'MIDMZT009', 1, 20, 0, 4),
(3242, 'MZT', 'MID', '2024-12-12', '2024-12-12', '14:15:00', '17:15:00', 3100.00, 0.00, 275.00, 658.50, 'MZTMID009', 1, 20, 0, 4),
(3243, 'CDM', 'TIJ', '2024-12-12', '2024-12-12', '10:30:00', '15:30:00', 5000.00, 4700.00, 350.00, 855.00, 'CDMXTIJ009', 1, 9, 0, 3),
(3244, 'TIJ', 'CDM', '2024-12-12', '2024-12-12', '18:30:00', '23:30:00', 5000.00, 0.00, 350.00, 855.00, 'TIJCDMX009', 1, 12, 0, 2),
(3245, 'MTY', 'MID', '2024-12-12', '2024-12-12', '07:00:00', '11:00:00', 3600.00, 0.00, 260.00, 688.00, 'MTYMID009', 1, 16, 0, 1),
(3246, 'MID', 'MTY', '2024-12-12', '2024-12-12', '13:00:00', '17:00:00', 3600.00, 3300.00, 260.00, 688.00, 'MIDMTY009', 1, 16, 0, 1),
(3247, 'CUN', 'CDM', '2024-12-12', '2024-12-12', '09:30:00', '11:45:00', 2300.00, 2000.00, 200.00, 460.00, 'CUNCDMX009', 1, 12, 0, 2),
(3248, 'CDM', 'CUN', '2024-12-12', '2024-12-12', '18:00:00', '20:15:00', 2300.00, 0.00, 200.00, 460.00, 'CDMXCUN009', 1, 12, 0, 2),
(3249, 'TIJ', 'MID', '2024-12-13', '2024-12-13', '08:00:00', '12:00:00', 4500.00, 0.00, 300.00, 720.00, 'TIJMID018', 1, 16, 0, 1),
(3250, 'MID', 'TIJ', '2024-12-13', '2024-12-13', '14:00:00', '18:00:00', 4500.00, 0.00, 300.00, 720.00, 'MIDTIJ018', 1, 16, 0, 1),
(3251, 'CUN', 'MTY', '2024-12-13', '2024-12-13', '09:00:00', '13:00:00', 3200.00, 2900.00, 250.00, 608.00, 'CUNMTY010', 1, 12, 0, 2),
(3252, 'MTY', 'CUN', '2024-12-13', '2024-12-13', '15:00:00', '19:00:00', 3200.00, 0.00, 250.00, 608.00, 'MTYCUN018', 1, 12, 0, 2),
(3253, 'CDM', 'MZT', '2024-12-13', '2024-12-13', '07:30:00', '10:00:00', 2800.00, 2400.00, 220.00, 568.00, 'CDMXMZT010', 1, 9, 0, 3),
(3254, 'MZT', 'CDM', '2024-12-13', '2024-12-13', '16:30:00', '19:00:00', 2800.00, 0.00, 220.00, 568.00, 'MZTCDMX010', 1, 9, 0, 3),
(3255, 'MID', 'MZT', '2024-12-13', '2024-12-13', '08:45:00', '11:45:00', 3100.00, 2850.00, 275.00, 658.50, 'MIDMZT010', 1, 20, 0, 4),
(3256, 'MZT', 'MID', '2024-12-13', '2024-12-13', '14:15:00', '17:15:00', 3100.00, 0.00, 275.00, 658.50, 'MZTMID010', 1, 20, 0, 4),
(3257, 'CDM', 'TIJ', '2024-12-13', '2024-12-13', '10:30:00', '15:30:00', 5000.00, 4700.00, 350.00, 855.00, 'CDMXTIJ010', 1, 9, 0, 3),
(3258, 'TIJ', 'CDM', '2024-12-13', '2024-12-13', '18:30:00', '23:30:00', 5000.00, 0.00, 350.00, 855.00, 'TIJCDMX010', 1, 12, 0, 2),
(3259, 'MTY', 'MID', '2024-12-13', '2024-12-13', '07:00:00', '11:00:00', 3600.00, 0.00, 260.00, 688.00, 'MTYMID010', 1, 16, 0, 1),
(3260, 'MID', 'MTY', '2024-12-13', '2024-12-13', '13:00:00', '17:00:00', 3600.00, 3300.00, 260.00, 688.00, 'MIDMTY010', 1, 16, 0, 1),
(3261, 'CUN', 'CDM', '2024-12-13', '2024-12-13', '09:30:00', '11:45:00', 2300.00, 2000.00, 200.00, 460.00, 'CUNCDMX010', 1, 12, 0, 2),
(3262, 'CDM', 'CUN', '2024-12-13', '2024-12-13', '18:00:00', '20:15:00', 2300.00, 0.00, 200.00, 460.00, 'CDMXCUN010', 1, 12, 0, 2),
(3263, 'TIJ', 'MID', '2024-12-14', '2024-12-14', '08:00:00', '12:00:00', 4500.00, 0.00, 300.00, 720.00, 'TIJMID019', 1, 16, 0, 1),
(3264, 'MID', 'TIJ', '2024-12-14', '2024-12-14', '13:00:00', '18:00:00', 4500.00, 0.00, 300.00, 720.00, 'MIDTIJ010', 1, 16, 0, 1),
(3265, 'CUN', 'MTY', '2024-12-14', '2024-12-14', '09:00:00', '14:00:00', 3200.00, 2900.00, 250.00, 608.00, 'CUNMTY018', 1, 12, 0, 2),
(3266, 'MTY', 'CUN', '2024-12-14', '2024-12-14', '15:00:00', '19:00:00', 3200.00, 0.00, 250.00, 608.00, 'MTYCUN020', 1, 12, 0, 2),
(3267, 'CDM', 'MZT', '2024-12-14', '2024-12-14', '07:30:00', '10:00:00', 2800.00, 2400.00, 220.00, 568.00, 'CDMXMZT020', 1, 9, 0, 3),
(3268, 'MZT', 'CDM', '2024-12-14', '2024-12-14', '16:30:00', '19:00:00', 2800.00, 0.00, 220.00, 568.00, 'MZTCDMX018', 1, 9, 0, 3),
(3269, 'MID', 'MZT', '2024-12-14', '2024-12-14', '08:45:00', '11:45:00', 3100.00, 2850.00, 275.00, 658.50, 'MIDMZT018', 1, 20, 0, 4),
(3270, 'MZT', 'MID', '2024-12-14', '2024-12-14', '13:15:00', '17:15:00', 3100.00, 0.00, 275.00, 658.50, 'MZTMID020', 1, 20, 0, 4),
(3271, 'CDM', 'TIJ', '2024-12-14', '2024-12-14', '10:30:00', '15:30:00', 5000.00, 4700.00, 350.00, 855.00, 'CDMXTIJ018', 1, 9, 0, 3),
(3272, 'TIJ', 'CDM', '2024-12-14', '2024-12-14', '18:30:00', '23:30:00', 5000.00, 0.00, 350.00, 855.00, 'TIJCDMX018', 1, 12, 0, 2),
(3273, 'MTY', 'MID', '2024-12-14', '2024-12-14', '07:00:00', '11:00:00', 3600.00, 0.00, 260.00, 688.00, 'MTYMID018', 1, 16, 0, 1),
(3274, 'MID', 'MTY', '2024-12-14', '2024-12-14', '13:00:00', '17:00:00', 3600.00, 3300.00, 260.00, 688.00, 'MIDMTY017', 1, 16, 0, 1),
(3275, 'CUN', 'CDM', '2024-12-14', '2024-12-14', '09:30:00', '11:45:00', 2300.00, 2000.00, 200.00, 460.00, 'CUNCDMX019', 1, 12, 0, 2),
(3276, 'CDM', 'CUN', '2024-12-14', '2024-12-14', '18:00:00', '20:15:00', 2300.00, 0.00, 200.00, 460.00, 'CDMXCUN018', 1, 12, 0, 2),
(3277, 'TIJ', 'MID', '2024-12-15', '2024-12-15', '08:00:00', '12:00:00', 4500.00, 0.00, 300.00, 720.00, 'TIJMID010', 1, 16, 0, 1),
(3278, 'MID', 'TIJ', '2024-12-15', '2024-12-15', '13:00:00', '18:00:00', 4500.00, 0.00, 300.00, 720.00, 'MIDTIJ020', 1, 16, 0, 1),
(3279, 'CUN', 'MTY', '2024-12-15', '2024-12-15', '09:00:00', '14:00:00', 3200.00, 2900.00, 250.00, 608.00, 'CUNMTY020', 1, 12, 0, 2),
(3280, 'MTY', 'CUN', '2024-12-15', '2024-12-15', '15:00:00', '19:00:00', 3200.00, 0.00, 250.00, 608.00, 'MTYCUN010', 1, 12, 0, 2),
(3281, 'CDM', 'MZT', '2024-12-15', '2024-12-15', '07:30:00', '10:00:00', 2800.00, 2400.00, 220.00, 568.00, 'CDMXMZT018', 1, 9, 0, 3),
(3282, 'MZT', 'CDM', '2024-12-15', '2024-12-15', '16:30:00', '19:00:00', 2800.00, 0.00, 220.00, 568.00, 'MZTCDMX020', 1, 9, 0, 3),
(3283, 'MID', 'MZT', '2024-12-15', '2024-12-15', '08:45:00', '11:45:00', 3100.00, 2850.00, 275.00, 658.50, 'MIDMZT020', 1, 20, 0, 4),
(3284, 'MZT', 'MID', '2024-12-15', '2024-12-15', '13:15:00', '17:15:00', 3100.00, 0.00, 275.00, 658.50, 'MZTMID018', 1, 20, 0, 4),
(3285, 'CDM', 'TIJ', '2024-12-15', '2024-12-15', '10:30:00', '15:30:00', 5000.00, 4700.00, 350.00, 855.00, 'CDMXTIJ020', 1, 9, 0, 3),
(3286, 'TIJ', 'CDM', '2024-12-15', '2024-12-15', '18:30:00', '23:30:00', 5000.00, 0.00, 350.00, 855.00, 'TIJCDMX020', 1, 12, 0, 2),
(3287, 'MTY', 'MID', '2024-12-15', '2024-12-15', '07:00:00', '11:00:00', 3600.00, 0.00, 260.00, 688.00, 'MTYMID020', 1, 16, 0, 1),
(3288, 'MID', 'MTY', '2024-12-15', '2024-12-15', '13:00:00', '17:00:00', 3600.00, 3300.00, 260.00, 688.00, 'MIDMTY020', 1, 16, 0, 1),
(3289, 'CUN', 'CDM', '2024-12-15', '2024-12-15', '09:30:00', '11:45:00', 2300.00, 2000.00, 200.00, 460.00, 'CUNCDMX018', 1, 12, 0, 2),
(3290, 'CDM', 'CUN', '2024-12-15', '2024-12-15', '18:00:00', '20:15:00', 2300.00, 0.00, 200.00, 460.00, 'CDMXCUN020', 1, 12, 0, 2);

--
-- Disparadores `vuelos`
--
DELIMITER $$
CREATE TRIGGER `actualizar_num_asientos` BEFORE INSERT ON `vuelos` FOR EACH ROW BEGIN
    DECLARE asientos INT;

    -- Obtiene el número de asientos de la aeronave asignada al vuelo
    SELECT num_asientos INTO asientos
    FROM aeronaves
    WHERE id_aeronave = NEW.id_aeronave;
    
    -- Asigna el número de asientos al nuevo registro antes de insertarlo
    SET NEW.num_asientos = asientos;
END
$$
DELIMITER ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indices de la tabla `aeronaves`
--
ALTER TABLE `aeronaves`
  ADD PRIMARY KEY (`id_aeronave`),
  ADD UNIQUE KEY `matricula` (`matricula`);

--
-- Indices de la tabla `asientos`
--
ALTER TABLE `asientos`
  ADD PRIMARY KEY (`id_asiento`),
  ADD KEY `id_vuelo` (`id_vuelo`);

--
-- Indices de la tabla `asientos_reservas`
--
ALTER TABLE `asientos_reservas`
  ADD PRIMARY KEY (`id_asiento`,`id_reserva`),
  ADD KEY `id_reserva` (`id_reserva`);

--
-- Indices de la tabla `codigos_promos`
--
ALTER TABLE `codigos_promos`
  ADD PRIMARY KEY (`id_codigo`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Indices de la tabla `destinos`
--
ALTER TABLE `destinos`
  ADD PRIMARY KEY (`id_destino`);

--
-- Indices de la tabla `destinos_nuevos`
--
ALTER TABLE `destinos_nuevos`
  ADD PRIMARY KEY (`id_destino_nuevo`);

--
-- Indices de la tabla `equipaje`
--
ALTER TABLE `equipaje`
  ADD PRIMARY KEY (`id_equipaje`),
  ADD KEY `id_reserva` (`id_reserva`);

--
-- Indices de la tabla `extras`
--
ALTER TABLE `extras`
  ADD PRIMARY KEY (`id_extra`);

--
-- Indices de la tabla `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id_faq`),
  ADD KEY `creado_por` (`creado_por`);

--
-- Indices de la tabla `historial_compras`
--
ALTER TABLE `historial_compras`
  ADD PRIMARY KEY (`id_historial`),
  ADD KEY `id_pasajero` (`id_pasajero`),
  ADD KEY `id_reserva` (`id_reserva`);

--
-- Indices de la tabla `imagenes_destinos`
--
ALTER TABLE `imagenes_destinos`
  ADD PRIMARY KEY (`id_imagen`),
  ADD KEY `id_destino` (`id_destino`);

--
-- Indices de la tabla `pasajeros`
--
ALTER TABLE `pasajeros`
  ADD PRIMARY KEY (`id_pasajero`);

--
-- Indices de la tabla `pasajeros_reserva`
--
ALTER TABLE `pasajeros_reserva`
  ADD PRIMARY KEY (`id_pasajero_reserva`),
  ADD KEY `id_reserva` (`id_reserva`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo_reserva` (`codigo_reserva`),
  ADD UNIQUE KEY `codigo_boleto` (`codigo_boleto`),
  ADD KEY `fk_codigo_vuelo` (`codigo_vuelo`);

--
-- Indices de la tabla `vuelos`
--
ALTER TABLE `vuelos`
  ADD PRIMARY KEY (`id_vuelo`),
  ADD UNIQUE KEY `codigo_vuelo` (`codigo_vuelo`),
  ADD KEY `id_aeronave` (`id_aeronave`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administradores`
--
ALTER TABLE `administradores`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `aeronaves`
--
ALTER TABLE `aeronaves`
  MODIFY `id_aeronave` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `asientos`
--
ALTER TABLE `asientos`
  MODIFY `id_asiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `codigos_promos`
--
ALTER TABLE `codigos_promos`
  MODIFY `id_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `destinos`
--
ALTER TABLE `destinos`
  MODIFY `id_destino` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `destinos_nuevos`
--
ALTER TABLE `destinos_nuevos`
  MODIFY `id_destino_nuevo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `equipaje`
--
ALTER TABLE `equipaje`
  MODIFY `id_equipaje` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `extras`
--
ALTER TABLE `extras`
  MODIFY `id_extra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id_faq` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historial_compras`
--
ALTER TABLE `historial_compras`
  MODIFY `id_historial` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `imagenes_destinos`
--
ALTER TABLE `imagenes_destinos`
  MODIFY `id_imagen` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pasajeros`
--
ALTER TABLE `pasajeros`
  MODIFY `id_pasajero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pasajeros_reserva`
--
ALTER TABLE `pasajeros_reserva`
  MODIFY `id_pasajero_reserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `vuelos`
--
ALTER TABLE `vuelos`
  MODIFY `id_vuelo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3291;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asientos`
--
ALTER TABLE `asientos`
  ADD CONSTRAINT `asientos_ibfk_1` FOREIGN KEY (`id_vuelo`) REFERENCES `vuelos` (`id_vuelo`);

--
-- Filtros para la tabla `asientos_reservas`
--
ALTER TABLE `asientos_reservas`
  ADD CONSTRAINT `asientos_reservas_ibfk_1` FOREIGN KEY (`id_asiento`) REFERENCES `asientos` (`id_asiento`),
  ADD CONSTRAINT `asientos_reservas_ibfk_2` FOREIGN KEY (`id_reserva`) REFERENCES `reservas` (`id_reserva`);

--
-- Filtros para la tabla `equipaje`
--
ALTER TABLE `equipaje`
  ADD CONSTRAINT `equipaje_ibfk_1` FOREIGN KEY (`id_reserva`) REFERENCES `reservas` (`id_reserva`);

--
-- Filtros para la tabla `faqs`
--
ALTER TABLE `faqs`
  ADD CONSTRAINT `faqs_ibfk_1` FOREIGN KEY (`creado_por`) REFERENCES `administradores` (`id_admin`);

--
-- Filtros para la tabla `historial_compras`
--
ALTER TABLE `historial_compras`
  ADD CONSTRAINT `historial_compras_ibfk_1` FOREIGN KEY (`id_pasajero`) REFERENCES `pasajeros` (`id_pasajero`),
  ADD CONSTRAINT `historial_compras_ibfk_2` FOREIGN KEY (`id_reserva`) REFERENCES `reservas` (`id_reserva`);

--
-- Filtros para la tabla `imagenes_destinos`
--
ALTER TABLE `imagenes_destinos`
  ADD CONSTRAINT `imagenes_destinos_ibfk_1` FOREIGN KEY (`id_destino`) REFERENCES `destinos` (`id_destino`);

--
-- Filtros para la tabla `pasajeros_reserva`
--
ALTER TABLE `pasajeros_reserva`
  ADD CONSTRAINT `pasajeros_reserva_ibfk_1` FOREIGN KEY (`id_reserva`) REFERENCES `reservas` (`id_reserva`);

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `fk_codigo_vuelo` FOREIGN KEY (`codigo_vuelo`) REFERENCES `vuelos` (`codigo_vuelo`);

--
-- Filtros para la tabla `vuelos`
--
ALTER TABLE `vuelos`
  ADD CONSTRAINT `vuelos_ibfk_1` FOREIGN KEY (`id_aeronave`) REFERENCES `aeronaves` (`id_aeronave`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
