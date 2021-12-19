/*
EXTRA CREDIT


Use AP;
SELECT VendorState, VendorName, COUNT(*), SUM(InvoiceTotal) AS InvoiceTotal
FROM Invoices
JOIN Vendors ON Invoices.VendorID = Vendors.VendorID
GROUP BY VendorState, VendorName WITH ROLLUP;



USE AP;
SELECT VendorState, VendorName, COUNT(*) AS InvoiceCount,
SUM(InvoiceTotal) AS InvoiceTotal
FROM Invoices
JOIN Vendors ON Invoices.VendorID = Vendors.VendorID
GROUP BY VendorState, VendorName WITH CUBE;


USE AP;
SELECT VendorState, VendorCity, COUNT(*) AS InvoiceCount,
SUM(InvoiceTotal) AS InvoiceTotal
FROM Invoices
JOIN Vendors ON Invoices.VendorID = Vendors.VendorID
GROUP BY VendorState, VendorCity WITH CUBE;



USE AP;
SELECT VendorState, VendorCity, COUNT(*) AS QtyVendors
FROM Vendors
--GROUP BY VendorState, VendorCity WITH ROLLUP
--GROUP BY VendorState, VendorCity WITH CUBE
GROUP BY GROUPING SETS(VendorState, (VendorState,VendorCity))
ORDER BY VendorState DESC, VendorCity DESC;



USE AP;
Select VendorID, VendorState,
COUNT(VendorID) OVER (PARTITION BY VendorState ORDER BY VendorState, VendorID) AS 'Total Vendors per State'
FROM Vendors;



USE AP;
Select VendorID, VendorState,
COUNT(VendorID) OVER (ORDER BY VendorState, VendorID) AS 'Total Vendors per State'
FROM Vendors;

*/