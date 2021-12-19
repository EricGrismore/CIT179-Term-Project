/*Task #1 
Use AP;
Select * Into InvoiceCopy
From Invoices;

Use AP;
Drop Table InvoiceCopy;

Select InvoiceID, InvoiceNumber, InvoiceTotal Into InvoiceCopy
From Invoices;

Select * From InvoiceCopy;

Alter Table InvoiceCopy
Add Constraint PK_ID Primary Key(InvoiceID);

Task #2

Select InvoiceID, InvoiceDate, PaymentTotal, CreditTotal, InvoiceTotal Into PaidInvoice
From Invoices
Where InvoiceTotal-PaymentTotal-CreditTotal=0;

Select * From PaidInvoice;

Task 3#

Drop Database testDB;

Create Database testDB;

Use testDB;
Select * Into customers
From Northwind.dbo.Customers
Where 1=0;

Alter Table customers
Add Constraint PK_ID Primary Key(CustomerID);

Task #4

INSERT INTO customers Values ('abc12', 'ABC Warehouse', 'Frank Furter', '100 Ventura Blvd', 'Traverse City', 'MI', '49696', 'USA', '(231)-999-1234', 'NULL');

INSERT INTO customers(CustomerID, CompanyName)VALUES('xyz10', 'Berthas Bakery');

INSERT INTO customers VALUES
('az99','Pappa Johns','Jenny Jones','General Manager','5 Airport Drive', 'Traverse City', 'MI','49696','USA','(231)-777-1234','NULL'),
('bb2','Costco','Erin Rodriguez','Manager','110 Airport Drive', 'Traverse City', 'MI','49696','USA','(231)-999-9999','NULL'),
('cbc44','TJ Maxx','Amy Juarez','General Manager','102 Ventura Blvd', 'Traverse City', 'MI','49696','USA','(231)-515-1234','NULL');

Task #5

Insert Into customers
Select * From Nothwind.dbo.customers
Where Northwind.dbo.customers.Country='USA';

Select * From customers;

Task #6

Use testDB;
Update customers
Set ContactName='Jill', ContactTitle='Owner', Address='123 Main Street', City='Traverse City', Region='MI', PostalCode='49696', Country='USA', Phone='(231)222-3333'
Where customerID='xyz10';

Select * From customers;

Alter Table customers
Drop Column Fax;
Alter Table customers
Add email varchar(30) NULL;

Use testDB;

Update customers
Set email='frankie@abcwarehouse.com'
Where CustomerID='abc12';

Update customers
Set email='JYorres@stopnshop.net'
Where CustomerID='LETSS';

Update customers
Set email='management@whiteclover.com'
Where CustomerID='WHITC';

Update customers
Set email='bertha@berthasbakery.net'
Where CustomerID='xyz10';

Update customers
Set email='bite@rattlesnakecanyon.com'
Where CustomerID='RATTC';


Delete customers
Where Region='WY';

Task #7

Select * Into ForeignCustomers
From Northwind.dbo.Customers AS NWC
Where NWC.Country<>'USA';

Merge Into customers AS C
Using ForeignCustomers AS FC ON C.CustomerID = FC.CustomerID
When MATCHED THEN
Update SET
C.CompanyName = FC.CompanyName,
C.ContactName = FC.ContactName,
C.ContactTitle=FC.ContactTitle,
C.Address=FC.Address,
C.City=FC.City,
C.Region=FC.Region,
C.PostalCode=FC.PostalCode,
C.Country=FC.Country,
C.Phone=FC.Phone
When NOT MATCHED THEN
Insert(CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone)
Values(FC.CustomerID, FC.CompanyName, FC.ContactName, FC.ContactTitle, FC.Address, FC.City, FC.Region, FC.PostalCode, FC.Country, FC.Phone);

Select * From customers;*/