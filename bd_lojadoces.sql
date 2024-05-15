-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 15/05/2024 às 18:30
-- Versão do servidor: 8.2.0
-- Versão do PHP: 8.2.13

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
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `senha` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `senha` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tbclientes_tbpedidos` (`nome`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `tbclientes`
--

INSERT INTO `tbclientes` (`id`, `nome`, `email`, `senha`) VALUES
(1, 'bruno', 'bruno@123.com', '123'),
(2, 'bruno', 'bruno123@gmail.com', '123');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbintenspedidos`
--

DROP TABLE IF EXISTS `tbintenspedidos`;
CREATE TABLE IF NOT EXISTS `tbintenspedidos` (
  `idIntensPedido` int NOT NULL AUTO_INCREMENT,
  `idPedido` int DEFAULT NULL,
  `idProduto` int DEFAULT NULL,
  `qtdeProduto` int DEFAULT NULL,
  PRIMARY KEY (`idIntensPedido`),
  KEY `idPedido` (`idPedido`),
  KEY `fk_tbintenspedidos_tbprodutos` (`idProduto`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `tbintenspedidos`
--

INSERT INTO `tbintenspedidos` (`idIntensPedido`, `idPedido`, `idProduto`, `qtdeProduto`) VALUES
(1, 1, 1, 12);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbpedidos`
--

DROP TABLE IF EXISTS `tbpedidos`;
CREATE TABLE IF NOT EXISTS `tbpedidos` (
  `idPedido` int NOT NULL AUTO_INCREMENT,
  `idCliente` int DEFAULT NULL,
  `data` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('aberto','fechado') DEFAULT 'aberto',
  PRIMARY KEY (`idPedido`),
  KEY `fk_tbpedidos_tbclientes` (`idCliente`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `tbpedidos`
--

INSERT INTO `tbpedidos` (`idPedido`, `idCliente`, `data`, `status`) VALUES
(1, 2, '2024-05-15 18:28:26', 'aberto');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbprodutos`
--

DROP TABLE IF EXISTS `tbprodutos`;
CREATE TABLE IF NOT EXISTS `tbprodutos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `NomeProduto` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `quantidade` varchar(50) NOT NULL,
  `preco` varchar(50) NOT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `tbprodutos`
--

INSERT INTO `tbprodutos` (`id`, `NomeProduto`, `quantidade`, `preco`, `imagem`) VALUES
(1, 'Bala Crava', '32', '29,90', NULL),
(2, 'Pastel de Frango', '12', '22,50', NULL),
(3, 'Sabao Em Po', '22', '90', NULL),
(4, 'Amendoin', '23', '12,95', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
