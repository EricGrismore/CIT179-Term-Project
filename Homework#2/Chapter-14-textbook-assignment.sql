/* Task #1

Use AP;
Declare @BigVendors table (VendorID int, VendorName varchar(50));
Insert @BigVendors 
Select VendorId, VendorName
From Vendors
Where VendorId IN(Select VendorID From Invoices Where InvoiceTotal > 5000);
Select * From @BigVendors;



Use AP;
Declare @MaxInvoice money, @MinInvoice money;
Declare @InvoiceCount int, @VendorIDVar int;
Set @VendorIDVar = 95;
SELECT @MinInvoice = MIN(InvoiceTotal),  @MaxInvoice =MAX(InvoiceTotal), @InvoiceCount = COUNT(*)
FROM Invoices WHERE VendorID = @VendorIDVar;
PRINT 'Number of invoices: ' + CONVERT(varchar,@InvoiceCount) + '.';
PRINT 'Maximum invoice is $' + CONVERT(varchar,@MaxInvoice,1) + '.';
PRINT 'Minimum invoice is $' + CONVERT(varchar,@MinInvoice,1) + '.';


Select InvoiceNumber AS 'Invoice#', InvoiceDate AS 'Date', InvoiceTotal AS 'Total', InvoiceTotal-PaymentTotal-CreditTotal AS 'Balance'
Into ##UnpaidInvoice
FROM Invoices
Where InvoiceTotal-PaymentTotal-CreditTotal>0
Order By Balance;


Select * From ##UnpaidInvoice;


Create Table #Employee(
	ID int PRIMARY KEY,
	FName varchar(50),
	LName varchar(50),
	SalaryType int);
Insert #Employee Values(1, 'Fred', 'Flinstone', 1);
Insert #Employee Values(2, 'Barney', 'Rubble', 2);
Insert #Employee Values(3, 'Wilma', 'Flinstone', 3);
Select ID, FName, LName, Choose(SalaryType, 'Hourly', 'Salary', 'Piecerate', 'Monthly', 'Biweekly', 'Yearly') FROM #Employee;



Task #2


IF OBJECT_ID('InvoiceCopy') IS NOT NULL
    DROP TABLE InvoiceCopy;

IF OBJECT_ID('tempdb..##customers') IS NOT NULL
    DROP TABLE ##customers;


Use Northwind;
Go
Declare @Counter INT = 1;
Declare rowCursor CURSOR FOR
	Select OrderID, ProductID, UnitPrice * Quantity AS 'Total Price'
	FROM [Order Details]
	WHERE UnitPrice * Quantity >100
	ORDER BY 'Total Price' DESC;
Open rowCursor;
Fetch NEXT FROM rowCursor;
While @@FETCH_STATUS=0
	Begin
		Fetch NEXT FROM rowCursor;
		Set @Counter = @Counter +1;
		IF @Counter>=10
			BREAK;
		Else
			CONTINUE;
	END;
CLOSE rowCursor;
DEALLOCATE rowCursor;


SELECT * FROM MASTER.dbo.sysdatabases;


DECLARE @name VARCHAR(50);
DECLARE @path VARCHAR(256);
DECLARE @fileName VARCHAR(256);
DECLARE @fileDate VARCHAR(20);

SET @path = 'C:\temp\;'

Select @fileDate = CONVERT(VARCHAR(20), GETDATE(),112);
DECLARE db_cursor CURSOR FOR
	SELECT name
	FROM MASTER.dbo.sysdatabases
	Where name NOT IN ('master', 'model', 'msdb', 'tempdb');

OPEN db_cursor
FETCH NEXT FROM db_cursor INTO @name; ---retrieves the first one

While @@FETCH_STATUS=0
	BEGIN
		SET @fileName = @path + @name + '_' + @fileDate + '.BAK'
		Backup Database @name TO DISK = @fileName

		FETCH NEXT FROM db_cursor INTO @name
	END;

Close db_cursor;
DEALLOCATE db_cursor;


Task #3

Use AP;
BEGIN TRY
    INSERT Invoices VALUES (799, 'ZXK-799', '2020-05-07', 299.95, 0, 0, 1, '2020-06-06', NULL);
    PRINT 'SUCCESS: Record was inserted.';
END TRY
BEGIN CATCH
    PRINT 'FAILURE: Record was not inserted.'; PRINT 'Error ' + CONVERT(varchar, ERROR_NUMBER(), 1) + ': ' + ERROR_MESSAGE();
END CATCH;
BEGIN TRY
    INSERT Invoices VALUES(122,'abc-123','2020-02-02',599.99,0,200,2,'2020-03-02',NULL);
    PRINT 'SUCCESS: Record was inserted.';
END TRY
BEGIN CATCH
    PRINT 'FAILURE: Record was not inserted.'; PRINT 'Error ' + CONVERT(varchar, ERROR_NUMBER(), 1) + ': ' + ERROR_MESSAGE();
END CATCH;


Use AP;
					--Remove old InvoiceCopy table if one exists
BEGIN TRY
    DROP TABLE #InvoiceCopy
END TRY
BEGIN CATCH
    PRINT ' The table does not exist'
END CATCH

SELECT * INTO #InvoiceCopy FROM Invoices
DECLARE InvCursor CURSOR FOR SELECT * FROM #InvoiceCopy
OPEN InvCursor;
FETCH NEXT FROM InvCursor
WHILE @@FETCH_STATUS = 0
    BEGIN
        UPDATE #InvoiceCopy SET InvoiceTotal = InvoiceTotal + (InvoiceTotal * .06)
        PRINT 'Total has been updated'
        FETCH NEXT FROM InvCursor
    END
CLOSE InvCursor
DEALLOCATE InvCursor;

Task #4

Use AP;
BEGIN TRY
    DROP TABLE #InvoiceCopy
END TRY
BEGIN CATCH
    PRINT ' The table does not exist'
END CATCH

SELECT * INTO #InvoiceCopy FROM Invoices
DECLARE InvCursor CURSOR FOR SELECT * FROM #InvoiceCopy
OPEN InvCursor;
FETCH NEXT FROM InvCursor
WHILE @@FETCH_STATUS = 0
    BEGIN
        UPDATE #InvoiceCopy SET InvoiceTotal = InvoiceTotal + (InvoiceTotal * .06)
        PRINT 'Total has been updated'
        FETCH NEXT FROM InvCursor
      IF @@ROWCOUNT=0
         PRINT 'Warning: No rows were updated';
    END
CLOSE InvCursor
DEALLOCATE InvCursor;


USE AP;
DECLARE @MyIdentity int, @MyRowCount int;

INSERT Vendors (VendorName, VendorAddress1, VendorCity, VendorState, VendorZipCode, VendorPhone, DefaultTermsID, DefaultAccountNo)
VALUES ('Peerless Binding', '1112 S Windsor St', 'Hallowell', 'ME', '04347', '(207) 555-1555', 4, 400);

SET @MyIdentity = @@IDENTITY;
SET @MyRowCount = @@ROWCOUNT;
IF @MyRowCount = 1
    INSERT Invoices VALUES (@MyIdentity, 'BA-0199', '2020-05-01', 4598.23, 0, 0, 4, '2020-06-30', NULL);
ELSE
    PRINT 'The row was not inserted into Invoices';

*/