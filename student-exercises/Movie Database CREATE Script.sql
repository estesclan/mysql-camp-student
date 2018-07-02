DROP DATABASE  IF EXISTS `movies`;

CREATE DATABASE `movies`; 
USE movies;


CREATE TABLE `actor` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lastName` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `firstName` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `birthPlaceCity` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `gender` enum('M','F') COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO `actor` 
VALUES (1,'Nicholson','Jack','Atlantic City','M'),
(2,'Hamm','John','St. Louis','M'),
(3,'Del Toro','Benicio','San Germán','M'),
(4,'Oldman','Gary','London','M'),
(5,'Lewis','Daniel Day','London','M'),
(6,'Winger','Debra','Cleveland','F'),
(7,'Spacek','Sissy','Quitman','F'),
(8,'Spacey','Kevin','Nuptune, NJ','M'),
(9,'Freeman','Morgan','Memphis','M'),
(10,'Hackman','Gene','San Bernardino','M'),
(11,'Freeman','Morgan','Memphis','M'),
(12,'Damon','Matt','Cambridge','M'),
(13,'Wahlberg','Mark',' Dorchester','M'),
(14,'DiCaprio','Leonardo',' Los Angeles','M'),
(15,'Hanks','Tom','Concord','M'),
(16,'Shelley','Duvall','Houston','F'),
(17,'Salley','Field','Pasadena','F'),
(18,'Murray','Bill','Chicago','M');

CREATE TABLE `director` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `born` year(4) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;


INSERT INTO `director` 
VALUES 
(1,'STEVEN SPIELBERG',1946),
(2,'Clint Eastwood',1930),
(3,'Martin Scorsese',1942),
(4,'Wes Anderson',1969);


CREATE TABLE `movie` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `year` year(4) NOT NULL,
  `rottenTomatoes` decimal(4,2) unsigned NOT NULL,
  `genre` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `runningTimeMinutes` smallint(10) NOT NULL,
  `boxOffice` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `directorID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_movie_director_idx` (`directorID`),
  CONSTRAINT `FK_movie_director` FOREIGN KEY (`directorID`) REFERENCES `director` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;


INSERT INTO `movie` VALUES 
(1,'Unforgiven',1992,96.00,'Western',131,120.00,1),
(2,'Royal Tennenbaums',2002,80.00,'Comedy',108,52.30,1),
(3,'Rushmore',1998,89.00,'Comedy',93,100.00,1),
(4,'The Departed',2006,90.00,'Drama',152,132.30,1),
(5,'Catch Me if you Can',2002,96.00,'Drama',140,164.40,1),
(6,'Lincoln',2012,90.00,'Drama',149,129.40,1),
(7,'Coal Miners Daughter',1980,88.00,'Drama',125,100.00,1),
(8,'The Revenant',2015,80.00,'Action',156,80.00,1),
(9,'The Usual Suspects',1995,89.00,'Mystery',105,100.00,1),
(10,'The Shining',1980,86.00,'Horror',145,100.00,1),
(11,'Forest Gump',1994,72.00,'Comedy',142,330.00,1),
(12,'Harry Potter and the Deathly Hallows - Part 2',2011,96.00,'Action',131,381.00,1);


CREATE TABLE `role` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `actorID` int(10) unsigned NOT NULL,
  `movieID` int(10) unsigned NOT NULL,
  roleName varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_role_actor_idx` (`actorID`),
  KEY `FK_role_movie_idx` (`movieID`),
  CONSTRAINT `FK_role_actor` FOREIGN KEY (`actorID`) REFERENCES `actor` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_role_movie` FOREIGN KEY (`movieID`) REFERENCES `movie` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) 