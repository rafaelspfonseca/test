-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29-Jul-2020 às 14:48
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 7.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `test`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_nota`
--

CREATE TABLE `tb_nota` (
  `cod_nota` int(11) NOT NULL,
  `cod_empresa` int(11) NOT NULL,
  `num_nf` int(11) NOT NULL,
  `data_emissao` date NOT NULL,
  `natOp` varchar(60) DEFAULT NULL,
  `modelo` varchar(2) DEFAULT NULL,
  `tpNF` int(1) DEFAULT NULL,
  `finNFe` int(1) DEFAULT NULL,
  `qrCode` varchar(255) DEFAULT NULL,
  `chNFe` varchar(44) NOT NULL,
  `cStat` int(3) DEFAULT NULL,
  `xMotivo` varchar(255) DEFAULT NULL,
  `vST` double DEFAULT NULL,
  `vProd` double DEFAULT NULL,
  `vDesc` double DEFAULT NULL,
  `vNF` double DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `id_user` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_nota`
--

INSERT INTO `tb_nota` (`cod_nota`, `cod_empresa`, `num_nf`, `data_emissao`, `natOp`, `modelo`, `tpNF`, `finNFe`, `qrCode`, `chNFe`, `cStat`, `xMotivo`, `vST`, `vProd`, `vDesc`, `vNF`, `date`, `id_user`) VALUES
(10438, 1, 475, '2020-02-12', 'VENDA EFETUADA FORA DO ESTABELECIMENTO', '65', 1, 1, NULL, '15200215138579000120650030000004751000004763', 100, 'Autorizado o uso da NF-e', 0, 472, 0, 472, '2020-07-28 14:17:45', 'admin'),
(272, 1, 8989, '2020-02-17', 'VENDA', '65', 1, 1, NULL, '15200215138579000120650010000089891000089900', 100, 'Autorizado o uso da NF-e', 0, 37, 2, 35, '2020-07-16 15:50:57', 'jefferson'),
(400, 1, 9115, '2020-02-26', 'VENDA', '65', 1, 1, NULL, '15200215138579000120650010000091151000091163', 100, 'Autorizado o uso da NF-e', 0, 243, 23, 220, '2020-07-16 15:50:57', 'jefferson'),
(424, 1, 9139, '2020-02-27', 'VENDA', '65', 1, 1, NULL, '15200215138579000120650010000091391000091408', 100, 'Autorizado o uso da NF-e', 0, 209, 11, 198, '2020-07-16 15:50:57', 'jefferson');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_nota_item`
--

CREATE TABLE `tb_nota_item` (
  `cod_nota` int(11) NOT NULL,
  `nItem` int(11) NOT NULL DEFAULT 1,
  `cod_produto` varchar(60) NOT NULL,
  `nome_produto` varchar(100) NOT NULL,
  `cod_ncm` bigint(20) NOT NULL,
  `cfop` int(4) NOT NULL,
  `qtd_item` double NOT NULL,
  `valor_item` double NOT NULL,
  `valor_desc` double DEFAULT NULL,
  `valor_total` double NOT NULL,
  `date` datetime DEFAULT NULL,
  `id_user` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_nota_item`
--

