USE sql_store;

-- ------------------------------------------------------------
-- 			 *********  THE USING CLAUSE  *********
-- ------------------------------------------------------------
 	
-- asagida customers ve orders tablolarini join eden basit bir query var
SELECT 
	o.order_id,
    c.first_name
FROM orders o
JOIN customers c
	ON o.customer_id = c.customer_id;
    
-- sorgularimiz karmasiklastikca ON ile yazdigimiz ortak kosullar sorgumuzu okumayi zorlastiriyor 
-- sql'de bunu basitlestirmenin bir yolu mevcut

-- eger ON cumlesinde yazdigim, iki farkli tablodakin esit olmasini istedigim sutunlarin isimleri ayni ise (o.customer_id = c.customer_id) gibi
-- bu durumda ON cumlecigini USING cumlecigi ile degistirebilirim

SELECT 
	o.order_id,
    c.first_name
FROM orders o
JOIN customers c
	USING(customer_id);
    
-- join yapacagin tablolardaki customer_id sutunlarini kullanarak esitleme yap demis oluyor 
-- bu sorgunun daha acik ve net oldugu konusunda suphe yok

-- ardindan yeni bir join ekleyebiliriz
SELECT 
	o.order_id,
    c.first_name,
    sh.name AS shipper
FROM orders o
JOIN customers c
	USING(customer_id)
LEFT JOIN shippers sh
	USING(shipper_id);
        
-- DIKKAT DIKKAT !!! her iki tablodaki sutun adinin ayni oldugundan emin olmak zorundayiz !!!!
-- boylece USING yan cumlecigini hem inner hem de outer joinde kulanabildigimizi gormus olduk

-- bu komutu order_status tablosu ile birlestirme yaparken kullanamayiz,
-- cunku o tablodakiler ile ayni isimde olan bir sutunumuz yok 




-- unique olmayan ve birden fazla primary key iceren tablolarla USING keyword'u kullanarak birlestirmeyi nasil yapariz
SELECT *
FROM order_items oi
JOIN order_item_notes oin
	ON oi.order_id = oin.order_id 
    AND oi.product_id = oin.product_id;
    
-- bu sorgunun anlasilmasi guz oldugunu ve kolay okunur olmadigini goruyoruz 
-- simdi bu sorguyu USING keyword'unu kullanarak basitlestirelim   
 
SELECT *
FROM order_items oi
JOIN order_item_notes oin
	USING (order_id,product_id);
-- that's it :)

-- -------------------
-- 		EXERCSE
-- -------------------
-- sql_invoicing database'ini kulanarak payments tablosunda su sutunlari secen bir sorgu yazin
-- date client amount name(odeme tipi)
-- Kim hangi tarihte hangi odeme yontemini kullanarak ne kadar odedi

USE sql_invoicing;

SELECT 
	p.date,
    c.name AS client,
    p.amount,
    pm.name AS payment_method
FROM payments p
JOIN clients c
	USING(client_id)
JOIN payment_methods pm
	ON p.payment_method = pm.payment_method_id;


    
    
    
    
    
    