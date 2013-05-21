-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 04-11-2012 a las 23:04:04
-- Versión del servidor: 5.5.16
-- Versión de PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `fundaappius`
--

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `Deleteavancedeobra`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Deleteavancedeobra`( 
IN NumeroP int(11) ,  
IN CantidadP double ,  
IN IdAvanceRealP int(11) ,  
IN IdAvanceDeObraP int(11) 
)
BEGIN 
DELETE FROM avancedeobra  
WHERE IdAvanceDeObra = IdAvanceDeObraP; 
END$$

DROP PROCEDURE IF EXISTS `Deleteavancereal`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Deleteavancereal`( 
IN IdProyectoP int(11) ,  
IN IdAvanceRealP int(11) 
)
BEGIN 
DELETE FROM avancereal  
WHERE IdAvanceReal = IdAvanceRealP; 
END$$

DROP PROCEDURE IF EXISTS `Deletecatalogoconceptos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Deletecatalogoconceptos`( 
IN IdProyectoP int(11) ,  
IN IdCatalogoConceptosP int(11) 
)
BEGIN 
DELETE FROM catalogoconceptos  
WHERE IdCatalogoConceptos = IdCatalogoConceptosP; 
END$$

DROP PROCEDURE IF EXISTS `Deleteconcepto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Deleteconcepto`( 
IN NumeroP int(10) ,  
IN EspecificacionP varchar(15) ,  
IN DescripcionP varchar(400) ,  
IN UnidadP varchar(10) ,  
IN PrecioUnitarioP double ,  
IN ImporteP double ,  
IN CantidadP int(10) ,  
IN IdSeccionConceptoP int(11) ,  
IN IdConceptoP int(11) 
)
BEGIN 
DELETE FROM concepto  
WHERE IdConcepto = IdConceptoP; 
END$$

DROP PROCEDURE IF EXISTS `Deleteconstructora`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Deleteconstructora`( 
IN NombreP varchar(200) ,  
IN DireccionP varchar(200) ,  
IN RFCP varchar(13) ,  
IN TelefonoP int(15) ,  
IN EmailP varchar(100) ,  
IN DescripcionP varchar(200) ,  
IN FechaIngreso date ,  
IN IdConstructoraP int(11) 
)
BEGIN 
DELETE FROM constructora  
WHERE IdConstructora = IdConstructoraP; 
END$$

DROP PROCEDURE IF EXISTS `Deleteindirectocatalogo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Deleteindirectocatalogo`( 
IN ConceptoP varchar(60) ,  
IN Monto_OficinaCentral double ,  
IN Monto_OficinaCampoP double ,  
IN Porcentaje_OficinaCentralP double ,  
IN Porcentaje_OficinaCampoP double ,  
IN IdSeccionIndirectosP int(11) ,  
IN IdIndirectoCatalogoP int(11) 
)
BEGIN 
DELETE FROM indirectocatalogo  
WHERE IdIndirectoCatalogo = IdIndirectoCatalogoP; 
END$$

DROP PROCEDURE IF EXISTS `Deleteinsumocapturado`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Deleteinsumocapturado`( 
IN ConceptoP varchar(60) ,  
IN DescripcionP varchar(400) ,  
IN CantidadP double ,  
IN PrecioP double ,  
IN IdAvanceRealP int(11) ,  
IN IdInsumoCapturadoP int(11) 
)
BEGIN 
DELETE FROM insumocapturado  
WHERE IdInsumoCapturado = IdInsumoCapturadoP; 
END$$

DROP PROCEDURE IF EXISTS `Deleteinsumocatalogo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Deleteinsumocatalogo`( 
IN ConceptoP varchar(60) ,  
IN UnidadP varchar(10) ,  
IN PrecioP double ,  
IN ImporteP double ,  
IN CantidadP double ,  
IN PorcentajeIndidenciaP double ,  
IN IdSeccionInsumosP int(11) ,  
IN IdInsumoCatalogoP int(11) 
)
BEGIN 
DELETE FROM insumocatalogo  
WHERE IdInsumoCatalogo = IdInsumoCatalogoP; 
END$$

DROP PROCEDURE IF EXISTS `Deletelistadoindirectos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Deletelistadoindirectos`( 
IN IdPresupuestoP int(11) ,  
IN IdListadoIndirectosP int(11) 
)
BEGIN 
DELETE FROM listadoindirectos  
WHERE IdListadoIndirectos = IdListadoIndirectosP; 
END$$

