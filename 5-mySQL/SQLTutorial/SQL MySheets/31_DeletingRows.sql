USE sql_invoicing;

-- ------------------------------------------------------------
-- 			 *********  DELETING ROWS  *********
-- ------------------------------------------------------------

-- Bu derste verilerin nasil silinecegini ogrenecegiz
-- Bunu yapmak oldukca basit
-- yalnizca DELETE keywordunu kullanmamiz yeterli 

DELETE FROM invoices;
-- bu komut ile tablodaki tum verileri silebiliriz, truncate gibi, bunun cok tehlikeli oldugunu unutmamaliyiz
-- veya ozel olarak silinmesini istedigimiz  bir yer varsa WHERE keyword'u ile condition belirtebiliriz
-- simdilik id'si 1 olan faturayi silmek isteyelim
DELETE FROM invoices
WHERE invoice_id = 1;
-- burada ayni zamanda sub query de kullanabiliriz
-- hadi deneyelim
-- Mesela musteri adi Myworks olan tum musterileri silmeye calisalim
-- Oncelikle bu musterileri bulmamiz gerekecek
SELECT *
FROM clients
WHERE name = 'Myworks';
-- bu sorgu bize yalnizca 1 tane musteri dondurdu
-- o halde silme islemini su sekilde yapabiliriz
DELETE FROM invoices
WHERE invoice_id = 
			(SELECT *
			FROM clients
			WHERE name = 'Myworks');
-- eger sub query birden fazla musteri dondurmus olsa idi = yerine IN kullanirdik
