USE sql_hr;

-- -------------------------------------------------------
-- 			*********  SELF JOINS *********
-- -------------------------------------------------------
-- sql'de bir talo ayni zamanda kendisine de baglanabilir 
-- mesela sql_hr database'indeki employees tablosunu inceleyelim
-- tablodsa calisan_id, name surname title salary'nin yani sira reports to diye bir sutun var
-- bu sutun her bir calisanin bagli oldugu yoneticisini gostermekte
-- ancak burada yonetici bilgileri acikca yer almamis (cok makul bir durum, cunku bu bilgiler gelecekte degiseilir)
-- dikkat edilirse sutunda yazilan yonetici bilgisi, yoneticinin calisan_id'sinden olusmakta
-- yani tablomuzun ilk sutunu !!
-- yonetici de bir calisan oldugu icin aslinda o da bu tabloda yer aliyor 
-- boylece tablo icerisindeki bir data, reports_to sayesinde tablo icerisindeki baska bir datayla baglanti kurmus oluyor 
-- dikkat etmemiz geren bir diger sey ise bu tablodaki employee'lerden birinin reports_to datasina sahip olmamasi (null)
-- yani yoneticisinin olmamasi
-- bu su anlama geliyor: CEO tam olarak karsimizda duruyor 

SELECT *
FROM employees e
JOIN employees m 
	ON e.reports_to = m.employee_id;
-- burada manager'lari getirecegimiz zaman farkli bir alias kullanmamiz gerekiyor
-- employee'ler icin e, manager'lar icin m kullandik

-- simdi yalnizca calisan ve manager adinin yazdigi daha basit bir tablo olusturacak sorguyu yazalim
SELECT 
	e.employee_id,
    e.first_name,
    m.first_name
FROM employees e
JOIN employees m 
	ON e.reports_to = m.employee_id;
    
-- burada tablolarimiz ve sutunlarimiz ayni oldugu icin sorgu sonucu olusan taloda iki tabbe first_name sutunu oldu,
-- biz her ne kadar bunlardan birinin employee, digerinin manager oldugunu bilsek dahi, cok da hos bir gorunum degil
-- simdi durumu daha clear hale getirmek icin alias'lardan faydalanalim
SELECT 
	e.employee_id,
    e.first_name,
    m.first_name AS manager
FROM employees e
JOIN employees m 
	ON e.reports_to = m.employee_id;
    
-- temelde bir tablonun kendine join edilmesi ile baska bir tabloya join edilmesi arasinda hicbir fark yoktur
-- yalnizca farkli alias'lar kullanilmasina dikkat edilmeli ve her sutun onune prefix olarak bu alias'larin eklenmesidir
    
    
    
    