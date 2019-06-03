-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para exame
CREATE DATABASE IF NOT EXISTS `exame` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `exame`;

-- Copiando estrutura para tabela exame.exames
CREATE TABLE IF NOT EXISTS `exames` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exame` varchar(50) DEFAULT NULL,
  `responsavel` varchar(50) DEFAULT NULL,
  `resultado` varchar(50) DEFAULT NULL,
  `idMedico` int(11) DEFAULT NULL,
  `idPaciente` int(11) DEFAULT NULL,
  KEY `Index 1` (`id`),
  KEY `FK_exames_medicos` (`idMedico`),
  KEY `FK_exames_pacientes` (`idPaciente`),
  CONSTRAINT `FK_exames_medicos` FOREIGN KEY (`idMedico`) REFERENCES `medicos` (`id`),
  CONSTRAINT `FK_exames_pacientes` FOREIGN KEY (`idPaciente`) REFERENCES `pacientes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportação de dados foi desmarcado.
-- Copiando estrutura para procedure exame.FC_ATUALIZA_EXAME
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `FC_ATUALIZA_EXAME`(
	IN `exameParam` VARCHAR(50),
	IN `responsavelParam` VARCHAR(50),
	IN `resultadoParam` VARCHAR(50),
	IN `idMedicoParam` INT,
	IN `idPacienteParam` INT
,
	IN `idParam` INT
)
BEGIN
 UPDATE exames SET 
	exame = exameParam,
	responsavel = responsavelParam,
	resultado = resultadoParam,
	idMedico = idMedicoParam,
	idPaciente = idPacienteParam
 WHERE
	id = idParam;
END//
DELIMITER ;

-- Copiando estrutura para procedure exame.FC_ATUALIZA_MEDICO
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `FC_ATUALIZA_MEDICO`(
	IN `nomeParam` VARCHAR(50),
	IN `especialidadeParam` VARCHAR(50),
	IN `crmParam` VARCHAR(50),
	IN `idParam` INT
)
BEGIN
 UPDATE medicos SET 
	nome = nomeParam,
	especialidade = especialidadeParam,
	crm = crmParam
 WHERE
	id = idParam;
END//
DELIMITER ;

-- Copiando estrutura para procedure exame.FC_ATUALIZA_PACIENTE
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `FC_ATUALIZA_PACIENTE`(
	IN `nomeParam` VARCHAR(50),
	IN `convenioParam` VARCHAR(50),
	IN `idParam` INT
)
BEGIN
 UPDATE pacientes SET 
	nome = nomeParam,
	convenio = convenioParam
 WHERE
	id = idParam;
END//
DELIMITER ;

-- Copiando estrutura para procedure exame.FC_BUSCA_EXAME
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `FC_BUSCA_EXAME`(
	IN `idParam` INT
)
BEGIN
	SELECT
		id,
		exame,
		responsavel,
		resultado,
		idMedico,
		idPaciente
	FROM
		exames
	WHERE 
		id= idParam;
END//
DELIMITER ;

-- Copiando estrutura para procedure exame.FC_BUSCA_MEDICO
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `FC_BUSCA_MEDICO`(
	IN `idParam` INT

)
BEGIN
	SELECT
		id,
		nome,
		especialidade, 
		crm
	FROM 
		medicos
	WHERE
		id = idParam;
END//
DELIMITER ;

-- Copiando estrutura para procedure exame.FC_BUSCA_MEDICO_NM
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `FC_BUSCA_MEDICO_NM`(
	IN `nomeParam` VARCHAR(50)
)
BEGIN
	SELECT
		id,
		nome,
		especialidade, 
		crm
	FROM 
		medicos
	WHERE
		nome = nomeParam;
END//
DELIMITER ;

-- Copiando estrutura para procedure exame.FC_BUSCA_PACIENTE
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `FC_BUSCA_PACIENTE`(
	IN `idParam` INT

)
BEGIN
	SELECT
		id,
		nome,
		convenio
	FROM 
		pacientes
	WHERE
		id = idParam;