DROP PROCEDURE IF EXISTS `Deletelistadoinsumos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Deletelistadoinsumos`( 
IN IdPresupuestoP int(11) ,  
IN IdListadoInsumos int(11) 
)
BEGIN 
DELETE FROM listadoinsumos  
WHERE IdListadoInsumos = IdListadoInsumos; 
END$$

DROP PROCEDURE IF EXISTS `Deletepresupuesto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Deletepresupuesto`( 
IN FinanciamientoP double ,  
IN UtilidadP double ,  
IN CargosAdicionalesP double ,  
IN IdProyectoP int(11) ,  
IN IdPresupuestoP int(11) 
)
BEGIN 
DELETE FROM presupuesto  
WHERE IdPresupuesto = IdPresupuestoP; 
END$$

DROP PROCEDURE IF EXISTS `Deleteproyecto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Deleteproyecto`( 
IN NombreP varchar(200) ,  
IN ClienteP varchar(200) ,  
IN ContratoP varchar(50) ,  
IN DescripcionP varchar(600) ,  
IN FechaInicioP date ,  
IN FechaEntregaP date ,  
IN IdConstructoraP int(11) ,  
IN IdProyectoP int(11) 
)
BEGIN 
DELETE FROM proyecto  
WHERE IdProyecto = IdProyectoP; 
END$$

DROP PROCEDURE IF EXISTS `Deleteseccionconcepto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Deleteseccionconcepto`( 
IN NombreP varchar(60) ,  
IN IdCatalogoConceptosP int(11) ,  
IN IdSeccionConceptoP int(11) 
)
BEGIN 
DELETE FROM seccionconcepto  
WHERE IdSeccionConcepto = IdSeccionConceptoP; 
END$$

DROP PROCEDURE IF EXISTS `Deletesecciondirectos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Deletesecciondirectos`( 
IN NombreP varchar(60) ,  
IN IdListadoInsumosP int(11) ,  
IN IdSeccionIndirectos int(11) 
)
BEGIN 
DELETE FROM secciondirectos  
WHERE IdSeccionIndirectos = IdSeccionIndirectos; 
END$$

DROP PROCEDURE IF EXISTS `Insertaravancedeobra`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insertaravancedeobra`( 
IN NumeroP int(11) ,  
IN CantidadP double ,  
IN IdAvanceRealP int(11) 
)
BEGIN 
INSERT INTO avancedeobra ( 
Numero, 
Cantidad, 
IdAvanceReal) 
VALUES (NumeroP, 
CantidadP, 
IdAvanceRealP 
); 
END$$

DROP PROCEDURE IF EXISTS `Insertaravancereal`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insertaravancereal`( 
IN IdProyectoP int(11) 
)
BEGIN 
INSERT INTO avancereal ( 
IdProyecto) 
VALUES (IdProyectoP 
); 
END$$

DROP PROCEDURE IF EXISTS `Insertarcatalogoconceptos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insertarcatalogoconceptos`( 
IN IdProyectoP int(11) 
)
BEGIN 
INSERT INTO catalogoconceptos ( 
IdProyecto) 
VALUES (IdProyectoP 
); 
END$$

DROP PROCEDURE IF EXISTS `Insertarconcepto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insertarconcepto`( 
IN NumeroP int(10) ,  
IN EspecificacionP varchar(15) ,  
IN DescripcionP varchar(400) ,  
IN UnidadP varchar(10) ,  
IN PrecioUnitarioP double ,  
IN ImporteP double ,  
IN CantidadP int(10) ,  
IN IdSeccionConceptoP int(11) 
)
BEGIN 
INSERT INTO concepto ( 
Numero, 
Especificacion, 
Descripcion, 
Unidad, 
PrecioUnitario, 
Importe, 
Cantidad, 
IdSeccionConcepto) 
VALUES (NumeroP, 
EspecificacionP, 
DescripcionP, 
UnidadP, 
PrecioUnitarioP, 
ImporteP, 
CantidadP, 
IdSeccionConceptoP 
); 
END$$

