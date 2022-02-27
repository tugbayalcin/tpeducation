USE sql_store;

-- -------------------------------------------------------
-- 		 *********  OUTER JOIN *********
-- -------------------------------------------------------

-- birkac ders oncesinde sql'de join isleminin ikiye ayrildigindan bahsetmistik
-- Inner Join ve Outer Join
-- simdiye kadar inner join ile calistik ve inner join yaparken inner keywordunu kulanmak zorunda olmadigimiz
-- yalnizca inner yazinca da bunun inner join anlamina geldigini konustuk
-- simdi de outer join'e bakalim

-- asagidaki inner join ornegine bakalim
SELECT 
	c.customer_id, -- anlatacaklarimiz daha net anlasilsin diye tum tabloyu degil, birkac sutun secelim 
    c.first_name,
    o.customer_id
FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id
ORDER BY c.customer_id;
-- bu sorguyu calistirdigimizdfa yalnizca siparisi olan musterilerin listelendigini goruruz
-- peki biz yalnizca siparisi olanlari degil de tum musterileri gormek istersek ne yapariz
-- tum musteriler listelensin ve siparisi var ya da yok, bunu gorebileyim

-- sorunumza cozum uretmek icin yukaridaki sorguyu biraz daha yakindan incelemeyi deneyelim
-- bu sorguda yalnizca siparisi olan musterileri almamizin sebebi,
-- bu iki tabloyu customer_id ile baglamis olmamiz
-- yalnizca order tablosunda yer alan customer_id'ler sonuc tablomuzda yer aldi
-- yani diger musteriler icin c.customer_id = o.customer_id kosulu saglanmamis oldu ve bu musteriler ignore edildi
-- bu sorunu cozmek icin bir dis birlestirme kullaniyoruz 

-- -------------------------------------------------------
-- 			 *********  LEFT JOIN *********
-- -------------------------------------------------------

-- sql'de iki tur outer join vardir 
-- LEFT JOIN ve RIGHT JOIN

-- left join kullandigimizda : sol tarafa yazdigimiz tablodaki (istedigimiz sutundaki tum satirlar) tum veriler 
-- (yukaridaki ornegimizde customer tablosu) bu kosulun dogru olup olmadigina bakilmaksizin result table'a eklenir
-- sag tarafa yazdigimiz tablodaki veriler ise kosulu sagliyorsa datasi gelir, saglamiyorsa bos kalir
-- hemen sorgumuzu calistiralim ve result table'a bakalim
SELECT 
	c.customer_id,
    c.first_name,
    o.customer_id
FROM customers c
LEFT JOIN orders o
	ON c.customer_id = o.customer_id
ORDER BY c.customer_id;

-- -------------------------------------------------------
-- 			 *********  RIGHT JOIN *********
-- -------------------------------------------------------

-- right join kullandigimizda : sag tarafa yazdigimiz tablodaki (istedigimiz sutundaki tum satirlar) tum veriler 
-- (yukaridaki ornegimizde orders tablosu) bu kosulun dogru olup olmadigina bakilmaksizin result table'a eklenir
-- sol tarafa yazdigimiz tablodaki veriler ise kosulu sagliyorsa datasi gelir, saglamiyorsa bos kalir
-- hemen sorgumuzu calistiralim ve result table'a bakalim
SELECT 
	c.customer_id,
    c.first_name,
    o.customer_id
FROM customers c
RIGHT JOIN orders o
	ON c.customer_id = o.customer_id
ORDER BY c.customer_id;

-- bu haliyle calistirdigimizda inner join sorgusu ile ayni sonucu aliriz
-- cunku sorgumuzu sagdaki tablo uzerinden yapiyoruz ve sagda orders var, yani zaten tum musterileri icermiyordu
-- ben right join kullanmak ve tum musterileri listelemek istiyorsam, tablolarin yerlerini degistirmeliyim
SELECT 
	c.customer_id,
    c.first_name,
    o.customer_id
FROM orders o
RIGHT JOIN customers c
	ON c.customer_id = o.customer_id
ORDER BY c.customer_id;
-- su anda butun datalar sag tablodan gelecegi icin tum musterileri gormus olacagiz 
-- NOT: right join ve left join kullanirken RIGHT OUTER JOIN veuya LEFT OUTER JOIN yazabiliriz
-- ancak bu her ne kadra teknik olarak dogru olsa da gereksiz kelime yazmaktan kacinmak ve tipkki inner join yerine yalnizca
-- join yazdigimiz gibi burada da yalnizca left join ve right join yazmak daha kolay olacaktir

-- ---------------------
-- 		EXERCISE
-- ---------------------
-- order_items talosundaki product_id ve quantity  ile product talosundaki name sutunlarini iceren bir tablo olusturalim
-- burada product tablosuna join yapmamiz gerekiyor
-- Boylece her urunun kac kere siparis edildigini gorebiliriz
-- 
SELECT 
	p.product_id,
    p.name,
    oi.quantity
FROM products p
LEFT JOIN order_items oi
	ON oi.product_id = p.product_id
ORDER BY p.product_id;











