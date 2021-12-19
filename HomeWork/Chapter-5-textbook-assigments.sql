/*Task #1

Use AP;
Select MIN(InvoiceTotal-PaymentTotal-CreditTotal) As MinimumDue
From Invoices
Where InvoiceTotal-PaymentTotal-CreditTotal > 0;


Use ProductOrders;
Select MIN(UnitPrice) AS 'Minimum Unit Price'
From Items;


Task #2

USE AP;
SELECT MIN(InvoiceTotal - PaymentTotal - CreditTotal) AS MinimumDue,
MAX(InvoiceTotal - PaymentTotal - CreditTotal) AS MaximumDue
FROM Invoices
WHERE InvoiceTotal - PaymentTotal - CreditTotal > 0;


Use Examples;
Select Max(SalesTotal) As 'Highest Sales', MIN(SalesTotal) AS 'Lowest Sales'
From SalesTotals;


Task #3

Use Examples;
Select COUNT(CUSTID) AS 'Illinois Customers'
FROM Customers
Where CustState = 'IL';



Use AP;
Select MIN(VendorName) AS FirstVendor, MAX(VendorName) As LastVendor,COUNT(VendorName) AS NumberOfVendors
From Vendors;



USE Examples;
Select COUNT(*) AS 'ALL Customers'
FROM Customers;



Use Examples;
Select COUNT(InvestorID) AS [Number of Investors], MAX(NetGain) AS [Max Net Gain], MIN(NetGain) AS [Min Net Gain]
From Investors;



Use Examples;
Select COUNT(InvestorID) AS [Number of Investors], MAX(NetGain) AS [Max Net Gain], MIN(NetGain) AS [Min Net Gain], AVG(NetGain) AS [Average Gain]
From Investors;

Task #5 

USE AP;
Select SUM(InvoiceTotal) AS "Total Invoice"
From Invoices
Where InvoiceDate Between '2019-06-01' AND '2019-12-01';



USE AP;
SELECT COUNT(DISTINCT VendorID) AS '#Vendors', COUNT(VendorID) AS '#Invoices', AVG(InvoiceTotal) AS 'Invoice Average', SUM(InvoiceTotal) AS 'Invoice Total'
FROM Invoices
WHERE InvoiceDate > '2020-01-01';



Task #6 

Use AP;
Select VendorID, AVG(InvoiceTotal) AS [Invoice Average]
From Invoices
Group By VendorID
Order By AVG(InvoiceTotal) DESC;



USE AP;
SELECT VendorState, VendorCity, COUNT(*) AS InvoiceQty, AVG(InvoiceTotal) AS InvoiceAvg
FROM Invoices
JOIN Vendors ON Invoices.VendorID = Vendors.VendorID
GROUP BY VendorState, VendorCity
ORDER BY VendorState, VendorCity;



USE AP;
SELECT VendorState, VendorCity, COUNT(*) AS InvoiceQty, AVG(InvoiceTotal) AS InvoiceAvg
FROM Invoices
JOIN Vendors ON Invoices.VendorID = Vendors.VendorID
GROUP BY VendorState, VendorCity
Having AVG(InvoiceTotal) > 50
ORDER BY VendorState, VendorCity;



USE Examples;
SELECT SalesTotals.RepID, Max(SalesTotal) AS 'High Sales', MIN(SalesTotal) AS 'Low Sales'
FROM SalesTotals JOIN SalesReps ON SalesReps.RepID = SalesTotals.RepID
GROUP BY SalesTotals.RepID
HAVING Max(SalesTotal) > 500000 AND MIN(SalesTotal)>100000;

*/