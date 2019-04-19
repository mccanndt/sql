-- -----------------------------------------------------
-- Schema prs
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS prs;
CREATE SCHEMA IF NOT EXISTS prs;
USE prs;

-- -----------------------------------------------------
-- Table user
-- -----------------------------------------------------
CREATE TABLE user (
  ID			INT 		NOT NULL 	AUTO_INCREMENT	PRIMARY KEY,
  UserName		VARCHAR(20)	NOT NULL,
  Password		VARCHAR(10) NOT NULL,
  FirstName		VARCHAR(20) NOT NULL,
  LastName		VARCHAR(20) NOT NULL,
  PhoneNumber	VARCHAR(12) NOT NULL,
  Email			VARCHAR(75) NOT NULL,
  IsReviewer	TINYINT(1)	NOT NULL,
  IsAdmin		TINYINT(1)	NOT NULL,
  IsActive		TINYINT(1)	NOT NULL	DEFAULT 1,
  DateCreated	DATETIME	NOT NULL	DEFAULT CURRENT_TIMESTAMP,
  DateUpdated	DATETIME	NOT NULL	DEFAULT CURRENT_TIMESTAMP	ON UPDATE CURRENT_TIMESTAMP,
  UpdatedByUser INT			NOT NULL	DEFAULT 1,
  CONSTRAINT uname UNIQUE (UserName)
);

-- -----------------------------------------------------
-- Table vendor
-- -----------------------------------------------------
CREATE TABLE vendor (
  ID			INT				NOT NULL	AUTO_INCREMENT	PRIMARY KEY,
  Code			VARCHAR(10)		NOT NULL,
  Name			VARCHAR(255)	NOT NULL,
  Address		VARCHAR(255)	NOT NULL,
  City			VARCHAR(255)	NOT NULL,
  State			VARCHAR(2)		NOT NULL,
  Zip			VARCHAR(5)		NOT NULL,
  PhoneNumber	VARCHAR(12)		NOT NULL,
  Email			VARCHAR(100) 	NOT NULL,
  IsPreApproved	TINYINT(1)		NOT NULL,
  IsActive		TINYINT(1)		NOT NULL	DEFAULT 1,
  DateCreated	DATETIME		NOT NULL	DEFAULT CURRENT_TIMESTAMP,
  DateUpdated	DATETIME		NOT NULL	DEFAULT CURRENT_TIMESTAMP	ON UPDATE CURRENT_TIMESTAMP,
  UpdatedByUser INT				NOT NULL	DEFAULT 1,
  CONSTRAINT vcode UNIQUE (Code)
);

-- -----------------------------------------------------
-- Table purchaserequest
-- -----------------------------------------------------
CREATE TABLE purchaserequest (
  ID					INT				NOT NULL	AUTO_INCREMENT	PRIMARY KEY,
  UserID				INT				NOT NULL,
  Description			VARCHAR(100)	NOT NULL,
  Justification			VARCHAR(255)	NOT NULL,
  DateNeeded			DATE			NOT NULL,
  DeliveryMode			VARCHAR(25)		NOT NULL,
  Status				VARCHAR(20)		NOT NULL,
  Total					DECIMAL(10,2)	NOT NULL,
  SubmittedDate			DATETIME		NOT NULL,
  ReasonForRejection	VARCHAR(100),
  IsActive				TINYINT(1)		NOT NULL	DEFAULT 1,
  DateCreated			DATETIME		NOT NULL	DEFAULT CURRENT_TIMESTAMP,
  DateUpdated			DATETIME		NOT NULL	DEFAULT CURRENT_TIMESTAMP	ON UPDATE CURRENT_TIMESTAMP,
  UpdatedByUser			INT				NOT NULL	DEFAULT 1,
  FOREIGN KEY (UserID) REFERENCES user(ID)
);

-- -----------------------------------------------------
-- Table product
-- -----------------------------------------------------
CREATE TABLE product (
  ID			INT				NOT NULL	AUTO_INCREMENT	PRIMARY KEY,
  VendorID		INT				NOT NULL,
  PartNumber	VARCHAR(50)		NOT NULL,
  Name			VARCHAR(150)	NOT NULL,
  Price			DECIMAL(10,2)	NOT NULL,
  Unit			VARCHAR(255),
  PhotoPath		VARCHAR(255),
  IsActive		TINYINT(1)		NOT NULL	DEFAULT 1,
  DateCreated	DATETIME		NOT NULL	DEFAULT CURRENT_TIMESTAMP,
  DateUpdated	DATETIME		NOT NULL	DEFAULT CURRENT_TIMESTAMP	ON UPDATE CURRENT_TIMESTAMP,
  UpdatedByUser INT				NOT NULL	DEFAULT 1,
  FOREIGN KEY (VendorID) REFERENCES vendor(ID),
  CONSTRAINT vendor_part UNIQUE (VendorID, PartNumber)
);