DROP PROCEDURE IF EXISTS `Insertarconstructora`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insertarconstructora`( 
IN NombreP varchar(200) ,  
IN DireccionP varchar(200) ,  
IN RFCP varchar(13) ,  
IN TelefonoP int(15) ,  
IN EmailP varchar(100) ,  
IN DescripcionP varchar(200) ,  
IN FechaIngreso date 
)
BEGIN 
INSERT INTO constructora ( 
Nombre, 
Direccion, 
RFC, 
Telefono, 
Email, 
Descripcion, 
FechaIngreso) 
VALUES (NombreP, 
DireccionP, 
RFCP, 
TelefonoP, 
EmailP, 
DescripcionP, 
FechaIngreso 
); 
END$$

DROP PROCEDURE IF EXISTS `Insertarindirectocatalogo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insertarindirectocatalogo`( 
IN ConceptoP varchar(60) ,  
IN Monto_OficinaCentral double ,  
IN Monto_OficinaCampoP double ,  
IN Porcentaje_OficinaCentralP double ,  
IN Porcentaje_OficinaCampoP double ,  
IN IdSeccionIndirectosP int(11) 
)
BEGIN 
INSERT INTO indirectocatalogo ( 
Concepto, 
Monto_OficinaCentral, 
Monto_OficinaCampo, 
Porcentaje_OficinaCentral, 
Porcentaje_OficinaCampo, 
IdSeccionIndirectos) 
VALUES (ConceptoP, 
Monto_OficinaCentral, 
Monto_OficinaCampoP, 
Porcentaje_OficinaCentralP, 
Porcentaje_OficinaCampoP, 
IdSeccionIndirectosP 
); 
END$$

DROP PROCEDURE IF EXISTS `Insertarinsumocapturado`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insertarinsumocapturado`( 
IN ConceptoP varchar(60) ,  
IN DescripcionP varchar(400) ,  
IN CantidadP double ,  
IN PrecioP double ,  
IN IdAvanceRealP int(11) 
)
BEGIN 
INSERT INTO insumocapturado ( 
Concepto, 
Descripcion, 
Cantidad, 
Precio, 
IdAvanceReal) 
VALUES (ConceptoP, 
DescripcionP, 
CantidadP, 
PrecioP, 
IdAvanceRealP 
); 
END$$

DROP PROCEDURE IF EXISTS `Insertarinsumocatalogo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insertarinsumocatalogo`( 
IN ConceptoP varchar(60) ,  
IN UnidadP varchar(10) ,  
IN PrecioP double ,  
IN ImporteP double ,  
IN CantidadP double ,  
IN PorcentajeIndidenciaP double ,  
IN IdSeccionInsumosP int(11) 
)
BEGIN 
INSERT INTO insumocatalogo ( 
Concepto, 
Unidad, 
Precio, 
Importe, 
Cantidad, 
PorcentajeIndidencia, 
IdSeccionInsumos) 
VALUES (ConceptoP, 
UnidadP, 
PrecioP, 
ImporteP, 
CantidadP, 
PorcentajeIndidenciaP, 
IdSeccionInsumosP 
); 
END$$

DROP PROCEDURE IF EXISTS `Insertarlistadoindirectos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insertarlistadoindirectos`( 
IN IdPresupuestoP int(11) 
)
BEGIN 
INSERT INTO listadoindirectos ( 
IdPresupuesto) 
VALUES (IdPresupuestoP 
); 
END$$

DROP PROCEDURE IF EXISTS `Insertarlistadoinsumos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insertarlistadoinsumos`( 
IN IdPresupuestoP int(11) 
)
BEGIN 
INSERT INTO listadoinsumos ( 
IdPresupuesto) 
VALUES (IdPresupuestoP 
); 
END$$

DROP PROCEDURE IF EXISTS `Insertarpresupuesto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insertarpresupuesto`( 
IN FinanciamientoP double ,  
IN UtilidadP double ,  
IN CargosAdicionalesP double ,  
IN IdProyectoP int(11) 
)
BEGIN 
INSERT INTO presupuesto ( 
Financiamiento, 
Utilidad, 
CargosAdicionales, 
IdProyecto) 
VALUES (FinanciamientoP, 
UtilidadP, 
CargosAdicionalesP, 
IdProyectoP 
); 
END$$

DROP PROCEDURE IF EXISTS `Insertarproyecto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insertarproyecto`( 
IN NombreP varchar(200) ,  
IN ClienteP varchar(200) ,  
IN ContratoP varchar(50) ,  
IN DescripcionP varchar(600) ,  
IN FechaInicioP date ,  
IN FechaEntregaP date ,  
IN IdConstructoraP int(11) 
)
BEGIN 
INSERT INTO proyecto ( 
Nombre, 
Cliente, 
Contrato, 
Descripcion, 
FechaInicio, 
FechaEntrega, 
IdConstructora) 
VALUES (NombreP, 
ClienteP, 
ContratoP, 
DescripcionP, 
FechaInicioP, 
FechaEntregaP, 
IdConstructoraP 
); 
END$$

