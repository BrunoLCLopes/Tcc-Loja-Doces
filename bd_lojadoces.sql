-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.32-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.7.0.6850
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para bd_lojadoces
CREATE DATABASE IF NOT EXISTS `bd_lojadoces` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `bd_lojadoces`;

-- Copiando estrutura para tabela bd_lojadoces.tbadministrativa
CREATE TABLE IF NOT EXISTS `tbadministrativa` (
  `id` int(11) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `senha` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bd_lojadoces.tbclientes
CREATE TABLE IF NOT EXISTS `tbclientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `senha` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bd_lojadoces.tbitenspedidos
CREATE TABLE IF NOT EXISTS `tbitenspedidos` (
  `idPedido` int(11) NOT NULL,
  `codProduto` int(11) DEFAULT NULL,
  `qtdProduto` int(11) DEFAULT NULL,
  KEY `FK_CODPRODUTO` (`codProduto`),
  KEY `FK_PEDIDOS` (`idPedido`),
  CONSTRAINT `FK_CODPRODUTO` FOREIGN KEY (`codProduto`) REFERENCES `tbprodutos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_PEDIDOS` FOREIGN KEY (`idPedido`) REFERENCES `tbpedidos` (`idPedidos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bd_lojadoces.tbpedidos
CREATE TABLE IF NOT EXISTS `tbpedidos` (
  `idPedidos` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL DEFAULT 0,
  `dataPedido` date DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`idPedidos`) USING BTREE,
  KEY `FK_tbpedidos_tbclientes` (`idCliente`),
  CONSTRAINT `FK_tbpedidos_tbclientes` FOREIGN KEY (`idCliente`) REFERENCES `tbclientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bd_lojadoces.tbprodutos
CREATE TABLE IF NOT EXISTS `tbprodutos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomeProduto` varchar(50) NOT NULL,
  `quantidade` varchar(50) NOT NULL,
  `preco` varchar(50) NOT NULL,
  `imagem` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados foi desmarcado.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
