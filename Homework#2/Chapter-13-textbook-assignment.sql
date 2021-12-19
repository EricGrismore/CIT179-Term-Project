/*
Task #1 

USE AP;
GO
--Updateable View:
CREATE VIEW VI_view
AS
SELECT VendorName, InvoiceNumber, InvoiceDate, InvoiceTotal
FROM Vendors
JOIN Invoices ON Vendors.VendorID = Invoices.VendorID;
GO
--Limited Update View:
CREATE VIEW VI_limited_view
AS
SELECT VendorName, InvoiceNumber, InvoiceDate, InvoiceTotal
FROM Vendors
JOIN Invoices ON Vendors.VendorID = Invoices.VendorID
WITH CHECK OPTION;
GO


SELECT * FROM VI_limited_view;
SELECT * FROM VI_view;


CREATE VIEW OutstandingInvoices (Invoice#, Date, Total, Balance)
AS
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal,InvoiceTotal - PaymentTotal - CreditTotal
FROM Invoices
WHERE InvoiceTotal - PaymentTotal - CreditTotal > 0;


Select * From OutstandingInvoices;

Use AP;
GO
Create View Vendors_SW
AS
Select * FROM Vendors
Where VendorState IN('Ca', 'AZ', 'NV', 'NM');
GO
Select * From Vendors_SW;


Task #2

UPDATE VI_view
SET InvoiceDate=GETDate()
WHERE VendorName='IBM';


USE AP;
GO
CREATE VIEW VendorPayment
AS
SELECT VendorName, InvoiceNumber, InvoiceDate, PaymentDate, InvoiceTotal, CreditTotal, PaymentTotal
FROM Invoices
JOIN Vendors ON Invoices.VendorID = Vendors.VendorID
WHERE InvoiceTotal - PaymentTotal - CreditTotal > 0;
GO
Select * FROM VendorPayment;

USE AP;
GO
UPDATE VendorPayment
SET PaymentDate=GETDATE();
GO
UPDATE VendorPayment
SET PaymentTotal = 19351.18, PaymentDate = '2020-06-01'
WHERE VendorName = 'Malloy Lithographing Inc' AND InvoiceNumber = '0-2436';


Select * From VendorPayment;

Use AP;
GO
INSERT INTO Vendors_SW (VendorName, VendorCity, VendorState, VendorZipCode, DefaultTermsID, DefaultAccountNO)
Values('Kookoes Kandies', 'San Jose', 'CA', 95035, 2, 572);


SELECT * FROM Vendors_SW
WHERE VendorName='Internal Revenue Service';
GO
DELETE FROM Vendors_SW
WHERE VendorName='Internal Revenue Service';
GO


USE AP;
GO
ALTER VIEW Vendors_SW
AS
SELECT * FROM Vendors
WHERE VendorState IN ('CA','AZ','NV','NM','UT','CO');

USE AP;
GO
DROP VIEW OutstandingInvoices;


Task #4

Select [name], create_date, modify_date FROM sys.views;


Select [name], create_date, modify_date, [type_desc] FROM sys.key_constraints;
*/