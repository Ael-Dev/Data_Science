
USE Northwind
GO

-- EXERCISE 1

-- Obtener el top 10 de produtos más comprados por nombre
-- orden descendente por unidades vendidas
SELECT TOP 10 od.ProductID, p.ProductName, SUM(od.Quantity) AS Units_Sold
FROM [Order Details] od INNER JOIN Products p ON od.ProductID = p.ProductID
GROUP BY od.ProductID, p.ProductName
ORDER BY Units_Sold DESC;

-- EXERCISE 2

-- Encontrar el producto que tiene el segundo precio más alto
-- en la campaña
SELECT ProductID, ProductName, UnitPrice
FROM Products p1
WHERE 1 =  (SELECT COUNT(DISTINCT(UnitPrice))
			FROM Products p2
			WHERE p2.UnitPrice > p1.UnitPrice);

-- EXERCISE 3
-- Crear un RANK de productos vendidos ordenado por ciudad y cantidad en USA
SELECT p.ProductName, c.City, od.Quantity,
DENSE_RANK() OVER(PARTITION BY c.City ORDER BY od.Quantity DESC) AS RANK -- Genera un rank dependiendo la ciudad
FROM Products p INNER JOIN [Order Details] od ON p.ProductID = od.ProductID
				INNER JOIN Orders o ON od.OrderID = o.OrderID
				INNER JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE c.Country = 'USA'
ORDER BY od.Quantity DESC;


-- EXERCISE 4
-- Encontrar las ordenes que tardaron más de 2 días en entregarse después de ser realizados por el usuario,
-- donde el valor sea mayor a 10000. Mostrar número de días, fecha de la orden, customer_id y país de envío.

SELECT o.OrderID, o.CustomerID, o.OrderDate, o.ShippedDate, o.ShipCountry,
DATEDIFF(DAY, OrderDate, ShippedDate) AS Duration_to_Ship,
SUM(od.Quantity * od.UnitPrice) AS Total_Sale_Amount
FROM Orders o INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
WHERE DATEDIFF(DAY, OrderDate, ShippedDate) > 2
GROUP BY o.OrderID, o.CustomerID, o.OrderDate, o.ShippedDate, o.ShipCountry
HAVING SUM(od.Quantity * od.UnitPrice) > 10000;


-- EXERCISE 5
-- Encontrar el top 10 de los clientes(empresas) más valiosos en un determinado año
SELECT TOP 10 c.CustomerID, c.CompanyName, c.Country, o.OrderDate, od.Quantity, SUM(od.UnitPrice * od.Quantity) AS Total_Sales_Amount
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID
				 INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
WHERE DATEPART(YEAR,o.OrderDate) = '2017'
GROUP BY c.CustomerID, c.CompanyName, c.Country, o.OrderDate, od.Quantity
ORDER BY Total_Sales_Amount DESC;

-- EXERCISE 6
-- Mostrar los productos que generaron un monto total de venta >= $30,000
-- y mostrar las unidades vendidas de cada producto en 2018
SELECT p.ProductName, SUM(od.Quantity) as [Number of Units], SUM(od.Quantity * od.UnitPrice) as [Total Sale Amount]
FROM Orders o INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
			  INNER JOIN Products p ON od.ProductID = p.ProductID
WHERE DATEPART(YEAR, o.OrderDate) = '2018'
GROUP BY p.ProductName
HAVING SUM(od.Quantity * od.UnitPrice) >= 30000;

--EXERCISE 7
-- Clasifica a los clientes de acuerdo al total de ventas
-- >= $30000 Level A
-- >= $20000 y < $30000 Level B
-- < $20000 Level C
SELECT 
	c.CompanyName,
	SUM(od.Quantity * od.UnitPrice) as Total_Sales,
	CASE 
		WHEN SUM(od.Quantity * od.UnitPrice) >= 30000 THEN 'A'
		WHEN SUM(od.Quantity * od.UnitPrice) < 30000 AND 
			 SUM(od.Quantity * od.UnitPrice) >= 20000 THEN 'B'
		ELSE 'C'
	END AS [Classified_Level]
FROM Customers as c INNER JOIN Orders as o ON c.CustomerID = o.CustomerID
					INNER JOIN [Order Details] as od ON o.OrderID = od.OrderID
GROUP BY c.CompanyName;

