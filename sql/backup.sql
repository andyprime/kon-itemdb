-- MySQL dump 10.13  Distrib 5.1.63, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: items_dev
-- ------------------------------------------------------
-- Server version	5.1.63-0ubuntu0.10.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_number` int(11) NOT NULL DEFAULT '0',
  `type` enum('m','t','o','p','r') NOT NULL DEFAULT 'm',
  `description` text NOT NULL,
  `notes` text NOT NULL,
  `value` int(11) NOT NULL DEFAULT '0',
  `date_added` date NOT NULL DEFAULT '0000-00-00',
  `added_by` varchar(64) NOT NULL DEFAULT '',
  `visible` enum('y','n') NOT NULL DEFAULT 'y',
  `include_in_lists` enum('y','n') NOT NULL DEFAULT 'y',
  PRIMARY KEY (`item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=364 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,1,'m','Gold Ring w/ Yellow Stone (+1 Power and +1 Prod)','Blah de blah blah',0,'2008-10-09','Dan','y','y'),(2,2,'m','Gold Pin with Pearl (+1 Armor not to exceed 5)vvv','',0,'2009-03-28','Dan','y','n'),(3,5,'m','Dissipate Box','',0,'2006-06-02','DAH','y','y'),(4,7,'t','Pearl necklace','',5,'2011-05-29','','y',''),(5,8,'t','Ring w/ Green Rock','',2,'0000-00-00','','y','y'),(6,9,'t','Gold Ring, Leaf Pattern','',2,'0000-00-00','','y','y'),(7,10,'t','Small Gold Ring w/ Red Stone','',30,'0000-00-00','','y','y'),(8,11,'t','Wide Gold Ring','',3,'0000-00-00','','y','y'),(9,12,'m','Silver Non-Martial Axe','',0,'2004-10-01','DAH','y','y'),(10,13,'m','Magic Dagger (Dissipate 1/gd)','',0,'2004-09-04','JR','y','y'),(11,14,'t','Silver Ring w/ Metal Flower','',4,'0000-00-00','','y','y'),(12,15,'t','Bone Necklace','',10,'0000-00-00','','y','y'),(13,16,'t','Stone Ring Pendant on Leather Cord','',2,'0000-00-00','','y','y'),(14,17,'t','Ring w/ Yellow Rock','',20,'2004-10-01','DAH','y','y'),(15,18,'t','Gold Ring shaped like Sticks','',4,'2004-10-01','DAH','y','y'),(16,19,'t','Ring w/ 4 Diamonds','',25,'2004-10-01','DAH','y','y'),(17,20,'t','Green Gems (7 in total)','',3,'2004-10-01','DAH','y','y'),(18,21,'t','Silver Brooch w/ Black Stone','',4,'2004-10-01','DAH','y','y'),(19,22,'t','Gold XX Necklace','',25,'2004-10-01','DAH','y','y'),(20,23,'m','Bear Claw Necklace (Battle Mastery 1/gd, +1 extra smite if ordained to grak)','Introduced as a treasure item in Oct \'04.  Time added reflects update received in June \'08.',0,'2008-06-06','Rick','y','y'),(21,24,'m','Magic Non-Martial Elemental Fire Sword','',0,'2005-02-08','Rk','y','y'),(22,25,'m','Goblin-Iron Mace ','',0,'2004-11-04','DAH','y','y'),(23,26,'m','Bracers of Armor (+2 Armor, full body, resets at game day)','',0,'2005-02-08','DAH','y','y'),(24,27,'m','Undetectable Pouch (Contents need not be revealed in a search)','',0,'2005-02-08','DAH','y','y'),(25,28,'p','Big Red Flower (3 production points for Alchemy)','',0,'2005-06-03','DAH','y','y'),(26,29,'p','Yellow Lemons (5 production points for Alchemy)','',0,'2005-06-03','DAH','y','y'),(27,30,'p','Small Berries (1 production point for Alchemy)','',0,'2005-06-03','DAH','y','y'),(28,31,'t','Butterfly Pendant','',20,'0000-00-00','','y','y'),(29,31,'p','Blue Flowers (1 production point for Alchemy)','',0,'2005-06-03','DAH','y','y'),(30,32,'p','Maroon Fern (1 production point for Alchemy)','',0,'2005-06-03','DAH','y','y'),(31,33,'p','Orange Flower (1 production point for Alchemy)','Should be 10 in game',0,'2008-10-02','DAH','y','y'),(32,34,'m','Undetectable Pouch (Contents need not be revealed in a search)','',0,'2005-06-03','DAH','y','y'),(33,35,'m','Magic Scabbard (1/GD cast Elemental Weapon on drawn weapon)','',0,'2005-06-03','DAH','y','y'),(34,36,'t','Silver Chain','',10,'2005-06-03','DAH','y','y'),(35,37,'m','Bead and Antler Tip Necklace (+3 power points cursed by Thrasymachus)','',0,'2005-06-03','DAH','y','y'),(36,38,'r','Green Ritual Bottle','',0,'2005-06-03','JTK','y','y'),(37,39,'m','Non-Martial Elven Steel Sword','',0,'2005-09-02','FCM','y','y'),(38,40,'m','Amulet (Spirit Shield 1/GD, wearer only)','',0,'2005-09-03','JTK','y','y'),(39,41,'m','Elven Steel Dagger','',0,'2005-09-03','JR','y','y'),(40,42,'m','Adimo\'s Mirror of Sophestry','',0,'2005-10-07','FCM','y','y'),(41,43,'m','Horn of Armor (1/GD, w/ weapons sheathed, 10ft group Magic Armor)','',0,'2005-10-07','FCM','y','y'),(42,44,'m','Jingle Ball Necklace (Curse 1/GD)','',0,'2005-10-07','DAH','y','y'),(43,45,'m','Purple Earrings (when both are worn, +1 power point)','',0,'2005-10-07','DAH','y','y'),(44,46,'t','Gold Stick Ring','',5,'2005-10-07','DAH','y','y'),(45,47,'t','Pendant Gury','',5,'2005-10-07','DAH','y','y'),(46,48,'t','Emerald Pendant','',10,'2005-10-07','DAH','y','y'),(47,49,'m','Goblin-Iron Mortar and Pestle','',0,'2005-10-08','FCM','y','y'),(48,50,'r','Ogre Horn (Ritual component)','',0,'2005-09-02','DAH','y','y'),(49,51,'m','Cat Pin of martial prowess (strength or toughness 1/GD)','',0,'2005-10-08','RS','y','y'),(50,52,'m','Mask of mystical knowledge (Identify Magic or Estimate Value 1/GD)','',0,'2005-10-08','RS','y','y'),(51,53,'t','Painted Gold Bead Necklace','',3,'0000-00-00','','y','y'),(52,54,'t','Small Pearl Necklace w/ Pearl Pendant','',14,'0000-00-00','','y','y'),(53,55,'t','Thick Gold Chain Necklace','',25,'0000-00-00','','y','y'),(54,56,'t','Thin Gold Chain Necklace','',2,'0000-00-00','','y','y'),(55,57,'m','Large Gold and Jade neclace','',0,'0000-00-00','','y','y'),(56,58,'m','Gold Necklace w/ 8 Colored Gems','',0,'0000-00-00','','y','y'),(57,59,'t','Silver Choker','',15,'0000-00-00','','y','y'),(58,60,'t','Flat Gold Necklace','',3,'0000-00-00','','y','y'),(59,61,'t','Flat Gold Bracelet','',2,'0000-00-00','','y','y'),(60,62,'t','Gold Arm Wrap','',8,'0000-00-00','','y','y'),(61,63,'m','Undetectable Pouch (Contents need not be revealed in a search)','',0,'0000-00-00','','y','y'),(62,64,'m','Undetectable Pouch (Contents need not be revealed in a search)','',0,'0000-00-00','','y','y'),(63,65,'m','Undetectable Pouch (Contents need not be revealed in a search)','',0,'0000-00-00','','y','y'),(64,66,'t','Pearl Starburst Pin','',15,'0000-00-00','','y','y'),(65,67,'t','Gold Braid Edged Earrings','',10,'0000-00-00','','y','y'),(66,68,'t','Ring w/ 9 Diamonds','',5,'0000-00-00','','y','y'),(67,69,'t','Ring w/ 9 Diamonds','',30,'0000-00-00','','y','y'),(68,70,'t','Thin Gold Chain Necklace','',3,'0000-00-00','','y','y'),(69,71,'t','Silver Ring w/ 2 Green Heart Gems','',8,'0000-00-00','','y','y'),(70,72,'t','Gold Ring w/ Rubies and Emeralds','',3,'0000-00-00','','y','y'),(71,73,'t','Gold Elf-Style Ring','',5,'0000-00-00','','y','y'),(72,74,'t','Blue Uncut Gem','',1,'0000-00-00','','y','y'),(73,75,'t','Blue Uncut Gem','',1,'0000-00-00','','y','y'),(74,76,'t','Blue Uncut Gem','',1,'0000-00-00','','y','y'),(75,77,'t','Blue Uncut Gem','',1,'0000-00-00','','y','y'),(76,78,'t','Blue Uncut Gem','',1,'0000-00-00','','y','y'),(77,79,'t','Blue Uncut Gem','',1,'0000-00-00','','y','y'),(78,80,'t','Blue Uncut Gem','',1,'0000-00-00','','y','y'),(79,81,'t','Blue Uncut Gem','',1,'0000-00-00','','y','y'),(80,82,'t','Blue Uncut Gem','',1,'0000-00-00','','y','y'),(81,83,'t','Blue Uncut Gem','',1,'0000-00-00','','y','y'),(82,84,'t','Green Uncut Gem','',1,'0000-00-00','','y','y'),(83,85,'t','Green Uncut Gem','',1,'0000-00-00','','y','y'),(84,86,'t','Green Uncut Gem','',1,'0000-00-00','','y','y'),(85,87,'t','Green Uncut Gem','',1,'0000-00-00','','y','y'),(86,88,'t','Green Uncut Gem','',1,'0000-00-00','','y','y'),(87,89,'t','Green Uncut Gem','',1,'0000-00-00','','y','y'),(88,90,'t','Green Uncut Gem','',1,'0000-00-00','','y','y'),(89,91,'t','Amethyst Gem','',2,'0000-00-00','','y','y'),(90,92,'t','Amethyst Gem','',2,'0000-00-00','','y','y'),(91,93,'t','Amethyst Gem','',2,'0000-00-00','','y','y'),(92,94,'t','Masterwork Earthkin Hammer','',150,'0000-00-00','','y','y'),(93,95,'m','Chessboard of Doom (see Dave)','',0,'2005-11-04','DAH','y','y'),(94,96,'m','Adimo\'s Hermetic Rod','',0,'2005-11-04','DAH','y','y'),(95,97,'m','Dragon Cover Aegis Tome w/ Die for randomized page removal','',0,'2005-11-05','JR','y','y'),(96,98,'m','Elemental Sphere (casts all Nature spells 1/gd using players power)','',0,'2005-11-05','SM','y','y'),(97,99,'m','Sword (Magic Damage and 1/GD Mind Blank)','',0,'0000-00-00','','y','y'),(98,100,'m','Sword (Magic Damage and 1/GD Enchant Weapon)','',0,'0000-00-00','','y','y'),(99,101,'m','Malikai\'s Mirror of Sophestry','',0,'2005-11-05','JTK','y','y'),(100,102,'m','Silver Non-Martial Sword','',0,'2006-02-25','JR','y','y'),(101,103,'m','Elven Steel Non-Martial Sword','',0,'2006-02-25','Dan','y','y'),(102,104,'m','30\" sword (mend armor, enhance armor 1/gd)','',0,'2008-06-05','DEM','y','y'),(103,105,'r','Winter\'s Bite (4x) Ritual Component','',0,'0000-00-00','','y','y'),(104,106,'t','Rose Quartz on Silver Chain','',10,'2006-04-08','TB','y','y'),(105,107,'p','Paper for producing scrolls(2 production points)','',0,'2006-02-25','JR','y','y'),(106,108,'m','Wooden Vase (casts Panacea 1/gd, when drank from)','',0,'2006-04-07','Dan','y','y'),(107,109,'p','Silver Bracelet (provides +2 Production Points)','',0,'2006-04-07','Dan','y','y'),(108,110,'m','Elven Steel Arrow','',0,'2005-02-25','DAH','y','y'),(109,111,'m','Turtle Shell Necklace (grants 2 Armor to user, must be wearing no armor)','',0,'0000-00-00','FCM','y','y'),(110,112,'m','Jar of Potion Summoning (Any Potion 1 per event)','',0,'2006-06-03','DEM','y','y'),(111,113,'r','Candles for Compulsion Ritual (x3)','',0,'2008-05-03','DEM','y','y'),(112,114,'t','Skull Ring','',15,'2008-05-03','DEM','y','y'),(113,115,'t','Ring with Large Blue gem','',25,'2008-05-03','DEM','y','y'),(114,116,'r','Ritual Candle','',0,'2008-05-03','DEM','y','y'),(115,117,'t','Ring green inset gems ','',20,'2008-05-03','DEM','y','y'),(116,118,'t','Red/Black Ring','',15,'0000-00-00','','y','y'),(117,119,'m','Silver Bracelet w/ blue stones (Anti-Magic Aura 1/gd)','',0,'2006-06-03','FCM','y','y'),(118,120,'p','White and Pink Flowers (2 Production Points for Alchemy)','',0,'0000-00-00','','y','y'),(119,121,'m','Gold Ring w/ a Blue Stone (1 Body For the event)','',0,'0000-00-00','','y','y'),(120,122,'m','Little Silver Locket (Casts Fear on person that opens it)','',0,'0000-00-00','','y','y'),(121,123,'t','Gold Jewel Encrusted Goblet','',15,'2006-04-08','SM','y','y'),(122,124,'t','Gold Chain','',5,'2006-04-08','SM','y','y'),(123,125,'t','Gold Earring','',3,'0000-00-00','','y','y'),(124,126,'m','Pearl and Gem necklace','',0,'2006-06-03','DEM','y','y'),(125,127,'m','Silver short Sword (bound to Dave H)','',0,'2008-05-02','Dana','y','y'),(126,128,'p','Large Yellow and White Flowers (3 Production Points for Alchemy)','',0,'0000-00-00','','y','y'),(127,129,'p','Small White Flowers (1 Production Point for Alchemy)','',0,'0000-00-00','','y','y'),(128,130,'p','Medium White Flowers (1 Production Point for Alchemy)','',0,'0000-00-00','','y','y'),(129,131,'p','Red Rose (1 Production Point for Alchemy)','',0,'0000-00-00','','y','y'),(130,132,'m','Rope of Elemental Binding','',0,'2006-09-07','Todd','y','y'),(131,134,'m','Gloves (Greater Magic Hands)','',0,'0000-00-00','','y','y'),(132,135,'r','Ritual: Remove Curse','',0,'0000-00-00','Jim','y','y'),(133,136,'r','Ritual: Summon Elemental','',0,'0000-00-00','','y','y'),(134,138,'r','Powderd ogre horn ritual comonant','',0,'0000-00-00','','y','y'),(135,139,'m','Silver chalice','',0,'0000-00-00','','y','y'),(136,140,'t','Sunburst Necklace','',8,'0000-00-00','','y','y'),(137,141,'t','Purple Beads','',2,'0000-00-00','','y','y'),(138,142,'t','Multilink silver chain','',5,'0000-00-00','','y','y'),(139,143,'r','Generic Ritual Candle','',0,'0000-00-00','','y','y'),(140,144,'m','ring (heal body 1/gd)','',0,'0000-00-00','','y','y'),(141,145,'r','Ritual Component (multi coloured rope)','',0,'0000-00-00','','y','y'),(142,146,'t','Bead Necklace','',2,'2006-11-04','Eva','y','y'),(143,147,'t','Pendant Necklace','',2,'2006-11-04','Eva','y','y'),(144,148,'t','Ring','',2,'2006-11-04','Eva','y','y'),(145,149,'t','Amber gemstone Pendant Necklace','',8,'2011-04-06','Eva','y','y'),(146,150,'m','Necklace  (Dissipate 1/GD, bound to Dave H)','',0,'2008-05-02','Dana','y','y'),(147,151,'m','Flute of Healing (user must play specific treasure songs to intitiate the effects)','',0,'2006-05-07','JR','y','y'),(148,152,'m','Thaumaturgist\'s Mortar of Ightwaar','',0,'0000-00-00','','y','y'),(149,154,'r','Ritual Scroll (Vitalis Unguent, 10 Applications of buffed Purify Spirit)','',0,'0000-00-00','','y','y'),(150,155,'r','Crystal Ball (Orb of Power) Ritual Component','',0,'0000-00-00','','y','y'),(151,156,'m','stining Nettle Heart thing','',0,'2008-05-03','DEM','y','y'),(152,157,'t','Amber Gemstone Ring','',4,'2006-11-04','Eva','y','y'),(153,159,'r','Kattaflower (Ritual Component)','',0,'2006-11-04','Eva','y','y'),(154,160,'r','Sourberry (Ritual Component)','',0,'2006-11-04','Eva','y','y'),(155,161,'r','Autumn Snake (Ritual Component)','',0,'2006-11-04','Eva','y','y'),(156,162,'m','Bug (+1 Prod Point, Alchemy)','',0,'2006-11-04','Eva','y','y'),(157,163,'m','Adimo\'s Thaumaturgist\'s Mortar','',0,'2006-06-02','FCM','y','y'),(158,164,'m','Amulet (Mana Burn 2/GD)','',0,'0000-00-00','','y','y'),(159,165,'r','Ritual Quill','',0,'0000-00-00','','y','y'),(160,166,'m','Brooch (Cast Enhance Armor 1/gd)','',0,'0000-00-00','DEM','y','y'),(161,167,'p','Potion Water (2 Production Points for Brew Potion)','',0,'0000-00-00','','y','y'),(162,168,'m','Sword','',0,'0000-00-00','','y','y'),(163,169,'m','Magic Ring','',0,'0000-00-00','','y','y'),(164,170,'r','Ritual Quill','',0,'0000-00-00','','y','y'),(165,171,'r','Ritual Quill','',0,'0000-00-00','','y','y'),(166,172,'m','Flute Key (for use with Flute of Healing)','',0,'0000-00-00','','y','y'),(167,173,'m','Music Tutorial (for use with Flute of Healing)','',0,'0000-00-00','','y','y'),(168,174,'m','Heal Body Song (for use with Flute of Healing)','',0,'0000-00-00','','y','y'),(169,175,'m','Jhon\'s Mirror of Sophestry','',0,'0000-00-00','','y','y'),(170,176,'t','Copper Armband','',5,'0000-00-00','','y','y'),(171,178,'m','Mana Shard','',0,'0000-00-00','','y','y'),(172,179,'m','Mana Shard','',0,'0000-00-00','','y','y'),(173,180,'m','Magic Goblin Iron Long Sword (Creates Claw of the Beast 1/gd)','',0,'2006-05-07','FCM','y','y'),(174,181,'m','Bracelet (Elemental Weapon 1/day)','',0,'0000-00-00','','y','y'),(175,182,'m','Amulet (sanctuary 1/gd)','',0,'0000-00-00','','y','y'),(176,183,'m','Blue bottle per Bob M','',0,'2008-05-03','Dana','y','y'),(177,184,'t','Silver Bracelet with 3 turquiose stones','',5,'0000-00-00','','y','y'),(178,185,'m','Mirror of Sophestry for Gabby','',0,'0000-00-00','','y','y'),(179,186,'m','Frog (+2 Prod Points, Alchemy)','',0,'0000-00-00','','y','y'),(180,187,'m','Magic Conch (Call Piscenes 1/event)','',0,'0000-00-00','','y','y'),(181,188,'m','Mana Shard','',0,'0000-00-00','','y','y'),(182,189,'m','Lock (Casts magic Lock 1/gd)','',0,'2006-05-07','FCM','y','y'),(183,190,'m','Turtle Ring (Casts Improved Magic Armor 1/gd)','',0,'2006-05-07','FCM','y','y'),(184,191,'m','Magic Mace (Terran Masterwork, Hits for Magic and Elem Earth)','',0,'2006-06-03','TB','y','y'),(185,192,'m','Magic Cloak (Casts Heal Mortal Wound 1/gd)','',0,'0000-00-00','','y','y'),(186,193,'m','Leaf Necklace (Casts Elemental Dart 1/gd)','',0,'2006-06-03','FCM','y','y'),(187,194,'t','The Gem of Lost Souls','',50,'2006-06-03','TSB','y','y'),(188,195,'t','The Gem of Eternal Darkness','',50,'2006-06-03','TSB','y','y'),(189,196,'t','The Gem of Quietus','',50,'2006-06-03','TSB','y','y'),(190,197,'t','The Gem of Unlife','',50,'2006-06-03','TSB','y','y'),(191,198,'m','SilverRing w/ 3 Red Stones (1/gd Healing spells become ranged for 10 min)','',0,'2006-10-07','TSB','y','y'),(192,199,'m',' ','',0,'0000-00-00','','y','y'),(193,200,'m','4 pieces of the Wand of Doom','',0,'0000-00-00','','y','y'),(194,201,'m','Crystal pendant (Grants Magic Hands 1/gd)','',0,'2006-06-03','JTK','y','y'),(195,202,'m','Magic Quill (Provides 1 immediate Lore Request per event)','',0,'0000-00-00','','y','y'),(196,204,'m','Faerie Necklace (casts ley lines on anything in 10 ft radius)','',0,'0000-00-00','Eva','y','y'),(197,205,'m','Magic Bird','',0,'0000-00-00','','y','y'),(198,206,'p','Dissipate Box (automatically dissipates when not empty; appears at convergence for 10 minutes)','',0,'0000-00-00','','y','y'),(199,207,'m','The Dread Regalia : Atticus\' staff and mace','',0,'2006-11-04','TSB','y','y'),(200,208,'m','Amulet (Anti-Magic shield 1/gd)','',0,'0000-00-00','','y','y'),(201,209,'p','Bunch of Flowers (5 Alchemical Production Points)','',0,'0000-00-00','','y','y'),(202,210,'p','MistleToe Sickle (When Plant is cut it provides 1 production point)','',0,'0000-00-00','','y','y'),(203,211,'m','Gold Necklace with Tear Drop Diamond, +1 Power','',0,'2006-11-04','SAM','y','y'),(204,212,'m','Silver Cross with Blue/Green Gems (1/gd acts as elixer of wisdom)','',0,'2006-11-04','SAM','y','y'),(205,213,'r','Silver Martial Sword.  If attuned by ritual, 1/GD cast strength, anti-magic shield, repel undead)','',0,'0000-00-00','','y','y'),(206,214,'r','Wooden Bowl, ritual component','',0,'0000-00-00','','y','y'),(207,215,'m','The Champion\'s Blade, Martial Magic sword (battle immunity when wielded in hand unsheathed.  In the hands of an ordained Septon, it grants 1 smite/day)','',0,'0000-00-00','','y','y'),(208,216,'r','Ritual Component (Small Hammer)','',0,'2006-05-07','DAH','y','y'),(209,217,'m','Skull Shield, (2/GD either ghastly visage, enchant shield, or unhallow; requires mend armor and abomination to repair)','',0,'0000-00-00','','y','y'),(210,218,'m','Captainâ€™s Belt, +1 armor to all who swear an oath on the belt','',0,'0000-00-00','','y','y'),(211,219,'m','Earthkin goggles (avoid traps when worn)','',0,'0000-00-00','','y','y'),(212,220,'m','Gem of blasting, 5 charges, each 1 tagbag of 8 Magic)','',0,'0000-00-00','','y','y'),(213,221,'m','Armor belt (+1 armor, Imp Magic  Armor 1/gd)','',0,'0000-00-00','','y','y'),(214,222,'m','Blue Bag ','',0,'0000-00-00','FEAST','y','y'),(215,223,'m','Leechblade, sacrifice 1/body for (+1 magic dmg for day, grounding, pin, or dispel magic)','',0,'0000-00-00','','y','y'),(216,224,'r','Ritual component if destroyed can be used for 3 production potion','',0,'0000-00-00','','y','y'),(217,225,'m','Magic Sword, martial length, +1 magic damage, +2 versus humans (casts Abomination 1/game day.)','',0,'0000-00-00','','y','y'),(218,226,'m','Masterwork Non-martial sword','',0,'0000-00-00','','y','y'),(219,227,'m','Magic mace ','',0,'0000-00-00','FEAST','y','y'),(220,228,'m','Magic Amulet ','',0,'0000-00-00','','y','y'),(221,229,'p','Silver ore (2 production for Weaponsmithing or Ornamenting)','',0,'0000-00-00','','y','y'),(222,230,'m','Padlock ','',0,'0000-00-00','','y','y'),(223,231,'t','Ring','',20,'2008-05-03','dem','y','y'),(224,232,'t','Tiara w/ 3 red gems','',50,'0000-00-00','','y','y'),(225,233,'t','Earthkin Gold 3 weaponsmithing production','',5,'0000-00-00','','y','y'),(226,234,'t','uncut purple gem','',2,'0000-00-00','','y','y'),(227,235,'m','Blue Transparent Plastic Bubble (Leylines 1/GD)','',0,'0000-00-00','','y','y'),(228,236,'m','Magic Conch (Calls Piscenes 1/GD)','',0,'0000-00-00','','y','y'),(229,237,'m','silver necklace w/Medallion (+1 body and cast one 2nd lvl spell 1/GD)','',0,'0000-00-00','','y','y'),(230,238,'m','Blue Wind Chime (Sanctuary 1/GD on entire building)','',0,'0000-00-00','','y','y'),(231,239,'m','Blue Magic Helmet  (final rest 1/gd) crafted by Aden Onan','',0,'2007-05-04','DEM','y','y'),(232,240,'m','Clover','',0,'0000-00-00','','y','y'),(233,241,'m','Granite and onyx symbol','',0,'0000-00-00','','y','y'),(234,242,'p','4 production for ornamentor or weapon smith or worth 1 silver.','',0,'0000-00-00','','y','y'),(235,243,'m','Malikai\'s Mortar and Pestle','',0,'2007-05-05','','y','y'),(236,244,'t','Silver necklace with threee topaz gems','',3,'0000-00-00','','y','y'),(237,245,'m','Blue Painted Whistle (Blow for repel undead 1/GD)','',0,'0000-00-00','','y','y'),(238,246,'t','Gold Bars marked with the Julean famil symbol- can not be turned into logistics for xp','',100,'2007-05-05','DEM','y','y'),(239,247,'m','Blue Claw Necklace (Battle Immunity 1/day)','',0,'2007-05-05','JR','y','y'),(240,248,'m','Stainless Wand w/Crystal; Wand of Panacea (5 Charges, Expires May 2008)','',0,'2007-05-05','TSB','y','y'),(241,249,'t','red striped vase','',10,'0000-00-00','','y','y'),(242,250,'m','blue glass box (can store an active spell for a game day)','',0,'0000-00-00','','y','y'),(243,251,'m','Blue Teardrop necklace with spiraling gold adornment  (Dissipate 1/GD)','',0,'0000-00-00','','y','y'),(244,252,'m','blue leather bracers (control lesser elemental 1/GD, for entire day) Must be recharged monthly by Air Officers or stops working','',0,'0000-00-00','','y','y'),(245,253,'r','Broken Sword (Ritual Component) hits for magic','',0,'0000-00-00','','y','y'),(246,254,'t','Ring','',10,'0000-00-00','','y','y'),(247,255,'m','Magic Jug (create a potion of Elem Dart, Water 1/gd, must use water from lake)','',0,'0000-00-00','','y','y'),(248,256,'m','Magic Gloves (Casts Elemental Weapon 1/gd)','',0,'0000-00-00','','y','y'),(249,257,'m','orb Jordans philo stone','',0,'0000-00-00','','y','y'),(250,258,'m','Tome of Elemental Magic','',0,'0000-00-00','FEAST','y','y'),(251,259,'t','Perfume','',10,'0000-00-00','','y','y'),(252,260,'m','Red gem pendant (charm person 1/gd)','',0,'0000-00-00','','y','y'),(253,261,'m','Malikai\'s Philosophers stone','',0,'0000-00-00','','y','y'),(254,262,'p','June Blooming Lavender Bell (4 Production)','',0,'2007-06-02','JR','y','y'),(255,263,'r','Red Blade of Hrisod (Magical, Ritual Component)','',0,'2007-06-02','JR','y','y'),(256,264,'t','Favor of Draconus','',10,'2007-06-02','DEM','y','y'),(257,265,'m','Legion Tabard (Mend Armor 2/game day)','',0,'0000-00-00','','y','y'),(258,266,'m','Heal Limb Song (Heal Limb, 1/GD)','',0,'0000-00-00','','y','y'),(259,267,'t','3 strand pearl necklace','',15,'0000-00-00','','y','y'),(260,268,'m','Goblin Iron Arrows x2','',0,'0000-00-00','','y','y'),(261,269,'m','Skeleton Necklace (Repel Undead as Garlic Paste, Permanent) (Draws Undead in a 10mile radius)<--- This last part isn\'t identifiable','',0,'0000-00-00','','y','n'),(262,270,'p','Green open face rock 2 production points towards weapon smithing.','',0,'0000-00-00','','y','y'),(263,271,'m','Magic martial sword (+1 magic water damage, casts Elemental Dart 1/game day)','',0,'0000-00-00','','y','y'),(264,272,'r','Kazvac Heart (Ritual Component)','',0,'0000-00-00','','y','y'),(265,273,'m','Magic Helmet (counts as 2 Armor and provides 2 Power Points)','',0,'0000-00-00','','y','y'),(266,274,'p','Vial of flux (Provides 1 temporary craft point and 4 production points towards Ornamentor or Weaponsmith)','',0,'0000-00-00','','y','y'),(267,275,'m','Ring, (Casts Silence 2/game day)','',0,'0000-00-00','','y','y'),(268,276,'p','Big Red Apple (one time use: Panacea)','',0,'0000-00-00','','y','y'),(269,278,'p','Madweed Plants (red feather looking leafy plants) +1 production or eat for Raw Madweed effect.','',0,'0000-00-00','','y','y'),(270,279,'m','Gold Scorpion Necklace  (Claw of the Beast 1/GD)','',0,'0000-00-00','','y','y'),(271,280,'m','Magic Rope (Unbreakable, Uncutttable.  Automatic success on binding with a single knot. No escape from these bonds. Will hold monstrous creatures.)','',0,'0000-00-00','','y','n'),(272,281,'m','Chain Head Thingy (Enchant Weapon 1/game day, counts as a helmet for +1 armor)','',0,'2007-09-08','TSB','y','y'),(273,282,'m','Purple Amethyst Necklace (Mind Blank 1/event)','',0,'2007-09-08','TSB','y','y'),(274,283,'m','Blue Glass Birds. Piece A Single Bird// PieceB 2 birds// Allow Pcs to use walkie talkies// Piece A is mobile// Piece B must stay in a cabin.','',0,'0000-00-00','','y','y'),(275,284,'p','elven steel dagger (armor skipping)','',0,'0000-00-00','','y','y'),(276,285,'m','lion shield (user immune to fear)','',0,'0000-00-00','','y','y'),(277,286,'m','Magic Bow (3x/gd ranged dispel using arrow)','',0,'0000-00-00','','y','y'),(278,287,'p','blue flower necklace ( 2 production points)','',0,'0000-00-00','','y','y'),(279,288,'m','blue/silver braclet ( imp magic amor 1/day)','',0,'0000-00-00','','y','y'),(280,289,'m','amythest neklace (abomination 1/day)','',0,'0000-00-00','','y','y'),(281,290,'t','silver necklace ','',10,'0000-00-00','','y','y'),(282,291,'m','ball diamond on gold chain (may cast detect nights children at will  within 50 ft) (most be held out infront of user or infront of eye)','',0,'0000-00-00','','y','y'),(283,292,'p','Ettercat gland- 2 production for the creation of poisons only','',0,'2007-11-03','DEM','y','y'),(284,293,'p',' Magic Bottle 3 production for potions','',0,'2007-11-03','FM','y','y'),(285,294,'m','Magic Ring, â€œnewâ€ spell store (lasts for event instead of gameday- must be stored on ring) ','',0,'2007-11-03','DEM','y','y'),(286,295,'m','Magic Necklace (1/gd casts enhance armor for 2 points of armor â€“ not to exceed total of 4)','',0,'2007-11-03','DEM','y','y'),(287,296,'m','Non-Martial Silver Axe','',0,'2006-11-04','DEM','y','y'),(288,297,'m','Magic Bow (See JC)','',0,'0000-00-00','','y','y'),(289,298,'m','Silver Mace, Masterwork +1 Dmg','',0,'2007-11-07','JR','y','y'),(290,299,'m','Piscene Necklace (Call Piscenes 1/GD)','',0,'0000-00-00','','y','y'),(291,300,'m','Rynils mirror of sophstry','',0,'0000-00-00','','y','y'),(292,301,'m','Durum mirrorof sophystry','',0,'0000-00-00','','y','y'),(293,302,'p','Benthic Ambergris (3 PP for Alchemy)','',0,'0000-00-00','','y','y'),(294,303,'m','Elven Steel Katana','',0,'2007-11-07','DRM','y','y'),(295,304,'m','Cape (Shadowskin 1/GD)','',0,'0000-00-00','','y','y'),(296,305,'m','Durhum mortar','',0,'0000-00-00','','y','y'),(297,306,'m','Durhum\'s hermetic rod','',0,'0000-00-00','','y','y'),(298,307,'p','2 Production Points for Traps','',0,'0000-00-00','','y','y'),(299,308,'p','1 Production Points for traps','',0,'0000-00-00','','y','y'),(300,309,'m','Elven Steel Gladius â€œLiberatusâ€ (mass anti-magic shield 1/gd, aura of reflection 1/gd self only)','',0,'2008-02-09','FEAST','y','y'),(301,310,'m','Money Tree (creates random amount of money 1/event)','',0,'2008-02-09','FEAST','y','y'),(302,311,'m','Sanctify Candles (Sanctify building when both are lit inside)','',0,'2008-02-09','FEAST','y','n'),(303,312,'m','Ring of the Scholar (1/gd read any document/scroll)','',0,'2008-02-09','FEAST','y','y'),(304,313,'m','Butterfly Amulet (Immune to Final Rest, purify spirit 1/gd, upon death, you may be revived until the end of the event, only one soul at a time)','',0,'2008-02-09','FEAST','y','y'),(305,314,'m','Poison immune necklace (Immune to Poisons)','',0,'2008-02-09','FEAST','y','y'),(306,315,'m','Undetectable Pouch (Contents need not be revealed in a search)','',0,'2008-02-09','FEAST','y','y'),(307,316,'m','Stealth Amulet (slot of your choice, ignore all â€œdetectâ€ calls,  gain 1 power from \"detect\" calls, no-incant dissipate 1/event)','',0,'2008-02-09','FEAST','y','y'),(308,317,'p','Magic Chain (+1 power, +1 production)','',0,'2008-02-09','FEAST','y','y'),(309,318,'m','Magic Shield (final rest, Enchant Shield, Restore Limb 1/GD each)','',0,'2008-02-09','FEAST','y','y'),(310,319,'t','necklace','',15,'2008-05-03','DEM','y','y'),(311,320,'t','necklace','',15,'2008-05-03','DEM','y','y'),(312,321,'p','Sunface pin (energy dart 1/GD) (attached to trapped chest 5Jul08)','',0,'2008-05-03','ARU','y','y'),(313,322,'t','Silver Bracelet ','',25,'2008-06-06','DEM','y','y'),(314,323,'t','Silver Broach- TBD','',15,'0000-00-00','','y','y'),(315,324,'m','Pirate skull ring TBD','',0,'0000-00-00','','y','y'),(316,325,'m','Necklace (imp magic armor 1/gd)','',0,'2008-06-06','DEM','y','y'),(317,326,'p','Copper band (+1 damage to ranged weapon)','',0,'2008-06-06','DEM','y','y'),(318,327,'m','Magic Pants (Ghastly Visage, Grounding, Final Rest 1/GD)','',0,'2008-06-07','Dana','y','y'),(319,328,'m','Silver Hammer','',0,'2008-06-08','Dana','y','y'),(320,329,'m','SoulDrinker (Final Rest 3/day, when final rest is cast 1 power returned)','',0,'2008-06-06','Dana','y','y'),(321,330,'m','Necklace (elemental immunity when glowing and visible)','',0,'0000-00-00','','y','y'),(322,331,'m','Blue Candle (Melted wax creates seal of Magic Lock, dispel self)','',0,'0000-00-00','','y','y'),(323,332,'t','Gold Neclace','',25,'2008-06-06','DEM','y','y'),(324,333,'m','Power Stone, restores 1 power point when consumed','',0,'0000-00-00','','y','y'),(325,334,'m','Tabard (heal mortal and silvershine 1/gd)','',0,'2008-06-06','DEM','y','y'),(326,335,'t','green heart stone ring','',15,'2008-06-07','TSB','y','y'),(327,336,'r','ritual candle (generic)','',0,'2008-06-07','SAM','y','y'),(328,337,'m','Small wooden box','',0,'2008-06-07','TSB','y','y'),(329,338,'t','Ring With large Blue gem','',50,'2008-06-07','Rk','y','y'),(330,339,'t','Big gold chain','',15,'2008-06-07','RK','y','y'),(331,340,'m','Blue belt.  (Enhance armor, magic amor, anti magic shield 1/gd)','',0,'2008-06-07','RK','y','y'),(332,341,'t','Light Plastic Tear Gems (Multiples)','',1,'0000-00-00','','y','y'),(333,342,'m','Blue and Green Stone Necklace (Silence 1/GD)','',0,'2008-06-07','ARU','y','y'),(334,343,'m','Fellowship leaf cloak clasp (group mend armor 1/day, Elf only)','',0,'2008-06-07','ARU','y','y'),(335,344,'m','Enhance Armor','',0,'2008-06-07','ARU','y','y'),(336,345,'m','martial length elven steel sword. Soulbound to Rick King/Ajax Thorgrim','',0,'2008-06-24','DEM','y','y'),(337,346,'m','Malikai\'s Hermetic Rod','',0,'2008-07-01','MN','y','y'),(338,347,'r','Ritual of Undead Detection','',0,'2008-07-01','Bob','y','y'),(339,348,'r','Ritual of Spellstriking','',0,'2008-07-01','Bob','y','y'),(340,349,'r','Ritual of The Sworn Brother\'s Oath','',0,'2008-07-01','Bob','y','y'),(341,350,'r','Ritual of the Knight\'s Shield','',0,'2008-07-01','Bob','y','y'),(342,351,'r','Ritual of the Craftsman\'s Raiment','',0,'2008-07-01','Bob','y','y'),(343,352,'r','Ritual of Regeneration','',0,'2008-07-01','Bob','y','y'),(344,353,'p','Scroll Paper 1 PP for scroll making','',0,'2008-07-01','Bob','y','y'),(345,354,'p','Potion Water (1 Production Points for Brew Potion)','',0,'2008-07-01','Bob','y','n'),(346,355,'m','Fellowship leaf cloak clasp (group mend armor 1/day, Elf only)','',0,'2008-07-01','Bob','y','y'),(347,356,'p','Alchemical Extract 2 PP for alchemy','',0,'2008-07-01','Bob','y','y'),(348,357,'m','Soulbound to Alia Elem prot vs fire - vest','',0,'2008-07-04','DM','y','n'),(349,358,'m','Silver short Swordxxxxx','',0,'2011-05-29','NJA','y','n'),(350,359,'m','Elementals Wedding Ring(life extension)','',0,'2008-07-04','TB','y','n'),(351,360,'o','ghost weed (mysterious weed that has ties to the undead)','Justin\'s plot?',0,'2008-10-29','Rick','y','n'),(352,361,'m','Necromancers Stone (controls undead for 10 mins p/command, with no instructions within 10 minutes undead run amok, if killed they lay down for a minute, with no final rest, they stand back up.)','',0,'2008-07-05','DH','y','n'),(353,400,'r','Soldier\'s Ring of Battle Ritual','',0,'0000-00-00','','y','n'),(354,401,'m','Soldier\'s Meteor Fragment','',0,'0000-00-00','','y','n'),(355,666,'','d','n',123,'0000-00-00','','y','y'),(362,363,'','woooooooo','',0,'0000-00-00','','y','y'),(361,362,'','New thang!','',0,'0000-00-00','','y','y'),(363,3,'','Martial elven steel swordxy','',0,'2012-03-04','','y','y');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_tags`
--

DROP TABLE IF EXISTS `item_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_tags` (
  `item_tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`item_tag_id`),
  KEY `item_id` (`item_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_tags`
--

LOCK TABLES `item_tags` WRITE;
/*!40000 ALTER TABLE `item_tags` DISABLE KEYS */;
INSERT INTO `item_tags` VALUES (1,1,'Ring slot'),(2,1,'Magic Item'),(3,3,'Dissipate'),(4,10,'Magic item'),(5,0,'Area effect power'),(6,0,'1xDay'),(7,0,'2xDay'),(8,0,'3xDay'),(9,0,'1xEvent'),(10,0,'Breaks cap'),(11,0,'No incant'),(27,4,'Treasure'),(28,4,'Neck slot'),(46,349,'Silver'),(45,349,'Sword'),(44,349,'Weapon'),(47,355,'pizza'),(48,355,'bacon'),(60,363,'Elven steel'),(59,363,'Sword'),(58,363,'Weapon');
/*!40000 ALTER TABLE `item_tags` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-10-17 23:54:37