USE master
GO
IF EXISTS (SELECT * FROM sys.databases WHERE Name='DreamWeaver')
DROP DATABASE DreamWeaver
GO
CREATE DATABASE DreamWeaver
GO
USE DreamWeaver
GO

--Tạo bảng dữ liệu khách hàng
CREATE TABLE Customer(
	CID varchar(10) PRIMARY KEY,
	CName varchar(40) NOT NULL,
	CAddress varchar(100) NOT NULL,
	Phone varchar(12) NOT NULL
);
--Tạo bảng dữ liệu sản phẩm
CREATE TABLE Product(
	PID int PRIMARY KEY,
	PName varchar(40)NOT NULL,
	Description varchar(100),
	Brand_Name varchar(30),
	Price money NOT NULL,
	InStore int NOT NULL
);
--Tạo bảng dữ liệu thẻ khách hàng
CREATE TABLE MemberShip( 
	MID int PRIMARY KEY,
	MPoint int,
	MGrade char(1) NOT NULL,
	DiscountRate decimal(2) NOT NULL,
	CID varchar(10),
		CONSTRAINT FK_MS_CID
		FOREIGN KEY (CID)
		REFERENCES Customer (CID)
		ON DELETE CASCADE,	
);
--Tạo bảng dữ liệu OrDER
CREATE TABLE Product_Customers( 
	Invoie_No int PRIMARY KEY,
	DateSold DATETIME NOT NULL,
	PID int,
	CID varchar(10),
	Price money NOT NULL,
	CONSTRAINT FK_PC_PID
		FOREIGN KEY (PID)
		REFERENCES Product (PID)
		ON DELETE CASCADE,
	CONSTRAINT FK_PC_CID
		FOREIGN KEY (CID)
		REFERENCES Customer (CID)
		ON DELETE CASCADE
);
--Tạo bảng dữ liệu bộ sưu tập:
CREATE TABLE Collections( 
	CollectionsID int PRIMARY KEY,
	CollectionsName varchar(50) NOT NULL,
	CollectionsTime DateTime NOT NULL,
	PID int,
	CONSTRAINT FK_Cls_PID
		FOREIGN KEY (PID)
		REFERENCES Product (PID)
		ON DELETE CASCADE
);
--Tạo bảng dữ liệu sản phẩm sale:
CREATE TABLE Sales( 
	SID int PRIMARY KEY,
	SName varchar(50) NOT NULL,
	STime DateTime NOT NULL,
	SAmount int NOT NULL,
	Price_Sale  money NOT NULL,
	PID int,
	CONSTRAINT FK_S_PID
		FOREIGN KEY (PID)
		REFERENCES Product (PID)
		ON DELETE CASCADE
);
--Tạo bảng dữ liệu nhân viên:
CREATE TABLE Employee( 
	EID varchar(50) PRIMARY KEY,
	EName varchar(50) NOT NULL,
	EPhone varchar(12) NOT NULL,
	EAddress varchar(100) NOT NULL,
);
--Tạo bảng dữ liệu tiền lương nhân viên:
CREATE TABLE Salary( 
	Payment_ID int PRIMARY KEY,
	Payment_Amount money NOT NULL,
	Payment_Date datetime NOT NULL,
	Payment_Peroid datetime NOT NULL,
	EID varchar(50)
	CONSTRAINT FK_Salary_EID
		FOREIGN KEY (EID)
		REFERENCES Employee (EID)
		ON DELETE CASCADE	
);
--Nhập dữ liệu:

--Nhập dữ liệu khách hàng:
INSERT INTO Customer VALUES (111,'Nguyen Van A','HP',842361527302);
INSERT INTO Customer VALUES (222,'Tran Thi B','HN',847261521102);
INSERT INTO Customer VALUES (333,'Bui Van C','YB',847261573302);
INSERT INTO Customer VALUES (444,'Duong Van D','HCM',847261512302);
INSERT INTO Customer VALUES (555,'Le Thi E','DN',847261327302);

--Nhập dữ liệu sản phẩm:

INSERT INTO Product  VALUES (9090,'Sơ mi công sở','sơ mi nam','Chanel',1000,230);
INSERT INTO Product  VALUES (9111,'Sơ mi nam','sơ mi nam','Chanel',2000,220);
INSERT INTO Product  VALUES (9222,'Sơ mi nữ','sơ mi nữ','Chanel',1400,240);
INSERT INTO Product  VALUES (9234,'Sơ mi công sở','sơ mi nữ','Chanel',1000,210);
INSERT INTO Product  VALUES (9241,'Sơ mi cộc tay','sơ mi nam','Chanel',1000,260);
INSERT INTO Product  VALUES (9314,'Polo nam','polo nam','Chanel',800,330);
INSERT INTO Product  VALUES (9555,'Polo nữ','polo nữ','Chanel',800,220);
INSERT INTO Product  VALUES (9666,'Váy công sở','nữ','Chanel',1600,240);

