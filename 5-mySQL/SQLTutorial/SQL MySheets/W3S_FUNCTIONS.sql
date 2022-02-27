

-- Bu egitimde W3S ile baslayan her dosya, asagidaki baglanti adresi uzerindeki ornekler dogrultusunda olusturulmustur
-- ihtiyacin oldugunda gidip calisabilirsin
-- https://www.w3schools.com/sql/default.asp



-- ----------------------------------------------------
-- 			*********  FUNCTIONS  *********
-- ----------------------------------------------------

-- SQL baszi yerlesik fonksiyonlar icerir
-- simdilik bu fonksiyonlarin nasil yazildigini ve calistigini bilmemize gerek yoktur
-- ancak nasil ve hangi durumlarda kullanildigini bilmeliyiz

-- ****************************************************************
-- -----------------
-- 		MIN()
-- -----------------
/* 
	secilen sutunun en kucuk degerini dondurur
    
    Kullanim Sekli/Syntax:
    
    SELECT MIN(column_name)
	FROM table_name
	WHERE condition;
*/
-- example:
SELECT MIN(Price) AS SmallestPrice   -- alias 
FROM Products;
-- ****************************************************************

-- ****************************************************************
-- -----------------
-- 		MAX()
-- -----------------
/* 
	secilen sutunun en buyuk degerini dondurur
    
    Kullanim Sekli/Syntax:
    
    SELECT MAX(column_name)
	FROM table_name
	WHERE condition;
*/
-- example:
SELECT MAX(Price) AS LargestPrice   -- alias
FROM Products;
-- ****************************************************************

-- ****************************************************************
-- -----------------
-- 		COUNT()
-- -----------------
/* 
	secilen sutunun, verilen kosulu saglayan satirlarinin sayisini dondurur
    
    Kullanim Sekli/Syntax:
    
    SELECT COUNT(column_name)
	FROM table_name
	WHERE condition;
*/
-- example: 
SELECT COUNT(ProductID)
FROM Products;
-- ****************************************************************

-- ****************************************************************
-- -----------------
-- 		AVG()
-- -----------------
/* 
	secilen sutunun, verilen kosulu saglayan satirlarinin tuttugu degerlerin ortalamasini dondurur
    
    Kullanim Sekli/Syntax:
    
    SELECT AVG(column_name)
	FROM table_name
	WHERE condition;
*/
-- example: 
SELECT AVG(Price)
FROM Products;

-- ****************************************************************

-- ****************************************************************
-- -----------------
-- 		SUM()
-- -----------------
/* 
	secilen sutunun, verilen kosulu saglayan satirlarinin tuttugu degerlerin ortalamasini dondurur
    
    Kullanim Sekli/Syntax:
    
	SELECT SUM(column_name)
	FROM table_name
	WHERE condition;
*/
-- example: 
SELECT SUM(Quantity)
FROM OrderDetails;
-- ****************************************************************