DROP PROCEDURE IF EXISTS `Insertarseccionconcepto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insertarseccionconcepto`( 
IN NombreP varchar(60) ,  
IN IdCatalogoConceptosP int(11) 
)
BEGIN 
INSERT INTO seccionconcepto ( 
Nombre, 
IdCatalogoConceptos) 
VALUES (NombreP, 
IdCatalogoConceptosP 
); 
END$$

DROP PROCEDURE IF EXISTS `Insertarsecciondirectos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insertarsecciondirectos`( 
IN NombreP varchar(60) ,  
IN IdListadoInsumosP int(11) 
)
BEGIN 
INSERT INTO secciondirectos ( 
Nombre, 
IdListadoInsumos) 
VALUES (NombreP, 
IdListadoInsumosP 
); 
END$$

DROP PROCEDURE IF EXISTS `Updateavancedeobra`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Updateavancedeobra`( 
IN NumeroP int(11) ,  
IN CantidadP double ,  
IN IdAvanceRealP int(11) ,  
IN IdAvanceDeObraP int(11) 
)
BEGIN 
UPDATE avancedeobra  
SET Numero = NumeroP, 
Cantidad = CantidadP, 
IdAvanceReal = IdAvanceRealP 
WHERE IdAvanceDeObra = IdAvanceDeObraP; 
END$$

DROP PROCEDURE IF EXISTS `Updateavancereal`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Updateavancereal`( 
IN IdProyectoP int(11) ,  
IN IdAvanceRealP int(11) 
)
BEGIN 
UPDATE avancereal  
SET IdProyecto = IdProyectoP 
WHERE IdAvanceReal = IdAvanceRealP; 
END$$

DROP PROCEDURE IF EXISTS `Updatecatalogoconceptos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Updatecatalogoconceptos`( 
IN IdProyectoP int(11) ,  
IN IdCatalogoConceptosP int(11) 
)
BEGIN 
UPDATE catalogoconceptos  
SET IdProyecto = IdProyectoP 
WHERE IdCatalogoConceptos = IdCatalogoConceptosP; 
END$$

DROP PROCEDURE IF EXISTS `Updateconcepto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Updateconcepto`( 
IN NumeroP int(10) ,  
IN EspecificacionP varchar(15) ,  
IN DescripcionP varchar(400) ,  
IN UnidadP varchar(10) ,  
IN PrecioUnitarioP double ,  
IN ImporteP double ,  
IN CantidadP int(10) ,  
IN IdSeccionConceptoP int(11) ,  
IN IdConceptoP int(11) 
)
BEGIN 
UPDATE concepto  
SET Numero = NumeroP, 
Especificacion = EspecificacionP, 
Descripcion = DescripcionP, 
Unidad = UnidadP, 
PrecioUnitario = PrecioUnitarioP, 
Importe = ImporteP, 
Cantidad = CantidadP, 
IdSeccionConcepto = IdSeccionConceptoP 
WHERE IdConcepto = IdConceptoP; 
END$$

