CREATE DATABASE  IF NOT EXISTS `airport_mng` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `airport_mng`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: airport_mng
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `additional_room`
--

DROP TABLE IF EXISTS `additional_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `additional_room` (
  `additional_room_id` int NOT NULL,
  `additional_room_type` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `opening_time` time NOT NULL,
  `closing_time` time NOT NULL,
  `room_description` varchar(200) NOT NULL,
  `amenities` varchar(200) NOT NULL,
  `contact_info` varchar(50) NOT NULL,
  `web_site` varchar(50) NOT NULL,
  `airport_id` int NOT NULL,
  PRIMARY KEY (`additional_room_id`),
  KEY `airport_id` (`airport_id`),
  CONSTRAINT `additional_room_ibfk_1` FOREIGN KEY (`airport_id`) REFERENCES `the_airport` (`airport_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `additional_room`
--

LOCK TABLES `additional_room` WRITE;
/*!40000 ALTER TABLE `additional_room` DISABLE KEYS */;
INSERT INTO `additional_room` VALUES (1,'Conference Room','Business','09:00:00','18:00:00','A professional setting for meetings and presentations','Projector, Whiteboard, Conference phone','contact@airport.com','www.airport.com/conference-room',1),(2,'Sleeping Room','Transit','00:00:00','23:59:59','A private and comfortable room for resting or sleeping','Bed, Blanket, Pillow, Towel','contact@airport.com','www.airport.com/sleeping-room',1),(3,'Gym','Fitness','06:00:00','22:00:00','A space for exercise and physical activity','Treadmill, Dumbbells, Yoga mats','contact@airport.com','www.airport.com/gym',1),(4,'Game Room','Entertainment','10:00:00','20:00:00','A recreational space for playing games and having fun','Pool table, Board games, Video games','contact@airport.com','www.airport.com/game-room',1),(5,'Prayer Room','Religious','00:00:00','23:59:59','A quiet space for prayer and meditation','Prayer rugs, Quran, Religious texts','contact@airport.com','www.airport.com/prayer-room',1);
/*!40000 ALTER TABLE `additional_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airline`
--

DROP TABLE IF EXISTS `airline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airline` (
  `airline_id` int NOT NULL,
  `airlane_name` text NOT NULL,
  `contact` text NOT NULL,
  `airplane_id` int NOT NULL,
  `website` text NOT NULL,
  `phone` char(25) DEFAULT NULL,
  `country` text NOT NULL,
  `rating` int NOT NULL,
  PRIMARY KEY (`airline_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airline`
--

LOCK TABLES `airline` WRITE;
/*!40000 ALTER TABLE `airline` DISABLE KEYS */;
INSERT INTO `airline` VALUES (1,'Delta AirLines','contact@delta.com',1,'https://www.delta.com/','+1-800-221-12','United States',4),(2,'Emirates','contact@emirates.com',2,'https://www.emirates.com/','+971-4-708-111','United Arab Emirates',5),(3,'Singapore Airlines','contact@singaporeair.com',3,'https://www.singaporeair.com/','+65 6223 88','Singapore',6),(4,'Lufthansa','contact@lufthansa.com',4,'https://www.lufthansa.com/','+49 69 86 799 9','Germany',1),(5,'Qatar Airways','contact@qatarairways.com',5,'https://www.qatarairways.com/','+974 4022 00','Qatar',3);
/*!40000 ALTER TABLE `airline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airplane`
--

DROP TABLE IF EXISTS `airplane`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airplane` (
  `airplane_id` int NOT NULL,
  `airline_id` int NOT NULL,
  `pilot_id` int NOT NULL,
  `airplane_type` varchar(400) DEFAULT NULL,
  `manufacturer` varchar(400) DEFAULT NULL,
  `model` varchar(300) DEFAULT NULL,
  `seating_capacity` int NOT NULL,
  `max_speed` int NOT NULL,
  `fuel_capacity` int NOT NULL,
  `year_of_the_plain` date DEFAULT NULL,
  `airplane_status` tinyint DEFAULT NULL,
  `maintenance_records` date DEFAULT NULL,
  PRIMARY KEY (`airplane_id`),
  KEY `airline_id` (`airline_id`),
  CONSTRAINT `airplane_ibfk_1` FOREIGN KEY (`airline_id`) REFERENCES `airline` (`airline_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airplane`
--

LOCK TABLES `airplane` WRITE;
/*!40000 ALTER TABLE `airplane` DISABLE KEYS */;
INSERT INTO `airplane` VALUES (1,1,1,'Boeing 737-800','Boeing','737-800',162,830,26025,'2018-01-01',1,'2022-03-15'),(2,2,2,'Airbus A320','Airbus','A320',186,834,24000,'2016-06-01',1,'2022-04-02'),(3,3,3,'Boeing 777-300ER','Boeing','777-300ER',396,892,117348,'2014-10-01',1,'2022-02-20'),(4,4,4,'Airbus A330-300','Airbus','A330-300',277,871,97530,'2017-09-01',1,'2022-03-28'),(5,5,5,'Boeing 787-9','Boeing','787-9',290,954,138000,'2015-12-01',1,'2022-02-15');
/*!40000 ALTER TABLE `airplane` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airport_security`
--

DROP TABLE IF EXISTS `airport_security`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airport_security` (
  `security_id` int NOT NULL,
  `worker_name` varchar(50) NOT NULL,
  `worker_surname` varchar(50) NOT NULL,
  `contact` varchar(75) NOT NULL,
  `company` varchar(50) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `address` varchar(75) NOT NULL,
  `airport_id` int NOT NULL,
  PRIMARY KEY (`security_id`),
  KEY `airport_id` (`airport_id`),
  CONSTRAINT `airport_security_ibfk_1` FOREIGN KEY (`airport_id`) REFERENCES `the_airport` (`airport_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airport_security`
--

LOCK TABLES `airport_security` WRITE;
/*!40000 ALTER TABLE `airport_security` DISABLE KEYS */;
INSERT INTO `airport_security` VALUES (1,'John','Doe','john.doe@airportsecurity.com','Airport Security LLC','+1 555-525-5555','123 Main St, Anytown USA',1),(2,'Jane','Smith','jane.smith@airportsecurity.com','Airport Security LLC','+1 555-555-9555','456 Oak Ave, Anycity USA',1),(3,'David','Lee','david.lee@airportsecurity.com','Airport Security LLC','+1 555-555-5115','789 Elm St, Anystate USA',1),(4,'Sarah','Kim','sarah.kim@airportsecurity.com','Airport Security LLC','+1 555-555-5995','321 Maple Ave, Anycity USA',1),(5,'Michael','Johnson','michael.johnson@airportsecurity.com','Airport Security LLC','+1 955-555-5555','654 Cedar St, Anytown USA',1);
/*!40000 ALTER TABLE `airport_security` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airport_staff`
--

DROP TABLE IF EXISTS `airport_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airport_staff` (
  `airport_staff_id` int NOT NULL,
  `staff_name` text NOT NULL,
  `email` text NOT NULL,
  `phone_number` char(10) DEFAULT NULL,
  `staff_position` text NOT NULL,
  `department` text NOT NULL,
  `shift_start_time` time DEFAULT NULL,
  `shift_end_time` time DEFAULT NULL,
  `salary` int NOT NULL,
  `airport_id` int NOT NULL,
  PRIMARY KEY (`airport_staff_id`),
  KEY `airport_id` (`airport_id`),
  CONSTRAINT `airport_staff_ibfk_1` FOREIGN KEY (`airport_id`) REFERENCES `the_airport` (`airport_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airport_staff`
--

LOCK TABLES `airport_staff` WRITE;
/*!40000 ALTER TABLE `airport_staff` DISABLE KEYS */;
INSERT INTO `airport_staff` VALUES (1,'John Koe','johnkoe@example.com','551-912','Security Officer','Security','08:00:00','16:00:00',35000,1),(2,'Jane Leith','janeleith@example.com','555-5678','Baggage Handler','Baggage Services','06:00:00','14:00:00',30000,1),(3,'Michael Lee','michaellee@example.com','555-9101','Air Traffic Controller','Air Traffic Control','14:00:00','22:00:00',45000,1),(4,'Emily Davis','emilydavis@example.com','555-1212','Customer Service Representative','Customer Service','10:00:00','18:00:00',32000,1),(5,'David Kim','davidkim@example.com','555-1313','Pilot','Flight Operations','08:00:00','16:00:00',80000,1);
/*!40000 ALTER TABLE `airport_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars` (
  `license_plate` varchar(20) NOT NULL,
  `brand` varchar(35) NOT NULL,
  `color` varchar(20) NOT NULL,
  PRIMARY KEY (`license_plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES ('ABC123','Toyota','Blue'),('DEF456','Honda','Black'),('GHI789','Chevrolet','White'),('JKL012','Tesla','Silver'),('XYZ789','Ford','Red');
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counter`
--

DROP TABLE IF EXISTS `counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `counter` (
  `counter_id` int NOT NULL,
  `ticket_id` int NOT NULL,
  `services` text NOT NULL,
  `closing_time` time DEFAULT NULL,
  `location` text NOT NULL,
  `counter_type` text NOT NULL,
  `operated_by` text NOT NULL,
  `operated_time` time DEFAULT NULL,
  `staff_count` int NOT NULL,
  `availability` tinyint DEFAULT NULL,
  `additional_info` text NOT NULL,
  `airport_id` int NOT NULL,
  PRIMARY KEY (`counter_id`),
  KEY `airport_id` (`airport_id`),
  CONSTRAINT `counter_ibfk_1` FOREIGN KEY (`airport_id`) REFERENCES `the_airport` (`airport_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counter`
--

LOCK TABLES `counter` WRITE;
/*!40000 ALTER TABLE `counter` DISABLE KEYS */;
INSERT INTO `counter` VALUES (1,1,'Check-in, Bag Drop, Boarding Pass Printing','22:00:00','Terminal A, Departure Hall','Staffed Counter','Airline X','06:00:00',4,1,'For Business and First Class passengers only',1),(2,2,'Check-in, Bag Drop, Boarding Pass Printing','23:00:00','Terminal B, Departure Hall','Self-Service Counter','Airport','06:00:00',2,1,'Available for all passengers',1),(3,3,'Information, Lost & Found, Airport Maps','00:00:00','Terminal C, Arrival Hall','Information Counter','Airport','06:00:00',1,1,'Located near baggage claim',1),(4,4,'Foreign Exchange, Banking, ATM','22:30:00','Terminal A, Departure Hall','Financial Counter','Bank X','06:00:00',3,1,'Only accepts major currencies',1),(5,5,'Visa, Immigration, Passport Control','23:30:00','Terminal B, Arrival Hall','Immigration Counter','Government','06:00:00',5,1,'For non-citizens only',1);
/*!40000 ALTER TABLE `counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight` (
  `flight_id` int NOT NULL,
  `airline_id` int NOT NULL,
  `airport_id` int NOT NULL,
  `luggage_id` int NOT NULL,
  `flight_number` int NOT NULL,
  `duration` time DEFAULT NULL,
  `flight_status` tinyint DEFAULT NULL,
  `price` int NOT NULL,
  `booked_seat` char(1) DEFAULT NULL,
  `seat_capacity` int DEFAULT NULL,
  `arrival_time` datetime DEFAULT NULL,
  `airplane_id` int NOT NULL,
  PRIMARY KEY (`flight_id`),
  KEY `airplane_id` (`airplane_id`),
  CONSTRAINT `flight_ibfk_1` FOREIGN KEY (`airplane_id`) REFERENCES `airplane` (`airplane_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES (1,1,1,1,1,'04:00:00',1,500,'A',200,'2023-05-10 14:30:00',1),(2,2,1,2,2,'03:30:00',1,450,'B',180,'2023-05-11 12:15:00',2),(3,3,1,3,3,'01:30:00',1,200,'C',100,'2023-05-12 09:00:00',3),(4,4,1,4,4,'02:00:00',1,250,'D',120,'2023-05-13 16:45:00',4),(5,5,1,5,5,'05:15:00',1,800,'E',300,'2023-05-14 21:00:00',5);
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license`
--

DROP TABLE IF EXISTS `license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `license` (
  `license_number_id` int NOT NULL,
  `license_date_issue` date DEFAULT NULL,
  `license_date_expiry` date DEFAULT NULL,
  `pilot_id` int NOT NULL,
  PRIMARY KEY (`license_number_id`),
  KEY `pilot_id` (`pilot_id`),
  CONSTRAINT `license_ibfk_1` FOREIGN KEY (`pilot_id`) REFERENCES `pilot` (`pilot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license`
--

LOCK TABLES `license` WRITE;
/*!40000 ALTER TABLE `license` DISABLE KEYS */;
INSERT INTO `license` VALUES (1,'2020-06-01','2025-06-01',1),(2,'2019-04-01','2024-04-01',2),(3,'2021-01-15','2026-01-15',3),(4,'2018-12-10','2023-12-10',4),(5,'2017-10-25','2022-10-25',5);
/*!40000 ALTER TABLE `license` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `luggage`
--

DROP TABLE IF EXISTS `luggage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `luggage` (
  `luggage_id` int NOT NULL,
  `passenger_id` int NOT NULL,
  `luggage_type` varchar(400) DEFAULT NULL,
  `color` varchar(400) DEFAULT NULL,
  `weight` int NOT NULL,
  `tag_number` int NOT NULL,
  `baggage_fee` int NOT NULL,
  `date_of_check_in` date DEFAULT NULL,
  `luggage_status` tinyint DEFAULT NULL,
  `date_of_pickup` date DEFAULT NULL,
  `origin` varchar(400) NOT NULL,
  `destination` varchar(400) NOT NULL,
  `flight_id` int NOT NULL,
  PRIMARY KEY (`luggage_id`),
  KEY `passenger_id` (`passenger_id`),
  KEY `flight_id` (`flight_id`),
  CONSTRAINT `luggage_ibfk_1` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`passenger_id`),
  CONSTRAINT `luggage_ibfk_2` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`flight_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `luggage`
--

LOCK TABLES `luggage` WRITE;
/*!40000 ALTER TABLE `luggage` DISABLE KEYS */;
INSERT INTO `luggage` VALUES (1,1,'Suitcase','Black',25,12345,50,'2023-05-07',1,'2023-05-08','New York','Los Angeles',1),(2,2,'Backpack','Blue',10,54321,0,'2023-05-07',0,NULL,'Chicago','Miami',2),(3,3,'Duffel Bag','Red',15,98765,25,'2023-05-07',1,'2023-05-10','Houston','Atlanta',3),(4,4,'Carry-On','Grey',7,24680,0,'2023-05-07',0,NULL,'Seattle','San Francisco',4),(5,5,'Trunk','Green',40,13579,75,'2023-05-07',1,'2023-05-09','Boston','Washington D.C.',5);
/*!40000 ALTER TABLE `luggage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parking`
--

DROP TABLE IF EXISTS `parking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parking` (
  `parking_id` int NOT NULL,
  `capacity` int NOT NULL,
  `parking_name` varchar(50) NOT NULL,
  `parking_type` varchar(50) NOT NULL,
  `amenities` varchar(200) NOT NULL,
  `location` varchar(50) NOT NULL,
  `airport_ID` int NOT NULL,
  PRIMARY KEY (`parking_id`),
  KEY `airport_ID` (`airport_ID`),
  CONSTRAINT `parking_ibfk_1` FOREIGN KEY (`airport_ID`) REFERENCES `the_airport` (`airport_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parking`
--

LOCK TABLES `parking` WRITE;
/*!40000 ALTER TABLE `parking` DISABLE KEYS */;
INSERT INTO `parking` VALUES (1,100,'Long-term parking','Covered','Shuttle service, EV charging','North Terminal',1),(2,50,'Short-term parking','Uncovered','Close to terminals, valet service','South Terminal',1),(3,200,'Economy parking','Covered and uncovered','24/7 surveillance, car wash','East Terminal',1),(4,75,'Premium parking','Covered','VIP service, lounge access','West Terminal',1),(5,30,'Valet parking','Covered','Convenient drop-off and pick-up, car detailing','Central Terminal',1);
/*!40000 ALTER TABLE `parking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parking_space`
--

DROP TABLE IF EXISTS `parking_space`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parking_space` (
  `parking_space_id` int NOT NULL,
  `parking_id` int NOT NULL,
  `status_id` int NOT NULL,
  `space_type` varchar(50) NOT NULL,
  PRIMARY KEY (`parking_space_id`),
  KEY `parking_id` (`parking_id`),
  CONSTRAINT `parking_space_ibfk_1` FOREIGN KEY (`parking_id`) REFERENCES `parking` (`parking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parking_space`
--

LOCK TABLES `parking_space` WRITE;
/*!40000 ALTER TABLE `parking_space` DISABLE KEYS */;
INSERT INTO `parking_space` VALUES (1,1,1,'Compact'),(2,2,2,'Standard'),(3,3,3,'Standard'),(4,4,4,'Compact'),(5,5,5,'Oversized');
/*!40000 ALTER TABLE `parking_space` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parking_status`
--

DROP TABLE IF EXISTS `parking_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parking_status` (
  `status_id` int NOT NULL,
  `availability` varchar(3) NOT NULL,
  `parking_space_id` int NOT NULL,
  PRIMARY KEY (`status_id`),
  KEY `parking_space_id` (`parking_space_id`),
  CONSTRAINT `parking_status_ibfk_1` FOREIGN KEY (`parking_space_id`) REFERENCES `parking_space` (`parking_space_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parking_status`
--

LOCK TABLES `parking_status` WRITE;
/*!40000 ALTER TABLE `parking_status` DISABLE KEYS */;
INSERT INTO `parking_status` VALUES (1,'YES',1),(2,'NO',2),(3,'YES',3),(4,'YES',4),(5,'NO',5);
/*!40000 ALTER TABLE `parking_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parking_tickets`
--

DROP TABLE IF EXISTS `parking_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parking_tickets` (
  `parking_tickets_id` int NOT NULL,
  `license_plate` varchar(20) NOT NULL,
  `time_of_arrival` time NOT NULL,
  `time_of_departure` time DEFAULT NULL,
  `licence_plate_id` int NOT NULL,
  `parking_space_id` int NOT NULL,
  `parking_duration` time NOT NULL,
  PRIMARY KEY (`parking_tickets_id`),
  KEY `parking_space_id` (`parking_space_id`),
  KEY `license_plate` (`license_plate`),
  CONSTRAINT `parking_tickets_ibfk_1` FOREIGN KEY (`parking_space_id`) REFERENCES `parking_space` (`parking_space_id`),
  CONSTRAINT `parking_tickets_ibfk_2` FOREIGN KEY (`license_plate`) REFERENCES `cars` (`license_plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parking_tickets`
--

LOCK TABLES `parking_tickets` WRITE;
/*!40000 ALTER TABLE `parking_tickets` DISABLE KEYS */;
INSERT INTO `parking_tickets` VALUES (1,'ABC123','12:30:00','18:45:00',1,1,'06:15:00'),(2,'XYZ789','09:15:00','14:30:00',2,2,'05:15:00'),(3,'DEF456','07:00:00','10:30:00',3,3,'03:30:00'),(4,'GHI789','15:00:00',NULL,4,4,'07:08:30'),(5,'JKL012','11:45:00','16:00:00',5,5,'04:15:00');
/*!40000 ALTER TABLE `parking_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger` (
  `passenger_id` int NOT NULL,
  `first_name` varchar(400) DEFAULT NULL,
  `last_name` varchar(400) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `nationality` varchar(400) DEFAULT NULL,
  `passport_number` bigint NOT NULL,
  `email` varchar(400) DEFAULT NULL,
  `phone_number` bigint NOT NULL,
  `street_number` varchar(50) NOT NULL,
  `city` varchar(400) NOT NULL,
  `country_of_origin` varchar(400) NOT NULL,
  `frequent_flyer_number` bigint NOT NULL,
  `seat_preference` varchar(40) NOT NULL,
  `meal_preference` varchar(400) NOT NULL,
  `special_needs` varchar(400) DEFAULT NULL,
  `emergency_contact` varchar(400) DEFAULT NULL,
  `flight_number` int NOT NULL,
  `status_passenger` tinyint DEFAULT NULL,
  `booking_number` bigint NOT NULL,
  PRIMARY KEY (`passenger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (1,'John','Doe','1990-01-01','American',123456789,'johndoe@email.com',5551234567,'123 Main St','New York','USA',987654321,'Window','Vegetarian',NULL,'Jane Doe',1,1,1),(2,'Jane','Doe','1992-02-02','British',987654321,'janedoe@email.com',5552345678,'456 Market St','London','UK',456789012,'Aisle','Kosher','Wheelchair assistance','John Doe',2,1,2),(3,'Juan','Gonzalez','1985-03-03','Mexican',2468101214,'juangonzalez@email.com',5553456789,'789 5th Ave','Mexico City','Mexico',369121518,'Middle','Gluten-free',NULL,'Maria Gonzalez',3,1,3),(4,'Hiroshi','Nakamura','1995-04-04','Japanese',135791113,'hirosnak@email.com',5554567890,'1010 Yamato Rd','Tokyo','Japan',258369147,'Window','Vegetarian','Hearing-impaired','Yuko Nakamura',4,0,4),(5,'Maria','Santos','1980-05-05','Brazilian',2468135758,'mariasantos@email.com',5555678901,'1234 Copacabana Ave','Rio de Janeiro','Brazil',753951284,'Aisle','Halal',NULL,'Joao Santos',5,1,5);
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL,
  `ticket_id` int NOT NULL,
  `price` double NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `payment_status` varchar(10) NOT NULL,
  `parking_tickets_id` int DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `parking_tickets_id` (`parking_tickets_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`parking_tickets_id`) REFERENCES `parking_tickets` (`parking_tickets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,20.5,'Credit Card','Paid',1),(2,2,15,'Debit Card','Paid',2),(3,3,10.25,'Cash','Paid',3),(4,4,5.75,'Credit Card','Pending',4),(5,5,12,'Debit Card','Paid',5);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pilot`
--

DROP TABLE IF EXISTS `pilot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pilot` (
  `pilot_id` int NOT NULL,
  `first_name` varchar(400) DEFAULT NULL,
  `last_name` varchar(400) DEFAULT NULL,
  `salary` int NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `nationality` varchar(400) DEFAULT NULL,
  `status_pilot` tinyint DEFAULT NULL,
  `flight_record` int NOT NULL,
  `total_flight_hours` int NOT NULL,
  `rating` double NOT NULL,
  `license_number_id` int NOT NULL,
  `airplane_id` int NOT NULL,
  PRIMARY KEY (`pilot_id`),
  KEY `airplane_id` (`airplane_id`),
  CONSTRAINT `pilot_ibfk_1` FOREIGN KEY (`airplane_id`) REFERENCES `airplane` (`airplane_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pilot`
--

LOCK TABLES `pilot` WRITE;
/*!40000 ALTER TABLE `pilot` DISABLE KEYS */;
INSERT INTO `pilot` VALUES (1,'John','Smith',70000,'1985-02-12','American',1,200,4000,4.5,1,1),(2,'Maria','Garcia',65000,'1990-07-21','Spanish',1,150,3000,4,2,2),(3,'David','Lee',80000,'1982-11-08','Korean',1,300,6000,4.8,3,3),(4,'Lena','Zhao',75000,'1995-04-05','Chinese',1,250,5000,4.3,4,4),(5,'Robert','Johnson',90000,'1980-12-28','British',1,400,8000,5,5,5);
/*!40000 ALTER TABLE `pilot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `the_airport`
--

DROP TABLE IF EXISTS `the_airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `the_airport` (
  `airport_id` int NOT NULL,
  `airport_name` text NOT NULL,
  `city` text NOT NULL,
  `country` text NOT NULL,
  `location` text NOT NULL,
  `elevation` int NOT NULL,
  `time_zone` time DEFAULT NULL,
  `website` text NOT NULL,
  `airport_staff_id` int NOT NULL,
  `gates` int NOT NULL,
  `counter_id` int NOT NULL,
  `waiting_room_id` int NOT NULL,
  `security_id` int NOT NULL,
  `parking_id` int NOT NULL,
  `additional_room_id` int NOT NULL,
  PRIMARY KEY (`airport_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `the_airport`
--

LOCK TABLES `the_airport` WRITE;
/*!40000 ALTER TABLE `the_airport` DISABLE KEYS */;
INSERT INTO `the_airport` VALUES (1,'Sarajevo International Airport','Sarajevo','Bosnia and Herzegovina','Butmir',511,'02:00:00','https://www.sarajevo-airport.ba/',1,4,1,1,1,1,1);
/*!40000 ALTER TABLE `the_airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `ticket_id` int NOT NULL,
  `airline_id` int NOT NULL,
  `class` text NOT NULL,
  `seat_number` int NOT NULL,
  `departure_date` datetime DEFAULT NULL,
  `arrival_date` datetime DEFAULT NULL,
  `departure_airport` varchar(50) DEFAULT NULL,
  `arrival_airport` varchar(50) NOT NULL,
  `ticket_price` decimal(14,0) NOT NULL,
  `currency` varchar(5) NOT NULL,
  `payment_method` text NOT NULL,
  `coupon_code` int NOT NULL,
  `refound_amount` int NOT NULL,
  `ticket_status` tinyint DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `ticket_type` text NOT NULL,
  `counter_id` int NOT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `counter_id` (`counter_id`),
  KEY `airline_id` (`airline_id`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`counter_id`) REFERENCES `counter` (`counter_id`),
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`airline_id`) REFERENCES `airline` (`airline_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,1,'Economy',25,'2023-06-01 08:00:00','2023-06-01 10:00:00','LAX','SJJ',200,'USD','Credit Card',789,50,1,'2023-05-06','One-way',1),(2,2,'Business',10,'2023-07-01 12:00:00','2023-07-01 16:00:00','SFO','SJJ',500,'USD','Paypal',123,100,0,'2023-05-06','Round-trip',2),(3,3,'First',1,'2023-08-01 14:00:00','2023-08-02 08:00:00','JFK','SJJ',1000,'USD','Credit Card',456,200,1,'2023-05-06','One-way',3),(4,4,'Economy',30,'2023-09-01 09:00:00','2023-09-01 12:00:00','SEA','SJJ',150,'USD','Credit Card',789,25,0,'2023-05-06','One-way',4),(5,5,'Business',15,'2023-10-01 15:00:00','2023-10-02 06:00:00','DEN','SJJ',800,'USD','Paypal',123,200,1,'2023-05-06','Round-trip',5);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waiting_room`
--

DROP TABLE IF EXISTS `waiting_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `waiting_room` (
  `waiting_room_id` int NOT NULL,
  `location` varchar(50) NOT NULL,
  `capacity` int NOT NULL,
  `amenities` varchar(200) NOT NULL,
  `availability` varchar(200) NOT NULL,
  `additional_info` varchar(200) NOT NULL,
  `type_of_wr` varchar(50) NOT NULL,
  `airport_id` int NOT NULL,
  PRIMARY KEY (`waiting_room_id`),
  KEY `airport_id` (`airport_id`),
  CONSTRAINT `waiting_room_ibfk_1` FOREIGN KEY (`airport_id`) REFERENCES `the_airport` (`airport_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waiting_room`
--

LOCK TABLES `waiting_room` WRITE;
/*!40000 ALTER TABLE `waiting_room` DISABLE KEYS */;
INSERT INTO `waiting_room` VALUES (1,'Gate A1',50,'Wi-Fi, charging stations, comfortable seating','Open 24/7','Family-friendly area','Basic',1),(2,'Gate B2',30,'Wi-Fi, charging stations, reclining chairs','Open from 8am to 10pm','Quiet zone','Premium',1),(3,'Gate C3',40,'Wi-Fi, charging stations, TV, snacks','Open from 6am to 10pm','Business center','Business',1),(4,'Gate D4',25,'Wi-Fi, charging stations, newspapers','Open from 8am to 8pm','No children under 12 allowed','Exclusive',1),(5,'Gate E5',20,'Wi-Fi, charging stations, massage chairs','Open from 9am to 9pm','Bookable for private events','Premium',1);
/*!40000 ALTER TABLE `waiting_room` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-07  9:26:51
