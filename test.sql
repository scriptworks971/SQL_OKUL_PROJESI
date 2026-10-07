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



SELECT ProductName, UnitPrice 
FROM Products
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products);
 
 --22 EXITS AMA NASIL 
 SELECT OrderID, OrderDate
 FROM Orders
 WHERE OrderDate BETWEEN '1998-01-01' AND '1998-12-31';        


--23 

SELECT ProductName, UnitinStock
   CASE 
        WHEN UnitinStock = 0 THEN 'TUKENDI' 
        WHEN UnitinStock = 15 THEN 'KRITIK'
        ELSE 'YETERTLI' 
    END AS StokDurumu
FROM Products;

--24

SELECT OrderID, RequiredDate, ShippedDate, 
       DATEDIFF(day, RequiredDate, ShippedDate) AS GecikenGunSayisi
FROM Orders
WHERE ShippedDate > RequiredDate;


--25 

SELECT e.Employees, o.Orders, SUM (UnitPrice * Quantity)
FROM Employees e
INNER JOIN Employees e ON e.EmployeeID = e.EmployeeID
GROUP BY EmployeeID
ORDER BY Employees DESC;

--26

SELECT c.CategoryName, sum(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS KategoriGeliri
FROM Categories c 
JOIN Products p ON c.CategoryID = p.ProductID
JOIN [Order Details] od ON p.ProductID = od.ProductID
GROUP BY c.CategoryName
ORDER BY KategoriGeliri DESC; 


--27 

SELECT SupplierID, CompanyName, ContactName, Phone
FROM Suppliers
WHERE SupplierID IN (
   SELECT SupplierID
   FROM Products p 
   JOIN Categories c ON p.CategoryID = c.CategoryID
   WHERE c.CategoryName = 'Seafood'
   );

--28 

SELECT ShipCountry, SUM(Freight) AS toplamnavlun
FROM Orders
WHERE OrderDate BETWEEN '1997-01-01' AND '1997-12-31'
GROUP BY ShipCountry
ORDER BY toplamnavlun DESC; 

--29 

SELECT CustomerID, 
       MIN(OrderDate) AS ilksiparistarihi,
       MAX(OrderDate) AS sonsiparistarihi,
       COUNT(OrderID) AS toplamsiparisSayisi
FROM Orders
GROUP BY CustomerID; 


--30 

SELECT o.OrderID, 
       STRING_AGG(p.ProductName, ', ') AS UrunlerListesi
FROM Orders o
JOIN [Order Details] od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY o.OrderID;

--31

