DROP PROCEDURE IF EXISTS `Updateconstructora`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Updateconstructora`( 
IN NombreP varchar(200) ,  
IN DireccionP varchar(200) ,  
IN RFCP varchar(13) ,  
IN TelefonoP int(15) ,  
IN EmailP varchar(100) ,  
IN DescripcionP varchar(200) ,  
IN FechaIngresoP date ,  
IN IdConstructoraP int(11) 
)
BEGIN 
UPDATE constructora  
SET Nombre = NombreP, 
Direccion = DireccionP, 
RFC = RFCP, 
Telefono = TelefonoP, 
Email = EmailP, 
Descripcion = DescripcionP, 
FechaIngreso = FechaIngreso 
WHERE IdConstructora = IdConstructoraP; 
END$$

DROP PROCEDURE IF EXISTS `Updateindirectocatalogo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Updateindirectocatalogo`( 
IN ConceptoP varchar(60) ,  
IN Monto_OficinaCentral double ,  
IN Monto_OficinaCampoP double ,  
IN Porcentaje_OficinaCentralP double ,  
IN Porcentaje_OficinaCampoP double ,  
IN IdSeccionIndirectosP int(11) ,  
IN IdIndirectoCatalogoP int(11) 
)
BEGIN 
UPDATE indirectocatalogo  
SET Concepto = ConceptoP, 
Monto_OficinaCentral = Monto_OficinaCentral, 
Monto_OficinaCampo = Monto_OficinaCampoP, 
Porcentaje_OficinaCentral = Porcentaje_OficinaCentralP, 
Porcentaje_OficinaCampo = Porcentaje_OficinaCampoP, 
IdSeccionIndirectos = IdSeccionIndirectosP 
WHERE IdIndirectoCatalogo = IdIndirectoCatalogoP; 
END$$

DROP PROCEDURE IF EXISTS `Updateinsumocapturado`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Updateinsumocapturado`( 
IN ConceptoP varchar(60) ,  
IN DescripcionP varchar(400) ,  
IN CantidadP double ,  
IN PrecioP double ,  
IN IdAvanceRealP int(11) ,  
IN IdInsumoCapturadoP int(11) 
)
BEGIN 
UPDATE insumocapturado  
SET Concepto = ConceptoP, 
Descripcion = DescripcionP, 
Cantidad = CantidadP, 
Precio = PrecioP, 
IdAvanceReal = IdAvanceRealP 
WHERE IdInsumoCapturado = IdInsumoCapturadoP; 
END$$

DROP PROCEDURE IF EXISTS `Updateinsumocatalogo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Updateinsumocatalogo`( 
IN ConceptoP varchar(60) ,  
IN UnidadP varchar(10) ,  
IN PrecioP double ,  
IN ImporteP double ,  
IN CantidadP double ,  
IN PorcentajeIndidenciaP double ,  
IN IdSeccionInsumosP int(11) ,  
IN IdInsumoCatalogoP int(11) 
)
BEGIN 
UPDATE insumocatalogo  
SET Concepto = ConceptoP, 
Unidad = UnidadP, 
Precio = PrecioP, 
Importe = ImporteP, 
Cantidad = CantidadP, 
PorcentajeIndidencia = PorcentajeIndidenciaP, 
IdSeccionInsumos = IdSeccionInsumosP 
WHERE IdInsumoCatalogo = IdInsumoCatalogoP; 
END$$

DROP PROCEDURE IF EXISTS `Updatelistadoindirectos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Updatelistadoindirectos`( 
IN IdPresupuestoP int(11) ,  
IN IdListadoIndirectosP int(11) 
)
BEGIN 
UPDATE listadoindirectos  
SET IdPresupuesto = IdPresupuestoP 
WHERE IdListadoIndirectos = IdListadoIndirectosP; 
END$$

DROP PROCEDURE IF EXISTS `Updatelistadoinsumos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Updatelistadoinsumos`( 
IN IdPresupuestoP int(11) ,  
IN IdListadoInsumos int(11) 
)
BEGIN 
UPDATE listadoinsumos  
SET IdPresupuesto = IdPresupuestoP 
WHERE IdListadoInsumos = IdListadoInsumos; 
END$$

DROP PROCEDURE IF EXISTS `Updatepresupuesto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Updatepresupuesto`( 
IN FinanciamientoP double ,  
IN UtilidadP double ,  
IN CargosAdicionalesP double ,  
IN IdProyectoP int(11) ,  
IN IdPresupuestoP int(11) 
)
BEGIN 
UPDATE presupuesto  
SET Financiamiento = FinanciamientoP, 
Utilidad = UtilidadP, 
CargosAdicionales = CargosAdicionalesP, 
IdProyecto = IdProyectoP 
WHERE IdPresupuesto = IdPresupuestoP; 
END$$

DROP PROCEDURE IF EXISTS `Updateproyecto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Updateproyecto`( 
IN NombreP varchar(200) ,  
IN ClienteP varchar(200) ,  
IN ContratoP varchar(50) ,  
IN DescripcionP varchar(600) ,  
IN FechaInicioP date ,  
IN FechaEntregaP date ,  
IN IdConstructoraP int(11) ,  
IN IdProyectoP int(11) 
)
BEGIN 
UPDATE proyecto  
SET Nombre = NombreP, 
Cliente = ClienteP, 
Contrato = ContratoP, 
Descripcion = DescripcionP, 
FechaInicio = FechaInicioP, 
FechaEntrega = FechaEntregaP, 
IdConstructora = IdConstructoraP 
WHERE IdProyecto = IdProyectoP; 
END$$

