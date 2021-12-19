/*
Task #1

Use TestCorp;
Select CustomerId, FirstName + LastName AS Customer, [Order].Id, OrderDate, SUM(TotalAmount) AS 'Largest Total Amount'
From Customer JOIN [Order] ON Customer.Id = [Order].CustomerId
Group By CustomerId, FirstName, LastName, [Order].Id, OrderDate																/*Done*/
Order by 'Largest Total Amount' DESC;


Use TestCorp;
Select Country, City, ID AS 'Customers Per City'					/*FIX*/
FROM Customer
Order By ID DESC;


Use TestCorp;
Select Customer.City, Customer.Country, .Customer.Id, LastName, Supplier.Id, CompanyName         /*pulling from Sullpier and Customer Table */
FROM Supplier JOIN Customer ON Supplier.City = Customer.City										/*Done*/


Task #2

Alter Table Product
ADD onOrder int NULL;

Use TestCorp;
SET IDENTITY_INSERT Customer ON
INSERT INTO [Customer] (onOrder) VALUES(100)
INSERT INTO [Customer] (onOrder) VALUES(200)			/*FIX*/
INSERT INTO [Customer] (onOrder) VALUES(300)
INSERT INTO [Customer] (onOrder) VALUES(400)
GO


create table ForeignCustomer (
   Id                   int                  identity,
   FirstName            nvarchar(40)         not null,
   LastName             nvarchar(40)         not null,
   City                 nvarchar(40)         null,
   Country              nvarchar(40)         null,
   Phone                nvarchar(20)         null,
   constraint PK_FOREIGNCUSTOMER primary key (Id)
)
go

Select * FROM ForeignCustomer;
CHECK Country;


Task #3


Use TestCorp;
Select [Order].OrderNumber, [Order].OrderDate, Product.ProductName, Product.UnitPrice, OrderItemQuantity, [Order].TotalAmount
FROM [Order] Join OrderItem JOIN Product [Order].OrderId = OrderItem.OrderId AND OrderItem.ProductId = Product.ProductId

SELECT AVG(TotalAmount)
WHERE TotalAmount>(SELECT AVG(TotalAmount
					FROM [Order] Join OrderItem JOIN Product										/*Something along these lines, but I know theres something missing*/
					Where 
Order BY OrderNumber;


Use TestCorp;
Select Customer.FirstName, Customer.LastName, [Order].TotalAmount
From Customer JOIN [Order] Customer.CustomerId = [Order].CustomerId								/*Is a start*/
Group By Customer.FirstName, Customer.LastName, [Order].TotalAmount;


Use TestCorp;
SELECT Product.ProductName, OrderItem.Quantity
FROM Product JOIN OrderItem ON OrderItem.ProductId = Product.ProductId				/*Done*/
WHERE Quantity IN (SELECT Quantity FROM OrderItem WHERE Quantity >100)
Order By ProductName;

Task #4
*/

