USE sql_store;

-- ------------------------------------------------------------
-- 		 *********  INSERTING MULTIPLE ROWS  *********
-- ------------------------------------------------------------	

-- Bu derste tek seferde birden cok record'u tablomuza nasil ekleyecegimizi ogrenecegiz

-- Bunu shippers tablosu uzerinden ornekler yaparak inceleyelim
-- shippers tablosunun table definition'ina (tool icon'a click yap) bakalim
-- Bu tabloda 2 sutunumuz var
-- birincisi id ve bu sutuna AI ozelligini tanimlamisiz,
-- yani bizim deger atamamiza gerek olmadan sql otomatik olarak id degeri verecek, harika
-- diger sutun ise name sutunu, biz de simdi bu sutuna degerler vererek record'larimizi olusturacagiz
-- sutun isimlerimizi belirterek ekleme yapacagiz boylece her seferinde id icin DEFAULT yazmamiza gerek kalmayacak
-- birden cok record eklemek istedigimizde tek yapmamiz gereken  values satirina birden cok deger ekleyip bunlari virgul 
-- kullanarak birnirinden ayirmak olacak

INSERT INTO shippers (name)
VALUES
	('Shipper1'),
	('Shipper2'),
	('Shipper3');
-- bu sorguyu calistirdigimizda verikler tablomuza eklenmis olacak, gidip shippers tablosuna bakalim
	  
	  
-- -----------------------
-- 		 EXERCISE
-- -----------------------
-- Insert three rows in the products table
INSERT INTO products (name, quantity_in_stock, unit_price)
VALUES 
	('tea pot', 30, 5.75),
	('tea cup', 90, 1.30),
	('cake plate', 60, 2.50);
    
-- NOT:  tabloya hicbşir sey eklemeden once tabloda 10 record vardi
-- otomatik arttirma (AI) acik oldugu icin ekledigim bu son 3 record id olarak 11, 12 ve 13 degerlerini aldilar
--  eger ben bu tablodan ekledigim son 2 veriyi silersem, yani 12 ve 13 numarali id'ye sahip recordlari silersem
-- ve yeni bir record eklemek istersem, yeni record'un id'si 12 olmayacak, 14 olacaktir
-- cunku datalar silinse bile sql bunu unutmaz ve en son 13  degerinde kaldigi icin bir sonraki record'a 14 degerini atar