INSERT INTO `tb_nota_item` (`cod_nota`, `nItem`, `cod_produto`, `nome_produto`, `cod_ncm`, `cfop`, `qtd_item`, `valor_item`, `valor_desc`, `valor_total`, `date`, `id_user`) VALUES
(272, 1, '000001', 'SELENIA EXPERT 4T 24X01', 27101932, 5656, 1, 16, 0.86, 16, '2020-07-24 11:39:06', 'admin'),
(272, 1, '001300', 'EXTRA VIDA XV100B 15W40 CH-4 TB 200', 27101932, 5656, 1, 14, 0.76, 14, '2020-07-24 11:39:06', 'admin'),
(272, 1, '002472', 'DESEMGRIPANTE BRILLUB FIT AER 300ML X 12', 38249941, 5102, 1, 7, 0.38, 7, '2020-07-24 11:39:06', 'admin'),
(400, 1, '002245', 'PROTETOR CARTER GOL/POLO/VOYAGEM', 87089990, 5405, 1, 95, 8.99, 95, '2020-07-16 15:50:57', 'jefferson'),
(400, 1, '002613', 'PETRONAS SYNTIUM 3000 5W40 24X01', 27101932, 5656, 4, 30, 11.36, 120, '2020-07-16 15:50:57', 'jefferson'),
(400, 1, '003194', 'WO346 FILTRO OLEO UP 1.0 FLES 2014/GOLF 1.4', 84212300, 5405, 1, 28, 2.65, 28, '2020-07-16 15:50:57', 'jefferson'),
(424, 1, '002193', 'FS04/7 FILTRO COMBUST CORSA VECTRA PALIO FIRE', 84212990, 5405, 1, 15, 0.79, 15, '2020-07-16 15:50:57', 'jefferson'),
(424, 1, '002502', 'FAC887 FILTRO CABINE HILLUX', 84213990, 5405, 1, 20, 1.05, 20, '2020-07-16 15:50:57', 'jefferson'),
(424, 1, '002522', 'LE803 FILTRO DE OLEO COROLLA 10/', 84212300, 5405, 1, 17, 0.89, 17, '2020-07-16 15:50:57', 'jefferson'),
(424, 1, '002758', 'JFA 0285 ELEMENTO FILTRANTE AR', 84219999, 5405, 1, 37, 1.95, 37, '2020-07-16 15:50:57', 'jefferson'),
(424, 1, '003118', 'ADITIVO R-1923 16X1 BIO COLLANT ROSA', 38249941, 5102, 1, 20, 1.05, 20, '2020-07-16 15:50:57', 'jefferson'),
(424, 1, '003155', 'ELAION F 50J 5W30 200L', 27101932, 5656, 4, 25, 5.27, 100, '2020-07-16 15:50:57', 'jefferson'),
(10438, 1, '002742', 'BORR VULCANIT BV 1,5MM GROSSO', 40059190, 5104, 1, 32, 0, 32, '2020-07-28 14:17:45', 'admin'),
(10438, 2, '002736', 'CAMARA KA-14 KENDA', 40139000, 5405, 7, 18, 0, 126, '2020-07-28 14:17:45', 'admin'),
(10438, 3, '002737', 'CAMARA KA-18  KENDA', 40139000, 5405, 5, 18, 0, 90, '2020-07-28 14:17:45', 'admin'),
(10438, 4, '002719', 'CAMARA KV-18 KELV', 40139000, 5405, 16, 14, 0, 224, '2020-07-28 14:17:45', 'admin');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_spedc100`
--

CREATE TABLE `tb_spedc100` (
  `cod_spedC100` int(11) NOT NULL,
  `cod_periodo_empresa` int(11) NOT NULL,
  `ind_operacao` int(1) DEFAULT NULL,
  `cod_mod` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cod_sit` int(2) DEFAULT NULL,
  `serie` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `num_doc` int(11) DEFAULT NULL,
  `chv_nfe` varchar(44) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_doc` date DEFAULT NULL,
  `valor_doc` double DEFAULT NULL,
  `valor_merc` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `tb_spedc100`
--

INSERT INTO `tb_spedc100` (`cod_spedC100`, `cod_periodo_empresa`, `ind_operacao`, `cod_mod`, `cod_sit`, `serie`, `num_doc`, `chv_nfe`, `data_doc`, `valor_doc`, `valor_merc`) VALUES
(8159, 14, 1, '65', 0, '1', 8989, '15200215138579000120650010000089891000089900', '2020-02-17', 3500, 3700),
(8282, 14, 1, '65', 0, '1', 9115, '15200215138579000120650010000091151000091163', '2020-02-26', 22000, 24300),
(8306, 14, 1, '65', 0, '1', 9139, '15200215138579000120650010000091391000091408', '2020-02-27', 19800, 20900),
(8367, 14, 1, '65', 0, '3', 475, '15200215138579000120650030000004751000004763', '2020-02-12', 47200, 47200);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_spedc190`
--

CREATE TABLE `tb_spedc190` (
  `cod_spedC90` int(11) NOT NULL,
  `cod_periodo_empresa` int(11) NOT NULL,
  `cod_spedC100` int(11) NOT NULL,
  `cst_icms` int(3) DEFAULT NULL,
  `cfop` int(4) DEFAULT NULL,
  `aliq_icms` int(6) DEFAULT NULL,
  `vl_opr` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_spedc190`
--

INSERT INTO `tb_spedc190` (`cod_spedC90`, `cod_periodo_empresa`, `cod_spedC100`, `cst_icms`, `cfop`, `aliq_icms`, `vl_opr`) VALUES
(11824, 14, 8159, 102, 5102, 0, 662),
(11825, 14, 8159, 500, 5656, 0, 2838),
(12010, 14, 8282, 500, 5405, 0, 11136),
(12011, 14, 8282, 500, 5656, 0, 10864),
(12048, 14, 8306, 102, 5102, 0, 1895),
(12049, 14, 8306, 500, 5405, 0, 8432),
(12050, 14, 8306, 500, 5656, 0, 9473),
(12140, 14, 8367, 102, 5102, 0, 3200),
(12141, 14, 8367, 500, 5405, 0, 44000);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tb_nota`
--
ALTER TABLE `tb_nota`
  ADD PRIMARY KEY (`cod_empresa`,`num_nf`,`chNFe`) USING BTREE,
  ADD UNIQUE KEY `cod_nota` (`cod_nota`);

--
-- Índices para tabela `tb_nota_item`
--
ALTER TABLE `tb_nota_item`
  ADD PRIMARY KEY (`cod_nota`,`nItem`,`cod_produto`) USING BTREE;

--
-- Índices para tabela `tb_spedc100`
--
ALTER TABLE `tb_spedc100`
  ADD PRIMARY KEY (`cod_spedC100`);

--
-- Índices para tabela `tb_spedc190`
--
ALTER TABLE `tb_spedc190`
  ADD PRIMARY KEY (`cod_spedC90`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_nota`
--
ALTER TABLE `tb_nota`
  MODIFY `cod_nota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11110;

--
-- AUTO_INCREMENT de tabela `tb_spedc100`
--
ALTER TABLE `tb_spedc100`
  MODIFY `cod_spedC100` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9809;

--
-- AUTO_INCREMENT de tabela `tb_spedc190`
--
ALTER TABLE `tb_spedc190`
  MODIFY `cod_spedC90` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14201;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