END//
DELIMITER ;

-- Copiando estrutura para procedure exame.FC_BUSCA_PACIENTE_NM
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `FC_BUSCA_PACIENTE_NM`(
	IN `nomeParam` VARCHAR(50)
)
BEGIN
	SELECT
		id,
		nome,
		convenio
	FROM 
		pacientes
	WHERE
		nome = nomeParam;
END//
DELIMITER ;

-- Copiando estrutura para procedure exame.FC_DELETE_EXAME
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `FC_DELETE_EXAME`(
	IN `idParam` INT
)
BEGIN
	DELETE FROM
		exames
	WHERE
		id = idParam;
END//
DELIMITER ;

-- Copiando estrutura para procedure exame.FC_DELETE_MEDICO
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `FC_DELETE_MEDICO`(
	IN `idParam` INT
)
BEGIN
	DELETE FROM
		medicos
	WHERE
		id = idParam;
END//
DELIMITER ;

-- Copiando estrutura para procedure exame.FC_DELETE_PACIENTE
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `FC_DELETE_PACIENTE`(
	IN `idParam` INT
)
BEGIN
	DELETE FROM
		pacientes
	WHERE
		id = idParam;
END//
DELIMITER ;

-- Copiando estrutura para procedure exame.FC_INSERE_EXAME
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `FC_INSERE_EXAME`(
	IN `exameParam` VARCHAR(50),
	IN `responsavelParam` VARCHAR(50),
	IN `resultadoParam` VARCHAR(50),
	IN `idMedicoParam` INT,
	IN `idPacienteParam` INT

)
BEGIN
	INSERT INTO
		exames (exame, responsavel, resultado, idMedico, idPaciente)
	VALUES
		(exameParam, responsavelParam, resultadoParam, idMedicoParam, idPacienteParam);
END//
DELIMITER ;

-- Copiando estrutura para procedure exame.FC_INSERE_MEDICO
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `FC_INSERE_MEDICO`(
	IN `nomeParam` VARCHAR(50),
	IN `especialidadeParam` VARCHAR(50),
	IN `crmParam` VARCHAR(50)
)
BEGIN

	INSERT INTO
		medicos (nome, especialidade, crm)
	VALUES
		(nomeParam, especialidadeParam, crmParam);

END//
DELIMITER ;

-- Copiando estrutura para procedure exame.FC_INSERE_PACIENTE
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `FC_INSERE_PACIENTE`(
	IN `nomeParam` VARCHAR(50),
	IN `convenioParam` CHAR(50)
)
BEGIN

	INSERT INTO
		pacientes (nome, convenio)
	VALUES
		(nomeParam,convenioParam);

END//
DELIMITER ;

-- Copiando estrutura para procedure exame.FC_LISTA_EXAMES
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `FC_LISTA_EXAMES`()
BEGIN
	SELECT
		id,
		exame,
		responsavel,
		resultado,
		idMedico,
		idPaciente
	FROM exames;
END//
DELIMITER ;

-- Copiando estrutura para procedure exame.FC_LISTA_MEDICOS
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `FC_LISTA_MEDICOS`()
BEGIN
	SELECT
		id,
		nome,
		especialidade,
		crm
	FROM medicos;
END//
DELIMITER ;

-- Copiando estrutura para procedure exame.FC_LISTA_PACIENTES
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `FC_LISTA_PACIENTES`()
    SQL SECURITY INVOKER
BEGIN
	SELECT
		id,
		nome,
		convenio
	FROM PACIENTES;
END//
DELIMITER ;

-- Copiando estrutura para tabela exame.medicos
CREATE TABLE IF NOT EXISTS `medicos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `especialidade` varchar(50) DEFAULT NULL,
  `crm` varchar(50) DEFAULT NULL,
  KEY `Index 1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportação de dados foi desmarcado.
-- Copiando estrutura para tabela exame.pacientes
CREATE TABLE IF NOT EXISTS `pacientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `convenio` varchar(50) DEFAULT NULL,
  KEY `Index 1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
