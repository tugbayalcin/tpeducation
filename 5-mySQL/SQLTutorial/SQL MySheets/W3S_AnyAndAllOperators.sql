-- ----------------------------------------------------
-- 		*********  ANY AND ALL OPERATORS *********
-- ----------------------------------------------------

-- *******************************************************************************************************
-- ------------------
-- 	   	  ANY
-- ------------------
/*
	Sonuc olarak boolean bir deger dondurur
    Alt sorguyu saglayan herhangi bir kayit bulunmasi durumunda TRUE dondurur
    Kosulu saglayan tek bir kayit olmasi bile TRUE donmesi icin yeterlidir (OR gibi)
    
	Kullanim Sekli/Syntax:
    
    SELECT column_name(s)
	FROM table_name
	WHERE column_name operator ANY
	  (SELECT column_name
	  FROM table_name
	  WHERE condition);
      
      Not: Operator standart bir karsilastirma operatoru olmalidir (=, <>, !=, >, >=, < veya <=)
*/
-- EXAMPLE 1 : ---------------------------------------------------------------------------------------------------------------
-- OrderDetails tablosunda Quantity'nin 10'a esit HERHANGI bir kaydi bulursa ProductName'i listeler--> TRUE dondurecek
SELECT ProductName
FROM Products
WHERE ProductID = ANY
  (SELECT ProductID
  FROM OrderDetails
  WHERE Quantity = 10);

-- ---------------------------------------------------------------------------------------------------------------------------

-- EXAMPLE 2 : ---------------------------------------------------------------------------------------------------------------
-- OrderDetails tablosunda Quantity'nin 99'dan büyük HERHANGI bir kaydi bulursa ProductName'i listeler --> TRUE dondurecek
SELECT ProductName
FROM Products
WHERE ProductID = ANY
  (SELECT ProductID
  FROM OrderDetails
  WHERE Quantity > 99);

-- ---------------------------------------------------------------------------------------------------------------------------

-- EXAMPLE 3 : ---------------------------------------------------------------------------------------------------------------
--  OrderDetails tablosunda Miktar 1000'den büyük HERHANGI bir kayit bulursa ÜrünAdı'ni listeler --> FALSE dondurecek
SELECT ProductName
FROM Products
WHERE ProductID = ANY
  (SELECT ProductID
  FROM OrderDetails
  WHERE Quantity > 1000);

-- ---------------------------------------------------------------------------------------------------------------------------
-- *******************************************************************************************************

-- *******************************************************************************************************
-- ------------------
-- 	   	  ALL
-- ------------------
/*
	Sonuc olarak boolean bir deger dondurur
    Alt sorgunun tum katitlar tarafindan saglanmasi durumunda TRUE dondurur (AND gibi)
    Kosulu saglamayan tek bir kayit olmasi bile FALSE donmesi icin yeterlidir
    SELECT, WHERE, HAVING keywordleri ile birlikte kullanilir
    
	Kullanim Sekli/Syntax:
    
    SELECT ALL column_name(s)
	FROM table_name
	WHERE condition;
      
    --> WHERE ya da HAVING ile kullanimi
    SELECT column_name(s)
	FROM table_name
	WHERE column_name operator ALL
	  (SELECT column_name
	  FROM table_name
	  WHERE condition);
      
      Not: Operatör standart bir karşılaştırma operatörü olmalıdır (=, <>, !=, >, >=, < veya <=).
	
*/
-- EXAMPLE 1 : ---------------------------------------------------------------------------------------------------------------
-- Tum Urun adlarini listeleyelim
SELECT ALL ProductName
FROM Products
WHERE TRUE;

-- ---------------------------------------------------------------------------------------------------------------------------

-- EXAMPLE 2 : ---------------------------------------------------------------------------------------------------------------
-- OOrderDetails tablosundaki TUM kayitlarin Quantity degeri 10'a esitse, ProductName'i listeler. --> FALSE dondurecek
SELECT ProductName
FROM Products
WHERE ProductID = ALL
  (SELECT ProductID
  FROM OrderDetails
  WHERE Quantity = 10);

-- ---------------------------------------------------------------------------------------------------------------------------






-- *******************************************************************************************************