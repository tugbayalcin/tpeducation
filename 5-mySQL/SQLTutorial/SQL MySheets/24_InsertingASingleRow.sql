USE sql_store;

-- ------------------------------------------------------------
-- 		 *********  INSERTING A SINGLE ROW  *********
-- ------------------------------------------------------------	

-- Bu derste tablomuza nasil satir ekleyecegimizi ogrenecegiz
-- bunun icin INSERT INTO keywordunu kullaniriz

-- INSERT INTO : icine ekle (neyin icine ?)
-- INSERT INTO customers : customers tablosuna ekle (ne ekliyim ?)
-- VALUES() : ekleyecegimiz record icin tuuuum sutun degerlerini tek tek virgul ile ayirarak parantex icine yazmaliyiz
--            id, first_name,last_name, ... etc
-- 			  ancak id yerine elimizle sayi girmemeye ozen gosteririz
--            cunku bu deger unique olmali ve ben yanlslikla ayni id ye sahip baska bir record girmek isteyebilirim
-- 			  ayrica ben id icin zaten AI kutucugunu tiklemistim
-- 			  yani sql ben deger vermedigim surece otomatik olarak ardisik sayilar vererek bu atamayi kendisi yapardi
-- 			  bu yuzden VALUES() icerisine id sutunu icin DEFAUL yazarsam, sql artik otomatik id atamasini kendisi yapacaktir
-- 			  DEFAULT yazarak bu isi sana biraktim sql'cigim kolay gelsin ellerine saglik demis oluyoruz

-- NN kutucugu tikli olmayan sutunlar icin Default/Expression sutununa null yazdiysak, 
-- insert isleminde bu record ivcin atama yapmak zorunda degiliz (customers tool'una iyice bak)
-- VALUES() parantezleri icerisine bu deger icin NULL ya da DEFAULT yazabiliriz, her ikisi de yani anlama gelmis olur

INSERT INTO customers
VALUES(DEFAULT,'John','Smith','1990-01-01',NULL,'address','city','CA',DEFAULT);
-- boyle okumasi karisik geliyorsa tipki sorgularimizda yaptigimiz gibi her bir degeri bir satira gelecek sekilde multiple row yapabilirsin
-- ama bana tek satirda olmasi, cok fazla record ekleyecegimiz tablolar icin daha okunakli ve guzel geliyor
-- Bunu yapmanin baska bir yolu daha var, simdi ona bakalim
-- INSERT INTO customer yazdiktan sonra bir parantez acip, deger atamasi yapacagimiz sutunlarimizi bu parantez icerisine yazabiliriz
-- null olanlari ve default olanlari yazmiyoruz, SUTUN ADI yaziyoruz
INSERT INTO customers (first_name, last_name, birth_date, address, city, state)
VALUES('John','Smith','1990-01-01','address','city','CA');
-- bu son sorguda, siralamayi istedigimiz gibi degistirebiliriz cunku sutun isimlerini de yazdik
-- onemli olan sey value'lerimizi yazdigimiz sutun sirasina uygun olarak eklemek
-- yani ben burada last_namme sutununu first_name sutunundan once yazabilirim
INSERT INTO customers (last_name, first_name, birth_date, address, city, state)
VALUES('Smith','John','1990-01-01','address','city','CA');

-- sorguyu calistirdiktan sonra customers tablosuna gidip bakabilirsin, 
-- 11. satir olarak ekledigimiz bu record'un oldugunu goreceksin

