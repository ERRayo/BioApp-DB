-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: biodb
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `asistencia`
--

DROP TABLE IF EXISTS `asistencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asistencia` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Atributo que relaciona la tabla',
  `id_grupo` int NOT NULL COMMENT 'Atributo que relaciona la tabla con la tabla de profesores',
  `id_prefecto` int NOT NULL COMMENT 'Atributo que relaciona la tabla con la tabla de prefectos',
  `fecha` date NOT NULL COMMENT 'Atributo que almacena la fecha en la que se toma la asistencia',
  `hora` time NOT NULL COMMENT 'Atributo que almacena la hora en que se toma la asistencia',
  `asistencia_estado` tinyint NOT NULL COMMENT 'Atributo que almacena la asistencia o inasistencia de un profesor',
  `descripcion` varchar(50) DEFAULT NULL COMMENT 'Atributo que almacena una descripcion sobre la asistencia tomada',
  PRIMARY KEY (`id`),
  KEY `IXFK_Asistencia_Grupo` (`id_grupo`),
  KEY `IXFK_Asistencia_Prefecto` (`id_prefecto`),
  CONSTRAINT `FK_Asistencia_Grupo` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='Tabla que almacena las asistencias impartidas en la institución con los atributos de "id", "id_profesor", "id_materia", "id_prefecto" , "fecha", "hora", "asistencia" y "descripcion"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `carrera`
--

DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrera` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Atributo que relaciona la tabla',
  `nombre` varchar(50) NOT NULL COMMENT 'Atributo que almacena el nombre de la carrerra',
  `plan_estudios` varchar(50) NOT NULL COMMENT 'Atributo que almacena el plan de estudios al que pertenece la carrera',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='Tabla que almacena las carreras impartidas en la institución con los atributos de "id", "nombre" y "plan_estudios"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupo` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Atributo que relaciona la tabla',
  `id_profesor` int DEFAULT NULL COMMENT 'Atributo que relaciona la tabla con la tabla de profesor',
  `id_materia` int DEFAULT NULL COMMENT 'Atributo que relaciona la tabla con la tabla de materia',
  `id_periodo` int DEFAULT NULL COMMENT 'Atributo que relaciona la tabla con la tabla de periodo',
  `aula` varchar(50) DEFAULT NULL COMMENT 'Atributo que almacena el aula en la que se imparte la clase',
  `grupo_estado` tinyint DEFAULT NULL COMMENT 'Atributo en el que se establece el estado del grupo, siendo 1 el estado para un grupo activo y 0 para un grupo inactivo',
  PRIMARY KEY (`id`),
  KEY `IXFK_Grupo_Materia` (`id_materia`),
  KEY `IXFK_Grupo_Periodo` (`id_periodo`),
  KEY `IXFK_Grupo_Profesor` (`id_profesor`),
  CONSTRAINT `FK_Grupo_Materia` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Grupo_Periodo` FOREIGN KEY (`id_periodo`) REFERENCES `periodo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Grupo_Profesor` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horario` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Atributo que relaciona la tabla',
  `id_grupo` int DEFAULT NULL COMMENT 'Atributo que relaciona la tabla con la tabla de grupo',
  `lunes` time DEFAULT NULL COMMENT 'Atributo que almacena la hora de inicio de la clase',
  `lunes_fin` time DEFAULT NULL COMMENT 'Atributo que almacena la hora de finalización de la clase',
  `martes` time DEFAULT NULL COMMENT 'Atributo que almacena la hora de inicio de la clase',
  `martes_fin` time DEFAULT NULL COMMENT 'Atributo que almacena la hora de finalización de la clase',
  `miercoles` time DEFAULT NULL COMMENT 'Atributo que almacena la hora de inicio de la clase',
  `miercoles_fin` time DEFAULT NULL COMMENT 'Atributo que almacena la hora de finalización de la clase',
  `jueves` time DEFAULT NULL COMMENT 'Atributo que almacena la hora de inicio de la clase',
  `jueves_fin` time DEFAULT NULL COMMENT 'Atributo que almacena la hora de finalización de la clase',
  `viernes` time DEFAULT NULL COMMENT 'Atributo que almacena la hora de inicio de la clase',
  `viernes_fin` time DEFAULT NULL COMMENT 'Atributo que almacena la hora de finalización de la clase',
  `sabado` time DEFAULT NULL COMMENT 'Atributo que almacena la hora de inicio de la clase',
  `sabado_fin` time DEFAULT NULL COMMENT 'Atributo que almacena la hora de finalización de la clase',
  PRIMARY KEY (`id`),
  KEY `IXFK_Horario_Grupo` (`id_grupo`),
  CONSTRAINT `FK_Horario_Grupo` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='Tabla que almacena el horario asignado a cada materia con los atributos "id", "lunes", "martes", "miercoles", "jueves", "viernes" y "sabado"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `huella_profesor`
