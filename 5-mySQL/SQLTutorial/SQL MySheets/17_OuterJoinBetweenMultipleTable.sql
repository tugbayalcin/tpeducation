USE sql_store;

-- ------------------------------------------------------------
-- 	 *********  OUTER JOIN BETWEEN MULTIPLE TABLE *********
-- ------------------------------------------------------------

-- Bir onceki dersin sonunda asagidaki query'yi calismistik
SELECT 
	c.customer_id,
    c.first_name,
    o.customer_id
FROM customers c
LEFT JOIN orders o
	ON c.customer_id = o.customer_id
ORDER BY c.customer_id;
-- Bu sorgu ile sioparisi olsun ya da olmasin tum musteriler    result table'da yer alir
-- order tablosuna bakarsak shipper_id diye bir sutun goruruz 
-- bu sutunda bir deger varsa, bunun anlami siparisin sevk edildigi, eger deger yok ve null ise siparisin henuz sevk edilmedigi anlamina gelir
-- result table'da gondericinin adini goruntuleyebilmek icin order talosunu ile shipper tablosunu birlestirelim
-- yukaridaki sorgumun aynisini alip yeni bir join ekleyerek bunu yapacagiz
-- 
SELECT 
	c.customer_id,
    c.first_name,
    o.customer_id
FROM customers c
LEFT JOIN orders o
	ON c.customer_id = o.customer_id
JOIN shippers sh						-- burada inner join kullandik
	ON o.shipper_id = sh.shipper_id
ORDER BY c.customer_id;
-- sorgumuzu bu haliyle calistirdigimizda tum siparislerimizi gorun tuleyemeyiz
-- cunku kosulumuz sevk edilenlerin id'si ile esit olanlari getiriyordu
-- bu yuzden inner join yerine left join kullanmaliyiz

SELECT 
	c.customer_id,
    c.first_name,
    o.customer_id,
    sh.name AS shipper            -- daha net gorebilmek icin name sutununu ekleyelim
FROM customers c
LEFT JOIN orders o
	ON c.customer_id = o.customer_id
LEFT JOIN shippers sh						-- burada inner joini left join'e cevirdik 
	ON o.shipper_id = sh.shipper_id
ORDER BY c.customer_id;
-- boylece siparisi olsun olmasin tum musterilerimizi, 
-- ve kargolanmis olsun olmasin musterilerimizin verdigi tum siparisleri result table'da goruntuleyebiliyoruz 
-- tum bunlar outer join sayesinde yailabildi 


-- right ve left join kullanimlarinda demistik ki, bu her iki komut ile ayni sonucu 
-- alabilmemiz mumkun, bunun icin tablolarin yerini degistirmemiz yeterli
-- ancak birden fazla tabloyu outer join ile birlestirmeye kalktgmzda isler karmasiklasiyor ve
-- hic de iki tablonun yerini degistirmmek kadar kolay olmuyor 
-- bu durtumlarda sorgumuzu okuyan bbiri, tablolarin birbirine nasil baglandigini gorsellestirmekte zorlanacaktir
-- ozellikle sag join ardindan sol join kullanildiginda 
-- veya tam yersi olarak sol join ardindan sag join kullandigimizda tablolarin durmunu gorsellestirmek oldukca zor olacaktir
-- bunu kolaylastirmak icin cogunlukla left join kullanmayi teric ederiz 


-- ---------------------
-- 		EXERCISE
-- ---------------------
-- asagidaki sutunlari iceren result tablosunu olusturacak sorguyu yaziniz
-- order_date order_id first_name(customer talosundan) shipper(null olanlar da goruntulensin) status 

SELECT 
	o.order_id,
	o.order_date,
    c.first_name AS customer,
    sh.name AS shipper,
    os.name AS status 
FROM orders o
JOIN customers c
	ON o.order_id = c.customer_id 
LEFT JOIN shippers sh
	ON o.shipper_id = sh.shipper_id
LEFT JOIN order_statuses os
	ON o.status = os.order_status_id
ORDER BY o.order_id;









