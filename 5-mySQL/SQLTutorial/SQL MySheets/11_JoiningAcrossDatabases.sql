USE sql_store;

-- -------------------------------------------------------
-- 		*********  JOINING ACROSS DATABASES *********
-- -------------------------------------------------------

-- Gercek dunyada birden fazla database ile ayni anda calismak durumunda kalabiliriz 
-- Bu derste, boyle durumlarda neler yaptigimizi ogrenecegiz

-- su anda sql_store database'i ile calisiyoruz
-- dusunelim ki products tablom bu database icerisinde olmasaydi
-- mesela navigator bar'da yer alan sql_inventory database'ine bakalim
-- icinde bbir tanecik tablo var, product table
-- bu product table bizim product table'imizla tamamen ayni
-- teknik olarak bu hos bir design degil ancak ornegimizi somutlastirmak icin bu sekilde yapmak zorundaydik

-- ve biz sql_store database'imizdeki order_item table'imiz ile sql_inventory database'indeki product table'imizi birlestirmek istiyoruz
SELECT *
FROM order_items oi
JOIN sql_inventory.products p  -- burada product table'imizin nereden geldigini soylememiz gerekiyor(prefix), tipki farkli tablolardan gelen sutunlarda soyledigimiz gibi
	ON oi.product_id = p.product_id;
    
-- DIKKAT DIKKAT !!!!!
-- Bu sorguda aktif olan database'imiz sql_store
-- Biz 2 database ile calistik
-- peki ben diger database'i kullanrak sorgumu yapabilir miyim, nasil yaparim

USE sql_inventory;
SELECT *
FROM sql_store.order_items oi
JOIN products p
	ON oi.product_id = p.product_id;
    
-- ta daaa :)


    
    
    
    
    
    
    
    