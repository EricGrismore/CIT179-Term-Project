/* Final Project Procedures 
Use myBuisnessOrder
GO
CREATE PROC spOrderDetail
AS
SELECT * FROM OrderDetail
ORDER BY ShipDate;
GO

EXEC spOrderDetail;


USE myBuisnessOrder;
GO
CREATE PROC spGETBuyer
	@BuyerID int
AS
BEGIN
	SELECT * FROM Buyer
	WHERE BuyerID = @BuyerID;
END
GO
EXEC spGETBuyer 1


USE myBuisnessOrder;
GO
CREATE PROC spInventory
	@GeodeID int,
	@GeodeType varchar(30) OUTPUT,
	@Size varchar(50) OUTPUT,
	@PricePerSize varchar(30) OUTPUT 
AS
SELECT @PricePerSize = PricePerSize, @GeodeType = GeodeType, @Size = Size
FROM Inventory
WHERE GeodeID = @GeodeID;
GO

DECLARE @GeodeType nvarchar(30);
DECLARE @Size nvarchar(50);
DECLARE @PricePerSize nvarchar(30);
EXEC spInventory 3, @GeodeType OUTPUT, @Size OUTPUT, @PricePerSize OUTPUT;
SELECT @GeodeType AS 'Geode Type', @Size AS 'Size', @PricePerSize AS 'Price Per Size';


USE myBuisnessOrder;
GO
CREATE PROC spMuseum
AS
DECLARE @Museum int;
SELECT @Museum = COUNT(*)
FROM Museum
RETURN @Museum;
GO
DECLARE @Museum int;
EXEC @Museum = spMuseum;
PRINT 'Located here is ' + CONVERT(varchar, @Museum) + ' that a shipment is going to';
GO

*/
/* Final Project User Defined Functions 

USE myBuisnessOrder;
GO
CREATE FUNCTION fnGetShipDate
    (@ShipDate nvarchar(50) = '%')
    RETURNS int
BEGIN
    RETURN (SELECT ShipDate FROM OrderDetail WHERE ShipDate Like @ShipDate);
END;

*/
/* Final Project Triggers 

CREATE TRIGGER InventoryStock_INSERT ON Inventory
    AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @GeodeID int
	DECLARE @GeodeType nvarchar(30)
	DECLARE @Size nvarchar(50)
	DECLARE @PricePerSize nvarchar(100)

    SELECT @GeodeID =INSERTED.GeodeID, @GeodeType = INSERTED.GeodeType, @Size = INSERTED.Size,
	@PricePerSize = INSERTED.PricePerSize
	FROM INSERTED

    INSERT INTO Inventory VALUES(@GeodeID,@Size, @PricePerSize, 'Inserted')
END
GO


INSERT INTO Inventory VALUES(7,'Ruby', '6"', 4.25);
GO


CREATE TRIGGER InventoryStock_DELETE ON Inventory
    AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @GeodeID int
	DECLARE @GeodeType nvarchar(30)
	DECLARE @Size nvarchar(50)
	DECLARE @PricePerSize nvarchar(100)

    SELECT @GeodeID =DELETED.GeodeID, @GeodeType = DELETED.GeodeType, @Size = DELETED.Size,
	@PricePerSize = DELETED.PricePerSize
	FROM DELETED
    INSERT INTO Inventory VALUES(@GeodeID,@Size, @PricePerSize, 'DELETED')
END
GO


ALTER TABLE Inventory
 ADD Time varchar(50);
 GO
 */