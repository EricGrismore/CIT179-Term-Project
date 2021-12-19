/* Final Project Views

USE myBuisnessOrder;
GO
Create view ItemsInStock
AS
Select GeodeType, Size
FROM Inventory;


GO
Create VIEW OrderTime
AS
SELECT OrderDate, FirstName, LastName
FROM Owner JOIN Orders ON Owner.OwnerID = Orders.OwnerID;
GO


GO
CREATE VIEW BossContact
AS
Select City, LastName
FROM ZipCode JOIN Owner ON ZipCode.ZipCodeID = Owner.ZipCodeID
GO

*/
GO 
CREATE VIEW ShipmentDetail
AS
SELECT ShipDate, OrderDate, Qty
FROM OrderDetail Join Orders ON OrderDetail.OrderID = Orders.OrderID
GO
*/