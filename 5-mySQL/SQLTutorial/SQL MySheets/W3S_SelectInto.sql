-- ----------------------------------------------------
-- 			*********  SELECT INTO *********
-- ----------------------------------------------------

/*
	Verileri bir tablodan yeni bir tabloya kopyalar
    
	Kullanim Sekli/Syntax:
    
    SELECT *
	INTO newtable [IN externaldb]
	FROM oldtable
	WHERE condition;
      
      
	--> Yalnizca bazi sutunlari yeni bir tabloya kopyalayalim:
    SELECT column1, column2, column3, ...
	INTO newtable [IN externaldb]
	FROM oldtable
	WHERE condition;
    
    NOTE: Yeni tablo, eski tabloda tanimlandigi gibi sutun adlari ve turleri ile olusturulacaktir. 
    AS keywordunu kullanarak yeni sutun isimleri olusturabiliriz
*/

-- EXAMPLE 1 : ---------------------------------------------------------------------------------------------------------------
-- Customers tablosunun yedek bir kopyasini olusturalim
SELECT * INTO CustomersBackup2017
FROM Customers;
-- ---------------------------------------------------------------------------------------------------------------------------

-- EXAMPLE 2 : ---------------------------------------------------------------------------------------------------------------
-- Customers tablosundaki birkac sutunun yedek bir kopyasini olusturalim
SELECT CustomerName, ContactName INTO CustomersBackup2017
FROM Customers;
-- ---------------------------------------------------------------------------------------------------------------------------

-- EXAMPLE 3 : ---------------------------------------------------------------------------------------------------------------
-- Customers tablosundaki yalnizca ulkesi Almanya olan musterileri baska bir tabloya koyalim
SELECT CustomerName, ContactName INTO CustomersBackup2017
FROM Customers;
-- ---------------------------------------------------------------------------------------------------------------------------

-- EXAMPLE 4 : ---------------------------------------------------------------------------------------------------------------
-- CBirden fazla tablodaki verileri kopyalayarak bir tabloya koyalim
SELECT Customers.CustomerName, Orders.OrderID
INTO CustomersOrderBackup2017
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
-- ---------------------------------------------------------------------------------------------------------------------------

-- Ipucu: SELECT INTO baska birinin semasını kullanarak yeni, bos bir tablo olusturmak icin de kullanilabilir. 
-- WHERE Sorgunun veri dondurmemesine neden olan bir yan tümce eklemeniz yeterlidir:
SELECT * INTO newtable
FROM oldtable
WHERE 1 = 0;


