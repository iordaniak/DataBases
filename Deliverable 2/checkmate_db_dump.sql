DROP SCHEMA checkmate_db;
CREATE SCHEMA checkmate_db;
USE checkmate_db;

-- MySQL dump 10.13  Distrib 8.0.25, for macos11 (x86_64)
--
-- Host: localhost    Database: checkmate_db
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adds_to_favorites_games`
--

DROP TABLE IF EXISTS `adds_to_favorites_games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adds_to_favorites_games` (
  `username` varchar(100) NOT NULL,
  `game_id` bigint NOT NULL,
  PRIMARY KEY (`username`,`game_id`),
  KEY `fk_user_has_game_game2_idx` (`game_id`),
  KEY `fk_user_has_game_user2_idx` (`username`),
  CONSTRAINT `fk_user_has_game_game2` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`),
  CONSTRAINT `fk_user_has_game_user2` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adds_to_favorites_games`
--

LOCK TABLES `adds_to_favorites_games` WRITE;
/*!40000 ALTER TABLE `adds_to_favorites_games` DISABLE KEYS */;
INSERT INTO `adds_to_favorites_games` VALUES ('alexandp',1),('kotsek',1),('userNotFound',1),('bhanu',2),('alexinho',3);
/*!40000 ALTER TABLE `adds_to_favorites_games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adds_to_favorites_players`
--

DROP TABLE IF EXISTS `adds_to_favorites_players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adds_to_favorites_players` (
  `player_id` bigint NOT NULL,
  `username` varchar(100) NOT NULL,
  PRIMARY KEY (`player_id`,`username`),
  KEY `fk_player_has_user_user1_idx` (`username`),
  KEY `fk_player_has_user_player1_idx` (`player_id`),
  CONSTRAINT `fk_player_has_user_player1` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`),
  CONSTRAINT `fk_player_has_user_user1` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adds_to_favorites_players`
--

LOCK TABLES `adds_to_favorites_players` WRITE;
/*!40000 ALTER TABLE `adds_to_favorites_players` DISABLE KEYS */;
INSERT INTO `adds_to_favorites_players` VALUES (1,'alexandp'),(1,'kotsek'),(2,'alexinho'),(6,'kotsek'),(10,'alexandp');
/*!40000 ALTER TABLE `adds_to_favorites_players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine`
--

DROP TABLE IF EXISTS `engine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `engine` (
  `id` bigint NOT NULL,
  `name` varchar(100) NOT NULL,
  `creators` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_engine_player1` FOREIGN KEY (`id`) REFERENCES `player` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine`
--

LOCK TABLES `engine` WRITE;
/*!40000 ALTER TABLE `engine` DISABLE KEYS */;
INSERT INTO `engine` VALUES (6,'Stockfish 17','Marco Costalba, Joona\n Kiiski, Gary Linscott, Tord\nRomstad, Stéphane\n Nicolet, Stefan\n Geschwentner'),(7,'Komodo','Don Dailey, Mark Lefler'),(8,'Leela Chess Zero','Gary Linscott, Gian-Carlo Pascutto, Alexander Lyashuk, Folkert Huizinga'),(9,'Rybka','Vasik Rajlich'),(10,'Fritz','\nFrans Morsch, Matthias Wüllenweber, Mathias Feist, Gyula Horváth, Vasik Rajlich, Frank Schneider');
/*!40000 ALTER TABLE `engine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `engine_games_today`
--

DROP TABLE IF EXISTS `engine_games_today`;
/*!50001 DROP VIEW IF EXISTS `engine_games_today`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `engine_games_today` AS SELECT 
 1 AS `white`,
 1 AS `black`,
 1 AS `moves`,
 1 AS `result`,
 1 AS `type`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game` (
  `id` bigint NOT NULL,
  `date` date DEFAULT NULL,
  `moves` varchar(1000) DEFAULT NULL,
  `result` enum('Black','White','Draw') DEFAULT NULL,
  `type` enum('Bullet','Blitz','Rapid','Classical') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES (1,'2020-12-25','1.Nf3Nf62.c4e63.Nc3b64.g3Bb75.Bg2Be76.O-OO-O7.Re1Ne48.Nxe4Bxe49.d3Bb710.e4c511.d4cxd412.Nxd4Nc613.Bf4Nxd414.Qxd4Bc515.Qd2Qe716.a3e517.Be3a518.Rad1Bc619.Bh3Ra720.Bg5f621.Be3a422.Bf1Qe623.Qd3Rc824.h4Rac725.Kh2Qe726.Rd2Bxe327.Qxe3Qc528.Qf3Rf829.Qg4Rcc830.h5Rce831.Re3Re632.Qd1Re733.Bh3Rff734.Bf5Qxc435.Rc3Qb536.Kg2Rf837.Qg4Kh838.Rcd3Qc439.Rd6Bb540.Bxd7Qf1+41.Kh2Bxd742.Rxd7Rxd743.Qxd7h644.Qe7Rg845.Qd6Qe146.Qb4b547.Kg2Kh748.Rd5Qe249.Rd7Rc850.Rxg7+Kxg751.Qe7+Kg852.Qe6+Kg753.Qd7+Kf854.Qxc8+Ke755.Qf5Qxb256.Qh7+Ke657.Qxh6b458.Qg6bxa359.h6a260.h7a1=Q61.Qf5+Kd662.h8=QKc563.Qf8+Kc464.Qe6+Kd365.Qfxf6Qd466.Qf3+Kd267.Qh6+Kc268.Qc6+Kb169.g4Qab270.g5a371.g6a272.g7a1=Q73.g8=QQaa374.Qgg3Qxf3+75.Qxf3Qc276.Qb5+Qcb277.Qfd3+Qxd378.Qxd3+Kc179.Kf3Qd480.Qe2Qd681.Qc4+Kd282.Qd5+','Black','Blitz'),(2,'2021-02-05','1.e4c52.Nf3d63.d4cxd44.Nxd4Nf65.Nc3Nc66.Be2g67.Nb3Bg78.O-OO-O9.Bg5a610.Re1b511.Bf1h612.Bh4g513.Bg3b414.Nd5Nxd515.exd5Ne516.a3bxa317.Rxa3f518.f3f419.Bf2g420.Nd4gxf321.Nxf3Nxf3+22.Qxf3Bxb223.Ra4Bg724.Rxf4Rxf425.Qxf4Qf826.Qh4Bf527.c4a528.c5a429.Bc4a330.Ba2Rb831.cxd6exd632.Qa4Ra833.Qb4Qf634.g4Bg635.h4Rf836.Qd2Qf337.Qe2Qxe238.Rxe2Rb839.Re3Ra840.Kg2Bf741.Rd3Bg642.Re3Bf743.Rd3Ra444.Kf3Be845.Rb3Bd746.Rb8+Kf747.Rb7Ke848.g5hxg549.hxg5Bg4+50.Kg2Be551.Rb3Bf552.Kf1Kf753.Be3Kg654.Bc1Rh455.Bxa3Rh1+56.Ke2Rh2+57.Ke3Rxa258.Bxd6Bb259.Be7Bc1+60.Kd4Rd2+61.Kc5Rc2+62.Kb6Bf463.Bc5Bxg564.d6Bd765.Be3Bd8+66.Kb7Kf567.Bb6Bf668.Rf3+Ke669.Rf2Rc470.Rf1Be571.Re1Kxd672.Rd1+Ke673.Re1Bc6+74.Ka6Ra4+75.Ba5Kd676.Rc1Ra277.Rd1+Kc578.Rc1+Kd579.Rd1+Bd480.Rc1Rb281.Bc3Ra2+82.Ba5Bc583.Rd1+Ke684.Rc1Kd685.Rd1+Bd586.Rd2Kc6','White','Rapid'),(3,'2021-05-01','1.c4c62.Nf3d53.e3Nf64.b3g65.Bb2Bg76.Be2O-O7.O-ORe88.d3Nbd79.Qc2e510.cxd5Nxd511.a3Nf812.Nc3Nxc313.Bxc3Bf514.Rfd1Qc715.Qb2Rad816.h3Bc817.b4Nd718.a4Nb619.e4Nd720.Bf1c521.a5b622.axb6axb623.Nd2Bb724.bxc5Nxc525.Nc4Re626.Ne3Ra827.Nd5Bxd528.exd5Ree829.Qb5Nb730.Rac1Nd631.Qb3Qb732.d4exd433.Bxd4Bxd434.Rxd4Rac835.Rxc8Rxc836.Rb4b537.g3Rc138.Kg2Rc539.Rd4Qc740.Be2Rc341.Qb4Qc542.Qxc5Rxc543.Kf3Kf844.Bd3Ke745.Ke3h546.g4hxg447.hxg4Kd748.f3Ke749.Be2Kd750.Bd3Kc751.Kf4Nc452.Ke4Kd653.Be2Nb654.f4Nxd555.Bd3Kc656.g5Nc3+57.Ke3Nd5+58.Kd2Nb659.Ke2Kc760.Be4Nc861.Bd5Nd662.Kd2Kb663.Bb3Kc664.Ba2Rf565.Bb3Nb766.Bc2Rc567.Be4+Kc768.Bd5Nd669.Bb3Kc670.Ba2Rf571.Bb3Kc572.Ke3Nc4+73.Kd3Na574.Bd1Nc675.Re4Nb4+76.Ke3Nd5+77.Kf3Nc378.Re1Nxd179.Rxd1b480.Ke4b381.Rd7Kb482.Kd3Rxf483.Rb7+Ka384.Kc3Rf3+85.Kc4Ka286.Ra7+Kb187.Rb7Kc288.Kd4b289.Rc7+Kb190.Ra7Kc291.Rc7+Kb392.Rb7+Ka293.Ra7+Ra394.Rxf7b1=Q95.Rf2+Ka1','Draw','Bullet'),(4,'2021-12-09','1.e4e52.Nf3Nc63.Bc4Nf64.Ng5Bc55.Bxf7+Ke76.Bb3Rf87.O-Od68.Nc3Qe89.Nd5+Kd810.Nxf6gxf611.Nxh7Rh812.Nxf6Qg613.Nd5Bg414.Qe1Bf315.g3Qxg3+','White','Bullet'),(5,'2021-12-09','1.d4Nf62.Nf3c53.c3b64.dxc5bxc55.e4Bb76.e5Nd57.Bb5e68.O-OBe79.Nbd2O-O10.Ne4f511.exf6Nxf612.Neg5Qc713.g3h614.Nh3Nd515.Ne1c416.Qg4Nb617.Bxh6Rf718.Be3Qe519.a4Qd520.f3Bc521.Ng2a622.a5axb523.axb6Rxf324.Rxa8Rxf1+25.Kxf1Qxg2+26.Ke1Bxa827.Bxc5Bf3','White','Classical'),(6,'2021-05-07','1.e4e52.f4d53.exd5e44.Nc3Nf65.Bc4c66.d3Bb47.dxe4Nxe48.Bd2Bxc39.Bxc3O-O10.Qh5Re811.O-O-ONxc312.bxc3Qa513.Kb2g614.Qh6Bg415.Nf3Bxf316.gxf3b517.f5bxc418.f6','Black','Bullet'),(7,'2021-03-08','1.d4d52.c4e63.Nc3c64.e4dxe45.Nxe4Bb4+6.Bd2Qxd47.Bxb4Qxe4+8.Ne2Na69.Bf8Ne710.Bxg7Rg811.Qd4Qxd412.Bxd4c513.Bf6Rg614.Bc3Nb415.Nf4Rg516.h4Rf517.Nd3Nc2+18.Kd2Nxa119.g4Rf320.Be2Rxd3+21.Bxd3e522.f3f523.g5e424.Bf6b525.fxe4Bb726.Rxa1fxe427.Bc2Rd8+28.Ke2Rd429.Rf1bxc430.Ba4+Kd831.h5c332.Bxd4Ba6+33.Ke1Bxf134.Bxc3Bd335.g6e336.Bb5Bb137.Bf6hxg638.h6g539.Ke2','Black','Rapid'),(8,'2020-10-03','1.d4d52.c4e63.Nc3c64.e4dxe45.Nxe4Bb4+6.Bd2Qxd47.Bxb4Qxe4+8.Ne2Na69.Bf8Ne710.Bxg7Rg811.Qd4Qxd412.Bxd4c513.Bf6Rg614.Bc3Nb415.Nf4Rg516.h4Rf517.Nd3Nc2+18.Kd2Nxa119.g4Rf320.Be2Rxd3+21.Bxd3e522.f3f523.g5e424.Bf6b525.fxe4Bb726.Rxa1fxe427.Bc2Rd8+28.Ke2Rd429.Rf1bxc430.Ba4+Kd831.h5c332.Bxd4Ba6+33.Ke1Bxf134.Bxc3Bd335.g6e336.Bb5Bb137.Bf6hxg638.h6g539.Ke2','White','Rapid'),(9,'2018-05-21','1.e4Nc62.Nc3e63.d4Bb44.Ne2d55.e5h56.Nf4g67.Be3Bxc3+8.bxc3Na59.Bd3Ne710.Nh3c511.Bg5c412.Be2Nac613.Bf6Rg814.O-OQa515.Qd2Nf516.Rfd1Kd717.Ng5Rf818.h3Kc719.g4hxg420.hxg4Nfe721.Kg2Ng822.Bg7Re823.Rh1Bd724.Rh3Nd825.Rf3Rc826.Rh1Qxa227.Rh7Kb828.Nxf7Nxf729.Rxf7Bc630.Bf6a531.Rh1Qb232.Bg5Rf833.Rfh7Rc734.Rxc7Kxc735.Qc1Qxc336.Qa1Qxa137.Rxa1Ra838.Bd2b639.Kg3Ne740.Bd1Bd741.Bb4Nc642.Bd6+Kb743.c3b544.Rb1b445.Ba4b346.Bxc6+Kxc647.g5Ra748.Rb2Rb749.Kf4Bc850.Kg3Rb451.cxb4a452.b5+Kxb553.Ba3c354.Rb1Kc455.f4Kxd456.Kf2Kc457.Ke1d458.Ke2Kd559.Kf3Bb760.Re1Kc4+61.Kf2b262.f5exf563.e6Bc6','Draw','Classical'),(10,'2019-06-21','1.d4Nf62.c4g63.Nc3Bg74.e4d65.Be2O-O6.Bg5c57.d5e68.Qd2exd59.exd5Qb610.Nf3Bf511.Nh4Ne412.Nxe4Bxe413.O-O-ONa614.f3Nb415.fxe4Nxa2+16.Kb1Nc3+17.Kc1Nxe418.Qc2Nxg519.Nf3Nxf320.Bxf3a521.Rd3a422.Re1Qb423.Re7Rfe824.Rxe8+Rxe825.Kb1b526.Ra3Re1+27.Ka2Qxa3+','White','Blitz');
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participates`
--

DROP TABLE IF EXISTS `participates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participates` (
  `player_id` bigint NOT NULL,
  `tournament_id` bigint NOT NULL,
  `points` float DEFAULT NULL,
  PRIMARY KEY (`player_id`,`tournament_id`),
  KEY `fk_player_has_tournament_tournament1_idx` (`tournament_id`),
  KEY `fk_player_has_tournament_player1_idx` (`player_id`),
  CONSTRAINT `fk_player_has_tournament_player1` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`),
  CONSTRAINT `fk_player_has_tournament_tournament1` FOREIGN KEY (`tournament_id`) REFERENCES `tournament` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participates`
--

LOCK TABLES `participates` WRITE;
/*!40000 ALTER TABLE `participates` DISABLE KEYS */;
INSERT INTO `participates` VALUES (1,1,9),(1,3,8.5),(1,6,12),(2,2,7),(2,6,7.5),(3,4,12),(5,5,7),(11,6,9);
/*!40000 ALTER TABLE `participates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `id` bigint NOT NULL,
  `rating_fide` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (1,2855),(2,2736),(3,2492),(4,2812),(5,2774),(6,3472),(7,3298),(8,3731),(9,3605),(10,3669),(11,2799);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professional`
--

DROP TABLE IF EXISTS `professional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professional` (
  `id` bigint NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `nationality` varchar(100) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_professional_player1` FOREIGN KEY (`id`) REFERENCES `player` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professional`
--

LOCK TABLES `professional` WRITE;
/*!40000 ALTER TABLE `professional` DISABLE KEYS */;
INSERT INTO `professional` VALUES (1,'Magnus','Carlsen','Norway','1990-11-30'),(2,'Hikaru','Nakamura','USA','1987-12-09'),(3,'Vasilis','Kotronias','Greece','1964-08-25'),(4,'Garry','Kasparov','Russia','1963-04-13'),(5,'Bobby','Fisher','USA','1943-03-09'),(11,'Ding','Liren','China','1992-10-24');
/*!40000 ALTER TABLE `professional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professional_game`
--

DROP TABLE IF EXISTS `professional_game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professional_game` (
  `id` bigint NOT NULL,
  `day_number` int DEFAULT NULL,
  `tournament_id` bigint DEFAULT NULL,
  `player1_id` bigint NOT NULL,
  `player2_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_professional_game_tournament1_idx` (`tournament_id`),
  KEY `fk_professional_game_player1_idx` (`player1_id`),
  KEY `fk_professional_game_player2_idx` (`player2_id`),
  CONSTRAINT `fk_professional game_game` FOREIGN KEY (`id`) REFERENCES `game` (`id`),
  CONSTRAINT `fk_professional_game_player1` FOREIGN KEY (`player1_id`) REFERENCES `player` (`id`),
  CONSTRAINT `fk_professional_game_player2` FOREIGN KEY (`player2_id`) REFERENCES `player` (`id`),
  CONSTRAINT `fk_professional_game_tournament1` FOREIGN KEY (`tournament_id`) REFERENCES `tournament` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professional_game`
--

LOCK TABLES `professional_game` WRITE;
/*!40000 ALTER TABLE `professional_game` DISABLE KEYS */;
INSERT INTO `professional_game` VALUES (1,1,1,1,2),(2,3,4,2,3),(3,1,2,3,4),(4,NULL,NULL,6,8),(5,2,5,5,1);
/*!40000 ALTER TABLE `professional_game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `professional_games_today`
--

DROP TABLE IF EXISTS `professional_games_today`;
/*!50001 DROP VIEW IF EXISTS `professional_games_today`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `professional_games_today` AS SELECT 
 1 AS `white`,
 1 AS `black`,
 1 AS `moves`,
 1 AS `result`,
 1 AS `type`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `rates`
--

DROP TABLE IF EXISTS `rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rates` (
  `username` varchar(100) NOT NULL,
  `game_id` bigint NOT NULL,
  `rating` enum('1','2','3','4','5','6','7','8','9','10') DEFAULT NULL,
  PRIMARY KEY (`username`,`game_id`),
  KEY `fk_user_has_Game_Game1_idx` (`game_id`),
  KEY `fk_user_has_Game_user1_idx` (`username`),
  CONSTRAINT `fk_user_has_game_game1` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`),
  CONSTRAINT `fk_user_has_game_user1` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rates`
--

LOCK TABLES `rates` WRITE;
/*!40000 ALTER TABLE `rates` DISABLE KEYS */;
INSERT INTO `rates` VALUES ('alexandp',1,'9'),('alexandp',2,'10'),('alexinho',4,'8'),('bhanu',4,'7'),('kotsek',1,'7');
/*!40000 ALTER TABLE `rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!50001 DROP VIEW IF EXISTS `ratings`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ratings` AS SELECT 
 1 AS `find_white(g.id)`,
 1 AS `find_black(g.id)`,
 1 AS `moves`,
 1 AS `result`,
 1 AS `type`,
 1 AS `avg(r.rating)`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tournament`
--

DROP TABLE IF EXISTS `tournament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tournament` (
  `id` bigint NOT NULL,
  `name` varchar(100) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `prize` int DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tournament`
--

LOCK TABLES `tournament` WRITE;
/*!40000 ALTER TABLE `tournament` DISABLE KEYS */;
INSERT INTO `tournament` VALUES (1,'Meltwater Champions Chess Tour 2021','2020-02-27','2020-03-02',150000,'Oslo','Norway'),(2,'44th International Tournament Ikaros','2021-07-10','2021-07-18',3000,'Ikaria','Greece'),(3,'Expo Dubai 2020','2020-05-19','2020-05-23',1000000,'Dubai','UAE'),(4,'30th Open International Tournament Kavala 2021','2021-08-01','2021-08-08',6000,'Kavala','Greece'),(5,'World Rapid and Blitz Championships 2021','2021-12-25','2021-12-31',200000,'Nur-Sultan','Kazakhstan'),(6,'Athens Open 2020','2020-05-06','2020-05-10',10000,'Athens','Greece');
/*!40000 ALTER TABLE `tournament` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `tournament_now`
--

DROP TABLE IF EXISTS `tournament_now`;
/*!50001 DROP VIEW IF EXISTS `tournament_now`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `tournament_now` AS SELECT 
 1 AS `name`,
 1 AS `city`,
 1 AS `country`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `username` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('alexandp','alexandros@gmail.com','132456789a@'),('alexinho','ale3is@outlook.com','125477!'),('bhanu','bhanana@gmail.com','toystory789'),('kotsek','kotsek@gmail.com','aek3489'),('userNotFound','kokomploko@yahoo.gr','www.ert99.gr');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_game`
--

DROP TABLE IF EXISTS `user_game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_game` (
  `id` bigint NOT NULL,
  `white` varchar(100) DEFAULT NULL,
  `black` varchar(100) DEFAULT NULL,
  `added_by` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_game_user1_idx` (`added_by`),
  CONSTRAINT `fk_user_game_game1` FOREIGN KEY (`id`) REFERENCES `game` (`id`),
  CONSTRAINT `fk_user_game_user1` FOREIGN KEY (`added_by`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_game`
--

LOCK TABLES `user_game` WRITE;
/*!40000 ALTER TABLE `user_game` DISABLE KEYS */;
INSERT INTO `user_game` VALUES (6,'kotsek','alexinho','kotsek'),(7,'userNotFound','bhanu','userNotFound'),(8,'alexinho','alexandp','alexinho'),(9,'boii','boii','alexandp'),(10,'alexandp','bhanu','alexandp');
/*!40000 ALTER TABLE `user_game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'checkmate_db'
--

--
-- Dumping routines for database 'checkmate_db'
--
/*!50003 DROP FUNCTION IF EXISTS `find_black` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `find_black`(game_id bigint) RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
begin 
	declare black varchar(100);
    
    select concat(pr.first_name, ' ', pr.last_name) into black 
		from professional_game pg 
        left join professional pr on pr.id = pg.player2_id
        where pg.id = game_id;
	
    if black is not null then
		return black;
	end if;
    
    select e.name into black 
		from professional_game pg 
        left join engine e on e.id = pg.player2_id
        where pg.id = game_id;
	
    if black is not null then
		return black;
	end if;
    
    select ug.black into black 
		from user_game ug 
        where ug.id = game_id;
	
    return black;
    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `find_white` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `find_white`(game_id bigint) RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
begin 
	declare white varchar(100);
    
    select concat(pr.first_name, ' ', pr.last_name) into white 
		from professional_game pg 
        left join professional pr on pr.id = pg.player1_id
        where pg.id = game_id;
	
    if white is not null then
		return white;
	end if;
    
    select e.name into white 
		from professional_game pg 
        left join engine e on e.id = pg.player1_id
        where pg.id = game_id;
	
    if white is not null then
		return white;
	end if;
    
    select ug.white into white 
		from user_game ug 
        where ug.id = game_id;
	
    return white;
    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `engine_games_today`
--

/*!50001 DROP VIEW IF EXISTS `engine_games_today`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `engine_games_today` AS select `p1`.`name` AS `white`,`p2`.`name` AS `black`,`g`.`moves` AS `moves`,`g`.`result` AS `result`,`g`.`type` AS `type` from (((`game` `g` left join `professional_game` `pg` on((`pg`.`id` = `g`.`id`))) left join `engine` `p1` on((`pg`.`player1_id` = `p1`.`id`))) left join `engine` `p2` on((`pg`.`player2_id` = `p2`.`id`))) where ((`g`.`date` = '2021-12-09') and (`p1`.`id` is not null) and (`p2`.`id` is not null)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `professional_games_today`
--

/*!50001 DROP VIEW IF EXISTS `professional_games_today`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `professional_games_today` AS select concat(`p1`.`first_name`,' ',`p1`.`last_name`) AS `white`,concat(`p2`.`first_name`,' ',`p2`.`last_name`) AS `black`,`g`.`moves` AS `moves`,`g`.`result` AS `result`,`g`.`type` AS `type` from (((`game` `g` left join `professional_game` `pg` on((`pg`.`id` = `g`.`id`))) left join `professional` `p1` on((`pg`.`player1_id` = `p1`.`id`))) left join `professional` `p2` on((`pg`.`player2_id` = `p2`.`id`))) where ((`g`.`date` = '2021-12-09') and (`p1`.`id` is not null) and (`p2`.`id` is not null)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ratings`
--

/*!50001 DROP VIEW IF EXISTS `ratings`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ratings` AS select `find_white`(`g`.`id`) AS `find_white(g.id)`,`find_black`(`g`.`id`) AS `find_black(g.id)`,`g`.`moves` AS `moves`,`g`.`result` AS `result`,`g`.`type` AS `type`,avg(`r`.`rating`) AS `avg(r.rating)` from (`rates` `r` left join `game` `g` on((`g`.`id` = `r`.`game_id`))) group by `r`.`game_id` order by avg(`r`.`rating`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tournament_now`
--

/*!50001 DROP VIEW IF EXISTS `tournament_now`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tournament_now` AS select `t`.`name` AS `name`,`t`.`city` AS `city`,`t`.`country` AS `country` from `tournament` `t` where (`t`.`end_date` > '2021-12-01') */;
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

-- Dump completed on 2021-12-19 17:59:06
