-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.2.0 - MySQL Community Server - GPL
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
CREATE DATABASE IF NOT EXISTS `bd_lojadoces` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bd_lojadoces`;

-- Copiando estrutura para tabela bd_lojadoces.tbadministrativa
CREATE TABLE IF NOT EXISTS `tbadministrativa` (
  `id` int NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `senha` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela bd_lojadoces.tbadministrativa: ~0 rows (aproximadamente)
REPLACE INTO `tbadministrativa` (`id`, `email`, `senha`) VALUES
	(1, '123@123.com', '123');

-- Copiando estrutura para tabela bd_lojadoces.tbclientes
CREATE TABLE IF NOT EXISTS `tbclientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `senha` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela bd_lojadoces.tbclientes: ~2 rows (aproximadamente)
REPLACE INTO `tbclientes` (`id`, `nome`, `email`, `senha`) VALUES
	(5, 'Bruno Luiz', 'bruno@gmail.com', '123'),
	(6, 'meu pal de lado', '123@123.com', '123');

-- Copiando estrutura para tabela bd_lojadoces.tbitenspedidos
CREATE TABLE IF NOT EXISTS `tbitenspedidos` (
  `idPedido` int NOT NULL,
  `codProduto` int DEFAULT NULL,
  `qtdProduto` int DEFAULT NULL,
  KEY `FK_CODPRODUTO` (`codProduto`),
  KEY `FK_PEDIDOS` (`idPedido`),
  CONSTRAINT `FK_CODPRODUTO` FOREIGN KEY (`codProduto`) REFERENCES `tbprodutos` (`id`),
  CONSTRAINT `FK_PEDIDOS` FOREIGN KEY (`idPedido`) REFERENCES `tbpedidos` (`idPedidos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela bd_lojadoces.tbitenspedidos: ~20 rows (aproximadamente)
REPLACE INTO `tbitenspedidos` (`idPedido`, `codProduto`, `qtdProduto`) VALUES
	(72, 1, 1),
	(73, 1, 1),
	(74, 1, 2),
	(75, 2, 1),
	(76, 1, 1);

-- Copiando estrutura para tabela bd_lojadoces.tbpedidos
CREATE TABLE IF NOT EXISTS `tbpedidos` (
  `idPedidos` int NOT NULL AUTO_INCREMENT,
  `idCliente` int NOT NULL,
  `dataPedido` date DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idPedidos`) USING BTREE,
  KEY `FK_tbpedidos_tbclientes` (`idCliente`),
  CONSTRAINT `FK_tbpedidos_tbclientes` FOREIGN KEY (`idCliente`) REFERENCES `tbclientes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela bd_lojadoces.tbpedidos: ~20 rows (aproximadamente)
REPLACE INTO `tbpedidos` (`idPedidos`, `idCliente`, `dataPedido`, `status`) VALUES
	(72, 5, '2024-06-10', 'Em Processo'),
	(73, 5, '2024-06-10', 'Em Processo'),
	(74, 5, '2024-06-10', 'Em Processo'),
	(75, 5, '2024-06-10', 'Em Processo'),
	(76, 5, '2024-06-10', 'Em Processo');

-- Copiando estrutura para tabela bd_lojadoces.tbprodutos
CREATE TABLE IF NOT EXISTS `tbprodutos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `NomeProduto` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `quantidade` int NOT NULL DEFAULT (0),
  `preco` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `imagem` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela bd_lojadoces.tbprodutos: ~5 rows (aproximadamente)
REPLACE INTO `tbprodutos` (`id`, `NomeProduto`, `quantidade`, `preco`, `imagem`) VALUES
	(1, 'Panettone - Bauduco', 320, '68,34', '20240524231342.png'),
	(2, 'Barra - Milke', 3, '15,78', '20240525224919.png'),
	(3, 'Trufa - Cacau Show', 29, '35,21', '1003366_1-removebg-preview.png'),
	(4, 'Bis', 6, '8,74', 'bis.png'),
	(5, 'Caixa de KitKat', 71, '45,90', '20240607142718.png');

-- Copiando estrutura para trigger bd_lojadoces.atualizar_quantidade_produto
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='';
DELIMITER //
CREATE TRIGGER `atualizar_quantidade_produto` AFTER INSERT ON `tbitenspedidos` FOR EACH ROW BEGIN
    UPDATE tbprodutos
    SET quantidade = quantidade - NEW.qtdProduto
    WHERE id = NEW.codProduto;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
