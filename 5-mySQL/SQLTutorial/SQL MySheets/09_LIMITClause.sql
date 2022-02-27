USE sql_store;

-- ----------------------------------------------------
-- 		*********  THE LIMIT CLAUSE  *********
-- ----------------------------------------------------

-- biz bir sorgu yaptigimizda, o kosula uyan tum veriler karsimiza gelir
-- ancak bunlardan ilk 3 tanesini getir, son 3 tanesini getir gibi ozel sinirleyici isteklerimiz olabilir
-- boyle durumlarda LIMIT keywordunden yararlaniyoruz

SELECT *
FROM customers
LIMIT 3;

-- eger limit olarak sorgumu saglayan data sayisindan daha buyuk bir sayi girersem, tum datalar getirilmis olacaktir

-- bu komutun en islevsel yonu de sudur: verilerimizi sayfalara ayirmak istedigimizde kullaniriz
-- mesela bir web page'imizin oldugunu dusunelim ve urada musteri listemizi gosterecegiz
-- page 1: 1-3
-- page 2: 4-6
-- page 3: 7-9
-- simdi 3. sayfadaki musterileri almak icin bir sorgu yazalim
-- ilk iki page'i skip yapmak istedigimiz asikar
-- yani ilk 6 datayi atlamak ve sonrasindaki 3 taneyi secmek istiyorum
-- o zaman unu yazabilirim
SELECT *
FROM customers
LIMIT 6, 3;
-- burada ofset degeri olarak 6 verdik ve boylece ilk 6 record skip edilmis oldu ardindan pick degeri 3 geldi ve bu 3 data secildi

-- ---------------------
-- 		EXERCISE
-- ---------------------
-- Gt the top three loyal customers (bunlar herkesten fazla puani olan musterilerdir)
SELECT *
FROM customers
-- WHERE points eger where olsa idi burada olacakti, bu sirsalama onemlidir, komutlari kafamiza gore yazarsak mysql bize bagirir
ORDER BY points DESC
LIMIT 3;


