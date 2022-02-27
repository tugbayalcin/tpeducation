USE sql_invoicing;

-- ------------------------------------------------------------
-- 		 *********  USING SUBQUERIES IN UPDATES  *********
-- ------------------------------------------------------------

-- Bu egitimde guncellemeleri alt sorgularla nasil yapacagimizi ogrenecegiz
-- Bu cok guclu bir ozelliktir
-- Bir onceki dersteki ornegimizi kullanarak devam edelim

UPDATE invoices     
SET payment_total = invoice_total * 0.5, 
	payment_date = due_date 			
WHERE client_id =3;

-- burada birkac ilginc degisiklik yapalim
-- Mesela biz burada id'si 3 olan musterinin tum faturalarini guncelliyoruz ancak
-- ya id'si 3 olan bir musterimiz yoksa ???

-- Mesela benim bir uygulamam var ve ben musterilerimi isimleri ile buluyorum 
-- ismini bildigim bir musterinin id'sini nasil bulurum
-- bunu su sorgu ile yapabiliriz :
SELECT client_id
FROM clients 
WHERE name = 'Myworks';
-- Bu sorgu bana Myworks isimli musterinin id'sini dondurur

-- beki ben yukarida client_id=3 yazarak hard coding yazmak yerine, bu sorguyu oraya referans gecemmez miyim
-- iste simdi yapacagimiz sey tam olarak da bu 
-- bu sorguyu sub query olarak ilk sorgu ile birlestirecegiz
-- hadi yapalim:
UPDATE invoices     
SET payment_total = invoice_total * 0.5, 
	payment_date = due_date 			
WHERE client_id = 
			(SELECT client_id
			FROM clients 
			WHERE name = 'Myworks');
-- her sey harika 
-- peki biz bunu birden fazla musteri icin yapmak istersek ne olacak
-- Mesela NY ve CA'da bulunan tum musterilerin faturalarini guncellemek isteyelim
-- bu durumda yapmamiz gereken tek sey sub query'mizi guncellemek
-- 
UPDATE invoices     
SET payment_total = invoice_total * 0.5, 
	payment_date = due_date 			
WHERE client_id IN 
			(SELECT client_id
			FROM clients 
			WHERE state IN ('NY', 'CA'));
--  burada tum sorguyu yurutmeden once yalnizca subquery'yi secerek ne dondurdugune bakabiliriz
-- baktik ve 2 tabne musteri dondurdugunu gorduk
-- o halde client_id = (1,3) gibi bir ifade kullanamayacgimiz icin. burada da ufak bir degisiklik yapmamiz gerekiyor 

--  BEST PRACTICE : Bu tip sorgularda yanis verileri yanlislikla guncellememek icin oncelikle sub query calistirilir
-- guncelenecek verilerin dogrulugundan emin olunduktan sonra tum query calistirilir

-- hatta ve hatta sub query'miz olmadigi durumlarda bile guncellenecek verileri kontrol etmemizde fayda var
-- simdi bunu nasil yapacagimiza bakalim:

-- Odemenin yapildigi tum faturalarei guncellemek istedigimizi dusunelim
-- 
UPDATE invoices     
SET payment_total = invoice_total * 0.5, 
	payment_date = due_date 
WHERE payment_date IS NULL;
-- bu sorgunun tamamini calistirmadan once soyle bir query calistiralim
SELECT *
FROM invoices 
WHERE payment_date IS NULL;
-- boylece hangi kayitlarin guncellenecegini gormus oluruz
-- ardindan rahatlikla yukaridaki update query'mizi calistiabiliriz

-- -----------------------
-- 		 EXERCISE
-- -----------------------
-- sql_store dataase'ine gecelim
-- orders tablosuna bakalim
-- comment sutunu oldugunu goruyoruz
-- 3000'den fazla puani olan musteriler icin commend sutununu guncelleyin ve gold customer yapin
--  
USE sql_store;

SELECT *
FROM customers
WHERE points > '3000';
-- bu sorgu ile gold customer'lari elde ettik
-- simdi bunlarin id'sini almamiz gerekiyor
-- bu yuzden sorgumuzu soyle duzeltiyoruz
SELECT customer_id
FROM customers
WHERE points > '3000';
-- artik sorgumuz bir sub query olmaya hazir

UPDATE orders
SET comments = 'Gold Customer'
WHERE customer_id IN 
		    (SELECT customer_id
			FROM customers
			WHERE points > '3000');