INSERT INTO Product  VALUES (8090,'Quần âu','quần âu sang trọng','Gucci',1000,230);
INSERT INTO Product  VALUES (8111,'Sơ mi nam','sơ mi nam','Gucci',1000,220);
INSERT INTO Product  VALUES (8222,'Sơ mi nữ','sơ mi nữ','Gucci',1500,240);
INSERT INTO Product  VALUES (8234,'Sơ mi công sở','sơ mi nữ','Gucci',1300,210);
INSERT INTO Product  VALUES (8241,'Polo váy nữ',' váy nữ','Gucci',300,260);
INSERT INTO Product  VALUES (8314,'Polo nam','polo nam','Gucci',800,330);
INSERT INTO Product  VALUES (8555,'Polo nữ','polo nữ','Gucci',800,220);
INSERT INTO Product  VALUES (8666,'Váy công sở','nữ','Gucci',1600,240);

INSERT INTO Product  VALUES (7090,'Quần âu','quần âu sang trọng','Hermes',1500,230);
INSERT INTO Product  VALUES (7111,'Sơ mi nam','sơ mi nam','Hermes',2100,220);
INSERT INTO Product  VALUES (7222,'Sơ mi nữ','sơ mi nữ','Hermes',2400,240);
INSERT INTO Product  VALUES (7234,'Sơ mi công sở','sơ mi nữ','Hermes',1000,210);
INSERT INTO Product  VALUES (7241,'Sơ mi cộc tay','sơ mi nam','Hermes',1000,260);
INSERT INTO Product  VALUES (7314,'Polo nam','polo nam','Hermes',1000,330);
INSERT INTO Product  VALUES (7555,'Polo nữ','polo nữ','Hermes',1000,220);
INSERT INTO Product  VALUES (7666,'Váy công sở','nữ','Hermes',1600,240);

INSERT INTO Product  VALUES (6090,'Sơ mi công sở','sơ mi nam','Zara',1000,230);
INSERT INTO Product  VALUES (6111,'Sơ mi nam','sơ mi nam','Zara',2000,220);
INSERT INTO Product  VALUES (6222,'Sơ mi nữ','sơ mi nữ','Zara',1400,240);
INSERT INTO Product  VALUES (6234,'Sơ mi công sở','sơ mi nữ','Zara',1000,210);
INSERT INTO Product  VALUES (6241,'Sơ mi cộc tay','sơ mi nam','Zara',1000,260);
INSERT INTO Product  VALUES (6314,'Polo nam','polo nam','Zara',800,330);
INSERT INTO Product  VALUES (6555,'Polo nữ','polo nữ','Zara',800,220);
INSERT INTO Product  VALUES (6666,'Váy công sở','nữ','Zara',1600,240);

INSERT INTO Product  VALUES (5090,'Váy dạ hội','nữ sang trọng','Prada',1000,230);
INSERT INTO Product  VALUES (5111,'Sơ mi nam','sơ mi nam','Prada',2000,220);
INSERT INTO Product  VALUES (5222,'Sơ mi nữ','sơ mi nữ','Prada',1400,240);
INSERT INTO Product  VALUES (5234,'Sơ mi công sở','sơ mi nữ','Prada',1000,210);
INSERT INTO Product  VALUES (5241,'Sơ mi cộc tay','sơ mi nam','Prada',1000,260);
INSERT INTO Product  VALUES (5314,'Polo nam','polo nam','Prada',800,330);
INSERT INTO Product  VALUES (5555,'Polo nữ','polo nữ','Prada',800,220);
INSERT INTO Product  VALUES (5666,'Váy công sở','nữ','Prada',1600,240);

-- Tạo dữ liệu cho Membership:

INSERT INTO MemberShip VALUES (911,NULL,'A',20,111);
INSERT INTO MemberShip VALUES (912,3000,'B',10,333);
INSERT INTO MemberShip VALUES (913,5000,'C',5,444);
INSERT INTO MemberShip VALUES (914,1000,'A',20,222);
INSERT INTO MemberShip VALUES (919,NULL,'D',0,555);

--Tạo dữ liệu hóa đơn :

INSERT INTO Product_Customers  VALUES (11001234,'2021-12-07','5090','222',1000);
INSERT INTO Product_Customers  VALUES (11002345,'2020-11-04','7222','333',2400);
INSERT INTO Product_Customers  VALUES (11003456,'2019-12-06','5666','111',1000);
INSERT INTO Product_Customers  VALUES (11004321,'2021-03-01','5555','555',800);
INSERT INTO Product_Customers  VALUES (11005432,'2021-11-24','8666','111',1600);
INSERT INTO Product_Customers  VALUES (11006543,'2021-11-13','9666','222',1600);
