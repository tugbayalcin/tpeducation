USE sql_store;

-- ----------------------------------------------------
-- 		*********  THE ORDER BY CLAUSE  *********
-- ----------------------------------------------------

/*
	ORDER BY keyword'u verileri siralamamiza yardim eden bir komuttur
    MySQL'de id sutunu default olarak siralama yapilan sutundur ve bu siralama natural order'a gore yani kucukten buyuge dogru yapilir
    Cunku tablo ayarlarina akarsak id sutununun yaninda sari bir key gorecegiz
    Bu anahtar bu sutunu 'birincil anahtar sutunu' haline getirir
    Relational tablolarda tablolar birbirine bu sutun yardimi ile baglanir
    Biz ise  istedigimiz zaman siralamanin baska sekilde yapilmasi ici ORDER BY keyword'unu kullanabiliriz
*/

SELECT *
FROM customers
ORDER BY first_name;
-- simdi ise artik tablom id sutununa gore degil first_name sutununa ve natural order'a gore siralanacaktir
-- string ifadelerde natural order artan siraya yani ASCENDES'e goredir
-- eger biz ters sirali olarak siralansin istersek de bunu tersine yani DESCENDES'ine cevirmeliyiz
-- bunun icin DESC keywordunu kullanmamiz yeterlidir
SELECT *
FROM customers
ORDER BY first_name DESC;

-- ayrica datalari birden fazla sutuna gore de siralayabiliriz
-- mesela her musteriyi once yasadiklari eyalete gore, ardindan ber eyaleti de kendi icinde first name'e gore siralamak istiyoruz
SELECT *
FROM customers
ORDER BY state, first_name;
-- burada onemli olan daima ilk yazdigimiz sutunun ilk once siralanacak olmasidir
-- ayrica burada yine tersten sirelama uygulayabilirim, istersem sutunlardan yalnizca birine istersem de her ikisine birden uygulayabilirim
SELECT *
FROM customers
ORDER BY state DESC, first_name;

SELECT *
FROM customers
ORDER BY state DESC, first_name DESC;

-- MYSQL'DE OLUP DIGER VERI TABANLARINDA OLMAYAN BIR SORGU:
-- ben verilerimi select ile getirdigim sutunlar haricindeki sutunlara gore siralayabilirim
-- daha anlasilir olmasi icin bir ornek verelim
-- ben tablomdan isim ve soyisim sutununu, dogum tarihine gore sirali olarak getirebilirim
-- bu sorgu mysql de hata vermezken diger database yapilarinda sorun cikarir
SELECT first_name, last_name
FROM customers
ORDER BY birth_date;

-- simdi sorgumuza tabblomuzda yer almayan bir sutun eklemek istedigimizi dusunelim, bu sutuna gore de siralama yaptirabiliriz 
SELECT first_name, last_name, 10 AS points -- bu sutun aslinda tabloda yok, Alias(takma ad) kullanarak biz yazdik
FROM customers
ORDER BY points, first_name;
-- tabi. burada 10 yerine daha komplike bir math expression da yer alabiirdi

-- siralama ile ilgili bakacagimiz son sey de su
-- biz siralama yaptirmak istedigimiz sutunun adini uzun uzun yazmak yerine sutun numaralarini kullanarak da siralama yaptirabiliriz
SELECT first_name, last_name
FROM customers
ORDER BY 1,2;
-- burada 1 first_name sutununun sira numarasidir, 2 ise last_name sutununun siralamasidir 
-- siralama orjinal tablodaki siraya gore degil, select keywordunun yanina yazdigim siraya gore yapilir
-- bu yazim her ne kadar kolaylik olarak gorunse de aslinda kacinmamiz gereken bir kulanim seklidir
-- cunku istemedigimiz durumlarin olusmasina oldukca musait biryapisi vardir
-- mesela ilerleyen zamanlarda geri donup bu sorgumun basina bir de birth_date sutununu ekledigimi dusunelim
-- istedigim sey sadece sutun eklemekti ve ben buna odaklanip order by satirinda degisiklik yapmadim
-- bu durumda artik verilerim isim ve soyisme gore siralanmayacaktir
-- birth_date ve isim sutunlarina gore siralanacaktir, bu yuzden acik acik sutun isimlerini belirterek sitalama yapmak cok daha saglikli sonuclar uretir

-- ---------------------
-- 		EXERCISE
-- ---------------------
-- order_items tablosunda order_id'si 2 olan verileri total prise'a gore buyukten kucuge dogru siralayin
SELECT * ,(quantity * unit_price) AS total_price
FROM order_items
WHERE order_id=2
ORDER BY total_price DESC;

SELECT * 
FROM order_items
WHERE order_id=2
ORDER BY (quantity * unit_price) DESC;
-- gordugumuz gibi siralama yapomak istedigimiz sutunun talomda olmasi bile gerekmez 







