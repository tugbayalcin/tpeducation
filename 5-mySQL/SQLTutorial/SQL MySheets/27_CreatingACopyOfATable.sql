USE sql_store;

-- ------------------------------------------------------------
-- 		 *********  CREATING A COPY OF A TABLE  *********
-- ------------------------------------------------------------	

-- Bu derste bir tablodan diger bir tabloya nasil veri kopyalayacagimizi ogrenecegiz
-- orders tablomuza bakalim
-- simdi bu tablomuzun orders_archive adinda bir kopyasini olusturmak istedigimizi varsayalim
-- orders tablosundaki her bir satiri yeni tablomuza insert into yapmaliyiz
-- eger ilk tabloda 10 kayit varsa, bu 10 satirdan olusan bir insert statement yazacagimiz anlamina geliyor
-- bu cok zaman alan bir yontemdir
-- bu yuzden cok daha kisa ve etkili olan baska bir yontem deneyecegiz
-- bunun icin oncelikle yeni tabloyu create etmemiz gerekiyor
-- 
CREATE TABLE orders_archived AS      -- AS keywordunu UNUTMA : orderds gibi bir tablo olustur demek
SELECT * FROM orders;

-- bu komutu calistirip navigator panel'i refresh yaptigimizda tablonun orada yer aldigini goruruz
-- tablonun sutunlarina bakalim
-- orders ile tamamen ayni
-- ancak tabloyu design mode'da acarsak (tool icon) bu tabloda PK bulunmadigini goruruz
-- sql bu komut ile talo olustururken PK AI gibi degerleri ignore eder
-- boylece ekleyecegizim her data icin bu degerleri duzgunce eklememiz gerekir
-- (ya da gidip design mode'dan PK isaretleyemez miyim ?? yapabilirim gibi gorunuyor )


--  simdi naviagtor panel uzerinden order_archived tablosuna sag click yapalim ve truncate'i secelim
-- tablomuza yeniden baktigimizda, tablonun ve sutunlarin yerinde durdugunu ancak icindeki verilerin silindigini goruyoruz 

-- simdi orders tablosundan buraya  yalnizca bir alt kayit kumesi eklemek istedigimizi dusunelim
-- mesela 2019'dan once verilen tum siparisleri buraya eklemek istiyoruz
-- bu veriler asagidaki gibi sorgulanabilir
SELECT *
FROM orders
WHERE order_date < '2019-01-01';
-- simdi ise bunlari orders_archived tablosuna eklemeliyiz
-- bunu yapmak icin ise, yazdigimiz bu query'yi sub query gibi kullanacagiz
-- insert komutu na bu sub query'yi ekleyecegiz

INSERT INTO orders_archived   -- burada () ile sutun adi vermemize gerek yok cunku tum sutunlerin verisi uygun bir sekilde sub query'den gelecek
SELECT *
FROM orders
WHERE order_date < '2019-01-01';
-- that's it, simdi gidip tablomuza bakalim ve onu refresh edelim 


-- -----------------------
-- 		 EXERCISE
-- -----------------------
-- cok guzel bir egzersiz dedi hoca :)
-- sql_invoicing database'ine geri donelim ve invoices tablosuna bakalim
-- bu tabloyu invoices_archived tablosuna kopyalayalim
-- ancak bu tabloda client_id yerine musteri adi sutunu olsun
-- bunu yapmak icin client tablosu ile join yapma islemini sub query olarak kullanabiliriz
-- ayrica egzersizi daha da ilginc hale getirmek icin
-- yalnizca odemesi olan faturalari kopyalamak istiyoruz
-- gercekten cok guzelmis :)

USE sql_invoicing;

CREATE TABLE invoices_archived AS
SELECT 
	i.invoice_id,
    i.number,
    c.name AS client,
    i.invoice_total,
    i.payment_total,
    i.invoice_date,  -- bu satirda
    i.due_date,    -- bu satirda
    i.payment_date -- ve bu satirda i. diye belirtmene gerek yok, bunlar sadece invoices tablosuna ait sutunlar anca ben belirtmeyi tercih ediyorum
FROM invoices i			-- prefix olmadan da gorursen sasirma
JOIN clients c
	USING (client_id)
WHERE payment_date IS NOT NULL;

-- harika, aferin cozdun bu isi 










