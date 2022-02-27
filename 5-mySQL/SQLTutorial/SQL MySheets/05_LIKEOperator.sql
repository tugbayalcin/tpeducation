USE sql_store;

-- ----------------------------------------------------
-- 		*********  LIKE OPERATOR  *********
-- ----------------------------------------------------

/*

	Belirli bir dize modeliyle eslesen verileri nasil sorgulayabilecegimize bakalim
    Mesela soyadi yalnizca b harfi ile baslayayan musterileri sorgulamak isteyelim. Bunu nasil yapariz?
    Bu sorgu icin LIKE keywordunu kullaniriz
    LIKE'dan sonra istedigimiz string pattern'i belirtmemiz gerekir
    Biz b ile baslayanlari istedigimiz icin once b yaziyoruz
    Ardindan aradigimiz kelimenin kac karakter icerdigini bilmedigimiz icin % isareti koyuyoruz
    Boylece b ile baslayan tum kelimeleri almis oluruz
    % : HERHANGİ BIR SAYIDA KARAKTERI IFADE ETMEK ICIN KULLANILIR
    _ : TEK BIR KARAKTERI IFADE ETMEK ICIN KULLANILIR
    Ayrica upper case veya lower case olmasi onemli degildir cunku zaten sql language non case sensitive bir query language idi
    Basinda: b%
    Ortasinda: %b%
    Sonunda: %b
    
*/

SELECT *
FROM customers
WHERE last_name LIKE 'b%';

-- simdi de soyadi brush ile baslayan musterileri listeleyelim 
SELECT *
FROM customers
WHERE last_name LIKE 'brush%';

-- peki biz bir kelimenin b harfini icermesini istiyorsak ancak ilk harf veya son harf olup olmadigini onemsemiyorsak ne yapariz
-- patternimizi su sekilde duzenleriz 
SELECT *
FROM customers
WHERE last_name LIKE '%b%';

-- soyadi y harfi ile biten musterileri sorgulayalim
SELECT *
FROM customers
WHERE last_name LIKE '%y';

-- simdi bir diger karakter temsilcimiz olan _ hakkinda konusalim
SELECT *
FROM customers
WHERE last_name LIKE '_y';
-- Bu sorgu su anlama geliyor: soyadi 2 harften olusan ve ikinci harfi y olan musterileri getir, ilk harfinin ne oldugu umrumda degil demek oluyor
-- her bir karakter icin bir tane _ kullanilir 
-- yani ben sorguma sunu yazarsam _ _ _ _ _ y (tabi hepsinin bitisik oldugunu dusun, ben net olarak goruneilsin diye ayrik yazdim)
-- aradigim soyisim 6 harfli olmali vce son harfi de y olmalidir 

SELECT *
FROM customers
WHERE last_name LIKE 'b____y';
-- 6 harften olusan, ilk harfi b son harfi de y olan soyisimlere sahip musterileri ariyoruz 	

SELECT *
FROM customers
WHERE last_name LIKE '_a%y';
-- ikinci harfi a olan son harfi de y olan ve toplamda kac harf icerdigiyle ilgilenmedigim soyisimlerini getirir

-- -----------
-- 	EXERCISE
-- -----------
-- Get the customer whose 
-- addresses contain TRAIL or AVENUE 
-- phone numbers end with 9
SELECT *
FROM customers
WHERE address LIKE '%trail%' OR 
	  address LIKE '%avenue%';

SELECT *
FROM customers
WHERE phone LIKE '%9';


-- Bu sorgu ile birlikte NOT operatoru de kullanilabilir
-- telefon num arasi 9 ile bitmeyenlere bakalim
SELECT *
FROM customers
WHERE phone NOT LIKE '%9';




