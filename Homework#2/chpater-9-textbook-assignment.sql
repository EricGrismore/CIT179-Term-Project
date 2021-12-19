/* Task #1
Use AP;
Select VendorName, VendorContactLName + ',' + LEFT(VendorContactFName, 1) + '.' AS ContactName, Right(RTRIM(VendorPhone), 8) AS Phone
FROM Vendors
Where SUBSTRING(VendorPhone, 2, 3) =559
Order By VendorName;



--BEFORE CHANGES
USE Examples;
SELECT Name
FROM StringSample;


---AFTER CHANGES
Use Examples;
Select Name, LEFT(Name, CHARINDEX(' ', Name) -1) AS FIRST, RIGHT(Name, LEN(Name) - CHARINDEX('', Name))AS Last
FROM StringSample;

Use Examples;
Select *
From Investors
Where InvestorID =CEILING(RAND( CHECKSUM( NEWID())) * 5);


Use Examples;
Select LastName, SUM(ROUND(Investments, 0)) AS Investments, SUM(ROUND(NetGain, 0)) AS GAIN, SUM(ROUND(Investments+NetGain, 0)) AS TotalInvestment
From Investors
GROUP BY LastName WITH ROLLUP

Task #3

Use Examples;
Select VendorID, InvoiceID, MONTH(InvoiceDueDate) AS [MONTH DUE], DAY(InvoiceDueDate) AS [DAY DUE]
From ActiveInvoices;


Use Examples;
Select * FROM DateSample;
WHERE MONTH(StartDate) = 10 AND DAY(StartDate) = 28 AND YEAR(StartDate) = 2019;  


Task #4 

Use AP;
Select InvoiceNumber, TermsID,
CASE TermsID
WHEN 1 THEN 'Net due 10 days'
WHEN 2 THEN 'Net due 20 days'
WHEN 3 THEN 'Net due 30 days'
WHEN 4 THEN 'Net due 60 days'
WHEN 5 THEN 'Net due 90 days'
END AS Terms
FROM Invoices;


Use AP;
Select InvoiceNumber, InvoiceTotal, InvoiceDate, InvoiceDueDate, CASE
When DATEDIFF(day, InvoiceDueDate, GETDATE()) > 30 THEN 'Over 30 days past due'
When DATEDIFF(day, InvoiceDueDate, GETDATE()) > 0 THEN '1 to 30 days past due'
Else 'Current' END AS Status
From Invoices
Where InvoiceTotal - PaymentTotal - CreditTotal > 0;


INSERT INTO Invoices VALUES(10,'10000',GETDATE()-30,5000,200,0,5,GETDATE()-20,GETDATE()-10);
INSERT INTO Invoices VALUES(20,'11000',GETDATE()-20,5000,200,0,5,GETDATE()-10,GETDATE());
INSERT INTO Invoices VALUES(30,'12000',GETDATE(),5000,200,0,5,GETDATE()+30,GETDATE()+30);
INSERT INTO Invoices VALUES(40,'13000',GETDATE(),5000,200,0,5,GETDATE(),GETDATE());


Use AP;
Select InvoiceNumber, InvoiceTotal, InvoiceDate, InvoiceDueDate,
CASE
WHEN DATEDIFF(day, InvoiceDueDate, GETDATE()) > 30 THEN 'Over 30 days past due'
WHEN DATEDIFF(day, InvoiceDueDate, GETDATE()) > 0 THEN '1 to 30 days past due'
ELSE 'Current' END AS Status
From Invoices
Where InvoiceTotal-PaymentTotal-CreditTotal>0;


Use Examples;
Select VendorID, IIF(CreditTotal>500,'Premier','Normal') AS CustomerType
From ActiveInvoices;


Use Examples;
Select VendorID, YTDPurchases, LastYTDPurchases,
IIF(LastYTDPurchases>YTDPurchases, 'Red Flag', ' ') AS [Need To Contact],
LEFT(VendorContactFName, 1) + '. ' + VendorContactLName AS Contact,
LTRIM(RTRIM(VendorPhone)) AS Phone
FROM Vendors
ORDER BY 'Need to Contact' DESC;


USE AP;
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal,
CHOOSE(TermsID, '10 days', '20 days', '30 days', '60 days', '90 days') AS NetDue
FROM Invoices
WHERE InvoiceTotal - PaymentTotal - CreditTotal > 0;


Use Examples;
Select EmployeeID,
Choose(RIGHT(ProjectNo, 1), 'Marketing Call System', 'AP System', 'Warehouse Tracking', 'Salesrep Earnings', 'NA') AS ProjectName
FROM Projects;

USE Examples;
CREATE TABLE dbo.wages  
(  
    emp_id        tinyint   NULL,  
    hourly_wage   decimal   NULL,  
    salary        decimal   NULL,  
    commission    decimal   NULL,  
    num_sales     tinyint   NULL  
);  
INSERT INTO dbo.wages (emp_id, hourly_wage, salary, commission, num_sales)  
VALUES (1, 10.00, NULL, NULL, NULL);  

INSERT INTO dbo.wages (emp_id, hourly_wage, salary, commission, num_sales)  
VALUES (2, 20.00, NULL, NULL, NULL);  

INSERT INTO dbo.wages (emp_id, hourly_wage, salary, commission, num_sales)  
VALUES (3, 30.00, NULL, NULL, NULL);  

INSERT INTO dbo.wages (emp_id, hourly_wage, salary, commission, num_sales)  
VALUES (4, 40.00, NULL, NULL, NULL);  

INSERT INTO dbo.wages (emp_id, hourly_wage, salary, commission, num_sales)  
VALUES (5, NULL, 10000.00, NULL, NULL);  

INSERT INTO dbo.wages (emp_id, hourly_wage, salary, commission, num_sales)  
VALUES (6, NULL, 20000.00, NULL, NULL);  

INSERT INTO dbo.wages (emp_id, hourly_wage, salary, commission, num_sales)  
VALUES (7, NULL, 30000.00, NULL, NULL);  

INSERT INTO dbo.wages (emp_id, hourly_wage, salary, commission, num_sales)  
VALUES (8, NULL, 40000.00, NULL, NULL);  

INSERT INTO dbo.wages (emp_id, hourly_wage, salary, commission, num_sales)  
VALUES (9, NULL, NULL, 15000, 3);  

INSERT INTO dbo.wages (emp_id, hourly_wage, salary, commission, num_sales)  
VALUES (10,NULL, NULL, 25000, 2);  

INSERT INTO dbo.wages (emp_id, hourly_wage, salary, commission, num_sales)  
VALUES (11, NULL, NULL, 20000, 6);  

INSERT INTO dbo.wages (emp_id, hourly_wage, salary, commission, num_sales)  
VALUES (12, NULL, NULL, 14000, 4);  


USE Examples
SELECT *
FROM Wages;


USE Examples;
SELECT emp_id, CAST(COALESCE(hourly_wage*40,salary, commission*num_sales) AS deciaml(10,2)) AS TotalSalary
FROM wages;


USE Examples;
SELECT emp_id, CAST(ISNULL(hourly_wage,0.00) AS deciaml(10,2)) AS Hourly, CAST(ISNULL(commission,0.00) AS deciaml(10,2)) AS Commission, CAST(ISNULL(salary,0.00) AS deciaml(10,2)) AS Salary
FROM Wages;


USE AP;
SELECT CASE
           WHEN GROUPING(VendorState) = 1 THEN 'State Total'
           ELSE VendorState
           END AS VendorState,
COUNT(*) AS QtyVendors
FROM Vendors
GROUP BY VendorState WITH ROLLUP;

*/