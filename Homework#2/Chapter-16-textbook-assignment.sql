/*Task #1

USE AP;
GO
DECLARE @InvoiceID int;
    BEGIN TRY
        BEGIN TRAN;
            INSERT Invoices VALUES (34,'ZXA-080','2020-04-30',14092.59,0,0,3,'2020-05-30',NULL);
            SET @InvoiceID = @@IDENTITY;
            INSERT InvoiceLineItems VALUES (@InvoiceID,1,160,4447.23,'HW upgrade');
            INSERT InvoiceLineItems VALUES (@InvoiceID,2,160,9645.36,'OS upgrade');
        COMMIT TRAN;
    END TRY
BEGIN CATCH
    ROLLBACK TRAN;
    PRINT 'FAILURE: Order was not processed.'; PRINT 'Error ' + CONVERT(varchar, ERROR_NUMBER(), 1) + ': ' + ERROR_MESSAGE();
END CATCH;
GO
SELECT * FROM Invoices WHERE VendorID=34;


BEGIN TRAN;
    DELETE Invoices WHERE VendorID = 34;
    IF @@ROWCOUNT > 1
        BEGIN
            ROLLBACK TRAN;
            PRINT 'More invoices than expected. Deletions rolled back.';
        END;
    ELSE
        BEGIN
            COMMIT TRAN;
            PRINT 'Deletions committed to the database.';
        END;


USE AP;
GO
IF OBJECT_ID('tempdb..#VendorCopy') IS NOT NULL
    DROP TABLE tempdb.. #VendorCopy;

SELECT VendorID, VendorName INTO #VendorCopy
FROM Vendors WHERE VendorID < 5;

BEGIN TRAN;
    DELETE #VendorCopy WHERE VendorID = 1;
    SAVE TRAN Vendor1;
            DELETE #VendorCopy WHERE VendorID = 2;
            SAVE TRAN Vendor2;
                DELETE #VendorCopy WHERE VendorID = 3;
                SELECT * FROM #VendorCopy;					 -- this will only show 1 vendor

            ROLLBACK TRAN Vendor2;
            SELECT * FROM #VendorCopy;						 -- this will show 2 vendors
    ROLLBACK TRAN Vendor1;
    SELECT * FROM #VendorCopy;								 -- this will show 3 vendors
COMMIT TRAN;
SELECT * FROM #VendorCopy;

*/