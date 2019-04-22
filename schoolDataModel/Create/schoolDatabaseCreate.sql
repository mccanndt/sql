DROP DATABASE IF EXISTS sdb;
CREATE DATABASE sdb;
use sdb;

CREATE TABLE student (
	ID int not null primary key auto_increment,
	firstName nvarchar(50) not null,
    lastName nvarchar(50) not null,
    streetAddress nvarchar(50) not null,
    city nvarchar(50) not null,
    state nvarchar(2) not null,
    zip nvarchar(5) not null,
    birthdate date not null,
    phoneNumber nvarchar(12),
    email nvarchar(50) not null,
    SSN nvarchar(11) not null
);

CREATE TABLE course (
	ID int not null primary key auto_increment,
	number int not null,
    subject nvarchar(50) not null,
    name nvarchar(50) not null
);

CREATE TABLE enrollment (
	ID int not null primary key auto_increment,
	studentID int not null,
	courseID int not null,
	grade decimal(5,2),
    foreign key (studentID) references student(ID),
    foreign key (courseID) references course(ID)
);

CREATE TABLE instructor (
	ID int not null primary key auto_increment,
	courseID int not null,
    firstName nvarchar(50) not null,
    lastName nvarchar(50) not null,
    foreign key (courseID) references course(ID)
);

-- create a user and grant privileges to that user
CREATE USER IF NOT EXISTS sdb_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON sdb.* TO sdb_user@localhost;

Insert student values
	(1, 'Amber', 'Kidwell', '8909 Pineknoll Street', 'Sandusky', 'OH', '44870', '1900-01-01', '859-835-8988', 'hemmerlea2@gmail.com', '111-11-1111'),
    (2, 'Anna', 'Bengel', '591 Livingston Ave.', 'Bridgeport', 'CT', '06606', '1900-01-01', '513-382-6083', 'annambengel@gmail.com', '222-22-2222'),
    (3, 'Ben', 'Shepherd', '40 Marconi Ave.', 'Grand Blanc', 'MI', '48439', '1900-01-01', '207-322-1753', 'ben1shep1herd@gmail.com', '333-33-3333'),
    (4, 'Chase', 'Williams', '8691 Bradford St.', 'Durham', 'NC', '27703', '1900-01-01', '513-498-8547', 'chasewilliams98@gmail.com', '444-44-4444'),
    (5, 'Chris', 'Jackson', '8898 Division St.', 'Riverview', 'FL', '33569', '1900-01-01', '513-207-4329', 'cjax44@gmail.com', '555-55-5555'),
    (6, 'David', 'McCann', '7579 NE. Hanover St.', 'South El Monte', 'CA', '91733', '1900-01-01', '513-340-0175', 'mccanndt91@gmail.com', '666-66-6666'),
    (7, 'Denis', 'Zamorski', '342 Princeton Rd.', 'West Chicago', 'IL', '60185', '1900-01-01', '224-548-0047', 'deniszamorski1@gmail.com', '777-77-7777'),
    (8, 'Dmitry', 'Guzov', '42 W. Coffee Lane', 'Palos Verdes Peninsula', 'CA', '90274', '1900-01-01', '513-283-3222', 'dguzov@yahoo.com', '888-88-8888'),
    (9, 'Erin', 'Heinrich', '8353 Mayflower Circle', 'Randallstown', 'MD', '21133', '1900-01-01', '513-593-1666', 'schills@gmail.com', '999-99-9999'),
    (10, 'Jason', 'Darrah', '9485 Cleveland St.', 'Benton Harbor', 'MI', '49022', '1900-01-01', '513-667-6500', 'jasondarrah@gmail.com', '101-01-0101'),
    (11, 'Jonelle', 'Wehrman', '8182 West Oak Meadow St.', 'Hyde Park', 'MA', '02136', '1900-01-01', '513-477-9069', 'jonelle@starberry.us', '121-21-2121'),
    (12, 'Maria', 'Konerman', '584 Selby Ave.', 'Gallatin', 'TN', '37066', '1900-01-01', '513-212-5689', 'mlkonerman@gmail.com', '131-31-3131'),
    (13, 'Marianne', 'Linardos', '86 Pendergast St.', 'North Olmsted', 'OH', '44070', '1900-01-01', '513-785-8187', 'mlinardos.edu@gmail.com', '141-41-4141'),
    (14, 'Steven', 'Ross', '90 Marvon Lane', 'Baton Rouge', 'LA', '70806', '1900-01-01', '513-543-3150', 'stevenar2016@gmail.com', '151-51-5151');
Insert course values
	(1, 101, 'Math', 'First Grade Algebra'),
    (2, 101, 'Science', 'Only Cool Animals Zoology'),
    (3, 201, 'Math', 'Boring Calculus'),
    (4, 301, 'Science', 'Explosive Chemistry'),
    (5, 201, 'Science', 'Yup That''s Fire'),
    (6, 101, 'History', 'The Warrior Culture of Japan'),
    (7, 101, 'Art', 'Happy Little Accidents');
Insert instructor values
	(1, 7, 'Bob', 'Ross'),
    (2, 2, 'Ted', 'Bear'),
    (3, 1, 'Neil', 'Tyson'),
    (4, 3, 'Neil', 'Tyson'),
    (5, 4, 'Bill', 'Nye'),
    (6, 5, 'Bill', 'Nye'),
    (7, 6, 'Jackie', 'Chan');
Insert enrollment values
	(1, 6, 2, 50.25),
    (2, 3, 4, 60.75),
    (3, 8, 6, 80.88),
    (4, 11, 7, 90.00),
    (5, 1, 3, 90.99),
    (6, 4, 5, 100.00),
    (7, 6, 1, 12.34);