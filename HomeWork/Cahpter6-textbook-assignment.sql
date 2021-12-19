/*Task #1

USE AP;
SELECT Vendors.VendorID, VendorName, VendorState
FROM Vendors LEFT JOIN Invoices ON Vendors.VendorID = Invoices.VendorID
WHERE Invoices.VendorID IS NULL;

USE AP;
SELECT DISTINCT VendorID FROM Invoices;

USE AP;
SELECT Vendors.VendorID, VendorName, VendorState
FROM Vendors 
WHERE VendorID NOT IN
		(Select Distinct VendorID FROM Invoices);

USE Northwind;
SELECT ProductID, ProductName, UnitPrice From Products
Where UnitPrice > (Select AVG(UnitPrice) From Products)
Order By ProductID;

USE Examples;
SELECT SalesReps.RepID, RepFirstName, RepLastName, SalesTotals.SalesTotal, SalesTotals.SalesYear
FROM SalesReps JOIN SalesTotals ON SalesReps.RepID = SalesTotals.RepID
WHERE SalesTotals.SalesTotal > (Select AVG(SalesTotal) FROM SalesTotals);

Task #2

Use Northwind
Select ProductName
From Products
Where ProductID = ALL
		(Select ProductID
		From[Order Details]
		Where Quantity=0);

Use Northwind;
Select ProductName, ProductID
From Products
Where ProductID = SOME
    (Select ProductID From [Order Details]
    Where Quantity>100);

Task #3

Use AP;
Select Distinct VendorName,
	(Select MAX(InvoiceDate) From Invoices
	Where Invoices.VendorID = Vendors.VendorID) AS [Most Recent Invoice]
From Vendors
Order By [Most Recent Invoice] DESC;


Use Northwind;
Select ProductName, UnitOrdered=
					(Select SUM([Order Details].Quantity)
					From [Order Details]
					Where [Order Details]. ProductID = Products.ProductID)
FROM Products;


Task #4

USE Northwind;
SELECT SupplierID, CompanyName, Phone
FROM Suppliers
Where EXISTS
        (SELECT ProductName FROM Products
        WHERE SupplierId = Suppliers.supplierId AND UnitPrice < 20);


USE AP;
SELECT VendorID, InvoiceNumber, InvoiceTotal
FROM Invoices AS Inv_Main
ORDER BY VendorID, InvoiceTotal;

SELECT AVG(InvoiceTotal)
FROM Invoices AS Inv_Sub

Select VendorID, InvoiceNumber, InvoiceTotal
FROM Invoices AS Inv_Main
Where InvoiceTotal > (Select AVG(InvoiceTotal)
					From Invoices AS Inv_Sub
					Where Inv_Sub.VendorID = Inv_Main.VendorID)
Order By VendorID, InvoiceTotal;


Task #5

USE AP;
WITH Summary AS (
    SELECT VendorState, VendorName, InvoiceTotal
    FROM Invoices JOIN Vendors ON Invoices.VendorID = Vendors.VendorID
)
SELECT Summary.VendorState, Summary.VendorName, Summary.InvoiceTotal
FROM Summary
WHERE Summary.InvoiceTotal > 1000
ORDER BY Summary.VendorState;



Use Northwind;
With Emp_CTE AS (
		Select EmployeeID, LastName, Region, ReportsTo
		From Employees
		Where ReportsTo IS NULL
		Union ALL
		Select e.EmployeeID, e.LastName, e.Region, e.ReportsTo
		From Employees e
		INNER JOIN Emp_CTE ecte ON ecte.EmployeeID = e.ReportsTo
)
Select * From Emp_CTE;


Use Northwind;
With Emp_CTE AS (
		Select EmployeeID, LastName, Region, ReportsTo
		From Employees
		Where ReportsTo IS NULL
		Union ALL
		Select e.EmployeeID, e.LastName, e.Region, e.ReportsTo
		From Employees e
		INNER JOIN Emp_CTE ecte ON ecte.EmployeeID = e.ReportsTo
)
Select Emp_CTE.ReportsTo, COUNT(Emp_CTE.ReportsTo) AS 'Number of Employees'
From Emp_CTE
Group By Emp_CTE.ReportsTo;
*/