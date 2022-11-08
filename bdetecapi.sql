-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08-Nov-2022 às 20:42
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
-- Banco de dados: `bdetecapi`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbaluno`
--

CREATE TABLE `tbaluno` (
  `idAluno` int(11) NOT NULL,
  `nomeAluno` varchar(90) NOT NULL,
  `rmAluno` varchar(16) NOT NULL,
  `turmaAluno` varchar(30) NOT NULL,
  `periodoAluno` varchar(10) NOT NULL,
  `userAluno` varchar(32) NOT NULL,
  `senhaAluno` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbaluno`
--

INSERT INTO `tbaluno` (`idAluno`, `nomeAluno`, `rmAluno`, `turmaAluno`, `periodoAluno`, `userAluno`, `senhaAluno`) VALUES
(1, 'Felipe Santos', '909090', '3° DS', 'Manhã', 'fefesantos', '123456789'),
(2, 'João Antonio', '121212', '1° Nutri', 'Manhã', 'JANutri', '111111'),
(3, 'Fernando Dias', '222222', '2° DS A', 'Manhã', 'Fernando09', '182812'),
(4, 'Cleide Araujo', '333333', '1° Edificações A', 'Tarde', 'clecle01', '12345'),
(5, 'Bruna Alves Santos', '444444', '3° DS', 'Manhã', 'brubru12', '123454321');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tblab`
--

CREATE TABLE `tblab` (
  `idLab` int(11) NOT NULL,
  `nomeLab` varchar(25) NOT NULL,
  `qntdComputador` int(11) DEFAULT NULL,
  `obsLab` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tblab`
--

INSERT INTO `tblab` (`idLab`, `nomeLab`, `qntdComputador`, `obsLab`) VALUES
(1, 'Laboratório 1', 12, 'Sem observações'),
(2, 'Laboratório 2', 16, 'Problemas continuo na internet'),
(3, 'Laboratório 3', 8, 'Sem observações');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbpedmnt`
--

CREATE TABLE `tbpedmnt` (
  `idPedMnt` int(11) NOT NULL,
  `idAluno` int(11) DEFAULT NULL,
  `idProf` int(11) DEFAULT NULL,
  `idLab` int(11) DEFAULT NULL,
  `pcPedMnt` varchar(50) NOT NULL,
  `descPedMnt` varchar(80) NOT NULL,
  `nomePedMnt` varchar(40) NOT NULL,
  `dataPedMnt` datetime NOT NULL,
  `concluido` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbpedmnt`
--

INSERT INTO `tbpedmnt` (`idPedMnt`, `idAluno`, `idProf`, `idLab`, `pcPedMnt`, `descPedMnt`, `nomePedMnt`, `dataPedMnt`, `concluido`) VALUES
(1, 1, NULL, 1, 'Computador do professor', 'Muito lento e travando muito quanado abre o goole', 'Computador Travando', '0000-00-00 00:00:00', 0),
(2, 4, NULL, 2, 'Computador do fundo do lado direito', 'Tela com rabiscos e com as cores falhando', 'Tela quebrada', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbprof`
--

CREATE TABLE `tbprof` (
  `idProf` int(11) NOT NULL,
  `nomeProf` varchar(90) NOT NULL,
  `cpfProf` varchar(14) NOT NULL,
  `userProf` varchar(32) NOT NULL,
  `senhaProf` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbprof`
--

INSERT INTO `tbprof` (`idProf`, `nomeProf`, `cpfProf`, `userProf`, `senhaProf`) VALUES
(1, 'Cleiton Da Silva', '111.111.111-11', 'cleiceli', '12345678'),
(2, 'Geovana Macedo', '222.222.222-22', 'GeovanaM', '123123'),
(3, 'Antônio Junior', '333.333.333-33', 'Sr_JR', '1010'),
(4, 'Vanessa Ferraz', '444.444.444-44', 'Vaaannn', '123454321'),
(5, 'Allan Vidal', '555.555.555-55', 'AllanVidal9', '12345678');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbrespmnt`
--

CREATE TABLE `tbrespmnt` (
  `idRespMnt` int(11) NOT NULL,
  `idPedMnt` int(11) DEFAULT NULL,
  `nomeResp` varchar(40) NOT NULL,
  `obsRespMnt` varchar(120) NOT NULL,
  `pcRespMnt` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbrespmnt`
--

INSERT INTO `tbrespmnt` (`idRespMnt`, `idPedMnt`, `nomeResp`, `obsRespMnt`, `pcRespMnt`) VALUES
(1, 1, 'PC do professor', 'Computador arrumado. Foi limpado o armazenamento para ficar mais rápido', NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tbaluno`
--
ALTER TABLE `tbaluno`
  ADD PRIMARY KEY (`idAluno`);

--
-- Índices para tabela `tblab`
--
ALTER TABLE `tblab`
  ADD PRIMARY KEY (`idLab`);

--
-- Índices para tabela `tbpedmnt`
--
ALTER TABLE `tbpedmnt`
  ADD PRIMARY KEY (`idPedMnt`),
  ADD KEY `idAluno` (`idAluno`),
  ADD KEY `idProf` (`idProf`),
  ADD KEY `idLab` (`idLab`);

--
-- Índices para tabela `tbprof`
--
ALTER TABLE `tbprof`
  ADD PRIMARY KEY (`idProf`);

--
-- Índices para tabela `tbrespmnt`
--
ALTER TABLE `tbrespmnt`
  ADD PRIMARY KEY (`idRespMnt`),
  ADD KEY `idPedMnt` (`idPedMnt`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tbaluno`
--
ALTER TABLE `tbaluno`
  MODIFY `idAluno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `tblab`
--
ALTER TABLE `tblab`
  MODIFY `idLab` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tbpedmnt`
--
ALTER TABLE `tbpedmnt`
  MODIFY `idPedMnt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tbprof`
--
ALTER TABLE `tbprof`
  MODIFY `idProf` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `tbrespmnt`
--
ALTER TABLE `tbrespmnt`
  MODIFY `idRespMnt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tbpedmnt`
--
ALTER TABLE `tbpedmnt`
  ADD CONSTRAINT `tbpedmnt_ibfk_1` FOREIGN KEY (`idAluno`) REFERENCES `tbaluno` (`idAluno`),
  ADD CONSTRAINT `tbpedmnt_ibfk_2` FOREIGN KEY (`idProf`) REFERENCES `tbprof` (`idProf`),
  ADD CONSTRAINT `tbpedmnt_ibfk_3` FOREIGN KEY (`idLab`) REFERENCES `tblab` (`idLab`);

--
-- Limitadores para a tabela `tbrespmnt`
--
ALTER TABLE `tbrespmnt`
  ADD CONSTRAINT `tbrespmnt_ibfk_1` FOREIGN KEY (`idPedMnt`) REFERENCES `tbpedmnt` (`idPedMnt`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
