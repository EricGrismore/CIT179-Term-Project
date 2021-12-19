
/*
Create DataBase myBuisnessOrder;

GO

Use myBuisnessOrder;
Create Table Zipcode(
	ZipCodeID int NOT NULL,
	City varchar(30) NOT NULL,
	State varchar(30) NOT NULL,
	PRIMARY KEY(ZipCodeID)
);

GO
Create Table Inventory(
	GeodeID int NOT NULL,
	GeodeType varchar(30) NOT NULL, 
	Size varchar(10),
	PricePerSize money,
	PRIMARY KEY(GeodeID)
);
--GO
--Create Table Shipping(
--	ShipperID int NOT NULL,
--	MuseumName varchar(30),
--	Primary Key(ShipperID)
--);
GO
Create Table Museum(         
	MuseumID int NOT NULL,
	--ZipCodeID int NOT NULL,
	ZipCodeID int,
	MuseumName varchar(30) NOT NULL,
	StreetAddress varchar(30), 
	PRIMARY KEY(MuseumID)
);
GO 
Create Table Owner(				
	OwnerID int NOT NULL,
	--ZipCodeID int NOT NULL,
	ZipCodeID int,
	FirstName varchar(20) NOT NULL,
	LastName varchar(20) NOT NULL,
	PRIMARY KEY(OwnerID)
);


GO
Create Table Buyer(				
	BuyerID int NOT NULL,
	--ZipCodeID int NOT NULL,
	ZipCodeID int,
	FirstN varchar(20) NOT NULL,
	LastN varchar(20) NOT NULL
	PRIMARY KEY(BuyerID)
);

GO
Create Table Exhibits(			
	ExhibitID int NOT NULL,
	MuseumID int NOT NULL,
	GeodeID int NOT NULL,
	--OwnerID int NOT NULL
	Primary Key (ExhibitID)
);

GO
Create Table Orders(		
	OrderID int NOT NULL,
	OwnerID int NOT NULL,
	BuyerID int NOT NULL,
	OrderDate varchar NOT NULL
	Primary Key(OrderID)
);

GO
Create Table OrderDetail(		
	ItemID int NOT NULL,
	OrderID int NOT NULL,
	GeodeID int NOT NULL,
	--ShipperID int NOT NULL,
	Qty varchar(2),
	ShipDate varchar(20),
	Primary Key(ItemID)
);


Use myBuisnessOrder;


ALTER TABLE Museum With Check
ADD Constraint FK_ZipCode FOREIGN KEY(ZipCodeID) References ZipCode(ZipCodeID)
ON UPDATE CASCADE
GO

ALTER TABLE Owner With Check
ADD Constraint FK_ZipCode2 FOREIGN KEY(ZipCodeID) References ZipCode(ZipCodeID)
ON UPDATE CASCADE
GO

ALTER TABLE Buyer With Check  
ADD Constraint FK_ZipCode3 FOREIGN KEY(ZipCodeID) References ZipCode(ZipCodeID)
ON UPDATE CASCADE
GO

ALTER TABLE Exhibits With Check			
ADD Constraint FK_MuseumID FOREIGN KEY(MuseumID) References Museum(MuseumID)
ON UPDATE CASCADE
GO

ALTER TABLE Exhibits With Check			
ADD Constraint FK_GeodeID FOREIGN KEY(GeodeID) References Inventory(GeodeID)
ON UPDATE CASCADE
GO

--ALTER TABLE Exhibits With Check			
--ADD Constraint FK_OwnerID FOREIGN KEY(OwnerID) References Owner(OwnerID)
--ON UPDATE CASCADE
--GO

ALTER TABLE Orders With Check		
ADD Constraint FK_BuyerID FOREIGN KEY(BuyerID) References Buyer(BuyerID)
ON UPDATE CASCADE
GO

ALTER TABLE Orders With Check		
ADD Constraint FK_OwnerID FOREIGN KEY(OwnerID) References Owner(OwnerID)
ON UPDATE NO ACTION
GO

ALTER TABLE OrderDetail With Check		
ADD Constraint FK_OrderID FOREIGN KEY(OrderID) References Orders(OrderID)
ON UPDATE CASCADE
GO

ALTER TABLE OrderDetail With Check			
ADD Constraint FK_Geode FOREIGN KEY(GeodeID) References Inventory(GeodeID)
ON UPDATE CASCADE
GO

--ALTER TABLE OrderDetail With Check
--ADD Constraint FK_Shipping FOREIGN KEY(ShipperID) References Shipping(ShipperID)
--ON UPDATE CASCADE
--GO





Use myBuisnessOrder;
GO
Create Index idx_ZipCode ON Museum(ZipCodeID);
Go

Create Index idx_ZipCode2 ON Owner(ZipCodeID);
Go

Create Index idx_ZipCode3 ON Buyer(ZipCodeID);
Go

Create Index idx_Museum ON Exhibits(MuseumID);
Go

Create Index idx_Geode ON Exhibits(GeodeID);
Go

--Create Index idx_Owner ON Exhibits(OwnerID);
--Go

Create Index idx_Buyer ON Orders(BuyerID);
Go

Create Index idx_Owner_Order ON Orders(OwnerID);
Go
--Create Index idx_ZipCode ON Orders(BuyerID);
--Go

Create Index idx_Order ON OrderDetail(OrderID);
Go

Create Index idx_Geode ON OrderDetail(GeodeID);
Go

--Create Index idx_Shipper ON OrderDetail(ShipperID);
*/

select * from Orders


	