--EXERCISE 8
-- ¿Qué clientes generaron ventas por encima del promedio del total de ventas?, filtrar por año
SELECT c.CompanyName,c.City, c.Country, SUM(od.Quantity * od.UnitPrice) [Total_Sale]
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID
				 INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
WHERE DATEPART(YEAR,o.OrderDate) = 2017 
GROUP BY c.CompanyName,c.City, c.Country
HAVING SUM(od.Quantity * od.UnitPrice) > (SELECT AVG(Quantity * UnitPrice) FROM [Order Details])
ORDER BY [Total_Sale] DESC

-- EXERCISE 9
-- ¿Qué clientes no han comprado en los ultimos 20 meses con respecto a la actualidad?
SELECT 
	c.CompanyName, 
	MAX(o.OrderDate),
	DATEDIFF(MONTH,MAX(o.OrderDate), GETDATE()) AS [Months since last order]
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CompanyName
HAVING DATEDIFF(MONTH,MAX(o.OrderDate), GETDATE()) > 20;

-- EXERCISE 10
-- Número de ordenes por clientes
-- opción 1
SELECT c.CompanyName, 
	   (SELECT COUNT(OrderID) 
	    FROM Orders o
		WHERE c.CustomerID = o.CustomerID) AS Number_Orders
FROM Customers c
ORDER BY Number_Orders ASC;

-- opción 2
SELECT c.CompanyName, COUNT(o.CustomerID) AS Number_Orders
FROM Customers c LEFT JOIN Orders o ON c.CustomerID = o.CustomerID 
GROUP BY CompanyName
ORDER BY Number_Orders ASC;

-- EXERCISE 11
-- Encuentra la duración de días entre ordenes de cada cliente

SELECT a.CustomerID, a.OrderDate,
		DATEDIFF(DAY, a.OrderDate, b.OrderDate) as [Days between two orders]
FROM Orders a INNER JOIN Orders b ON a.OrderID = b.OrderID - 1 -- id anterior
ORDER BY a.OrderDate;


-- EXERCISE 12
-- Mostrar los empleados con más ventas y calcular un bono por sus ventas del 2%
-- para enero del año 2018
SELECT TOP 3 (e.FirstName + ' ' + e.LastName) as Full_Name, 
			 SUM(od.Quantity * od.UnitPrice) as Total_Sales,
			 SUM(od.Quantity * od.UnitPrice)*0.02 as Bonus
FROM Employees e INNER JOIN Orders o ON e.EmployeeID = o.EmployeeID
				 INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
WHERE MONTH(o.OrderDate) = '1' AND YEAR(o.OrderDate) = '2018'
GROUP BY (e.FirstName + ' ' + e.LastName)
ORDER BY Total_Sales DESC;


-- EXERCISE 13
-- ¿Cuántos empleados se tiene por posicion y ciudad?

SELECT  e.Title,e.City,COUNT(e.City) as Number_employees
FROM Employees e 
GROUP BY  e.Title, e.City;


-- EXERCISE 14
-- ¿Cuánto tiempo en años llevan trabajando los empleados?

SELECT EmployeeID, FirstName, Title, 
	   DATEDIFF(YEAR, HireDate,GETDATE()) as Work_Years
FROM Employees ;

-- EXERCISE 15
-- ¿Cuales son empleados mayores de 70 años y cuales no?

-- Opción 1
SELECT FirstName, Title, 
	   DATEDIFF(YEAR, BirthDate, GETDATE()) Age,
	   IIF (DATEDIFF(YEAR, BirthDate, GETDATE()) > 70, 'YES','NO') AS Mayores
FROM Employees

-- Opcion 2
SELECT FirstName, LastName, Title, DATEDIFF(YEAR, BirthDate, GETDATE()) as Age
FROM Employees
WHERE DATEDIFF(YEAR, BirthDate, GETDATE()) > 70;



-- ***************************************************************************
-- CREAR UNA  VISTA PARA EXTRAER LOS DATOS
-- ***************************************************************************


CREATE VIEW TableauData AS
SELECT c.CompanyName, c.City, c.Country, 
	   CONVERT(DATE, o.OrderDate) as OrderDate,
	   od.Quantity, od.UnitPrice,
	   p.ProductName, ct.CategoryName
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID
				 INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
				 INNER JOIN Products p ON od.ProductID = p.ProductID
				 INNER JOIN Categories ct ON p.CategoryID = ct.CategoryID;

SELECT * FROM TableauData;







