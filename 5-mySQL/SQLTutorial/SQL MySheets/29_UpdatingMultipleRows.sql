USE sql_invoicing;

-- ------------------------------------------------------------
-- 		 *********  UPDATING MULTIPLE ROWS  *********
-- ------------------------------------------------------------

-- Bir onceki derste bir satirdaki verileri guncelemeyi ogrendik
-- Simdi ise birden fazla satiri guncellemke istedigimizde bunu nasil yapacagimizi ogrenecegiz
-- Bu komut digerine oldukca benzer olacak ancak condition'imiz daha genel (kapsayici) olacaktir

-- mesela faturalara bakarsak client_id'si 3 olan birden fazla fatura oldugunu goruruz
-- bu musteriye ait olan tum faturalari guncellemek istersek sorgumuzu soyle guncellemeliyiz

UPDATE invoices     
SET payment_total = invoice_total * 0.5, 
	payment_date = due_date 			
WHERE client_id =3;
-- bu sorguyu MySql Workbench'de calistirirsak hata aliriz
-- Cunku MySql Workbench safe update mode (guvenli guncelleme modu)'da calisir
-- bu da ayni anda yalnizca bir kayit'ta degisiklik yapmamiza olanak tanir
-- bu sql sorgusu MySql Workbench disindaki herhangi bir ide'de calisacaktir,
-- guvenli guncelleme modu MySql Workbanch'e ozgudur

-- simdi bunu nasil handle edecegimize bakalim
-- ekranin en ustundeki panelden MySQLWorkbanch > Preferences > SQL Editor > 
-- Sayfanin en altina inip Safe Update satirindaki kutucugun tikini kaldir ve kaydet
-- Bu ozellik  tablodaki bir grup kaydi yanlislikla guncellememizi veya silmemizi onler 
-- ayarin etkinlesmesi icin MySQLWorkbanch'i kapatip acmamiz gerekiyor
-- simdi yukaridaki son sorguyu yeniden calistiralim ve ta daaa 3 numarali musterinin tum kayitlari guncellendi

-- ayni sorguyu su sekilde de yazabiliriz
UPDATE invoices     
SET payment_total = invoice_total * 0.5, 
	payment_date = due_date 			
WHERE client_id IN (3,4);
-- 3 ve 4 numarali musterilerin kayitlari guncellenecek

-- -----------------------
-- 		 EXERCISE
-- -----------------------
-- Write a SQL Statement to
-- give any customers born before 1990
-- 50 extra points 
USE sql_store;
UPDATE customers
SET points = points + 50
WHERE birth_date < '1990-01-01';







