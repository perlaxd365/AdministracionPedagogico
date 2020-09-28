-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-09-2020 a las 22:33:03
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pedagogicousuarios`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `id_cargo` int(11) NOT NULL,
  `nombre_cargo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`id_cargo`, `nombre_cargo`) VALUES
(1, 'Administrador'),
(2, 'Secretario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `id_personal` int(11) NOT NULL,
  `nombres` varchar(100) DEFAULT NULL,
  `dni` varchar(8) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `id_cargo` int(11) DEFAULT NULL,
  `grados_academicos` varchar(100) DEFAULT NULL,
  `titulo_profesional` varchar(100) DEFAULT NULL,
  `exp_profesional` varchar(100) DEFAULT NULL,
  `exp_gestion` varchar(100) DEFAULT NULL,
  `exp_ldi` varchar(100) DEFAULT NULL,
  `horas_cap` varchar(20) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`id_personal`, `nombres`, `dni`, `correo`, `id_cargo`, `grados_academicos`, `titulo_profesional`, `exp_profesional`, `exp_gestion`, `exp_ldi`, `horas_cap`, `estado`) VALUES
(1, 'cesar', '88', 'cesarxd365@gmail.com', 1, '8', '8', '88', '88', '88', '88', 'Activo'),
(2, 'Cesar Raul Baca Gamarra', '73888312', 'perlaxd365@gmail.com', 2, 'Egresado', 'Ingeniero de Informática y de Sistemas', '2 años', '3 Meses', 'Desarrollo de Repositorio y Biblioteca', '1 hora', 'Activo'),
(3, 'Perla Sthefany', '76432549', 'perlaalmengual03@gmail.com', 1, 'Universitaria', 'No tiene', '4 años', 'nell', 'nell', 'nell', 'Activo'),
(4, 'Cesar Antionio', '10719829', 'antonioxd365@gmail.com', 1, 'uno', 'dos', 'tres', 'cuatro', 'cunco', '3', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sysdiagrams`
--

CREATE TABLE `sysdiagrams` (
  `name` varchar(128) CHARACTER SET utf8 NOT NULL,
  `principal_id` int(11) NOT NULL,
  `diagram_id` int(11) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `definition` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sysdiagrams`
--

INSERT INTO `sysdiagrams` (`name`, `principal_id`, `diagram_id`, `version`, `definition`) VALUES
('Diagram_0', 1, 1, 1, 0xd0cf11e0a1b11ae1000000000000000000000000000000003e000300feff0900060000000000000000000000010000000100000000000000001000000200000001000000feffffff0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdffffff09000000feffffff04000000050000000600000007000000080000000a000000feffffff0b0000000c0000000d0000000e0000000f000000feffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff52006f006f007400200045006e00740072007900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016000500ffffffffffffffff0200000000000000000000000000000000000000000000000000000000000000b094afd2c095d6010300000040160000000000006600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000201ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000002e020000000000006f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040002010100000004000000ffffffff000000000000000000000000000000000000000000000000000000000000000000000000090000008708000000000000010043006f006d0070004f0062006a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000012000201ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000002c0000005f000000000000000100000002000000030000000400000005000000060000000700000008000000feffffff0a0000000b0000000c0000000d0000000e0000000f000000100000001100000012000000130000001400000015000000160000001700000018000000190000001a0000001b0000001c0000001d0000001e0000001f000000200000002100000022000000230000002400000025000000260000002700000028000000290000002a0000002b000000feffffff2d000000feffffff2f000000300000003100000032000000330000003400000035000000360000003700000038000000390000003a0000003b0000003c0000003d0000003e0000003f000000400000004100000042000000430000004400000045000000460000004700000048000000490000004a000000fefffffffeffffff4d0000004e0000004f0000005000000051000000520000005300000054000000550000005600000057000000fefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff000430000a1e100c05000080060000000f00ffff06000000007d0000825600002f3d0000cc7900005559000010b3ffff63ccffffde805b10f195d011b0a000aa00bdcb5c0000080030000000000200000300000038002b00000009000000d9e6b0e91c81d011ad5100a0c90f5739f43b7f847f61c74385352986e1d552f8a0327db2d86295428d98273c25a2da2d00002c0043200000000000000000000053444dd2011fd1118e63006097d2df4834c9d2777977d811907000065b840d9c00002c0043200000000000000000000051444dd2011fd1118e63006097d2df4834c9d2777977d811907000065b840d9c05000000380100000085010000003000a50900000700008001000000a202000000800000080000805363684772696400c0c7ffff78d3ffff5573756172696f7300003000a50900000700008002000000a202000000800000080000805363684772696400f6beffffc6dfffff506572736f6e616c00003000a509000007000080040000009c0200000080000005000080536368477269647390e8ffff8ad0ffff436172676f69647300006800a5090000070000800500000052000000018000003f000080436f6e74726f6c73d9e5ffffc5deffff52656c6174696f6e736869702027464b5f506572736f6e616c5f436172676f27206265747765656e2027436172676f2720616e642027506572736f6e616c270000002800b50100000700008006000000310000005500000002800000436f6e74726f6c00f4e2ffff0be1ffff000000000000000000000000000000000000214334120800000039130000180c00007856341207000000140100005500730075006100720069006f00730000004d2014dbdf0c000000000000000000607140000000000000244000000000000014400000000000406f40000000000000f03f0000000000000000000000000100000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f03f00000000000000000000000000000000983b5b650000000000000000a03c5b65d8585b6530dbdf0c30dbdf0c020000000200000000000000000000003039aa0c000000000200000000008b430000204100808d430000204100008b430000704100000000000000000000000000000000000000000100000005000000540000002c0000002c0000002c0000003400000000000000000000002229000009230000000000002d0100000d0000000c000000070000001c0100000609000062070000480300001a040000df020000ec04000027060000b103000027060000cb07000055050000000000000100000039130000180c000000000000030000000300000002000000020000001c010000150900000000000001000000391300003403000000000000000000000000000002000000020000001c010000060900000100000000000000391300003403000000000000000000000000000002000000020000001c010000060900000000000000000000d13100000923000000000000000000000d00000004000000040000001c01000006090000aa0a00009006000078563412040000005a00000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f000000090000005500730075006100720069006f00730000002143341208000000222900000923000078563412070000001401000050006500720073006f006e0061006c00000000001510070000000000a41207000000000000000000000000000000000018000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000540000002c0000002c0000002c0000003400000000000000000000002229000009230000000000002d0100000d0000000c000000070000001c0100000609000062070000480300001a040000df020000ec04000027060000b103000027060000cb070000550500000000000001000000391300003403000000000000000000000000000002000000020000001c010000060900000000000001000000391300003403000000000000000000000000000002000000020000001c010000060900000100000000000000391300003403000000000000000000000000000002000000020000001c010000060900000000000000000000d13100000923000000000000000000000d00000004000000040000001c01000006090000aa0a00009006000078563412040000005a00000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000900000050006500720073006f006e0061006c0000002143341208000000222900000923000078563412070000001401000043006100720067006f000000000000009818b70c54b44c200000000000000000000024400000000000e0784000000000000072400000000000001440000000000000f03f00000000000000000000000001000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f03f0000000000000000983b5b650000000000000000a03c5b65d8585b6570b44c2070b44c2002000000020000000000000000000000603aad0c0000000002000000000020410000c743000020410080c9430000a0400000c74300000000000000000000000000000000000000000000000005000000540000002c0000002c0000002c0000003400000000000000000000002229000009230000000000002d0100000d0000000c000000070000001c0100000609000062070000480300001a040000df020000ec04000027060000b103000027060000cb070000550500000000000001000000391300003403000000000000000000000000000002000000020000001c010000060900000000000001000000391300003403000000000000000000000000000002000000020000001c010000060900000100000000000000391300003403000000000000000000000000000002000000020000001c010000060900000000000000000000d13100000923000000000000000000000d00000004000000040000001c01000006090000aa0a00009006000078563412040000005400000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000600000043006100720067006f00000002000b0090e8ffff5ce0ffff18e8ffff5ce0ffff0000000002000000f0f0f00000000000000000000000000000000000010000000600000000000000f4e2ffff0be1ffff960a00005801000032000000010000020000960a000058010000020000000000ffffff000800008001000000150001000000900144420100065461686f6d61110046004b005f0050006500720073006f006e0061006c005f0043006100720067006f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100feff030a0000ffffffff00000000000000000000000000000000170000004d6963726f736f66742044445320466f726d20322e300010000000456d626564646564204f626a6563740000000000f439b2710000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c00000010b3ffff63ccffff0100260000007300630068005f006c006100620065006c0073005f00760069007300690062006c0065000000010000000b0000001e0000000000000000000000000000000000000064000000000000000000000000000000000000000000000000000100000001000000000000000000000000000300440064007300530074007200650061006d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000160002000300000006000000ffffffff0000000000000000000000000000000000000000000000000000000000000000000000002e0000002f0700000000000053006300680065006d00610020005500440056002000440065006600610075006c0074000000000000000000000000000000000000000000000000000000000026000200ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000004b0000001600000000000000440053005200450046002d0053004300480045004d0041002d0043004f004e00540045004e0054005300000000000000000000000000000000000000000000002c0002010500000007000000ffffffff0000000000000000000000000000000000000000000000000000000000000000000000004c000000f80200000000000053006300680065006d00610020005500440056002000440065006600610075006c007400200050006f007300740020005600360000000000000000000000000036000200ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000580000001200000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003300310030002c0031002c0031003800390030002c0035002c0031003200360030000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0032003300320035000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003300310030000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003300310030000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003300310030002c00310032002c0032003700330030002c00310031002c0031003600380030000000020000000200000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000030000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003300310030002c0031002c0031003800390030002c0035002c0031003200360030000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0032003300310030000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003300310030000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003300310030000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003300310030002c00310032002c0032003700330030002c00310031002c0031003600380030000000040000000400000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000030000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003300310030002c0031002c0031003800390030002c0035002c0031003200360030000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0032003300310030000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003300310030000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003300310030000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003300310030002c00310032002c0032003700330030002c00310031002c003100360038003000000005000000050000000000000034000000013c5d2001000000640062006f00000046004b005f0050006500720073006f006e0061006c005f0043006100720067006f0000000000000000000000c40200000000060000000600000005000000080000000175b70c5875b70c0000000000000000ad0f000001000005000000050000000400000002000000be0000008b0000000000000000000000000000000000000000010003000000000000000c0000000b0000004e61bc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000dbe6b0e91c81d011ad5100a0c90f573900000200f0bfadd2c095d601020200001048450000000000000000000000000000000000d00100004400610074006100200053006f0075007200630065003d00430045005300410052003b0049006e0069007400690061006c00200043006100740061006c006f0067003d00500065006400610067006f006700690063006f005500730075006100720069006f0073003b0049006e00740065006700720061007400650064002000530065006300750072006900740079003d0054007200750065003b004d0075006c007400690070006c00650041006300740069007600650052006500730075006c00740053006500740073003d00460061006c00730065003b0043006f006e006e006500630074002000540069006d0065006f00750074003d00330030003b0054007200750073007400530065007200760065007200430065007200740069006600690063006100740065003d00460061006c00730065003b005000610063006b00650074002000530069007a0065003d0034003000390036003b004100700070006c00690063006100740069006f006e0020004e0061006d0065003d0022004d006900630072006f0073006f00660074002000530051004c00200053006500720076006500720020004d0061006e006100670065006d0065006e0074002000530074007500640069006f002200000000800500140000004400690061006700720061006d005f003000000000022600120000005500730075006100720069006f007300000008000000640062006f000000000226001200000050006500720073006f006e0061006c00000008000000640062006f000000000224000c00000043006100720067006f00000008000000640062006f00000001000000d68509b3bb6bf2459ab8371664f0327008004e0000007b00310036003300340043004400440037002d0030003800380038002d0034003200450033002d0039004600410032002d004200360044003300320035003600330042003900310044007d0000000000000000000000010003000000000000000c0000000b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000062885214);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuarios` int(11) NOT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `pass` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuarios`, `usuario`, `pass`) VALUES
(1, 'cesar', '123');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`id_cargo`),
  ADD KEY `ix_tmp_autoinc` (`id_cargo`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`id_personal`),
  ADD KEY `ix_tmp_autoinc` (`id_personal`),
  ADD KEY `fk_personal_cargo` (`id_cargo`);

--
-- Indices de la tabla `sysdiagrams`
--
ALTER TABLE `sysdiagrams`
  ADD PRIMARY KEY (`diagram_id`),
  ADD UNIQUE KEY `uk_principal_name` (`principal_id`,`name`),
  ADD KEY `ix_tmp_autoinc` (`diagram_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuarios`),
  ADD KEY `ix_tmp_autoinc` (`id_usuarios`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `id_cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
  MODIFY `id_personal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `sysdiagrams`
--
ALTER TABLE `sysdiagrams`
  MODIFY `diagram_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `fk_personal_cargo` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id_cargo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;