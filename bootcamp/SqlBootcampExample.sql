DROP DATABASE IF EXISTS SqlBootcampExample;
CREATE DATABASE SqlBootcampExample;
use SqlBootcampExample;

CREATE TABLE State (
	Code nvarchar(2) not null primary key,
    Name nvarchar(50) not null
);

CREATE TABLE Customer (
	ID int not null primary key auto_increment,
	Name nvarchar(50) not null,
	City nvarchar(50) not null,
	State nvarchar(2) not null,
	Sales decimal(18,0) not null,
	Active bit not null,
    FOREIGN KEY (State) REFERENCES State(Code)
);
    
Insert State (Code, Name) Values ('AL', 'Alabama');
Insert State (Code, Name) Values ('CA', 'California');
Insert State (Code, Name) Values ('HI', 'Hawaii');
Insert State (Code, Name) Values ('NJ', 'New Jersey');
Insert State (Code, Name) Values ('NV', 'Nevada');
Insert State (Code, Name) Values ('OH', 'Ohio');
Insert State (Code, Name) Values ('TX', 'Texas');
Insert State (Code, Name) Values ('WA', 'Washington');

Insert Customer (Name, City, State, Sales, Active) Values ('Acme, inc.','Jersey City','NJ',14381891,1);
Insert Customer (Name, City, State, Sales, Active) Values ('Widget Corp','Seattle','WA',97865829,1);
Insert Customer (Name, City, State, Sales, Active) Values ('123 Warehousing','Los Angeles','CA',77503710,1);
Insert Customer (Name, City, State, Sales, Active) Values ('Demo Company','Columbus','OH',74647541,1);
Insert Customer (Name, City, State, Sales, Active) Values ('Smith and Co.','Honolulu','HI',36046590,1);
Insert Customer (Name, City, State, Sales, Active) Values ('Foo Bars','Fresno','CA',39912857,1);
Insert Customer (Name, City, State, Sales, Active) Values ('ABC Telecom','Birmingham','AL',31149083,1);
Insert Customer (Name, City, State, Sales, Active) Values ('Fake Brothers','Stockton','CA',31226191,1);
Insert Customer (Name, City, State, Sales, Active) Values ('QWERTY Logistics','Lubbock','TX',17226905,1);
Insert Customer (Name, City, State, Sales, Active) Values ('Demo, Inc.','Las Vegas','NV',69551557,1);

Insert into Customer (Name, City, State, Sales, Active) Values
	('Super Cool Computers', 'Cincinnati', 'OH', 51234, 1),
	('Target', 'Cincinnati', 'OH', 87655, 0);