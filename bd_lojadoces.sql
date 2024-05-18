-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 18/05/2024 às 05:05
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd_lojadoces`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbadministrativa`
--

DROP TABLE IF EXISTS `tbadministrativa`;
CREATE TABLE IF NOT EXISTS `tbadministrativa` (
  `id` int(11) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `senha` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbadministrativa`
--

INSERT INTO `tbadministrativa` (`id`, `email`, `senha`) VALUES
(1, '123@123.com', '123');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbclientes`
--

DROP TABLE IF EXISTS `tbclientes`;
CREATE TABLE IF NOT EXISTS `tbclientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `senha` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbclientes`
--

INSERT INTO `tbclientes` (`id`, `nome`, `email`, `senha`) VALUES
(1, '123123', '123@123.com', '123'),
(2, 'Bruno', 'bruno@gmail.com', '123'),
(3, 'bruno', 'bruno123@gmail.com', '123');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbitenspedidos`
--

DROP TABLE IF EXISTS `tbitenspedidos`;
CREATE TABLE IF NOT EXISTS `tbitenspedidos` (
  `idPedido` int(11) NOT NULL,
  `codProduto` int(11) DEFAULT NULL,
  `qtdProduto` int(11) DEFAULT NULL,
  KEY `FK_CODPRODUTO` (`codProduto`),
  KEY `FK_PEDIDOS` (`idPedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbitenspedidos`
--

INSERT INTO `tbitenspedidos` (`idPedido`, `codProduto`, `qtdProduto`) VALUES
(1, 1, 2),
(2, 3, 3),
(1, 3, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbpedidos`
--

DROP TABLE IF EXISTS `tbpedidos`;
CREATE TABLE IF NOT EXISTS `tbpedidos` (
  `idPedidos` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL DEFAULT 0,
  `dataPedido` date DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`idPedidos`) USING BTREE,
  KEY `FK_tbpedidos_tbclientes` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbpedidos`
--

INSERT INTO `tbpedidos` (`idPedidos`, `idCliente`, `dataPedido`, `status`) VALUES
(1, 1, '2024-05-18', 'aberto'),
(2, 2, '2024-05-18', 'aberto');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbprodutos`
--

DROP TABLE IF EXISTS `tbprodutos`;
CREATE TABLE IF NOT EXISTS `tbprodutos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomeProduto` varchar(50) NOT NULL,
  `quantidade` varchar(50) NOT NULL,
  `preco` varchar(50) NOT NULL,
  `imagem` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbprodutos`
--

INSERT INTO `tbprodutos` (`id`, `NomeProduto`, `quantidade`, `preco`, `imagem`) VALUES
(1, 'bombom', '12', '12', ''),
(2, 'ProdutosTest', '1212', '12', ''),
(3, 'Panetonne Bauduco', '23', '99,99', ''),
(4, 'Trufa Recheada', '98', '3,90', '');

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `tbitenspedidos`
--
ALTER TABLE `tbitenspedidos`
  ADD CONSTRAINT `FK_CODPRODUTO` FOREIGN KEY (`codProduto`) REFERENCES `tbprodutos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_PEDIDOS` FOREIGN KEY (`idPedido`) REFERENCES `tbpedidos` (`idPedidos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `tbpedidos`
--
ALTER TABLE `tbpedidos`
  ADD CONSTRAINT `FK_tbpedidos_tbclientes` FOREIGN KEY (`idCliente`) REFERENCES `tbclientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
