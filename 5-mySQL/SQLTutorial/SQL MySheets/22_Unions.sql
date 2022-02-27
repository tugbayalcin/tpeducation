USE sql_store;

-- ------------------------------------------------------------
-- 				 *********  UNIONS  *********
-- ------------------------------------------------------------

-- sql'de birlestirme islemleriyle ilgili join komutuna dair her seyi gorduk
-- bunlar temelde talolari birbirine baglama islemleriydi
-- ancak biz sql'de satirlari da baska tablolara baglayabiliyoruz
-- bu oldukca guclu bir ozelliktir

SELECT *
FROM orders;
-- bu sorgudaki order_date sutununa bakalim, en ustteki satirin 2019'da, 
-- digerlerinin ise daha eski yillarda verilmis  oldugunu goruyoruz
-- peki biz siparisleri icinde bulundugumuz yilda verildiginde aktif 
-- onceki yillarda verildiginde archived gorunecek sekilde etiketlemekistesek ne olur
-- 
SELECT 
	order_id,
    order_date,
    'Active' AS status            -- tabloda olmayan bir sutunu sorhuma ekledim gibi oldu 
FROM orders
WHERE order_date >= '2019-01-01'; -- burasi hos degil, cunku hard coding var, dynamic degil, 
								  -- seneye bu sorguyu calistirsam bana 2019'u verecek ama ben current year olmasini istemistim
                                  -- ilerki derslerde bunu gorecegiz
-- bu sorgu bize 1 kayit dondurdu                                  
                                 
-- simdi de bu sorgunun tam tersini yapalim
SELECT 
	order_id,
    order_date,
    'Archived' AS status            -- tabloda olmayan bir sutunu sorhuma ekledim gibi oldu 
FROM orders
WHERE order_date < '2019-01-01';
-- bu sorgu ise bize 9 kayit dondurdu

-- biz union operatorunu kullanarak bu kayitlari bbirlestirebilir ve tek bir tabloda gorunmesini saglayabiliriz
SELECT 
	order_id,
    order_date,
    'Active' AS status
FROM orders
WHERE order_date >= '2019-01-01'
UNION
SELECT 
	order_id,
    order_date,
    'Archived' AS status
FROM orders
WHERE order_date < '2019-01-01';

-- burada sorgularimiz ayni idi ancak sorgulari tamamen farkli iki tabloyu da tek bir sonuc tablosunda birlestirebiliriz

-- hemen bir ornegini gorelim
SELECT first_name
FROM customers
UNION
SELECT name
FROM shippers;
-- bu sorgu bana tum musteri ve nakliyeci adlarinin bulundugu tek bir sutun dondurur

-- yani ozetle birden fazla kaynaktan gelen veriyi tek bir kumede toplayabiliriz
-- bu tablolaf ayni database'den alinabilecegi gibi farkli database'lerden de alinabilir
-- !! DIKKAT DIKKAT birlestirme islemi yapacagin zaman ilk tablodan donecek sutun sayisi ile ikinci tablodan donecek sutun sayisi
-- esit olmazsa hata alirsin
-- tipki asagidaki gibi
SELECT first_name, last_name -- 2 sutun
FROM customers
UNION
SELECT name 				 -- 1 sutun
FROM shippers;
							 -- get an Error
-- cunku sql bunlari nasil birlestirecegini bilemez 

-- Union ile yapilan birlestirmelerde, result table'daki sutun adi, daima ilk yazdigim tablodaki sutun adidir
-- eger alias vermek istiyorsam ilk tablodaki sutunun yanina yazmaliyim 

-- -----------------------
-- 		 EXERCISE
-- -----------------------
-- customer_id, first_name, points, type 
-- sutunlarini iceren bir tablo olusturan sorguyu yaziniz
-- type sutununu biz olusturduk
-- eger points 2000'den kucukse bronz, 2000-3000 arasi silver, 3000'den buyuk olanlar gold
-- first_name'e gore silansin
-- 
SELECT 
	customer_id,
    first_name,
    points,
    'Bronze' AS Type
FROM customers 
WHERE points < 2000
UNION
SELECT 
	customer_id,
    first_name,
    points,
    'Silver'
FROM customers 
WHERE points BETWEEN 2000 AND 3000
UNION
SELECT 
	customer_id,
    first_name,
    points,
    'Gold' 
FROM customers 
WHERE points > 3000
ORDER BY first_name;


-- UNION keywordu kume mantiginda calisir
-- birden fazla sorgunun sonuc kumesini birlestirir
-- ve bunu yaparken eh riki kumede de ayni deger varsa bunu yalnizca 1 kere yazar
-- eger bu sekilde her iki kumede de olan degerin ikisini de yazdirmak istersek UNION ALL kullaniriz






