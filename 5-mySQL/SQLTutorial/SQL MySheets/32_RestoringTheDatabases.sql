USE sql_invoicing;

-- ------------------------------------------------------------
-- 		  *********  RESTORING THE DATABASES  *********
-- ------------------------------------------------------------

-- Bu bolumle birlikte giris seviyesindeki derslerimiz bitti
-- Ancak simdi kullandigimiz tum database'leri orjinal durumlarina geri getirmeliyiz
-- Cunku biz bu egitimde bazi veriler ekledik, sildik, guncelledik 
-- Ve bunu duzeltmezsek ileride benzer islemler yaptigimizda farkli sonuclar almamiza sebep olur 
-- Dolayisiyla her seryi eski haline geri dondurmeliyiz
-- Aslinda bu oldukca basit bbir islemdir
-- Bos bir sql file'imiz acikken ekranin en ustundeki File menusune tiklayalim
-- File > OpenSQL Script... > burada orjinbal dosyalari nereye indirdiysek o path'i acmamiz gerekiyor 
-- orada bulunan ve duzeltmek istedigimiz database'lerden create-databases olani secelim
-- database'imizi actiktan sonra simsek isaretine basarak tum dosyayi calistiralim (recreate)
-- simdi navigator panel'i acalim baslangicta burasi bo gorunecek ama refresh yaptigimizda tum database'lerin geldigini gorecegiz
-- path icerisinde her bir database'in tek tek dosyasi da bulunuyor 
-- 