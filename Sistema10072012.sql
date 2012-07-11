-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 10-07-2012 a las 13:22:07
-- Versión del servidor: 5.1.44
-- Versión de PHP: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `practica7`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno_examen`
--

CREATE TABLE IF NOT EXISTS `alumno_examen` (
  `id_alumno` varchar(30) NOT NULL,
  `id_examen` varchar(30) NOT NULL,
  `calificacion` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_alumno`,`id_examen`),
  KEY `id_examen` (`id_examen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `alumno_examen`
--

INSERT INTO `alumno_examen` (`id_alumno`, `id_examen`, `calificacion`) VALUES
('PER03', 'EXA1339631660105', 0),
('PER03', 'EXA1339631992154', 0),
('PER03', 'EXA1339658356183', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno_grupo`
--

CREATE TABLE IF NOT EXISTS `alumno_grupo` (
  `id_alumno` varchar(30) NOT NULL,
  `id_grupo` varchar(30) NOT NULL,
  PRIMARY KEY (`id_alumno`,`id_grupo`),
  KEY `id_grupo` (`id_grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `alumno_grupo`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examen`
--

CREATE TABLE IF NOT EXISTS `examen` (
  `id_examen` varchar(50) NOT NULL,
  `id_curso` varchar(50) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id_examen`,`id_curso`),
  KEY `id_curso` (`id_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `examen`
--

INSERT INTO `examen` (`id_examen`, `id_curso`, `nombre`) VALUES
('EXA1339631660105', 'CUR02', 'Cuestionario1'),
('EXA1339631992154', 'CUR01', 'Cuestionario 2'),
('EXA1339658356183', 'CUR01', 'Guardar en Word');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE IF NOT EXISTS `grupo` (
  `id_grupo` varchar(30) NOT NULL,
  `id_propietario` varchar(30) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`id_grupo`,`id_propietario`),
  KEY `id_propietario` (`id_propietario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`id_grupo`, `id_propietario`, `nombre`, `password`, `descripcion`) VALUES
('GRU1341325998830', 'PER1339681977496', 'WORD-01', 'WORD-01', 'Curso para principiantes de este programa informatico.'),
('GRU1341328547075', 'PER1339681977496', 'EXCEL-02', 'EXCEL2121', 'Curso para aprender Excel 2007.'),
('GRU1341328623784', 'PER1339681977496', 'EXCEL-03', 'EXCEL9798', 'Curso avanzado de libros de excel 2007.'),
('GRU1341328773954', 'PER1339681977496', 'EXCEL-05', 'EXCEL-05', 'xoXo'),
('GRU1341329635641', 'PER1339681977496', 'POWER-01', 'grupo1powermodificado', 'Curso principiante de power point 2007.'),
('GRU1341364389180', 'PER1339681977496', 'ACCESS-01', 'ACCESS-01', 'ACCESS-01\npara principiantes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE IF NOT EXISTS `persona` (
  `id_persona` varchar(30) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidop` varchar(20) NOT NULL,
  `apellidom` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `sexo` varchar(10) NOT NULL,
  `fechaNac` date NOT NULL,
  `tipo` varchar(10) NOT NULL,
  PRIMARY KEY (`id_persona`,`usuario`),
  KEY `usuario` (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `persona`
--

INSERT INTO `persona` (`id_persona`, `usuario`, `password`, `nombres`, `apellidop`, `apellidom`, `email`, `sexo`, `fechaNac`, `tipo`) VALUES
('PER01', 'Administrador', 'äé\r%p¶µ”È¢ø)', 'Gustavo', 'Hernandez', 'Hernandez', 'volaverunt@live.com.mx', 'MASCULINO', '1990-02-17', 'ADMIN'),
('PER03', 'Alumno', 'abc2566d6783cd9eb8a671e9c0147ae3', 'Irma Paola', 'Hernandez', 'Hernandez', 'azula.7@live.com.mx', 'FEMENINO', '1998-08-04', 'ALUMNO'),
('PER05', 'Alumno2', '5f227207b27bf9bb1f1b73910917186a', 'Alumno2', 'Alumno2', 'Alumno2', 'alumno2@hotmail.com', 'MASCULINO', '1987-06-04', 'ALUMNO'),
('PER1339681977496', 'Ruben', 'ÚXÛ˜«ñ8?(ô­ÎÒ”', 'Ruben', 'Peredo', 'Valderrama', 'rubenperedo@hotmail.com', 'MASCULINO', '1980-06-21', 'PROFESOR'),
('PER1339927957062', 'nidiacortez3@gmail.com', 'b49e270ab7185fca835771677b22a24c', 'Nidia Asunción', 'Cortés', 'Duarte', 'nidiacortez3@gmail.com', 'FEMENINO', '1987-02-06', 'PROFESOR'),
('PER1339928038081', 'rabadanlorj@gmail.com', '8b3ef4a5575783cf707b110f28bdeae1', 'José Jaime', 'López', 'Rabadán', 'rabadanlorj@gmail.com', 'MASCULINO', '1980-04-14', 'PROFESOR'),
('PER1339928089984', 'paidosberenice@gmail.com', '19c047429ba0ec8233abe42774837e41', 'Adriana Berenice', 'Celis', 'Dominguez', 'paidosberenice@gmail.com', 'FEMENINO', '1987-01-20', 'PROFESOR'),
('PER1339928156906', 'irmex2012@gmail.com', 'a8a99cbbc4ced3369902b1e524f5f79d', 'Ismael', 'Rojas', 'Mexicano', 'irmex2012@gmail.com', 'MASCULINO', '1987-10-22', 'PROFESOR'),
('PER1339928342255', 'tareas.escom@gmail.com', 'e6e3064265d4c18a2510f1d41a997226', 'Joel Omar', 'Juárez', 'Gambino', 'tareas.escom@gmail.com', 'MASCULINO', '1987-04-06', 'PROFESOR'),
('PER1339928428913', 'tanibet.escom@gmail.com', '06b9344e57b95c132f6176705ea2a783', 'Tanibet', 'Pérez', 'de los Santos', 'tanibet.escom@gmail.com', 'FEMENINO', '1987-10-08', 'PROFESOR'),
('PER1339929224981', 'anerol_chavarria', '1eae295401b02234e6126d14e605fed6', 'Lorena', 'Chavarría', 'Baez', 'anerol_chavarria@hotmail.com', 'FEMENINO', '1987-03-19', 'PROFESOR'),
('PER1339931898407', 'avionica1@yahoo.com.mx', 'cb3561c92e463efc3a26f4118b47c22c', 'Alejandro Cigfrido', 'Cifuentes', 'Álvarez', 'avionica1@yahoo.com.mx', 'MASCULINO', '1970-06-13', 'PROFESOR'),
('PER1340008676279', 'ajax', '2705a83a5a0659cce34583972637eda5', 'Ajax', 'Ajax', 'Ajax', 'ajax@ajax.com', 'FEMENINO', '1976-09-15', 'PROFESOR'),
('PER1340008824001', 'Otro Ajax', 'ad7e8ca4de877cd220edc67a92e998ca', 'Otro Ajax', 'Otro Ajax', 'Otro Ajax', 'otroajax@otroajax.com.mx', 'FEMENINO', '1992-06-04', 'PROFESOR'),
('PER1340009181664', 'Ajax III', '4310821f969156bcbb753f723de5921c', 'Ajax III', 'Ajax III', 'Ajax III', 'ajaxIII@ajaxiii.com', 'FEMENINO', '2012-06-14', 'PROFESOR'),
('PER1340009375625', 'Ajax IV', 'd366ab4c06845f84b6e79a7aabad4caa', 'Ajax IV', 'Ajax IV', 'Ajax IV', 'ajaxiv.ajaxiv@ajaxiv.com.mx', 'FEMENINO', '1994-09-21', 'PROFESOR'),
('PER1340009564563', 'Ajax V', 'a31d518a83368992c6724f9acced7c9d', 'Ajax V', 'Ajax V', 'Ajax V', 'ajaxv@hotmail.com', 'FEMENINO', '1991-09-18', 'PROFESOR'),
('PER1340009727121', 'Ajax Vi', 'a9cf48ec267bad04644f793d0b46c1bc', 'Ajax Vi', 'Ajax Vi', 'Ajax Vi', 'ajaxvi@ajaxvi.com', 'MASCULINO', '1987-10-26', 'PROFESOR'),
('PER1340010046688', 'Ajax VII', '0fbdbc2e7fd271a1cb59af0b1897ef22', 'Ajax VII', 'Ajax VII', 'Ajax VII', 'ajaxvii@ajaxvii.com', 'MASCULINO', '1986-09-23', 'PROFESOR'),
('PER1340010198129', 'Ajax VIII', '6b6e6589fcb6a3db7c0c4b2dbe469d23', 'ajaxviii@', 'ajaxviii@', 'ajaxviii@', 'ajaxviii@ajaxviii.com', 'MASCULINO', '1989-10-12', 'PROFESOR'),
('PER1340010441286', 'Ajax IX', '589341cbe02645ec8648347a1dcc94c1', 'Ajax IX9', 'Ajax IX9', 'Ajax IX9', 'ajaxix@ajaxix.com.uk', 'MASCULINO', '1990-10-16', 'PROFESOR'),
('PER1340010527148', 'Ajax X', '69506f5c89d581633dddb77216224758', 'Ajax X10', 'Ajax X10', 'Ajax X10', 'ajaxx@ajaxx.com', 'MASCULINO', '1991-10-23', 'PROFESOR'),
('PER1340010612226', 'Ajax XI', '27765d172de82c6055557c982fcba022', 'Ajax XI10', 'Ajax XI10', 'Ajax XI10', 'ajaxxi10@ajaxxi.com', 'MASCULINO', '1988-12-21', 'PROFESOR'),
('PER1340011607955', 'Ajax XII', '574845ffa2a4adc959fdbc2b744522a3', 'Ajax XII', 'Ajax XII', 'Ajax XII', 'Ajax XII', 'MASCULINO', '1981-09-03', 'PROFESOR'),
('PER1340011864543', 'Ajax XIII', '39fb4e635955cfe8c4a4f40b9246d13c', 'Ajax XIII13', 'Ajax XIII13', 'Ajax XIII13', 'ajax13@ajax13.com', 'MASCULINO', '1993-09-15', 'PROFESOR'),
('PER1340011967304', 'Ajax XIV', '2ac235a03de12b92ea9aa217d550f94d', 'Ajax XIV14', 'Ajax XIV14', 'Ajax XIV14', 'ajaxxiv@ajaxxiv.com.mx', 'MASCULINO', '2012-06-21', 'PROFESOR'),
('PER1340012023257', 'Ajax XV', 'f76e50de431d35a4ec5fc13056427586', 'Ajax XV', 'Ajax XV', 'Ajax XV', 'ajaxXV@ajaxxv.com', 'MASCULINO', '1985-11-14', 'PROFESOR'),
('PER1340012141929', 'Ajax XVI', 'a29c096e0567c348c3c0d990eac533a2', 'Ajax XVI', 'Ajax XVI', 'Ajax XVI', 'AjaxXVI@AjaxXVI.com', 'MASCULINO', '1977-09-13', 'PROFESOR'),
('PER1340012301297', 'Ajax XVII', '9c3bde5c6f6a63abae8df16f1fee19a5', 'Ajax XVII', 'Ajax XVII', 'Ajax XVII', 'Ajax XVII', 'MASCULINO', '1983-08-25', 'PROFESOR'),
('PER1340012459925', 'Ajax XVIII', '4f83c4c5ddfa6c2885ed8303461c0d81', 'Ajax XVIII', 'Ajax XVIII', 'Ajax XVIII', 'Ajax XVIII', 'MASCULINO', '1990-10-17', 'PROFESOR'),
('PER1340012585696', 'Ajax XIX', '5b689960ebbd714d2b08a3badc49ab1a', 'Ajax XIX', 'Ajax XIX', 'Ajax XIX', 'Ajax XIX', 'MASCULINO', '1990-12-19', 'PROFESOR'),
('PER1340012968018', 'Ajax XX', 'e74628d8fdfbc5c3c5f939f44043f5fe', 'Ajax XX', 'Ajax XX', 'Ajax XX', 'Ajax XX', 'MASCULINO', '1975-10-09', 'PROFESOR'),
('PER1340013186414', 'Ajax XXI', '05d99c2b803771443c750e95a8c8aeee', 'Ajax XXI', 'Ajax XXI', 'Ajax XXI', 'Ajax XXI', 'MASCULINO', '1965-06-18', 'PROFESOR'),
('PER1340013267361', 'Ajax XXII', 'c071d764b9cfbfc7d659e5a541098237', 'Ajax XXII', 'Ajax XXII', 'Ajax XXII', 'Ajax XXII', 'MASCULINO', '1980-06-27', 'PROFESOR'),
('PER1340013844567', 'Ajax XXIII', '91333d31673dbbe0566233ef49d8b9ab', 'Ajax XXIII', 'Ajax XXIII', 'Ajax XXIII', 'Ajax XXIII', 'MASCULINO', '1993-10-26', 'PROFESOR'),
('PER1340014121236', 'Ajax XXIV', '37185482376252daa69267ff84631525', 'Ajax XXIV', 'Ajax XXIV', 'Ajax XXIV', 'Ajax XXIV', 'MASCULINO', '1977-11-27', 'PROFESOR'),
('PER1340014348782', 'PER1340014348782', 'f94f903139f9205b1bb4cfb76b733321', 'Ajax XXV', 'Ajax XXV', 'Ajax XXV', 'Ajax XXV', 'MASCULINO', '1974-02-14', 'PROFESOR'),
('PER1340014505538', 'PER1340014505538', '7cc0665da444f0b4effa2149185500c4', 'Ajax XXVI', 'Ajax XXVI', 'Ajax XXVI', 'Ajax XXVI', 'MASCULINO', '1965-06-11', 'PROFESOR'),
('PER1340015308393', 'PER1340015308393', 'eac1edff838055a0cbb1f012b1b891b7', 'Ajax XXVII', 'Ajax XXVII', 'Ajax XXVII', 'Ajax XXVII', 'MASCULINO', '1981-10-09', 'PROFESOR'),
('PER1340016161918', 'PER1340016161918', 'cc46db07b880d3363c0f2dd08466c84c', 'Ajax XXVIII', 'Ajax XXVIII', 'Ajax XXVIII', 'Ajax XXVIII', 'MASCULINO', '1987-10-07', 'PROFESOR'),
('PER1340016319984', 'PER1340016319984', 'f3469aa2eb1a4c0f8263ce7b6ff60e2a', 'Ajax XXIX', 'Ajax XXIX', 'Ajax XXIX', 'Ajax XXIX', 'MASCULINO', '1990-06-07', 'PROFESOR'),
('PER1340017332840', 'PER1340017332840', '957dd6e8065083e011d0d39b414003c2', 'Ajax XXX', 'Ajax XXX', 'Ajax XXX', 'Ajax XXX', 'MASCULINO', '2012-06-13', 'PROFESOR'),
('PER1340017409409', 'PER1340017409409', '694d5d52a5e13bb70d44fd44224b5d47', 'Ajax XXXI', 'Ajax XXXI', 'Ajax XXXI', 'Ajax XXXI', 'MASCULINO', '1970-08-26', 'PROFESOR'),
('PER1340018417797', 'PER1340018417797', '548b262a6856612240ad84da0c933244', 'Rhea I', 'Rhea I', 'Rhea I', 'Rhea I', 'FEMENINO', '1971-09-23', 'PROFESOR'),
('PER1340018556546', 'PER1340018556546', 'c748ce93ed983518ea5b6881930076c7', 'Thor I', 'Thor I', 'Thor I', 'Thor I', 'MASCULINO', '1980-11-18', 'PROFESOR'),
('PER1340018731768', 'PER1340018731768', 'f8986c32891fe4ff1121dbbf3ebd1ced', 'Quetzalcoatl I', 'Quetzalcoatl I', 'Quetzalcoatl I', 'Quetzalcoatl I', 'MASCULINO', '1966-11-08', 'PROFESOR'),
('PER1340157477677', 'PER1340157477677', 'aa63df449653871eab5c9b9ef5c77370', 'Persona', 'Sin', 'Errores', 'personasinerrores@yahoo.com.mx', 'MASCULINO', '1969-08-06', 'PROFESOR'),
('PER1340159000760', 'Iron Man 1', '02e5f9dc72a3bb9f0d0bf0f774cf3419', 'Iron Man 1', 'Iron Man 1', 'Iron Man 1', 'ironman@ironman.uk.cs', 'MASCULINO', '1965-10-19', 'PROFESOR'),
('PER1340159570950', 'Iron2', 'efd3d65112e5b91f33d6fee16ebae48a', 'Iron2', 'Iron2', 'Iron2', 'Iron2@Iron2.com', 'MASCULINO', '2012-06-07', 'PROFESOR'),
('PER1340159640245', 'Iron3', '617e24536092b550fd9532f7afd8a72c', 'Iron3', 'Iron3', 'Iron3', 'Iron3@Iron3.com', 'FEMENINO', '1964-06-12', 'PROFESOR'),
('PER1340159726327', 'Iron4', '54201119a8ec197dc44f87af455cc8ec', 'Iron4', 'Iron4', 'Iron4', 'Iron4@Iron4.com', 'FEMENINO', '2012-06-07', 'PROFESOR'),
('PER1340172427366', 'Iron5', 'ca656bd5674804b1a520667902756476', 'Iron5', 'Iron5', 'Iron5', 'Iron5@Iron5.com', 'MASCULINO', '1967-09-14', 'PROFESOR'),
('PER1340175154330', 'Cincuentaytres', 'c0ae510d7f16844550a58d0b33c5c470', 'Cincuentaytres', 'Cincuentaytres', 'Cincuentaytres', 'Cincuentaytres@Cincuentaytres.com', 'FEMENINO', '2012-06-04', 'PROFESOR'),
('PER1340175725257', 'Cincuentaycuatro', 'd6f6cc7e8e9dce8516554ebf5d542e22', 'Cincuentaycuatro', 'Cincuentaycuatro', 'Cincuentaycuatro', 'Cincuro@Cincuro.com', 'MASCULINO', '1969-06-20', 'PROFESOR'),
('PER1341370474224', 'instrcutor', 'É[Ò²>SÓk"†«Ÿ;-8§', 'instructor', 'instructor', 'instructor', 'instructor@instructor.com', 'MASCULINO', '1975-07-17', 'PROFESOR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta`
--

CREATE TABLE IF NOT EXISTS `pregunta` (
  `id_pregunta` varchar(50) NOT NULL,
  `id_examen` varchar(50) NOT NULL,
  `id_respuestaCorrecta` varchar(50) NOT NULL,
  `pregunta` text NOT NULL,
  PRIMARY KEY (`id_pregunta`,`id_examen`,`id_respuestaCorrecta`),
  KEY `id_examen` (`id_examen`),
  KEY `id_respuestaCorrecta` (`id_respuestaCorrecta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `pregunta`
--

INSERT INTO `pregunta` (`id_pregunta`, `id_examen`, `id_respuestaCorrecta`, `pregunta`) VALUES
('PRE1339631660105', 'EXA1339631660105', 'RES13396316601051', 'Pregunta 1'),
('PRE1339631992185', 'EXA1339631992154', 'RES13396319921852', 'Pregunta1 Cuestionario 2'),
('PRE1339658356199', 'EXA1339658356183', 'RES1339658356199', 'Exension de Word 2007');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta`
--

CREATE TABLE IF NOT EXISTS `respuesta` (
  `id_respuesta` varchar(50) NOT NULL,
  `id_pregunta` varchar(50) NOT NULL,
  `respuesta` text NOT NULL,
  PRIMARY KEY (`id_respuesta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `respuesta`
--

INSERT INTO `respuesta` (`id_respuesta`, `id_pregunta`, `respuesta`) VALUES
('RES1339631660105', 'PRE1339631660105', 'respuesta1'),
('RES13396316601051', 'PRE1339631660105', 'respuesta2'),
('RES13396316601052', 'PRE1339631660105', 'respuesta3'),
('RES1339631992185', 'PRE1339631992185', 'RA1 C2'),
('RES13396319921851', 'PRE1339631992185', 'RB1 C2'),
('RES13396319921852', 'PRE1339631992185', 'RC1 C2'),
('RES1339658356199', 'PRE1339658356199', '.docx'),
('RES13396583561991', 'PRE1339658356199', '.doc'),
('RES13396583561992', 'PRE1339658356199', '.ppt');

--
-- Filtros para las tablas descargadas (dump)
--

--
-- Filtros para la tabla `alumno_examen`
--
ALTER TABLE `alumno_examen`
  ADD CONSTRAINT `alumno_examen_ibfk_1` FOREIGN KEY (`id_alumno`) REFERENCES `persona` (`id_persona`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `alumno_examen_ibfk_2` FOREIGN KEY (`id_examen`) REFERENCES `examen` (`id_examen`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `alumno_grupo`
--
ALTER TABLE `alumno_grupo`
  ADD CONSTRAINT `alumno_grupo_ibfk_1` FOREIGN KEY (`id_alumno`) REFERENCES `persona` (`id_persona`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `alumno_grupo_ibfk_2` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id_grupo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `grupo_ibfk_1` FOREIGN KEY (`id_propietario`) REFERENCES `persona` (`id_persona`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD CONSTRAINT `pregunta_ibfk_1` FOREIGN KEY (`id_examen`) REFERENCES `examen` (`id_examen`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pregunta_ibfk_2` FOREIGN KEY (`id_respuestaCorrecta`) REFERENCES `respuesta` (`id_respuesta`) ON DELETE CASCADE ON UPDATE CASCADE;
