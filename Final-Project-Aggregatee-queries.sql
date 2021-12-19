/*
Use myBuisnessOrder;
Select MIN(Inventory.Size) AS [Smallest Size],
		MAX(Inventory.Size) As [Largest Size]
FROM Inventory;


Select COUNT(Inventory.PricePerSize) AS [Total Price per size], Inventory.GeodeType,
		AVG(Inventory.PricePerSize) AS [Total Price]
FROM Inventory
GROUP BY Inventory.GeodeType;


Select Zipcode.City, COUNT(DISTINCT Museum.StreetAddress) AS [Street In City]
FROM Museum JOIN Zipcode ON Museum.ZipCodeID = ZipCode.ZipCodeID
GROUP BY ZipCode.City
ORDER BY ZipCode.City ASC;

Select MAX(Inventory.PricePerSize) AS [Price For Geodes],
		COUNT(Inventory.Size) AS [Size Of Geode]
FROM Inventory
GROUP BY Inventory.Size;
*/