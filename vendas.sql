-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 10-Nov-2023 às 02:14
-- Versão do servidor: 8.0.31
-- versão do PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `vendas`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `calculo_media`
--

DROP TABLE IF EXISTS `calculo_media`;
CREATE TABLE IF NOT EXISTS `calculo_media` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `media` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `calculo_media`
--

INSERT INTO `calculo_media` (`id`, `media`) VALUES
(1, '2199'),
(2, '2251'),
(3, '2001'),
(4, '2474'),
(5, '2255'),
(6, '2255'),
(7, '2255'),
(8, '2073'),
(9, '1921');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE IF NOT EXISTS `pedidos` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `preço` double NOT NULL DEFAULT '0',
  `pagamento` varchar(255) NOT NULL DEFAULT 'negado',
  `data_ped` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `pedidos`
--

INSERT INTO `pedidos` (`id`, `nome`, `preço`, `pagamento`, `data_ped`) VALUES
(1, 'TV_LG', 3000, 'cartão_de_crédito', '2023-06-22'),
(2, 'Suporte_Celular', 41.49, 'pix', '2023-06-23'),
(3, 'Suporte_Monitor', 360.79, 'cartão_de_crédito', '2023-06-25'),
(4, 'Caixa_som_grande', 1000, 'cartão_de_débito', '2023-06-28'),
(5, 'Controle_basicoLG', 125, 'pix', '2023-06-30'),
(6, 'Controle_videogameX', 120, 'pix', '2023-07-02'),
(7, 'Controle_videogameP', 250, 'cartão_de_débito', '2023-06-05'),
(8, 'VideogameP', 4100.99, 'cartão_de_crédito', '2023-06-10'),
(9, 'VideogameX', 2899.59, 'cartão_de_crédito', '2023-06-13'),
(10, 'Batedeira_prática', 100, 'pix', '2023-06-14'),
(11, 'Batedeira', 1500, 'cartão_de_débito', '2023-07-18'),
(12, 'Fone_JBL', 250, 'cartão_de_crédito', '2023-07-22'),
(13, 'Óculos_VR', 2585.59, 'cartão_de_crédito', '2023-08-01'),
(14, 'Notebook_gamer', 2557.99, 'cartão_de_crédito', '0000-00-00'),
(15, 'fonte_notebook', 256.89, 'cartão_de_crédito', '2023-08-03'),
(16, 'Macbook', 6256.89, 'cartão_de_crédito', '2023-08-07'),
(17, 'Carregador_Xiaomi', 280.89, 'cartão_de_crédito', '2023-08-08'),
(18, 'Suporte_celular_carro', 120.89, 'pix', '2023-08-08'),
(19, 'Suporte_celular_carro', 120.89, 'pix', '2023-08-08'),
(20, 'Tablet', 625, 'pix', '2023-08-09'),
(21, 'Som_automotivo', 250.79, 'cartão_de_crédito', '2023-08-09'),
(22, 'Som_automotivo', 170.5, 'pix', '2023-08-09'),
(23, 'Caixa_de_som', 255.5, 'cartão_de_crédito', '2023-08-09'),
(24, 'Caixa_de_som', 355.5, 'cartão_de_crédito', '2023-08-09'),
(25, 'Fio_de_carregador_celular', 55.5, 'pix', '2023-08-11');

--
-- Acionadores `pedidos`
--
DROP TRIGGER IF EXISTS `before_insert_pedidos`;
DELIMITER $$
CREATE TRIGGER `before_insert_pedidos` BEFORE INSERT ON `pedidos` FOR EACH ROW begin
    if NEW.pagamento = 'cartão_de_crédito' then
        insert into calculo_media (media)
           select avg(preço) from pedidos where pagamento = 'cartão_de_crédito';
    end if;
end
$$
DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
