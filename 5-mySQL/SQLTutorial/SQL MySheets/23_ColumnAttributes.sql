USE sql_store;

-- ------------------------------------------------------------
-- 			 *********  COLUMN ATTRIBUTES  *********
-- ------------------------------------------------------------	

-- Bu derste tabblomuza nasil veri ekleyecegimizi, silecegimizi ve verilerimizi nasil guncelleyebilecegimizi ogrenecegiz

-- Customers tablomuzu tool icon'una basarak inceleyelim, 

-- tablomuzun sol tarafinda sutun isimleri yer alir

-- onun hemen yaninda ise data type yer alir
-- int --> integer(tam sayialar), 
-- varchar --> variable character (string olarak dusunebiliriz) genelde yaninda parantez icerisinde sayi bulunur, 
-- 			   bu alabilecegi maximum karakter sayisi anlamina gelir
-- 			   bu kismi biraz daha detaylandirmak istiyoum
-- 			   mesela ben isim sutunu icin vharcahar(50) tanimladim, bu demek oluyor ki max 50 karakterden olusan isim yazabilirim
-- 			   ancak kullandigim isimler 5 karaktere sahip olsun
--             bu durumda sql kalan 45 karajteri doldurmak icin bosluk ekleyecek ve gereksiz hafiza kullanimi olusmus olacak
-- 			   buna dikkat etmeliyiz

-- siradaki sutunumuz PK sutunu (Primary Key)
-- PK kutucugu tiklenmis sutunlarin yaninda sari bir anahtar isareti cikar
-- Bu sebeple bu sutunda yer alan degerler unique olarak tutulur 

-- sonraki sutun NN sutunu (not null)
-- NN kutucugu tiklanmis sutunlardaki degerler null olamazlar, null birakilamaz ve mutlaka bir deger atanmasi zorunludur anlamina gelir
-- kutucuk bos ise bu degerin null deger alabilecegi ve 
-- bu degerlerin atamasinin tamamen optional oldugu anlamina gelir

-- NN'in hemen yaninda olmayan ama ilerleyen sutunlar arasinda yer alan bir sutun da AI sutunu (auto increment)
-- bu sutun genellikle PK sutunu ile birlikte kullanilir
-- yani bir sutun PK anahtarina sahipose AI kutucugu da tiklenmis olur, diger sutunlar tiklenmemis olur 
-- tablomuza her yeni kayit ekledigimizde, database motorumuzun ona bir id atamasi yaopmasina izin vermis oluyoruz (pk id sutununda ise)
-- bu atama son satira bakilarak yapilir ve 1 arttirilarak gidilir
-- yani benim tablomda 10 customer var ve ben yeni bir tane daha eklemeye calisiyorsamm
-- database'im buna id olarak 11 verecek ve yazdigim veriler ile bu customer'in kaydini olusturacak
-- bir tane daha eklemek istedigimde artik son satirdaki id'im 11 oldugu icin bunu 1 arttirarak yeni customer'a 12 id'sini verecek
-- 

-- inceleyecegimiz sutunlardan biri de Default/Expression sutunu
-- ornegin birth_date sutunu icin Defalt/Expression sutunundaki degerim null ise: 
-- if I don't supply a value, MySql will supply the null values
-- benim birth_date datasi yazmadigim kayitlara mySql kendisi bir deger atamasi yapacak ve 'null' yazacaktir
-- benzer sekilde, customer tablomuzdaki points sutunu icin default/Expression value olarak 0 belirlemisiz
-- yani atama yapilmamasi durumunda MySql defgault olarak bu deger icin 0 atamasi yapacaktir 

-- simdilik buradaki diger sutunlarla ilgilenmeyecegiz, vakti geldikce ilerleyen derslerde onlara da deginecegiz
-- 

