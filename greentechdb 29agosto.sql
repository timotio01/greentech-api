-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30/08/2024 às 03:11
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `greentechdb`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `anuncios`
--

CREATE TABLE `anuncios` (
  `ANUNCIO_ID` int(11) NOT NULL,
  `DATA_VIGENCIA` date NOT NULL,
  `PRECO` varchar(45) NOT NULL,
  `STATUS` varchar(45) NOT NULL,
  `PRODUTOS_ID` int(11) NOT NULL,
  `USUARIOS_ID` int(11) NOT NULL,
  `DESCRICAO` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `anuncios`
--

INSERT INTO `anuncios` (`ANUNCIO_ID`, `DATA_VIGENCIA`, `PRECO`, `STATUS`, `PRODUTOS_ID`, `USUARIOS_ID`, `DESCRICAO`) VALUES
(1, '2024-08-01', '250', 'usado', 4, 4, 'wqsqsaSasASAS'),
(2, '2005-05-05', '250', 'usado', 4, 4, 'ssalkfsfksankn'),
(3, '2005-05-05', '250', 'usado', 4, 4, 'ssalkfsfksankn'),
(4, '2005-05-05', '250', 'usado', 4, 4, 'ssalkfsfksankn'),
(5, '2005-05-05', '2502222', 'usado', 4, 4, 'ssalkfsfksankn'),
(6, '2005-05-05', '2502222', '1', 4, 4, 'ssalkfsfksankn'),
(7, '2005-05-05', '2502222', '1', 4, 4, 'ssalkfsfksankn'),
(8, '2005-05-05', '2502222', '1', 4, 4, 'ssalkfsfksankn'),
(9, '2005-05-05', '102.99', '1', 4, 4, 'ssalkfsfksankn'),
(10, '2005-05-05', '102.99', '1', 4, 4, 'ssalkfsfksankn'),
(11, '2005-05-05', '102.99', '1', 4, 4, 'ssalkfsfksankn'),
(12, '2005-05-05', '102.99', '1', 4, 4, 'ssalkfsfksankn'),
(13, '2005-05-05', '102.99', '1', 4, 4, 'ssalkfsfksankn'),
(14, '2005-05-05', '102.98', '1', 4, 4, 'ssalkfsfksankn'),
(15, '2005-05-05', '102.98', '1', 4, 4, 'ssalkfsfksankn'),
(16, '2005-05-05', '102.98', '1', 4, 4, 'ssalkfsfksankn'),
(17, '2005-05-05', '102.98', '1', 4, 4, 'ssalkfsfksankn'),
(18, '2005-05-05', '111.1', '1', 4, 4, 'ssalkfsfksankn'),
(19, '2005-05-05', '999', '1', 4, 4, 'ssalkfsfksankn'),
(20, '2005-05-05', '999', '1', 4, 4, 'ssalkfsfksankn'),
(21, '2005-05-05', '999', '1', 4, 4, 'ssalkfsfksankn'),
(22, '2005-05-05', '999', '1', 4, 4, 'ssalkfsfksankn'),
(23, '2005-05-05', '500', 'usado', 4, 4, 'hdhdhdhddh'),
(24, '2005-05-05', '1000.11', 'USADO', 4, 4, 'GFHGFHGFHGHGH'),
(25, '2005-05-05', '1000.11', 'USADO', 4, 4, 'GFHGFHGFHGHGH'),
(26, '2005-05-05', '2000.11', 'USADO', 4, 4, 'GFHGFHGFHGHGH'),
(27, '2005-05-05', '2000.11', 'USADO', 4, 4, 'GFHGFHGFHGHGH'),
(28, '2005-05-05', '3000.11', 'USADO', 4, 4, 'Agora vai'),
(29, '2005-05-05', '3000.11', 'USADO', 4, 4, 'Agora vai'),
(30, '2005-05-05', '3000.11', 'USADO', 4, 4, 'Agora vai mesmo'),
(31, '2005-05-05', '3000.11', 'USADO', 4, 4, ' Agora vai mesmo x'),
(32, '2005-05-05', '3000.11', 'USADO', 4, 4, ' Agora vai mesmo x'),
(33, '2005-05-05', '3000.11', 'USADO', 4, 4, ' Agora vai mesmo x'),
(34, '2005-05-05', '3000.11', 'USADO', 4, 4, ' Agora vai mesmo x'),
(35, '2005-05-05', '3000.11', 'USADO', 4, 4, ' Agora vai mesmo xx'),
(36, '2005-05-05', '3000.11', 'USADO', 4, 4, ' Agora vai mesmo xx'),
(37, '2005-05-05', '3000.11', 'USADO', 4, 4, ' Agora vai mesmo y'),
(38, '2005-05-05', '3000.11', 'USADO', 4, 4, ' Agora vai mesmo y'),
(39, '2005-02-02', '255', 'novo', 4, 4, 'vendo aparelho usado rsrsrsrs'),
(40, '2005-02-02', '255', 'novo', 4, 4, 'gagagagagaa');

-- --------------------------------------------------------

--
-- Estrutura para tabela `comentarios`
--

CREATE TABLE `comentarios` (
  `DATA_COMENTARIO` varchar(45) NOT NULL,
  `CONTEUDO_COMENTARIO` text NOT NULL,
  `USUARIOS_ID` int(11) NOT NULL,
  `COMENTARIO_ID` int(11) NOT NULL,
  `ANUNCIOS_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `faleconosco`
--

CREATE TABLE `faleconosco` (
  `FALECONOSCO_ID` int(11) NOT NULL,
  `NOME` varchar(45) DEFAULT NULL,
  `EMAIL` varchar(45) DEFAULT NULL,
  `TELEFONE` varchar(45) DEFAULT NULL,
  `MENSAGEM` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `faleconosco`
--

INSERT INTO `faleconosco` (`FALECONOSCO_ID`, `NOME`, `EMAIL`, `TELEFONE`, `MENSAGEM`) VALUES
(8, 'adm', 'adm@greentech.com', '(18) 99609-0837', 'Teste de contato feito pelo site / contatos');

-- --------------------------------------------------------

--
-- Estrutura para tabela `fotos_produtos`
--

CREATE TABLE `fotos_produtos` (
  `FOTO_ID` int(11) NOT NULL,
  `ID_PRODUTOS` int(11) NOT NULL,
  `URL_FOTO_PRODUTO` varchar(45) NOT NULL,
  `PRODUTOS_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `login`
--

CREATE TABLE `login` (
  `email` varchar(45) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `usuarios_usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `login`
--

INSERT INTO `login` (`email`, `senha`, `usuarios_usuario_id`) VALUES
('email@email.com', '$2b$10$IdEqk7iNJ0FMFYuXvuCRGuYSwqSyJaWX9Bh40gYlvSIZ42txHTmra', 33);

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `PRODUTO_ID` int(11) NOT NULL,
  `NOME` varchar(45) NOT NULL,
  `MARCA` varchar(45) NOT NULL,
  `ESTADO_USO` varchar(45) NOT NULL,
  `PRECO` decimal(11,2) NOT NULL,
  `DESCRICAO` text NOT NULL,
  `DATA` date NOT NULL,
  `USUARIOS_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`PRODUTO_ID`, `NOME`, `MARCA`, `ESTADO_USO`, `PRECO`, `DESCRICAO`, `DATA`, `USUARIOS_ID`) VALUES
(4, 'PodutoTeste', 'asus', 'usado', 50.00, 'gsgsgsgssgsg', '2024-05-05', 4),
(5, 'TESTE 2', 'asus', 'usado', 50.00, 'gsgsgsgssgsg', '2024-05-05', 4),
(6, 'PC Asus', 'EEE', 'EEEE', 45.00, 'EEEE', '2024-02-07', 4),
(8, 'gggg', 'gggggg', 'gggg', 0.00, 'gggg', '2024-08-18', 4),
(9, 'monitor LG', 'LG', 'usado', 751.00, 'sem cabo de energia', '2024-08-25', 4),
(10, 'gabinete 2', 'Dell', 'usado', 50.00, 'sem conteudo', '2024-07-31', 4),
(11, 'gfgfgfg', 'gfgfg', 'gfgfgfg', 45.00, 'gfgfgf', '2024-08-20', 4),
(12, 'aaaaaaaaaaaa', 'aaaa', 'aaaa', 39.99, 'aaaaa', '2024-08-20', 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `respostas`
--

CREATE TABLE `respostas` (
  `RESPOSTA_ID` int(11) NOT NULL,
  `DATA` date NOT NULL,
  `CONTEUDO_RESPOSTA` text NOT NULL,
  `COMENTARIOS_ANUNCIOS_ID` int(11) NOT NULL,
  `USUARIOS_ID` int(11) NOT NULL,
  `COMENTARIOS_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `NOME` varchar(250) NOT NULL,
  `BAIRRO` varchar(250) NOT NULL,
  `USUARIO_ID` int(11) NOT NULL,
  `ENDERECO` varchar(250) NOT NULL,
  `CIDADE` varchar(250) NOT NULL,
  `CEP` varchar(45) NOT NULL,
  `TELEFONE` decimal(13,0) NOT NULL,
  `UF` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`NOME`, `BAIRRO`, `USUARIO_ID`, `ENDERECO`, `CIDADE`, `CEP`, `TELEFONE`, `UF`) VALUES
('quarta feira', 'fdfdfddf', 4, 'GGDFGFD', 'GFDGFDG', 'DFGFDGFD', 0, 'SP'),
('asdfasdf', 'dfasdf', 15, 'asdfasdfas', 'asdfasdf', 'dfasdfasdf', 0, 'as'),
('Alfredo', 'assas', 16, 'adasassas', 'sasasa', 'asasasas', 0, 'sa'),
('ead', 'sadsadasd', 17, 'sadsadsadddd', 'asdasdasd', 'adasdsad', 0, 'as'),
('', '', 18, '', '', '', 0, ''),
('Duillo feilipe', 'tropical', 19, 'rua professor boulanger, 72', 'presidente prudente', '19100100', 0, 'sp'),
('donizete lma', 'hjhjj', 20, 'hhjhj', 'hhjhjh', 'jhjhhj', 0, 'jh'),
('baba', 'jjjjjjj', 21, 'jjjjjjjjjj', 'jjjjjjjjjjjj', 'jjjjj', 0, 'jj'),
('marcela', 'lllllllllllll', 22, 'llllllllllllllll', 'llll', 'lll', 0, 'll'),
('logando teste', 'l', 23, 'l', 'l', 'l', 0, 'l'),
('Timoteo', 'hhhh', 24, 'hhhh', 'hhhh', 'hh', 0, 'hh'),
('marron', 'mmmmmmmmmm', 25, 'mmmmmmmmmmmmmmmmm', 'mmmmmm', 'mmmmm', 0, 'mm'),
('sdsad', 'asdsd', 26, 'dsadsad', 'sadasd', 'sdsds', 0, 'sd'),
('fernando guedes', 'kkkkk', 27, 'kkkkkkk', 'kkkkk', 'kkkkkk', 0, 'kk'),
('nome', 'bairro', 33, 'endereco', 'cidade', '19200-000', 0, 'uf');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `anuncios`
--
ALTER TABLE `anuncios`
  ADD PRIMARY KEY (`ANUNCIO_ID`),
  ADD KEY `fk_ANUNCIOS_PRODUTOS1_idx` (`PRODUTOS_ID`),
  ADD KEY `fk_ANUNCIOS_USUARIOS1_idx` (`USUARIOS_ID`);

--
-- Índices de tabela `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`COMENTARIO_ID`),
  ADD KEY `fk_COMENTARIOS_USUARIOS1_idx` (`USUARIOS_ID`),
  ADD KEY `fk_COMENTARIOS_ANUNCIOS1_idx` (`ANUNCIOS_ID`);

--
-- Índices de tabela `faleconosco`
--
ALTER TABLE `faleconosco`
  ADD PRIMARY KEY (`FALECONOSCO_ID`);

--
-- Índices de tabela `fotos_produtos`
--
ALTER TABLE `fotos_produtos`
  ADD PRIMARY KEY (`FOTO_ID`),
  ADD KEY `fk_FOTOS_PRODUTOS_PRODUTOS1_idx` (`PRODUTOS_ID`);

--
-- Índices de tabela `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`usuarios_usuario_id`),
  ADD KEY `fk_LOGIN_USUARIOS1_idx` (`usuarios_usuario_id`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`PRODUTO_ID`),
  ADD KEY `fk_PRODUTOS_USUARIOS1_idx` (`USUARIOS_ID`);

--
-- Índices de tabela `respostas`
--
ALTER TABLE `respostas`
  ADD PRIMARY KEY (`RESPOSTA_ID`),
  ADD KEY `fk_RESPOSTAS_USUARIOS1_idx` (`USUARIOS_ID`),
  ADD KEY `fk_RESPOSTAS_COMENTARIOS1_idx` (`COMENTARIOS_ID`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`USUARIO_ID`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `anuncios`
--
ALTER TABLE `anuncios`
  MODIFY `ANUNCIO_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de tabela `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `COMENTARIO_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `faleconosco`
--
ALTER TABLE `faleconosco`
  MODIFY `FALECONOSCO_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `fotos_produtos`
--
ALTER TABLE `fotos_produtos`
  MODIFY `FOTO_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `PRODUTO_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `USUARIO_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `anuncios`
--
ALTER TABLE `anuncios`
  ADD CONSTRAINT `fk_ANUNCIOS_PRODUTOS1` FOREIGN KEY (`PRODUTOS_ID`) REFERENCES `produtos` (`PRODUTO_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ANUNCIOS_USUARIOS1` FOREIGN KEY (`USUARIOS_ID`) REFERENCES `usuarios` (`USUARIO_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `fk_COMENTARIOS_ANUNCIOS1` FOREIGN KEY (`ANUNCIOS_ID`) REFERENCES `anuncios` (`ANUNCIO_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_COMENTARIOS_USUARIOS1` FOREIGN KEY (`USUARIOS_ID`) REFERENCES `usuarios` (`USUARIO_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `fotos_produtos`
--
ALTER TABLE `fotos_produtos`
  ADD CONSTRAINT `fk_FOTOS_PRODUTOS_PRODUTOS1` FOREIGN KEY (`PRODUTOS_ID`) REFERENCES `produtos` (`PRODUTO_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `fk_LOGIN_USUARIOS1` FOREIGN KEY (`usuarios_usuario_id`) REFERENCES `usuarios` (`USUARIO_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `fk_PRODUTOS_USUARIOS1` FOREIGN KEY (`USUARIOS_ID`) REFERENCES `usuarios` (`USUARIO_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `respostas`
--
ALTER TABLE `respostas`
  ADD CONSTRAINT `fk_RESPOSTAS_COMENTARIOS1` FOREIGN KEY (`COMENTARIOS_ID`) REFERENCES `comentarios` (`COMENTARIO_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_RESPOSTAS_USUARIOS1` FOREIGN KEY (`USUARIOS_ID`) REFERENCES `usuarios` (`USUARIO_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
