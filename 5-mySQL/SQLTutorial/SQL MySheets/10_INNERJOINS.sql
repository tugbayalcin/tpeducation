USE sql_store;

-- ----------------------------------------------------
-- 		*********  INNER JOINS *********
-- ----------------------------------------------------

-- simdiye kadar tek bir tablodan bir veya birden fazla sutun secerek sorgularimizi yaptik
-- ancak gercek dunyada birden fazla tablo ile ayni anda calisiriz ve sorgularimiz daha karmasik bir hale gelir
-- simdi bu tablolri biraz daha yakindan inceleyelim

-- naviagtor panel'den orders talosuna bakalim
-- customer_id sutununu kullandigini goruyoruz 
-- ancak burasi bir order tablosu
-- yani musterilerin adres bilgilerini, mail veya telefon bilgilerini burada tutmayiz 
-- zaten bu bilgiler gelecekte degisebilir ve ben veriyi her kullandigim yerde degistimek gibi zahmetli bbir is ile kari karsiya
-- kalmak istemem 
-- dolayisiyla belirli gruplardaki verileri yalnizca bir tabloya koyup, ihtiyaci olan diger tablolarin
-- bu tabloya erisimini saglayarak guvenli bir baglanti olusturabilirim 

-- JOIN keyword'u iki tabloyu birbirine baglamamizi saglayan bir komuttur
-- SQL'de iki tip JOIN vardir 
-- Birincisi: INNER JOIN
-- Ikincisi: OUTER JOIN

-- simdi oncelikle INNER JOIN'e bakalim
-- yalnizca JOIN yazdigimizda da MySql bunu INNER JOIN olarak algilar
-- bu yuzden inner join sorgularimizda yalnizca join yazacagiz

-- iki taloyu birbirine baglamak istedigimde ikisinde ortak olan bir sutun kullanarak bu islemi yapmaliyim
-- bbu yuzden birbirine baglamak istedigim sutunlari sorgumda acik bir sekilde belirtmeliyim, 
-- bunu yapmak icin ON keyword'unu kullaniriz

SELECT *
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id;
-- bu sorguyu calistirdigimizda once orders tablosunun, hemen yaninda da customers talosunun yer aldigini gorecegiz

-- simdi bu karmasikliktan siyrilalim ve sorgumuzu birkac sutun olacak sekilde duzenleyelim
SELECT order_id, orders.customer_id, first_name, last_name
 -- buraya yalnizca customer_id yazamam, cunku her iki taloda da var ve sql hangisini getirecegini bilmiyor, 
 -- bu yuzden hangi talodaki customer id sutununu istedigimi velirtmeliyim
 -- hangi tabloyu yazdigim gercekten onemli degil cunku her iki sutun da birbirinin aynisi zaten
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id;
-- bu komutta oldugu gibi tablo adlarini siklikta tekrar edip defalarca uzun uzun yazdik
-- bunun on une gecmek icin siklikla tekrar ettigimiz kelimeler icin de alias kullanabiliriz 
-- siklikla tablo isimlerinde alias kullaniriz
-- alias kullanirken AS keyword'unu kullanmak zorunda degiliz 
-- simdi ayni sorguyu tablo isimlerimizin alias'larini AS keywordunu kullanmadan olusturarark yazalim
SELECT order_id, o.customer_id, first_name, last_name
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

-- ---------------------
-- 		EXERCISE
-- ---------------------
-- order_items tablosunu products table ile  product_id sutunundan birlestirin
-- ve product_id, name, quantitiy ve unit_price sutunlarini iceren bir tablo olusturun
SELECT order_id, oi.product_id, quantity, oi.unit_price
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id;

-- NOT: eger bir isim icin alias olusturduysan bunu o ismin gectigi her yerde kullanmak zorundasin
-- bazi yerde kisaltma bazi yerde uzun halini kullanma gibi bir secenegin olmaz 
-- sql sana kizar 

-- ayrca sorumuzla ilgili olarak, her iki tabloda da unit_price sutunlari var ve bu iki sutunun tuttugu degerler farkli, 
-- peki biz hangisini alacagiz, bu gercekten onemli bir soru cunku aksi takdirde urun fiyatlarini dogru hesaplayamayiz
-- order_id tablosundaki birim fiyat urunun anlik fiyatidir, urun fiyatlari degisken olabilir ve o anda o siparis gecildigindeki fiyati gosterir
-- products table'indaki unit_price ise su anki guncel fiyattir 
-- BU KİSMİ TAM ANLAYAMADİM NEDEN İKİ UNİT PRİCE FARKLİ VE NEYE GORE HANGİSİNİ SECİYORUM ANLAMADİM ?????