--

DROP TABLE IF EXISTS `huella_profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `huella_profesor` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Atributo que relaciona la tabla',
  `id_profesor` int NOT NULL COMMENT 'Atributo que relaciona la tabla con la tabla de profesor',
  `huella_principal` varchar(1024) NOT NULL COMMENT 'Atributo que almacena la huella principal del profesor',
  `huella_secundaria` varchar(1024) NOT NULL COMMENT 'Atributo que almacena la huella secundaria del profesor',
  PRIMARY KEY (`id`),
  KEY `IXFK_Huella_Profesor_Profesor` (`id_profesor`),
  CONSTRAINT `FK_Huella_Profesor_Profesor` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COMMENT='Tabla que almacena los datos de las huellas dactilares de los profesores que laboran en la institucion con los atributos de "id", "id_profesor", "huella principal" y "huella secundaria"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `materia`
--

DROP TABLE IF EXISTS `materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Atributo que relaciona la tabla',
  `id_carrera` int NOT NULL COMMENT 'Atributo que relaciona la tabla con las carreras para identificar qué materia pertenece a que carrera',
  `nombre` varchar(50) NOT NULL COMMENT 'Atributo que almacena el nombre de la materia',
  PRIMARY KEY (`id`),
  KEY `IXFK_Materia_Carrera` (`id_carrera`),
  CONSTRAINT `FK_Materia_Carrera` FOREIGN KEY (`id_carrera`) REFERENCES `carrera` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COMMENT='Tabla que almacena las materias impartidas en la institución con los atributos de "id", "id_carrera", "id_horario" y "nombre"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `periodo`
--

DROP TABLE IF EXISTS `periodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periodo` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Atributo que relaciona la tabla',
  `fecha_ini` date NOT NULL COMMENT 'Atributo que almacena la fecha de inicio del periodo escolar',
  `fecha_fin` date NOT NULL COMMENT 'Atributo que almacena la fecha de finalización del periodo escolar',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='Tabla que almacena los datos de los periodos con los atributos de "id", "fecha inicio" y "fecha fin"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prefecto`
--

DROP TABLE IF EXISTS `prefecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prefecto` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Atributo que relaciona la tabla',
  `id_usuario` int NOT NULL COMMENT 'Atributo que relaciona la tabla con la tabla de usuarios',
  `nombre` varchar(50) NOT NULL COMMENT 'Atributo que almacena el nombre de los prefectos',
  `apellido_paterno` varchar(50) NOT NULL COMMENT 'atributo que almacena el apellido paterno de los prefectos',
  `apellido_materno` varchar(50) NOT NULL COMMENT 'atributo que almacena el apellido materno de los prefectos',
  PRIMARY KEY (`id`),
  KEY `IXFK_Prefecto_Usuario` (`id_usuario`),
  CONSTRAINT `FK_Prefecto_Usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='Tabla que almacena los datos de los prefectos que tomaran las asistencais con los atributos "id", "id_usuario", "nombre", "apellido_paterno" y "apellido_mateno"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profesor`
--

DROP TABLE IF EXISTS `profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesor` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Atributo que relaciona la tabla',
  `nombre` varchar(50) NOT NULL COMMENT 'Atributo que almacena el nombre del profesor',
  `apellido_paterno` varchar(50) NOT NULL COMMENT 'atributo que almacena el apellido paterno del profesor ',
  `apellido_materno` varchar(50) DEFAULT NULL COMMENT 'atributo que almacena el apellido materno del profesor ',
  `no_trabajador` varchar(50) NOT NULL COMMENT 'Atributo que almacena el número de trabajador del profesor',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='Tabla que almacena los datos de los profesores que laboran en la institución con los atributos de "id", "nombre", "apellido paterno", "apellido materno" y "no trabajador"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Atributo que relaciona la tabla',
  `email` varchar(50) NOT NULL COMMENT 'Atributo que almacena el correo electronico del usuario',
  `contraseña` varchar(200) NOT NULL COMMENT 'Atributo que almacena la contraseña del usuario',
  `tipo_usuario` varchar(50) NOT NULL COMMENT 'Atributo que almacena el tipo de usuario',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COMMENT='Tabla que almacena los datos de los usuarios que utilizaran el sistema con los atributos de "id", "email", "contraseña" y "tipo de usuario" ';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-10 19:01:09
