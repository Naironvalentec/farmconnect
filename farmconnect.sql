-- MySQL dump 10.13  Distrib 26.7.0, for Win64 (x86_64)
--
-- Host: localhost    Database: farmconnect
-- ------------------------------------------------------
-- Server version	26.7.0-commercial

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nome_categoria` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Comprimidos'),(2,'Charopes'),(3,'Vacinas'),(4,'Soros'),(5,'Primeiros socorros');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Carlos Machava','+258 84 111 2233'),(2,'Amélia Cossa','+258 82 444 5566'),(3,'Jorge Sitoe','+258 87 777 8899'),(4,'Marta Nhaca','+258 84 222 3344'),(5,'Pedro Chissano','+258 86 555 6677'),(6,'Lúcia Mondlane','+258 82 888 9900'),(7,'Adilson Tembe','+258 84 333 4455'),(8,'Rosa Mabjaia','+258 87 666 7788');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmacia`
--

DROP TABLE IF EXISTS `farmacia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `farmacia` (
  `id_farmacia` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `contacto` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id_farmacia`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmacia`
--

LOCK TABLES `farmacia` WRITE;
/*!40000 ALTER TABLE `farmacia` DISABLE KEYS */;
INSERT INTO `farmacia` VALUES (1,'Farmacia Central','Farmaciacentral@gmail.org','841234567'),(2,'Farmacia Museu','FarmaciaMuseu@gmail.org','842345678'),(3,'Farmacia Matola','FarmaciaMatola@gmail.org','843456789'),(4,'Farmacia Jardim','FarmaciaJardim@gmail.org','821345678'),(5,'Farmacia Fomento','FarmaciaFomento@gmail.org','871234567');
/*!40000 ALTER TABLE `farmacia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `id_fornecedor` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `contacto` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id_fornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,'Dial Pharma','+258 84 123 4567'),(2,'Medicamentos do Maputo','+258 82 987 6543'),(3,'Pharma Distribuidora Lda','+258 87 555 1122'),(4,'Biofarma Moçambique','+258 84 333 7788'),(5,'SulFarma Supplies','+258 86 444 9900');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_venda`
--

DROP TABLE IF EXISTS `item_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_venda` (
  `id_item` int NOT NULL AUTO_INCREMENT,
  `id_venda` int DEFAULT NULL,
  `id_lote` int DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  `preco_unit` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_item`),
  KEY `id_venda` (`id_venda`),
  KEY `id_lote` (`id_lote`),
  CONSTRAINT `item_venda_ibfk_1` FOREIGN KEY (`id_venda`) REFERENCES `venda` (`id_venda`) ON DELETE CASCADE,
  CONSTRAINT `item_venda_ibfk_2` FOREIGN KEY (`id_lote`) REFERENCES `lote` (`id_lote`),
  CONSTRAINT `item_venda_chk_1` CHECK ((`quantidade` > 0)),
  CONSTRAINT `item_venda_chk_2` CHECK ((`preco_unit` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_venda`
--

LOCK TABLES `item_venda` WRITE;
/*!40000 ALTER TABLE `item_venda` DISABLE KEYS */;
INSERT INTO `item_venda` VALUES (1,1,1,2,5.50),(2,1,2,1,22.00),(3,1,3,1,12.90),(4,2,4,1,35.00),(5,2,3,1,12.90),(6,3,4,1,35.00),(7,3,2,1,22.00),(8,4,5,1,8.00),(9,5,1,3,5.50),(10,5,5,2,8.00),(11,6,2,1,22.00),(12,6,4,1,35.00),(13,7,3,2,12.90),(14,8,1,1,5.50),(15,8,5,1,8.00),(16,9,4,2,35.00),(17,10,2,1,22.00),(18,10,1,1,5.50);
/*!40000 ALTER TABLE `item_venda` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_item_venda_antes` BEFORE INSERT ON `item_venda` FOR EACH ROW BEGIN
 DECLARE v_qtd INT;
 DECLARE v_val DATE;
 SELECT quantidade, validade INTO v_qtd, v_val
 FROM lote WHERE id_lote = NEW.id_lote;
 IF v_val < CURDATE() THEN
 SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Lote com validade expirada';
 END IF;
 IF v_qtd < NEW.quantidade THEN
 SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Stock insuficiente no lote';
 END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_item_venda_depois` AFTER INSERT ON `item_venda` FOR EACH ROW BEGIN
 UPDATE lote
 SET quantidade = quantidade - NEW.quantidade
 WHERE id_lote = NEW.id_lote;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `lote`
--

DROP TABLE IF EXISTS `lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lote` (
  `id_lote` int NOT NULL AUTO_INCREMENT,
  `id_farmacia` int DEFAULT NULL,
  `id_produto` int DEFAULT NULL,
  `id_fornecedor` int DEFAULT NULL,
  `numero_lote` varchar(30) DEFAULT NULL,
  `validade` date DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  `preco_custo` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_lote`),
  UNIQUE KEY `id_farmacia` (`id_farmacia`,`id_produto`,`numero_lote`),
  KEY `id_produto` (`id_produto`),
  KEY `id_fornecedor` (`id_fornecedor`),
  CONSTRAINT `lote_ibfk_1` FOREIGN KEY (`id_farmacia`) REFERENCES `farmacia` (`id_farmacia`),
  CONSTRAINT `lote_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`),
  CONSTRAINT `lote_ibfk_3` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id_fornecedor`),
  CONSTRAINT `lote_chk_1` CHECK ((`quantidade` >= 0)),
  CONSTRAINT `lote_chk_2` CHECK ((`preco_custo` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lote`
