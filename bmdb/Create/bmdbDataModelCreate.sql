-- -----------------------------------------------------
-- Schema bmdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS bmdb;
CREATE SCHEMA IF NOT EXISTS bmdb;
USE bmdb;

-- -----------------------------------------------------
-- Table movie
-- -----------------------------------------------------
CREATE TABLE movie (
  ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Title NVARCHAR(100) NOT NULL,
  Rating NVARCHAR(5) NULL,
  Year YEAR NOT NULL,
  Director NVARCHAR(50) NOT NULL
);

-- -----------------------------------------------------
-- Table actor
-- -----------------------------------------------------
CREATE TABLE actor (
  ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  FirstName NVARCHAR(50) NOT NULL,
  LastName NVARCHAR(50) NOT NULL,
  Gender NVARCHAR(1) NOT NULL,
  Birthdate DATE NOT NULL
);

-- -----------------------------------------------------
-- Table genre
-- -----------------------------------------------------
CREATE TABLE genre (
  ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Name NVARCHAR(50) NOT NULL
);

-- -----------------------------------------------------
-- Table credit
-- -----------------------------------------------------
CREATE TABLE credit (
  ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  actorID INT NOT NULL,
  movieID INT NOT NULL,
  role NVARCHAR(50) NULL,
  FOREIGN KEY (actorID) REFERENCES actor(ID),
  FOREIGN KEY (movieID) REFERENCES movie(ID)
);

-- -----------------------------------------------------
-- Table moviegenre
-- -----------------------------------------------------
CREATE TABLE moviegenre (
  ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  movieID INT NOT NULL,
  genreID INT NOT NULL,
  FOREIGN KEY (movieID) REFERENCES movie(`ID`),
  FOREIGN KEY (genreID) REFERENCES genre(`ID`)
);

INSERT INTO movie VALUES
(1, 'How to Train Your Dragon', 'PG', 2010, 'Dean DeBlois'),
(2, 'The Lord of the Rings: The Fellowship of the Ring', 'PG-13', 2001, 'Peter Jackson'),
(3, 'Aquaman', 'PG-13', 2018, 'James Wan'),
(4, 'The Mule', 'R', 2018, 'Clint Eastwood'),
(5, '21 Jump Street', 'R', 2012, 'Phil Lord'),
(6, 'Blade', 'R', 1998, 'Stephen Norrington');

INSERT INTO actor VALUES
(1, 'Wesley', 'Snipes', 'M', '1962-07-31'),
(2, 'Jonah', 'Hill', 'M', '1983-12-20'),
(3, 'Channing', 'Tatum', 'M', '1980-04-26'),
(4, 'Clint', 'Eastwood', 'M', '1930-05-31'),
(5, 'Jason', 'Momoa', 'M', '1979-08-01'),
(6, 'Amber', 'Heard', 'F', '1986-04-22'),
(7, 'Ian', 'McKellen', 'M', '1939-05-25'),
(8, 'America', 'Ferrera', 'F', '1984-04-18');

INSERT INTO genre VALUES
(1, 'Adventure'),
(2, 'Comedy'),
(3, 'Crime'),
(4, 'Drama'),
(5, 'Fantasy'),
(6, 'Historical'),
(7, 'Historical fiction'),
(8, 'Horror'),
(9, 'Magical Realism'),
(10, 'Mystery'),
(11, 'Paranoid Fiction'),
(12, 'Philosophical'),
(13, 'Action'),
(14, 'Romance'),
(15, 'Saga'),
(16, 'Satire'),
(17, 'Science fiction'),
(18, 'Social'),
(19, 'Speculative'),
(20, 'Thriller'),
(21, 'Urban'),
(22, 'Western');

INSERT INTO credit VALUES
(1, 8, 1, 'Astrid (voice)'),
(2, 7, 2, 'Gandalf the Grey'),
(3, 6, 3, 'Mera'),
(4, 5, 3, 'Arthur Curry / Aquaman'),
(5, 4, 4, 'Earl Stone'),
(6, 3, 5, 'Officer Greg Jenko / Brad McQuaid'),
(7, 2, 5, 'Officer Morton Schmidt / Doug McQuaid'),
(8, 2, 1, 'Snotlout (voice)'),
(9, 1, 6, 'Blade');

INSERT INTO moviegenre VALUES
(1, 1, 1),
(2, 1, 5),
(3, 2, 1),
(4, 2, 5),
(5, 3, 1),
(6, 4, 3),
(7, 4, 4),
(8, 5, 13),
(9, 5, 2),
(10, 6, 8),
(11, 6, 13);