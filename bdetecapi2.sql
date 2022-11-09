-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09-Nov-2022 às 14:11
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bdetecapi2`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbadm`
--

CREATE TABLE `tbadm` (
    `idAdm` int(11) NOT NULL,
    `userAdm` varchar(64) NOT NULL,
    `emailAdm` varchar(64) NOT NULL,
    `senhaAdm` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbpedido`
--

CREATE TABLE `tbpedido` (
    `idPedido` int(11) NOT NULL,
    `periodo` varchar(15) NOT NULL,
    `curso` varchar(50) NOT NULL,
    `lab` varchar(5) NOT NULL,
    `computador` varchar(50) NOT NULL,
    `titulo` varchar(50) DEFAULT NULL,
    `descPedido` text NOT NULL,
    `nomeProf` text DEFAULT NULL,
    `nomeAluno` text DEFAULT NULL,
    `turma` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbpedido`
--

INSERT INTO `tbpedido` (`idPedido`, `periodo`, `curso`, `lab`, `computador`, `titulo`, `descPedido`, `nomeProf`, `nomeAluno`, `turma`) VALUES
(1, 'Manhã', 'DS', 'Lab 6', 'PC 5', 'Falha na internet', 'A internet desse PC tá uma bosta, dos outros funcionam normalmente', NULL, 'Felipe Santos', NULL),
(13, 'Manhã', 'DS', 'lab 3', 'PC 3', 'Falha no teclado', 'O teclado não está funcionando. Socorro pelo amor de Deus', 'Allan Vidal', ' Felipe', '3° Ano');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tbadm`
--
ALTER TABLE `tbadm`
    ADD PRIMARY KEY (`idAdm`);

--
-- Índices para tabela `tbpedido`
--
ALTER TABLE `tbpedido`
    ADD PRIMARY KEY (`idPedido`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tbadm`
--
ALTER TABLE `tbadm`
    MODIFY `idAdm` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbpedido`
--
ALTER TABLE `tbpedido`
    MODIFY `idPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

ALTER TABLE tbpedido ADD dataPedido TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