--

LOCK TABLES `lote` WRITE;
/*!40000 ALTER TABLE `lote` DISABLE KEYS */;
INSERT INTO `lote` VALUES (1,1,1,1,'DP-2026-001','2028-03-15',200,2.10),(2,1,2,1,'DP-2026-002','2027-11-20',150,2.80),(3,1,4,2,'MM-2026-014','2027-08-10',80,16.50),(4,1,7,2,'MM-2026-015','2028-01-30',120,11.20),(5,1,10,3,'PD-2026-003','2027-06-25',100,5.90),(6,1,14,4,'BF-2026-007','2027-09-15',180,1.70),(7,2,3,1,'DP-2026-003','2028-05-01',160,3.60),(8,2,5,2,'MM-2026-016','2027-04-18',60,21.30),(9,2,8,3,'PD-2026-004','2028-02-10',90,7.80),(10,2,11,3,'PD-2026-005','2027-12-05',75,9.10),(11,2,13,4,'BF-2026-008','2027-07-22',45,24.60),(12,2,15,5,'SF-2026-002','2028-04-12',250,4.10),(13,3,1,1,'DP-2026-004','2028-01-08',175,2.10),(14,3,6,2,'MM-2026-017','2027-10-30',55,18.90),(15,3,9,3,'PD-2026-006','2028-03-28',110,10.40),(16,3,12,4,'BF-2026-009','2027-11-14',95,8.30),(17,3,13,4,'BF-2026-010','2027-08-05',40,24.60),(18,3,14,5,'SF-2026-003','2028-06-20',200,1.70);
/*!40000 ALTER TABLE `lote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `id_produto` int NOT NULL AUTO_INCREMENT,
  `id_categoria` int DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `principio_ativo` varchar(100) DEFAULT NULL,
  `forma` varchar(40) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `stock_minimo` int DEFAULT '10',
  `exige_receita` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_produto`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  CONSTRAINT `produto_chk_1` CHECK ((`preco` >= 0)),
  CONSTRAINT `produto_chk_2` CHECK ((`stock_minimo` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,1,'Dipirona 500mg','Dipirona monoidratada','Comprimido',3.50,50,0),(2,1,'Paracetamol 750mg','Paracetamol','Comprimido',4.20,40,0),(3,1,'Ibuprofeno 400mg','Ibuprofeno','Comprimido',5.80,30,0),(4,2,'Amoxicilina 500mg','Amoxicilina triidrato','Cápsula',25.90,20,1),(5,2,'Azitromicina 500mg','Azitromicina','Comprimido',32.50,15,1),(6,2,'Cefalexina 500mg','Cefalexina','Cápsula',28.70,15,1),(7,3,'Losartana 50mg','Losartana potássica','Comprimido',18.40,25,1),(8,3,'Enalapril 10mg','Enalapril maleato','Comprimido',12.30,25,1),(9,3,'Metformina 850mg','Metformina cloridrato','Comprimido',15.60,30,1),(10,4,'Loratadina 10mg','Loratadina','Comprimido',8.90,20,0),(11,4,'Omeprazol 20mg','Omeprazol','Cápsula',14.20,20,0),(12,4,'Salbutamol 100mcg','Sulfato de salbutamol','Aerosol',38.50,10,0),(13,5,'Vitamina C 1g','Ácido ascórbico','Comprimido efervescente',12.80,35,0),(14,5,'Soro Fisiológico 0,9%','Cloreto de sódio','Solução injetável',2.90,60,0),(15,5,'Furacilina 0,2%','Sulfadiazina de prata','Solução nasal',6.50,25,0);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilizador`
--

DROP TABLE IF EXISTS `utilizador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilizador` (
  `id_utilizador` int NOT NULL AUTO_INCREMENT,
  `id_farmacia` int DEFAULT NULL,
  `nome_utilizador` varchar(100) DEFAULT NULL,
  `email_utilizador` varchar(120) DEFAULT NULL,
  `perfil` enum('Gerente','Balcao') DEFAULT 'Balcao',
  PRIMARY KEY (`id_utilizador`),
  KEY `id_farmacia` (`id_farmacia`),
  CONSTRAINT `utilizador_ibfk_1` FOREIGN KEY (`id_farmacia`) REFERENCES `farmacia` (`id_farmacia`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilizador`
--

LOCK TABLES `utilizador` WRITE;
/*!40000 ALTER TABLE `utilizador` DISABLE KEYS */;
INSERT INTO `utilizador` VALUES (1,1,'Jose Craverinha','Josecraverinha@gmail.org','Gerente'),(2,2,'Noemia De Sousa','NoemiaSousa@gmail.org','Balcao'),(3,3,'Mia Couto','MiaCouto@gmail.org','Balcao'),(4,4,'Malangata Valente','MalangatanaValente@gmail.org','Gerente'),(5,5,'Kiba The seven','Kibatheseven@gmail.org','Balcao');
/*!40000 ALTER TABLE `utilizador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venda` (
  `id_venda` int NOT NULL AUTO_INCREMENT,
  `id_farmacia` int DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  `id_utilizador` int DEFAULT NULL,
  `data_venda` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_venda`),
  KEY `id_farmacia` (`id_farmacia`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_utilizador` (`id_utilizador`),
  CONSTRAINT `venda_ibfk_1` FOREIGN KEY (`id_farmacia`) REFERENCES `farmacia` (`id_farmacia`),
  CONSTRAINT `venda_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `venda_ibfk_3` FOREIGN KEY (`id_utilizador`) REFERENCES `utilizador` (`id_utilizador`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` VALUES (1,1,1,1,'2026-11-15 09:30:00'),(2,1,2,2,'2026-11-15 11:15:00'),(3,2,3,1,'2026-11-15 14:00:00'),(4,1,1,2,'2026-11-15 16:45:00'),(5,2,2,1,'2026-11-15 18:20:00'),(6,1,3,2,'2026-11-14 10:00:00'),(7,2,1,1,'2026-11-14 15:30:00'),(8,1,2,1,'2026-11-14 08:10:00'),(9,2,3,2,'2026-11-13 11:00:00'),(10,1,1,1,'2026-11-13 17:50:00');
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_stock_produto`
--

DROP TABLE IF EXISTS `vw_stock_produto`;
/*!50001 DROP VIEW IF EXISTS `vw_stock_produto`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_stock_produto` AS SELECT 
 1 AS `farmacia`,
 1 AS `produto`,
 1 AS `stock_total`,
 1 AS `stock_minimo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_vendas_clientes`
--

DROP TABLE IF EXISTS `vw_vendas_clientes`;
/*!50001 DROP VIEW IF EXISTS `vw_vendas_clientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_vendas_clientes` AS SELECT 
 1 AS `nome`,
 1 AS `total_vendas`,
 1 AS `total_gasto`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_stock_produto`
--

/*!50001 DROP VIEW IF EXISTS `vw_stock_produto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_stock_produto` AS select `f`.`nome` AS `farmacia`,`p`.`nome` AS `produto`,sum(`l`.`quantidade`) AS `stock_total`,`p`.`stock_minimo` AS `stock_minimo` from ((`lote` `l` join `produto` `p` on((`p`.`id_produto` = `l`.`id_produto`))) join `farmacia` `f` on((`f`.`id_farmacia` = `l`.`id_farmacia`))) where (`l`.`validade` >= curdate()) group by `f`.`id_farmacia`,`f`.`nome`,`p`.`id_produto`,`p`.`nome`,`p`.`stock_minimo` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_vendas_clientes`
--

/*!50001 DROP VIEW IF EXISTS `vw_vendas_clientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_vendas_clientes` AS select `c`.`nome` AS `nome`,count(distinct `v`.`id_venda`) AS `total_vendas`,sum((`i`.`quantidade` * `i`.`preco_unit`)) AS `total_gasto` from ((`cliente` `c` join `venda` `v` on((`v`.`id_cliente` = `c`.`id_cliente`))) join `item_venda` `i` on((`i`.`id_venda` = `v`.`id_venda`))) group by `c`.`id_cliente`,`c`.`nome` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-25  0:54:34
