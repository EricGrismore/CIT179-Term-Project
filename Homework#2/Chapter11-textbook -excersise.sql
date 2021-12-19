/*Task #1 
CREATE DATABASE New_AP;
CREATE DATABASE Test_AP;
CREATE DATABASE TestDB; 

Task #2
DROP DATABASE TestDB;

Task #3
USE Test_AP;
CREATE TABLE customers(
	id INT NOT NULL,
	fname VARCHAR (20) NOT NULL,
	lname VARCHAR (20) NOT NULL,
	address CHAR (25),
	phone varchar(10),
	PRIMARY KEY (id),
);

USE Test_AP
exec sp_columns customer;

SELECT * INTO Test_AP.dbo.Reps FROM Examples.dbo.Employees;
SELECT * FROM Test_AP.dbo.Reps;

Task #4
USE Test_AP;
DROP TABLE Customers;

Use Test_AP;
CREATE TABLE customers(
	ID int NOT NULL,
	LastName nvarchar(30) NULL,
	FirstName nvarchar(30) NULL,
	Addr nvarchar (60) NULL,
	City nvarchar (15) NULL,
	State nvarchar (15) NULL,
	Zip nvarchar (10) NULL,
	Phone nvarchar (24) NULL,
	PRIMARY KEY (ID)
);

USE Test_AP;
INSERT INTO customers 
SELECT * FROM Examples.dbo.Customers;

Task #5
USE Test_AP;
ALTER TABLE Reps
ADD Comission money DEFAULT(0) NOT NULL;

ALTER TABLE customers
ADD custType varchar(30)
ALTER TABLE customers
ADD companyName varchar(30);

ALTER TABLE customers
DROP COLUMN companyName;

ALTER TABLE customers
ALTER COLUMN custType int;

Task #6
USE AP;
CREATE INDEX IX_VendorID ON Invoices (VendorID);
CREATE INDEX IX_Invoices ON Invoices (InvoiceDate DESC, InvoiceTotal);

USE Test_AP;
CREATe INDEX idx_lastname ON Reps(LastName);

CREATE INDEX idx_name ON customers (LastName, FirstName);

USE AP;
CREATE INDEX idx_invoicesDateFilter ON Invoices(InvoiceDate DESC, InvoiceTotal)
Where InvoiceDate > '2016-02-01';

Task #7
USE New_AP;
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    PRIMARY KEY (ID),
    CONSTRAINT CHK_Age CHECK(Age >=18)
);
CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID) REFERENCES Persons(ID)
);

USE TEST_AP;
ALTER TABLE Reps
ADD CONSTRAINT PK_EmployeeID PRIMARY KEY(EmployeeID);

USE TEST_AP;
ALTER TABLE customers
ADD RepID int CONSTRAINT FK_Rep FOREIGN KEY(RepID) REFERENCES Reps(EmployeeID);

Use TEST_AP;
ALTER TABLE Reps
ADD CONSTRAINT chk_dept CHECK(DeptNo>=1 AND DeptNo<=6);


SELECT * INTO IllinoisCustomers FROM customers
WHERE State='IL';

ALTER TABLE ILLINOISCustomers
ADD CONSTRAINT chk_state CHECK(State='IL');*/