DROP PROCEDURE IF EXISTS `Updateseccionconcepto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Updateseccionconcepto`( 
IN NombreP varchar(60) ,  
IN IdCatalogoConceptosP int(11) ,  
IN IdSeccionConceptoP int(11) 
)
BEGIN 
UPDATE seccionconcepto  
SET Nombre = NombreP, 
IdCatalogoConceptos = IdCatalogoConceptosP 
WHERE IdSeccionConcepto = IdSeccionConceptoP; 
END$$

DROP PROCEDURE IF EXISTS `Updatesecciondirectos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Updatesecciondirectos`( 
IN NombreP varchar(60) ,  
IN IdListadoInsumosP int(11) ,  
IN IdSeccionIndirectos int(11) 
)
BEGIN 
UPDATE secciondirectos  
SET Nombre = NombreP, 
IdListadoInsumos = IdListadoInsumosP 
WHERE IdSeccionIndirectos = IdSeccionIndirectos; 
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `avancedeobra`
--

DROP TABLE IF EXISTS `avancedeobra`;
CREATE TABLE IF NOT EXISTS `avancedeobra` (
  `IdAvanceDeObra` int(11) NOT NULL AUTO_INCREMENT,
  `Numero` int(11) NOT NULL,
  `Cantidad` double NOT NULL,
  `IdAvanceReal` int(11) NOT NULL,
  PRIMARY KEY (`IdAvanceDeObra`),
  KEY `IdAvanceReal` (`IdAvanceReal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `avancereal`
--

DROP TABLE IF EXISTS `avancereal`;
CREATE TABLE IF NOT EXISTS `avancereal` (
  `IdAvanceReal` int(11) NOT NULL AUTO_INCREMENT,
  `IdProyecto` int(11) NOT NULL,
  PRIMARY KEY (`IdAvanceReal`),
  KEY `IdProyecto` (`IdProyecto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogoconceptos`
--

DROP TABLE IF EXISTS `catalogoconceptos`;
CREATE TABLE IF NOT EXISTS `catalogoconceptos` (
  `IdCatalogoConceptos` int(11) NOT NULL AUTO_INCREMENT,
  `IdProyecto` int(11) NOT NULL,
  PRIMARY KEY (`IdCatalogoConceptos`),
  KEY `IdProyecto` (`IdProyecto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `concepto`
--

DROP TABLE IF EXISTS `concepto`;
CREATE TABLE IF NOT EXISTS `concepto` (
  `IdConcepto` int(11) NOT NULL AUTO_INCREMENT,
  `Numero` int(10) NOT NULL,
  `Especificacion` varchar(15) NOT NULL,
  `Descripcion` varchar(400) NOT NULL,
  `Unidad` varchar(10) NOT NULL,
  `PrecioUnitario` double NOT NULL,
  `Importe` double NOT NULL,
  `Cantidad` int(10) NOT NULL,
  `IdSeccionConcepto` int(11) NOT NULL,
  PRIMARY KEY (`IdConcepto`),
  KEY `IdSeccionConcepto` (`IdSeccionConcepto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `constructora`
--

DROP TABLE IF EXISTS `constructora`;
CREATE TABLE IF NOT EXISTS `constructora` (
  `IdConstructora` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(200) NOT NULL,
  `Direccion` varchar(200) NOT NULL,
  `RFC` varchar(13) NOT NULL,
  `Telefono` int(15) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Descripcion` varchar(200) DEFAULT NULL,
  `FechaIngreso` date NOT NULL,
  PRIMARY KEY (`IdConstructora`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `constructora`
--

INSERT INTO `constructora` (`IdConstructora`, `Nombre`, `Direccion`, `RFC`, `Telefono`, `Email`, `Descripcion`, `FechaIngreso`) VALUES
(3, 'Nombre', 'Direccion', 'String RFC', 3, ' Email', 'String Descripcion', '3912-11-10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `indirectocatalogo`
--

DROP TABLE IF EXISTS `indirectocatalogo`;
CREATE TABLE IF NOT EXISTS `indirectocatalogo` (
  `IdIndirectoCatalogo` int(11) NOT NULL AUTO_INCREMENT,
  `Concepto` varchar(60) NOT NULL,
  `Monto_OficinaCentral` double NOT NULL,
  `Monto_OficinaCampo` double NOT NULL,
  `Porcentaje_OficinaCentral` double NOT NULL,
  `Porcentaje_OficinaCampo` double NOT NULL,
  `IdSeccionIndirectos` int(11) NOT NULL,
  PRIMARY KEY (`IdIndirectoCatalogo`),
  KEY `IdSeccionInsumos` (`IdSeccionIndirectos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumocapturado`
--

DROP TABLE IF EXISTS `insumocapturado`;
CREATE TABLE IF NOT EXISTS `insumocapturado` (
  `IdInsumoCapturado` int(11) NOT NULL,
  `Concepto` varchar(60) NOT NULL,
  `Descripcion` varchar(400) NOT NULL,
  `Cantidad` double NOT NULL,
  `Precio` double NOT NULL,
  `IdAvanceReal` int(11) NOT NULL,
  KEY `IdAvanceReal` (`IdAvanceReal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumocatalogo`
--

DROP TABLE IF EXISTS `insumocatalogo`;
CREATE TABLE IF NOT EXISTS `insumocatalogo` (
  `IdInsumoCatalogo` int(11) NOT NULL AUTO_INCREMENT,
  `Concepto` varchar(60) NOT NULL,
  `Unidad` varchar(10) NOT NULL,
  `Precio` double NOT NULL,
  `Importe` double NOT NULL,
  `Cantidad` double NOT NULL,
  `PorcentajeIndidencia` double NOT NULL,
  `IdSeccionInsumos` int(11) NOT NULL,
  PRIMARY KEY (`IdInsumoCatalogo`),
  KEY `IdSeccionInsumos` (`IdSeccionInsumos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listadoindirectos`
--

DROP TABLE IF EXISTS `listadoindirectos`;
CREATE TABLE IF NOT EXISTS `listadoindirectos` (
  `IdListadoIndirectos` int(11) NOT NULL AUTO_INCREMENT,
  `IdPresupuesto` int(11) NOT NULL,
  PRIMARY KEY (`IdListadoIndirectos`),
  KEY `IdPresupuesto` (`IdPresupuesto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listadoinsumos`
--

DROP TABLE IF EXISTS `listadoinsumos`;
CREATE TABLE IF NOT EXISTS `listadoinsumos` (
  `IdListadoInsumos` int(11) NOT NULL AUTO_INCREMENT,
  `IdPresupuesto` int(11) NOT NULL,
  PRIMARY KEY (`IdListadoInsumos`),
  KEY `IdPresupuesto` (`IdPresupuesto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presupuesto`
--

DROP TABLE IF EXISTS `presupuesto`;
CREATE TABLE IF NOT EXISTS `presupuesto` (
  `IdPresupuesto` int(11) NOT NULL AUTO_INCREMENT,
  `Financiamiento` double NOT NULL,
  `Utilidad` double NOT NULL,
  `CargosAdicionales` double NOT NULL,
  `IdProyecto` int(11) NOT NULL,
  PRIMARY KEY (`IdPresupuesto`),
  KEY `IdProyecto` (`IdProyecto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

DROP TABLE IF EXISTS `proyecto`;
CREATE TABLE IF NOT EXISTS `proyecto` (
  `IdProyecto` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(200) NOT NULL,
  `Cliente` varchar(200) NOT NULL,
  `Contrato` varchar(50) NOT NULL,
  `Descripcion` varchar(600) DEFAULT NULL,
  `FechaInicio` date NOT NULL,
  `FechaEntrega` date NOT NULL,
  `IdConstructora` int(11) NOT NULL,
  PRIMARY KEY (`IdProyecto`),
  KEY `IdConstructora` (`IdConstructora`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccionconcepto`
--

DROP TABLE IF EXISTS `seccionconcepto`;
CREATE TABLE IF NOT EXISTS `seccionconcepto` (
  `IdSeccionConcepto` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(60) NOT NULL,
  `IdCatalogoConceptos` int(11) NOT NULL,
  PRIMARY KEY (`IdSeccionConcepto`),
  KEY `IdCatalogoConceptos` (`IdCatalogoConceptos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccionindirectos`
--

DROP TABLE IF EXISTS `seccionindirectos`;
CREATE TABLE IF NOT EXISTS `seccionindirectos` (
  `IdSeccionIndirectos` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(60) NOT NULL,
  `IdListadoInsumos` int(11) NOT NULL,
  PRIMARY KEY (`IdSeccionIndirectos`),
  KEY `IdListadoInsumos` (`IdListadoInsumos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccioninsumos`
--

DROP TABLE IF EXISTS `seccioninsumos`;
CREATE TABLE IF NOT EXISTS `seccioninsumos` (
  `IdSeccionInsumos` int(11) NOT NULL AUTO_INCREMENT,
  `IdListadoInsumos` int(11) NOT NULL,
  PRIMARY KEY (`IdSeccionInsumos`),
  KEY `IdListadoInsumos` (`IdListadoInsumos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `IdUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `Puesto` varchar(40) NOT NULL,
  `Nombre` varchar(60) NOT NULL,
  `NombreUsuario` varchar(30) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `IdConstructora` int(11) NOT NULL,
  PRIMARY KEY (`IdUsuario`),
  KEY `IdConstructora` (`IdConstructora`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `avancedeobra`
--
ALTER TABLE `avancedeobra`
  ADD CONSTRAINT `avancedeobra_ibfk_1` FOREIGN KEY (`IdAvanceReal`) REFERENCES `avancereal` (`IdAvanceReal`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `avancereal`
--
ALTER TABLE `avancereal`
  ADD CONSTRAINT `avancereal_ibfk_1` FOREIGN KEY (`IdProyecto`) REFERENCES `proyecto` (`IdProyecto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `catalogoconceptos`
--
ALTER TABLE `catalogoconceptos`
  ADD CONSTRAINT `catalogoconceptos_ibfk_1` FOREIGN KEY (`IdProyecto`) REFERENCES `proyecto` (`IdProyecto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `concepto`
--
ALTER TABLE `concepto`
  ADD CONSTRAINT `concepto_ibfk_1` FOREIGN KEY (`IdSeccionConcepto`) REFERENCES `seccionconcepto` (`IdSeccionConcepto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `indirectocatalogo`
--
ALTER TABLE `indirectocatalogo`
  ADD CONSTRAINT `indirectocatalogo_ibfk_1` FOREIGN KEY (`IdSeccionIndirectos`) REFERENCES `seccionindirectos` (`IdSeccionIndirectos`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `insumocapturado`
--
ALTER TABLE `insumocapturado`
  ADD CONSTRAINT `insumocapturado_ibfk_1` FOREIGN KEY (`IdAvanceReal`) REFERENCES `avancereal` (`IdAvanceReal`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `insumocatalogo`
--
ALTER TABLE `insumocatalogo`
  ADD CONSTRAINT `insumocatalogo_ibfk_1` FOREIGN KEY (`IdSeccionInsumos`) REFERENCES `seccioninsumos` (`IdSeccionInsumos`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `listadoindirectos`
--
ALTER TABLE `listadoindirectos`
  ADD CONSTRAINT `listadoindirectos_ibfk_1` FOREIGN KEY (`IdPresupuesto`) REFERENCES `presupuesto` (`IdPresupuesto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `listadoinsumos`
--
ALTER TABLE `listadoinsumos`
  ADD CONSTRAINT `listadoinsumos_ibfk_1` FOREIGN KEY (`IdPresupuesto`) REFERENCES `presupuesto` (`IdPresupuesto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `presupuesto`
--
ALTER TABLE `presupuesto`
  ADD CONSTRAINT `presupuesto_ibfk_1` FOREIGN KEY (`IdProyecto`) REFERENCES `proyecto` (`IdProyecto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD CONSTRAINT `proyecto_ibfk_1` FOREIGN KEY (`IdConstructora`) REFERENCES `constructora` (`IdConstructora`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `seccionconcepto`
--
ALTER TABLE `seccionconcepto`
  ADD CONSTRAINT `seccionconcepto_ibfk_1` FOREIGN KEY (`IdCatalogoConceptos`) REFERENCES `catalogoconceptos` (`IdCatalogoConceptos`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `seccionindirectos`
--
ALTER TABLE `seccionindirectos`
  ADD CONSTRAINT `seccionindirectos_ibfk_2` FOREIGN KEY (`IdListadoInsumos`) REFERENCES `listadoinsumos` (`IdListadoInsumos`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `seccioninsumos`
--
ALTER TABLE `seccioninsumos`
  ADD CONSTRAINT `seccioninsumos_ibfk_1` FOREIGN KEY (`IdListadoInsumos`) REFERENCES `listadoinsumos` (`IdListadoInsumos`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`IdConstructora`) REFERENCES `constructora` (`IdConstructora`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
