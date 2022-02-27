USE sql_store;

-- ---------------------------------------------
-- 		********* WHERE Clause *********
-- ---------------------------------------------


-- * Where Clause daha once de bahsettigimiz gibi filtreleme yapmamiza olanak taniyan bir komuttur
--   tablodan getirecegimiz veriler arasindan yalnizca belli bir kosulu saglayanlari sorgulamak istedigimizde kullaniriz
--   yani bir condition/kosul icerir

-- * asagidaki ornegimizde customers tablosu uzerinde calisiyoruz ve points degeri 3000'den buyuk olan custoemr'lari ariyoruz
--   bu sorgu customer tablosundaki her bir musteriyi tek tek gezecek ve points degerinin 3000'den buyuk olup olmadigina bakacaktir
--   eger buyukse bunu bize dondurecek, degilse hicbir sey yapmadan bbir sonraki customer'dan gezmeye devam edecektir

-- *. ornegimizde de kulandigimiz karsilastirma operatorlerine biraz daha yakindan bakalim
-- >  : grater than
-- >= : grater than or equal to
-- <  : less then
-- <= : less then or equal to
-- =  : equality operator
-- != : not equality
-- <> : not equality
-- IN :          
-- BETWEEN:       Bu uc yan cumlecik de where ile kullanilir, detaylar bir sonraki derste islenecektir
-- LIKE :        

-- ----------------------------
-- QUERY WİTH SİNGLE CONDİTİON
-- ----------------------------

SELECT *
FROM customers
WHERE points > 3000;

-- bu operatorleri kullanarak birkac sorgu yapalim

-- 1. eyaleti virginia olan musterileri getirelim
SELECT *
FROM customers
WHERE state = 'VA'; -- burada VA'yi tek/cift tirnaklar icerisine yazdigimiza dikkat edelim, cunku bu ifade bir String'dir
-- stringlerle calisirken single or double quote icerisine almamiz gerekir ama genel kullanim single quote kullanmaktir
-- dikkat etmemiz gereken bir diger konu ise sql'in case sensitive olmadigidir
-- upper case, lower case or camel case kullanabiliriz
-- bu sebepten oturu sql keyword'lerini daime upper case, tablo,sutun ismi gibi diger seyleri de lower case yazmaya ozen gosteririz
-- ancak string ifadelerde bunun hicbir onemi olmayacaktir, nasil kolay geliyorsa oyle yazabiliriz

-- 2. virginia eyaleti disindaki tum musterileri getirelim
SELECT *
FROM customers
WHERE state != 'VA';

-- 3. 1 ocak 1990'dan sonra dogan musterileri listeleyelim
SELECT *
FROM customers
WHERE birth_date > '1990-01-01';
-- tarih ifadesi de quote icerisinde yazilir
-- aslinda date bir string degildir ancak ozel ir yaim sekli oldugundan bu sekilde ifade etmek daha dogru sonuclar verir
-- yukaridaki tarih formati MySql'in default date formatidir YYYY-MM-DD

-- ---------
-- 	EXERCSE
-- ---------
-- Get the orders placed this year
-- Bu yil verilen siparisleri getiren sorguyu yazalim
SELECT *
FROM orders
WHERE order_date >= '2019-01-01';
-- bu sorguyu yaptigimizda eger 2019 yilinda isek sikinti yok
-- 2019 yilinda verilen tum siparisler goruntulenecektir
-- ancak 2020 ve daha sonrasinda isek 2019 yilindaki siparisler icin farkli ir query yazmamiz gerekiyor
-- asagida bunu ogrenecegiz

-- --------------------------------------------------------------
-- QUERY WİTH MULTİPLE CONDİTİON | The AND, OR and NOT Operators
-- --------------------------------------------------------------
-- 01.01.1990 tarihinden sonra doganlari ve puani 1000'den buyuk olanlari listeleyelim
SELECT * 
FROM customers
WHERE birth_date > '1990-01-01' AND points > 1000;

-- AND operatoru kullanildiginda verilen kosullarin her ikisini de ayni anda saglayan veriler karsimiza gelir
-- OR operatoru kullanildiginda verilen kosullardan herhangi birini (her ikisini de saglayanlar da tabiki) saglayan veriler karsimiza gelir
-- NOT operatoru kosulumuzu saglayan verileri degil, geride kalan yani kosulu saglamayan her bir veriyi getirir

-- 01.01.1990 tarihinden sonra doganlari veya puani 1000'den buyuk olup virginia'da yasayanalari  listeleyelim
SELECT * 
FROM customers
WHERE birth_date > '1990-01-01' OR 
	  (points > 1000 AND state='VA');

-- * burada da gorecegimiz uzere mantiksal operatorlerde de (logical operation) islem onceligi vardir
--   bu nedenle AND operatoru her zaman once degerlendirilir 
--   eger farkli bir sirayla calismasini istiyorsak, ya da her ne kadar islem onceligini bilsek dahi daha temiz ve okunakli bir komut yazmak 
--   istiyorsak parantezlerden faydalaniriz ve hatta paranteszli kosulu yeni bir satira yazariz 
--   boylece bu komutu okuyanlar, amacini cok daha rahat bir sekilde anlayabilirler 

-- 
SELECT * 
FROM customers
WHERE NOT (birth_date > '1990-01-01' OR points > 1000);
-- !!!! bu komut sunlari getirir: 01.01.1990'dan once doganlar AND/VE puani 1000'den kucuk olanlar 
-- NOT opereatoru su sekilde calisir: Aslinda bu matematikten de bildigimiz bir durum
--  karsilastigi hem karsilastirma operatorlerini (comparison operators) hem de mantiksal operatorleri (logical operators) tersine cevirir, 
--  boylece komutumuz su hale gelmis olur
-- WHERE birth_date <= '1990-01-01' AND points <= 1000;
-- bbakalim valistirdigimizda ayni sonuc mu cikiyor :)
SELECT * 
FROM customers
WHERE birth_date <= '1990-01-01' AND points <= 1000;


-- ---------
-- 	EXERCSE
-- ---------
-- From the order_items  table, get the items for order #6 where the total price is grater then 30 
SELECT *
FROM order_items
WHERE order_id = 6 AND (quantity * unit_price) > 30;
-- tabloda total price diye bir sey yok ancak unit price ve quantity yani miktar var
-- ve ben miktar ile unit price'i carparsam total price'i elde ederim




