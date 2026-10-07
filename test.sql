SELECT ProductName, UnitPrice, UnitinStock
FROM Products;

SELECT ProductName, UnitPrice, UnitinStock
FROM Products
WHERE UnitPrice > 20 AND Discontinued = 0;

SELECT CompanyName, ContactName, City, Country
FROM Customers
ORDER BY CompanyName ASC;

SELECT CompanyName, ContactName, City, Country
FROM Customers
WHERE CompanyName LIKE 'A%' OR CompanyName LIKE  '%Resturant';

SELECT OrderID, OrderDate
FROM Orders
WHERE OrderDate BETWEEN '1997-01-01' AND '1997-12-31';

SELECT  CustomerID, CompanyName, Country
FROM Customers 
WHERE Country IN ('Germany', 'France', 'Brazil');

SELECT ShipRegion, OrderID, Country 
FROM Orders 
WHERE,ShipRegion IS NULL; 

SELECT TOP 5 ProductName, UnitPrice
FROM Products
ORDER BY UnitPrice DESC;

SELECT FirstName, LastName, Birthdate
FROM Employees
DATEDIFF 

SELECT DISTINCT ShipCountry
FROM Orders
ORDER BY ShipCountry;

SELECT SUM(UnitinStock) AS ToplamStok,
       ROUND(AVG(UnitPrice), 2) AS OrtalamaFiyat
FROM Products;

SELECT CategoryID, COUNT(*) AS UrunSayisi
FROM Products
GROUP BY CategoryID;

SELECT TOP 10  CategoryID, COUNT(UnitinStock) AS ToplamUrun
FROM Products
GROUP BY CategoryID
HAVING COUNT(*) > 10;

SELECT p.ProductName, c.CategoryName
FROM Products p 
INNER JOIN Categories c ON p.CategoryID = c.CategoryID;

SELECT o.OrderID, c.CompanyName, e.FirstName, e.LastName
FROM Orders o 
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID;

SELECT Country, COUNT(*) AS MusteriSayisi 
FROM Customers
GROUP BY Country
HAVING COUNT(*) > 3
ORDER BY Musterisayisi DESC; 

SELECT c.CustomerID, c.CompanyName
FROM Customers c 
LEFT JOIN Orders o ON o.CustomerID = c.CustomerID 
WHERE o.OrderID IS NULL; 

18#  SELECT OrderID=10250, Sum 


SELECT s.Shippers, o.OrderID COUNT(*) AS ToplamSiparisSayisi
FROM Shippers s 
LEFT JOIN Shippers s ON s.Shippers = o.Shippers
LEFT JOIN OrderID o ON o.OrderID = s.OrderID
HAVING COUNT (*) = ALL 
ORDER BY ToplamSiparisSayisi;


SELECT 
     e1.FirstName AS CalisanAd,
     e1.LastName AS CalisanSoyad,
     e2.FirstName AS PatronAd,
     e2.LastName AS PatronSoyad
FROM Employees e1 
LEFT JOIN Employees e2 ON e1.ReportsTo = e2.EmployeeID;



       