-- -----------------------------------------------------
-- Table purchaserequestlineitem
-- -----------------------------------------------------
CREATE TABLE purchaserequestlineitem (
  ID				INT			NOT NULL	AUTO_INCREMENT	PRIMARY KEY,
  PurchaseRequestID	INT			NOT NULL,
  ProductID			INT			NOT NULL,
  Quantity			INT			NOT NULL,
  IsActive			TINYINT(1)	NOT NULL	DEFAULT 1,
  DateCreated		DATETIME	NOT NULL	DEFAULT CURRENT_TIMESTAMP,
  DateUpdated		DATETIME	NOT NULL	DEFAULT CURRENT_TIMESTAMP	ON UPDATE CURRENT_TIMESTAMP,
  UpdatedByUser 	INT			NOT NULL	DEFAULT 1,
  FOREIGN KEY (PurchaseRequestID) REFERENCES purchaserequest(ID),
  FOREIGN KEY (ProductID) REFERENCES product(ID),
  CONSTRAINT req_pdt UNIQUE (PurchaseRequestID, ProductID)
);

-- -----------------------------------------------------
-- Insert users
-- -----------------------------------------------------
INSERT INTO user (ID, UserName, Password, FirstName, LastName, PhoneNumber, Email, IsReviewer, IsAdmin) VALUES 
(1,'SYSTEM','xxxxx','System','System','XXX-XXX-XXXX','system@test.com',1,1),
(2,'sblessing','login','Sean','Blessing','513-600-7096','sean@blessingtechnology.com',1,1),
(3,'dmccann','david','David','McCann','513-340-0175','mccanndt91@gmail.com',1,1),
(4,'reviewer','reviewer','Reviewer','Only','555-555-5555','change@me.com',1,0),
(5,'admin','admin','Admin','Only','555-555-5555','change@me.com',0,1);

-- -----------------------------------------------------
-- Insert vendors
-- -----------------------------------------------------
INSERT INTO vendor (ID, Code, Name, Address, City, State, Zip, PhoneNumber, Email, isPreApproved) VALUES 
(1,'BB-1001','Best Buy','100 Best Buy Street','Louisville','KY','40207','502-111-9099','geeksquad@bestbuy.com',1),
(2,'AP-1001','Apple Inc','1 Infinite Loop','Cupertino','CA','95014','800-123-4567','genius@apple.com',1),
(3,'AM-1001','Amazon','410 Terry Ave. North','Seattle','WA','98109','206-266-1000','amazon@amazon.com',0),
(4,'ST-1001','Staples','9550 Mason Montgomery Rd','Mason','OH','45040','513-754-0235','support@orders.staples.com',0),
(5,'MC-1001','Micro Center','11755 Mosteller Rd','Sharonville','OH','45241','513-782-8500','support@microcenter.com',0),
(6,'NE-1001','Newegg','17560 Rowland Street','Industry','CA','91748','800-390-1119','support@newegg.com',1),
(7,'OD-1001','Office Depot','275 Rivers Edge','Milford','OH','45150','513-831-2850','support@officedepot.com',0);

-- -----------------------------------------------------
-- Insert base products
-- -----------------------------------------------------
INSERT INTO product (ID,VendorID,PartNumber,Name,Price,Unit,PhotoPath) VALUES
(1,1,'ME280LL','iPad Mini 2',296.99,NULL,NULL),
(2,2,'ME280LL','iPad Mini 2',299.99,NULL,NULL),
(3,3,'105810','Hammermill Paper, Premium Multi-Purpose Paper Poly Wrap',8.99,'1 Ream / 500 Sheets',NULL),
(4,4,'122374','HammerMill® Copy Plus Copy Paper, 8 1/2\" x 11\", Case',29.99,'1 Case, 10 Reams, 500 Sheets per ream',NULL),
(5,4,'784551','Logitech M325 Wireless Optical Mouse, Ambidextrous, Black',14.99,NULL,NULL),
(6,4,'382955','Staples Mouse Pad, Black',2.99,NULL,NULL),
(7,4,'2122178','AOC 24-Inch Class LED Monitor',99.99,NULL,NULL),
(8,4,'2460649','Laptop HP Notebook 15-AY163NR',529.99,NULL,NULL),
(9,4,'2256788','Laptop Dell i3552-3240BLK 15.6\"',239.99,NULL,NULL),
(10,4,'IM12M9520','Laptop Acer Acer™ Aspire One Cloudbook 14\"',224.99,NULL,NULL),
(11,4,'940600','Canon imageCLASS Copier (D530)',99.99,NULL,NULL),
(12,5,'228148','Acer Aspire ATC-780A-UR12 Desktop Computer',399.99,NULL,'/images/AcerAspireDesktop.jpg'),
(13,5,'279364','Lenovo IdeaCentre All-In-One Desktop',349.99,NULL,'/images/LenovoIdeaCenter.jpg'),
(14,6,'N82E16824106004','Acer Predator XB271HU 27" WQHD IPS NVIDIA G-Sync Black/Red Gaming Monitor, 2560 x 1440 (2K)',599.99,NULL,NULL),
(15,6,'9SIAB2748G5663','Logitech M325 RF Wireless Optical 1000dpi Mouse, Black, 910-002974',16.99,NULL,NULL),
(16,7,'347005','Hammermill® Paper, Copy Plus MP, Letter Size Paper, 20 Lb,',64.99,'500 Sheets Per Ream, Case Of 10 Reams',NULL);