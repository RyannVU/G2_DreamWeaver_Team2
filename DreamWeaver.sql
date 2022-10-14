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
	CID varchar(20) PRIMARY KEY,
	CName varchar(40) NOT NULL,
	CAddress varchar(100) NOT NULL,
	Phone varchar(12) NOT NULL
);
GO

--Tạo bảng dữ liệu sản phẩm
CREATE TABLE Product(
	PID int PRIMARY KEY,
	PName varchar(40)NOT NULL,
	Description varchar(100),
	Brand_Name varchar(30) UNIQUE,
	Price money NOT NULL,
	InStore int NOT NULL
);
GO

--Tạo bảng dữ liệu thẻ khách hàng

CREATE TABLE MemberShip( 
	MID int PRIMARY KEY,
	MPoint int,
	MGrade char(1) NOT NULL,
	DiscountRate decimal(2) NOT NULL,
	CID varchar(20)
		CONSTRAINT FK_MS_CID
		FOREIGN KEY (CID)
		REFERENCES Customer (CID)
		ON DELETE CASCADE,	
);
GO

--Tạo bảng dữ liệu OrDER
CREATE TABLE Product_Customers( 
	Invoie_No int PRIMARY KEY,
	DateSold DATETIME NOT NULL,
	PID int,
	CID varchar(20)
	CONSTRAINT FK_PC_PID
		FOREIGN KEY (PID)
		REFERENCES Product (PID)
		ON DELETE CASCADE,
	CONSTRAINT FK_PC_CID
		FOREIGN KEY (CID)
		REFERENCES Customer (CID)
		ON DELETE CASCADE,
		
);
GO

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
GO

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
GO

--Tạo bảng dữ liệu nhân viên:
CREATE TABLE Employee( 
	EID varchar(50) PRIMARY KEY,
	EName varchar(50) NOT NULL,
	EPhone varchar(12) NOT NULL,
	EAddress varchar(100) NOT NULL,
);
GO

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
GO

--Nhập dữ liệu:

INSERT INTO