
-- bu egitim boyunca asagida baglanti adresi verilen MySQL Tutorial for Beginners [Full Course] isimli 3 saatlik 
-- kurs takip edilecektir (Mosh Hamedani - 20 Mart 2019)
-- https://www.youtube.com/watch?v=7S_tz1z_5bA

USE sql_store; 
-- bu satir database secimini gosterir, soldaki schemas panelinde su anda 5 tane veritabanimiz var ve biz hangisinde sorgu yapacaksak 
-- onu secmeliyiz, sectigimiz database bold olarak gorunecektir
-- secme islemini database adina cift tiklayarak da yapailiriz
-- eger hicbir database bold degilse sorgu yapilacak database secilmemis demektir, bu durumda iken sorgu yapilamaz   

SELECT *  
-- * ile talodaki her seyi getir demis oluyoruz, * yerine sutun isimleri de yazabiliriz, birden fazla sutun getirmek istiyorsak sutun 
-- isimlerini virgulle ayirarak yazabiliriz
FROM customers -- nereden: customer tablosundan getir demek
WHERE customer_id = 1 -- where keyword'u filtreleme yapar, where'den sonra condition/expression yazilir
ORDER BY first_name; -- sirala
-- select * : baana tuuuum verileri getir
-- from customer : nereden getireyim, customer tablosundan getir
-- where customer_id = 1 : filtre yap ve customer_id'si 1 olanlari getir
-- order by first_name :  ana verileri first_name sututuna gore siralayarak getir demek
-- bu ornegimizde where ile yalnizca customer id'si 1 olan biricik kayit gelecegi icin order by kullanmak pek de
-- mantikli olmayacaktir, order by sorgu komutunun islevini daha iyi anlayailmek icin where komut satirini yorum haline getirip calistir
-- gordugun uzere verdigim sutun uzerinden natural order'a gore siralama yaparak verileri karsima getirdi

-- ----------------------------------------------------------
-- 				********   SELECT   ********				
-- ----------------------------------------------------------
-- * cok buyuk datalar iceren milyonlarca satiri ve sutunu olan tablolarda SELECT komutu ile secim yaparken * kullandigimizda
--   bu database'imizi, agizimi yoran ve hic de pratik olmayan bir yontem olmus olur
--   bu gibi durumlarda ozellikle calismak istedigimiz sutunlari belirterek yalnizca onlarin getirilmesini saglamak faydali bir yol olacaktir

-- * burada sutunlar, bizim yazdigimiz siraya gore getirilecektir, siralamayi degistirdigimizde, asagida gordugumuz tablodaki 
--   sutunlarin da yeri degismis olur

-- * ayni zamanda burada getirmek istedigimiz sutunlar ile arithmetic expression da yazabiliriz
--   mesela asagidaki sorgumuza points sutununu ekleyelim
--   bu sutun musterilerin siparis sonrasinda kazandigi puanlai tutan bir sutundur
--   ve ben bu sutunu getirmek ve getirirken her bir hucreye her bir veriye +10 puan eklemek istiyorum
--   bunu yapmanin yollarindan biri sorguma expression eklemektir
--   unutulmamalidir ki bu ekleme islemi tabloda kalici bir islem yapmaz
--   sadece yaptigim sorgu ile ilgilidir, sorguma ait sonuclari etkiler, tablodaki orginal sutun bir degisiklige ugramayacaktir
--   hatta ve hatta sorgumuzu su sekilde yaptigimizda 'SELECT points, points + 10, points' gorecegiz ki
--   ilk sutun tablodaki orginal puanlari, ikinci sutun +10 eklenmis halini, ucuncu sutun ise yine talodaki halini getşrecek
--   ve bu ucuncu sutun sayesinde gorecegiz ki +10 ekleme islemi tablomuzu gercekten de etkilememis

SELECT first_name, last_name, points, points + 10, points
FROM customers;

-- * simdi ise ben bu expression isini biraz abartmak istiyorum, boylece satirim biraz fazla uzayip gştmis olacak 
--   ki bu da sorgumun okunulabilirligini etkileyecktir. Bu durumda sorgu komutumdan sonra getirmek istedigim her bir veriyi 
--   bir satira yazarak, gayet okunabilir ve tertemiz bir komut yazmis olurum

