USE sql_store;

-- ----------------------------------------------------
-- 			*********  IN OPERATOR  *********
-- ----------------------------------------------------

-- Virginia'daki, veya Florida'daki veya Georgia'daki musterileri goruntulemek istedigimizi dusunelim
-- bu sorguyu yazmanin yollarindan biri su sekildedir: 
SELECT *
FROM customers
WHERE state = 'VA' OR state = 'GA' OR state = 'FL';

-- ancaqk artik az da olsa SQL biliyoruz ve o zaman biz bu ifadeyi boyle yazmak yerine sunu yazmak isteyebiliriz:
SELECT *
FROM customers
WHERE state = 'VA' OR 'GA' OR 'FL';
-- OR operatoru birden cok kosulu birlestirmek icin kullanilir
-- burada ise bizim bir sartimiz var (state = 'VA') ve bu ifadenin saginda kalan kisim string ifadelerdir, kosullar degil
-- yani ben burada ilk condition ile 'GA' Stringini OR operatoruyla birlestirmeye calismis oluyorum
-- bu condition (state = 'VA') temelde bir boolean ifadedir
-- boolean ile stringi OR operatoru ile baglamaya caisiyorum, ne kadar das mantiksiz oyle degil mi
-- iste bu sebeple OR operatorunden sonra condition'imi tam olarak yazmam gerekiyor
-- yai dogru ifade tam olarak soyle gorunuyor olacak: state = 'VA' OR state = 'GA' OR state = 'FL'
-- artik cok sayida condition/expression'imiz oldu ve bunlari operator araciligi ile birlestirmeye calisabilim (oyle de yaptik zaten)
-- sorgumuzu calistirdigimizda istedigimiz sonuclarin guzelce geldigini goruruz
-- peki bunu yapmanin daha kisa bir yolu yok mudur? Bence mutlaka olmali :)
-- hadi buna biraz daha yakindan bakalim

-- OR operatoru kullanarak birden fazla condition'i birlestirmeye calististigimizda IN operatorunu kullanabiliriz, peki nasil
SELECT *
FROM customers
WHERE state IN ('VA', 'GA', 'FL');
-- bu yazim cok daha kisa ve anlasilir olacaktir. Tam olarak sunu soylemis oluyoruz: 
-- customer tablosundaki, state'i bu listenin ICINDE OLAN musterileri listelemek istiyorum.
-- calistirip ayni sonucu aldigimizdan emin olalim, harika, simdiye kadar her sey yolunda gidiyor
-- burada NOT operatorunu de kullanabiliriz 
-- Diyelim ki ben aslinda bu eyaletlerin disinda olan musterileri goruntulemek istiyorum
-- o zaman sorgumu yine bu sekilde yazip basina NOT operatorunu eklerim, hadi yapalim 
SELECT *
FROM customers
WHERE state NOT IN ('VA', 'GA', 'FL');
-- bunun anlami sudur: customer tablosundaki, state'i bu listenin ICINDE OLMAYAN musterileri listelemek istiyorum.

-- -------------------
-- 		EXERCSE		
-- -------------------
-- Return product with quantity in stock equal to 49, 38, 72
SELECT *
FROM products
WHERE quantity_in_stock IN (49,38,72); 
-- sorgu sonunda yalnizca 2 product goruntulendi, cunku tabloda stock degeri 72 olan bir urun yok, dolayiisyla gelmedi













