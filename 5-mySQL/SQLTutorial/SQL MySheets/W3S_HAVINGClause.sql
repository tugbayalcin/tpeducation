
-- ----------------------------------------------------
-- 			*********  HAVING CLAUSE  *********
-- ----------------------------------------------------

-- WHERE keyword'u SQL'de bulunan yerlesik fonksiyonlar ile birlikte kullanilamadigi icin,
-- fonskiyon kullanilarak yapilacak filtreleme islemlerinde HAVING keywordu kullanilir
-- Ornegin 5'tern fazla musterisi olan ulkeleri listelerken
-- oncelikle ulkelerin customer_id sutununda kac eleman oldugunu COUNT fonksiyonu ile bulmali
-- ardindan cikan sonucu HAVING kullanarak filtrelemeliyiz

/*
	Kullanim Sekli/Syntax : 
    SELECT column_name(s)
	FROM table_name
	WHERE condition
	GROUP BY column_name(s)
	HAVING condition
	ORDER BY column_name(s);
*/

-- NOT: asagidaki sorgu ornek olmasi amaciyla konmustur, ilgili database burada olmadigi icin calismaz,
-- calistirmak icin uygun bir database secip, tablo ve sutun isimlerini revize etmelisin

-- EXAMPLE 1 : ---------------------------------------------------------------------------------------------------------------
-- Musteri Sayisi 5'ten fazla olan ulkeleri listeleyelim
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5;

-- ---------------------------------------------------------------------------------------------------------------------------

-- EXAMPLE 2 : ---------------------------------------------------------------------------------------------------------------
-- Musteri Sayisi 5'ten fazla olan ulkeleri, musteri sayisi buyukten kucuge olacak sekilde listeleyelim
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5
ORDER BY COUNT(CustomerID) DESC;
-- ---------------------------------------------------------------------------------------------------------------------------

-- EXAMPLE 3 : ---------------------------------------------------------------------------------------------------------------
-- Siparis sayisi 10'dan buyuk olan calisanlari listeleyelim
SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM (Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID)
GROUP BY LastName
HAVING COUNT(Orders.OrderID) > 10;
-- ---------------------------------------------------------------------------------------------------------------------------

-- EXAMPLE 4 : ---------------------------------------------------------------------------------------------------------------
-- lastName'i "Davolio" veya "Fuller" olup 25'ten fazla siparis kaydeden calisanlari listeleyelim
SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE LastName = 'Davolio' OR LastName = 'Fuller'
GROUP BY LastName
HAVING COUNT(Orders.OrderID) > 25;

-- ---------------------------------------------------------------------------------------------------------------------------







