-- ----------------------------------------------------
-- 			*********  INSERT INTO *********
-- ----------------------------------------------------

/*
	Verileri bir tablodan kopyalar ve baska bir tabloya ekler
    kaynak ve hedef tablolardaki veri türlerinin eslesmesini gerektirir
    
    Not: Hedef tablodaki mevcut kayitlar etkilenmez.
    
	Kullanim Sekli/Syntax:
    
    INSERT INTO table2
	SELECT * FROM table1
	WHERE condition;
      
      
	--> Yalnizca bazi sutunlari yeni bir tabloya kopyalayalim:
    INSERT INTO table2 (column1, column2, column3, ...)
	SELECT column1, column2, column3, ...
	FROM table1
	WHERE condition;
    
*/
-- EXAMPLE 1 : ---------------------------------------------------------------------------------------------------------------
-- "Tedarikciler"i "Müsteriler"e kopyalayalim (verilerle doldurulmayan sutunlar NULL icerecektir
INSERT INTO Customers (CustomerName, City, Country)
SELECT SupplierName, City, Country FROM Suppliers;

-- ---------------------------------------------------------------------------------------------------------------------------

-- EXAMPLE 2 : ---------------------------------------------------------------------------------------------------------------
-- "Tedarikciler"i "Müsteriler"e kopyalayalim (tum sutunları doldurun)
INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
SELECT SupplierName, ContactName, Address, City, PostalCode, Country FROM Suppliers;

-- ---------------------------------------------------------------------------------------------------------------------------

-- EXAMPLE 3 : ---------------------------------------------------------------------------------------------------------------
-- yalnızca Alman tedarikcileri "Müsteriler"e kopyalar
INSERT INTO Customers (CustomerName, City, Country)
SELECT SupplierName, City, Country FROM Suppliers
WHERE Country='Germany';

-- ---------------------------------------------------------------------------------------------------------------------------