-- * arithmetic expression kullanirken dikkat etmemiz gereken bir seyden bahsedelim
--   burada da program soldan saga dogru calisir, yani expression'in sirasi onemlidir ancak arithmetic expression temelini matematikten alir
--   dolayisiyla islem onceligi burada da gecerlidir, carpmanin ve bolmenin heeeer zaman onceligi vardir
--   istedigimiz oncelikte islemlerin yapilmasini istiyorsak parantez kullanarak ayristirma yapabiliriz,
--   parantez de islemlerin sirasini degistirir, bunun yani sira komutumuza netlik kazandirir, okunabilirligini arttirir

-- * eger biz halihazirdaki bir sutunu getirmek yerine bazi islemler yaptirarak oradaki verileri getiriyorsak, sutun adinda
--   uzun uzun yazdigimiz expression yazdigini goruruz, bu istedigimiz veya goze hos gorunen bir sey degildir
--   simdi bbu durumu ele alalim
--   temelde expression ile olusturmus oldugum sutun adini degistirmek istiyorum, ona daha aciklayici olan bir takma ad vermek istiyorum
--   git'den de hatirlayacagimiz uzere alias ile kendi komut kisaltmalarimi yazabiliyordum
--   burada da ayni islemi yapabilir ve sutunlarima takma ad verebiliriz. Hatta ve hatta alias'i bile kisaltarak kullaniyoruz
--   adini degistirmek istedigim komutumun sonuna AS keywordunu ekler ve ardindan vermek istedigimiz takma adi yazariz
--   yine tipki expressiondan oldugu gibi bu durum orginal tablomuzu etkilemez. Tablomuzda bu isimde ve bu expression sonucu olusan verileri
--   tutan bir sutun aslinda yoktur, yalnizca sorgumuzun sonucu olarak ekranda goruntulemis oluruz
--   ornegimizdeki expression iceren sutun icin discount_factor adini verelim
--   bunun bize sagladigi yarar yalnşizca daha kisa bir yazim olmus olmasi degil ayni zamanda daha aciklayici da olmasidir
--   eger benim verdigim takma ad bosluk karakteri icerecekse bu durumda daha onceki programlama mantigindan da hatirladigin uzere
--   bu ismi tek veya cift tirnaklar icerisine alarak yazmaliyiz  

SELECT 
	last_name,
    first_name,
    points,
    (points + 10) * 100 AS 'discount factor'
FROM customers;

-- * select komutu ile ilgili ogrenmemiz gereken bir sey daha var
--   ben tablomdan bir sutun sectim ve buradak verilerde aslinda degisiklik yapmak istedigime karar verdim
--   bunu kolaylikla yapabiliriz degil mi
--   oncelikle navigator panel'den tablo adimin uzerine gelir ve sonda çikan tabblo iconuna basarak tablo verilerinin ekranimda gorunmesini saglarim
--   ardindan degistirmek istedigim hucreye cift tiklayarak istedigim degisikligi yapar ve enter'a basarim
--   bu islemlerden sonra eksanin sag alt kosesinde apply ve revert butonlari gorunur olacaktir
--   istersem degisikligi revert butonuna tiklayarak geri alabilir istersem de apply butonuna tiklayarak kaydedeilirim
--   takip eden adimlarda karsima degisiklik detaylari ile ilgili birkac pencere cikar. Inceleyip ilgili onaylamalari yaptigimda degisiklikler 
--   tabloma kalici olarak kaydedilmis olur

-- * simdi tablomuzdaki state sutununu cagiralim ve ilk musterinin yasadigi eyalette yukarida bahsettigimiz sekilde degisiklik yaparak 
--   eyaleti virginia VA olarak degistirelim
--   ardindan yeniden komutumuzu calistiralim ve ekrandaki verilere bakalim, tablomuzda kalici degisiklik yapmis oldugumuzu gorecegiz

-- * peki benim sutunum bazi verilerin tekrarlarini das iceriyor ve ben yalnizca her veriden yalnizca bir tane olacak sekilde goruntuleme
--   yapmak istiyorsam ne olur
--   bu durumda SELECT komutuna yardimci olmasi icin DİSTİNCT keywordunu ekleriz
--   bu keyword bize unique degerler donmesini saglar 
--   distinct kelime anlami olarak 'farkli' demektir ve verilerimizin duplicated olmasini engeller, unique olamsini saglar 


SELECT DISTINCT state
FROM customers;

--  -----------
--   EXCERCISE
--  -----------
--  Return all the products 
-- 	 name 
-- 	 unit price
-- 	 new price (unit price * 1.1)

SELECT name, unit_price, (unit_price * 1.1) AS 'new price'
FROM products;









