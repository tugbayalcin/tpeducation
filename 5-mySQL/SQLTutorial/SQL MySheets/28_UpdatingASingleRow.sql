USE sql_invoicing;

-- ------------------------------------------------------------
-- 		 *********  UPDATING A SINGLE ROW  *********
-- ------------------------------------------------------------

-- Bu derste verilerimizi nasil guncelleyecegimizi ogrenecegiz
-- invoices tablomuza bakalim
-- payment_total ve payment_date sutunlarini inceleyelim
-- payment_total sutunundaki verinin 0.00 oldugu yerlerde payment_date'in de null oldugunu goruyoruz 
-- Simdi bu bilgiyi kaydeden sistemde bir sorun oldugunu dusunelim
-- Diyelim ki musteri 10 dolar odedi
-- Bu yuzden verimizi kendimiz guncellemeliyiz
-- Bunu yapmak oldukca basittir

UPDATE invoices     -- guncellemek istedigimiz talo
SET payment_total = 10, payment_date = '2019-03-01'  -- guncellemek istedigimiz sutun/sutunlar ve yeni degeri
WHERE invoice_id =1;  -- o sutunda bulunan ve degeri guncellenecek hucre (satir da diyebiliriz)(invoice id'si 1 olan satir'daki veri demek)

-- sorguyu calistirip talomuzu refresh yaptiktan sonra guncelleme isleminin basarili bir sekilde gerceklestigini goruyoruz
-- simdi de diyelim ki ahh olamaz o da ne yanlis satiri guncellemisiz 
-- aslinda invoice id'si 3 olan satiri guncelleyecektim vay basima gelenler
-- hemen update'i geri almam lazim
-- 
UPDATE invoices     
SET payment_total = DEFAULT, payment_date = NULL  
WHERE invoice_id =1;
-- geri aldik ama ben bu sekilde geri almayi begenmedim
-- bunun calismis olmasinin sebebi tamamen bu iki sutunun design mode'da DEFAULT sutununda degere sahip olmasi idi,
-- ya gercekten kaybetmek istemeyecegim ve default olmayan bir degeri yanlislikla update ettiysem bunu nasil geri alacagim ?????

-- simdi id'si 3 olan veriyi guncellemeyi deneyelim
-- burada musteri odeme yapmis ama varsayalim ki tutarin tamamini degil yarisini odemis olsun
-- burada 148/2 = 74 olarak hesaplayip elimle 74 yazmak yerine expression kullanalim
UPDATE invoices     
SET payment_total = invoice_total * 0.5, 
	payment_date = due_date 			-- musteri kismi odeme yaptigi icin artik kalan odeme icin son tarih yazabiliriz
WHERE invoice_id =3;

-- simdi bu sorguyu calistiralim ve tablomuzu refresh edelim
-- uyari veriyor  ama guncelleme de yapiyor, ayrica yukarida bahsettigim sorunun cozumu degil
-- crtl z gibi bir sey bekliyorum ??? buna daha sonra bakalim

-- RETURNING diye bir komut var sanirim, w3schoolda bulkursan yazarsin, bulamazsan google'la !!!!




