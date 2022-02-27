-- ----------------------------------------------------
-- 			*********  GROUP BY  *********
-- ----------------------------------------------------

/*
	Ayni degerlere sahip sutunlari gruplandirmak icin kullanilir
	Genellikle aggregate fonksiyonlarla (COUNT(), MAX(), MIN(), SUM(), AVG()) birlikte kullanilir
    
    Kullanim Sekli/Syntax:
    
    SELECT column_name(s)
	FROM table_name
	WHERE condition
	GROUP BY column_name(s)
	ORDER BY column_name(s);
*/ 

-- EXAMPLE 1 : ---------------------------------------------------------------------------------------------------------------
-- her bir ulkedeki toplam musteri sayisini listeleyelim
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country;
-- ---------------------------------------------------------------------------------------------------------------------------

-- EXAMPLE 2 : ---------------------------------------------------------------------------------------------------------------
-- her bir ulkedeki toplam musteri sayisini buyukten kucuge dogru siralayarak listeleyelim
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
ORDER BY COUNT(CustomerID) DESC;
-- ---------------------------------------------------------------------------------------------------------------------------

-- EXAMPLE 3 : ---------------------------------------------------------------------------------------------------------------
-- bir gonderici tarafindan gonderilen siparislerin sayisini listeleyelim
SELECT Shippers.ShipperName, COUNT(Orders.OrderID) AS NumberOfOrders FROM Orders
LEFT JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID
GROUP BY ShipperName;
-- ---------------------------------------------------------------------------------------------------------------------------
