
-- ----------------------------------------------------
-- 			*********  EXISTS OPERATOR *********
-- ----------------------------------------------------

/*
	EXISTS operatoru bir alt sorgudaki herhangi bir kaydin varligini test etmek icin kullanilir
	Alt sorguyu saglayan bir veya birden fazla kayit olmasi durumuda TRUE degerini dondurur 
    
	Kullanim Sekli/Syntax:
    
    SELECT column_name(s)
	FROM table_name
	WHERE EXISTS
	(SELECT column_name FROM table_name WHERE condition);
*/

-- EXAMPLE 1 : ---------------------------------------------------------------------------------------------------------------
-- Urun fiyati 20'den az olan tedarikciler var mi bakalim --> TRUE dondurecek
SELECT SupplierName
FROM Suppliers
WHERE EXISTS (SELECT ProductName FROM Products WHERE Products.SupplierID = Suppliers.supplierID AND Price < 20);

-- ---------------------------------------------------------------------------------------------------------------------------

-- EXAMPLE 2	 : ---------------------------------------------------------------------------------------------------------------
-- Urun fiyati 22'ye esit olan tedarikciler var mi bakalim --> TRUE dondurecek
SELECT SupplierName
FROM Suppliers
WHERE EXISTS (SELECT ProductName FROM Products WHERE Products.SupplierID = Suppliers.supplierID AND Price = 22);

-- ---------------------------------------------------------------------------------------------------------------------------