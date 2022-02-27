USE sql_store;

-- ------------------------------------------------------------
-- 		 *********  INSERTING HIERARCHICAL ROWS  *********
-- ------------------------------------------------------------	

-- Simdiye kadar yalizca bir tabloya nasil veri ekleyecegimizi gorduk
-- Bu derste ise birden cok tabloya nasil veri ekleyecegimizi ogrenecegiz

-- orders tablosuna bakalim (table definition/tool icon)
-- order_id, customer_id,... etc gibi sutunlara sahip oldugunu goruyoruz
-- ancak bu order icin gercek ogeler bu tabloda degil (siparisin icerdigi seyler burada yazmiyor) 
-- onlar order_items tablosunda duruyorlar
-- Bir sipariste birden fazla siparis ogesi olabilir 
-- Buna parent-child iliskisi diyoruz
-- Bu iliskide ana tablo orders tablosudur, order_items tablosu da child tablodur 
-- Boylece orders tablosundaki bir satirda birden fazla child olabilir 
-- yani bir order recor'u birden fazla order_item record'u icerebilir

-- Bu derste icerdigi tum order_item'larla birlikte bir order'i nasil tablomuza ekleyecegimizi ogrenecegiz
-- (how to insert an order and all it's items)
-- dolayisiyla bir data birden fazla tabloya nasil eklenirü, bunu ogrenmis olacagiz

-- orders tablosuna record ekleyelim
-- oncelikle yapacagimiz sey bu tabloda yer alan sutunlara bakmak olacaktir
-- (clict tool icon) biraz fazla gorunuyor ancak bunlarin hepsini yazmak zorunda degiliz
-- yalnizca NN kutucugu isaretli olan sutunlari eklememiz yeterli olacak (required = NN kutucugu dolu olan sutunlari eklemek)
-- so now we have just 4 columns
-- bunlar arasindan da order_id AI (auto increment) degerine sahip oldugu icin bunu da yazmamiz gerekmiyor
-- geriye yalnizca 3 sutun kaldi, harika
-- burada customer_id sutununa gecerli bir customer_id degeri atamak(supply) zorundayiz 
-- sutunumuza gidip bakalim, 11 tane record var ve her birinin gecerli bir id'si var
-- 1, id olarak kullanilmamis o halde ben ekleyecegim record icin id olarak 1 degerini kullanabilirim
-- yine ayni sekilde status sutunu icin de gecerli bir deger girmem gerekiyor 
-- aksi takdirde sql bana kizar
-- uraya kadar anlattiklarimiz su sekilde yazilir: 
INSERT INTO orders (customer_id, order_date, status)
VALUES
	(1, '2019-01-02',1);
    
-- simdi de order_ityems tablosuna bakalim
-- bu taloda order_id sutunumuz var, PK anaktarina ve AI ozelligine sahip
-- biz bir order ekledigimizde MySql siparisimize bir id degeri olusturacak
-- bizim ogelerimizi tabloya ekleyebilmemiz icin bu id degerini ogrenmemiz gerekiyor  
-- peki bunu nasil yapariz, asagiyi dikkatlice okuyalim

-- sql bazi hazir methodlar icerir, (yerlesik fonksiyonlar)
-- bu fonksiyonlardan biri de LAST_INSERT_ID fonksiyonunudur
-- 
SELECT LAST_INSERT_ID();
-- bu fonksiyon bana tabloma en son ekledigim record'uma MySql'in atadigi id degerini dondurur
-- 11 dondurdu, bunu tablomuza giderek dogrulayabiliriz

-- artik son eklenen record'un id degerini nasil alacagimizi ogrendigimize gore
-- child recordlari eklemek icin bu id'yi kullanabiliriz
-- o halde yeni bir ekleme komutu yazalim
-- ekleme islemini order_items tablosuna yapacagiz, tool'dan gidip sutunlarini inceleyelim
-- 4 sutunumuz var 4'u de required
-- bu sebeple tek tek sutun isimlerini belirtmemize gerek yok
-- dogrudan, uygun siralama ile values() icerisine degerlerimizi yazmamiz yeterli olur
-- peki id'miz nedir --> LAST_INSERT_ID()'den donen degerdir, o halde bu fonksiyonu, id kismina yazalim
INSERT INTO order_items
VALUES
	(LAST_INSERT_ID(), 1, 1, 2.95),
	(LAST_INSERT_ID(), 2, 1, 3.95);

-- bu sorguyu calistirdiktan sonra orders ve orders_item tablolarina bakalim
-- refresh utonuna basabilirsin 
-- boylece hiyerarsik olarak iki tabloya birden veri eklemis olduk






