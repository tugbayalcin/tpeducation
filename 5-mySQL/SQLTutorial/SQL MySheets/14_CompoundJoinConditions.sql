USE sql_store;

-- -------------------------------------------------------
-- 		*********  COMPOUND JOIN CONDITIONS *********
-- -------------------------------------------------------

-- tablolarimizdaki sutunlarimiz bazen uniq degerler icermeyebilir
-- daha dogrusu unique deger iceren hicbir sutunu olmayabilir
-- boyle durumlarda bir veriyi tanimlayabilmemiz icin herhangi bir sutun kullanamayiz (cunku uniq degil)
-- peki ne yapabiliriz
-- birden fazla sutun yardimiyla uniq bir degere ulasabiliriz
-- order_id'si 2 ve product_id'si 1 olan urun gibi bir ifade kullanarak bunu kolaylikla yapabiliriz 
-- (tabiki de olusturdugumuz kombinasyon unique deger veriyorsa kullaniriz, vermiyorsa aska sutunlar secer veya condition'a ir sutun daha ekleriz)

-- simdi order_items tablosunu design mode'da acalim
-- uzerine geldiginde yanda cikan ingiliz anahtari (tool) gibi olan isaret
-- hem order_id'nin hem de product_id'nin yaninda sari bir key (primary key) oldugunu goruruz 
-- yani her ikisi de primary key'e sahiptir
-- buna composit primary key denir
-- Composit primary key birden fazla sutun icerir
-- Peki bu neden onemlidir: 
-- Birlesik anahtara(composite key) sahip bir tablomuz oldugunda o tabloyu diger talolarla nasil birlestirecegimizi ogrenmemiz gerekiyor

-- ornek olarak order_items tablosunu order_items_notes tabosuyla birlestirmeye calisalim:
SELECT *
FROM order_items oi
JOIN order_item_notes oin
	ON oi.order_id = oin.order_id -- burasi uniq olmadigi icin join islemi icin yeterli degildir
    AND oi.product_id = oin.product_id; -- dolayisiyla bir sutunu daha AND keywordu ile dahil ederiz
										-- iste buna compound join conditions denir (birlesik birlestirme kosullari)alter
                                        -- yani join yapmak icin birden fazla kosulumuz var
                                        

