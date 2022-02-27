USE sql_store;

-- ----------------------------------------------------
-- 		*********  THE REGEXP OPERATOR  *********
-- ----------------------------------------------------

/*
	regexp = regular expression
    Daha karmasik pattern'ler aradigimizda ize yardimci olan bir komuttur
    LIKE komutunda aradigimiz kelimenin boyutu onemliydi ve bbunun handle etmek icin % ve _ isaretlerinden yararlanmistik
    REGEXP'de ise boyuttan bagimsiz olarak aramamizi yapabiliyoruz
    Yine de aradigimiz subkelimenin, ana kelimenin neresinde oldugunu belirtmeye ihtiyac duyabiliriz
    Bunun icin yine yardimci karakterlerden faydalaniriz. Simdi bunlara goz atalim
    '^subword' : BASTA: aradigimiz subword'un ana kelimenin basinda yer almasini istedigimizi belirtir
    'subword$' : SONDA: aradigimiz subword'un ana kelimenin sonunda yer almasini istedigimizi belirtir
    
    Ayrica burada birden fazla kelime aramasi da yaptirabiliriz
    bunun icin soyle bir syntax kullanilir
    'subword1|subword2' etc
    aramak istedigimiz her alt kelimeyi bir dikey cizgi yardimi ile pattern'imize ekleriz
    burada her bir word icin spesific location isareti de verebiliriz
    
    bir harften once gelmesi gereken birden fazla harf olmasi durumun da sorgulayabiliriz
    yalnizca oncesindeki harfleri degil sonrasindaki harfleri de regexp ile sorgulayabiliriz
*/

-- -----------------------------------------------------------------------------------------------------------------------
-- bir onceki derste LIKE komutunu ogrenmistik
-- soyisminde field kelimesini iceren musterileri LIKE komutu ile listelemeyi deneyelim
SELECT *
FROM customers
WHERE last_name LIKE '%field%';
-- -----------------------------------------------------------------------------------------------------------------------

-- -----------------------------------------------------------------------------------------------------------------------
-- simdi ise REGEXP komutu kullanarak ayni sorguyu bir kere daha yapmayi deneyelim
SELECT *
FROM customers
WHERE last_name REGEXP 'field';
-- -----------------------------------------------------------------------------------------------------------------------

-- -----------------------------------------------------------------------------------------------------------------------
-- soyadi field kelimesi ile baslayan musteriler
SELECT *
FROM customers
WHERE last_name REGEXP '^field';
-- -----------------------------------------------------------------------------------------------------------------------

-- -----------------------------------------------------------------------------------------------------------------------
-- soyadi field kelimesi ile biten musteriler
SELECT *
FROM customers
WHERE last_name REGEXP 'field$';
-- -----------------------------------------------------------------------------------------------------------------------

-- -----------------------------------------------------------------------------------------------------------------------
-- soyadi field veya mac kelimesi iceren musteriler
SELECT *
FROM customers
WHERE last_name REGEXP 'field|mac';
-- -----------------------------------------------------------------------------------------------------------------------

-- -----------------------------------------------------------------------------------------------------------------------
-- soyadi field veya mac veya rose kelimesi iceren musteriler
SELECT *
FROM customers
WHERE last_name REGEXP 'field|mac|rose';
-- -----------------------------------------------------------------------------------------------------------------------

-- -----------------------------------------------------------------------------------------------------------------------
-- soyadi field ile biten veya mac kelimesini iceren veya rose kelimesi ile baslayan musteriler
SELECT *
FROM customers
WHERE last_name REGEXP 'field$|mac|^rose';
-- boylece komplike bir pattern uretmis ve sorgulamis olduk 
-- -----------------------------------------------------------------------------------------------------------------------

-- -----------------------------------------------------------------------------------------------------------------------
-- soyadinda e harfi iceren, ancak e harfinden once g,i,m harflerinden biri yer alan musterileri listeleyelim
SELECT *
FROM customers
WHERE last_name REGEXP '[gim]e'; -- ge / ie / me 
-- -----------------------------------------------------------------------------------------------------------------------

-- -----------------------------------------------------------------------------------------------------------------------
-- soyadinda e harfi iceren, ancak e harfinden sonra  f,m,q harflerinden biri yer alan musterileri listeleyelim
SELECT *
FROM customers
WHERE last_name REGEXP 'e[fmq]'; -- ef / em / eq 
-- -----------------------------------------------------------------------------------------------------------------------

-- -----------------------------------------------------------------------------------------------------------------------
-- aradigimiz her bir harfi koseli parantezler icerisine tek tek yazmak zorunda degiliz
-- bazen tum sessiz harflerin olmasini isteyebiliriz ve bunun icin neredeyse tum alfabeyi buraya yazmaya gerek yok
 SELECT *
FROM customers
WHERE last_name REGEXP '[a-h]e';
-- boylece e harfinden once a ve h arasinda yer alan tum harflerden birinin gelebilecegini belirtmis oluyorum
-- -----------------------------------------------------------------------------------------------------------------------

-- -----------------------------------------------------------------------------------------------------------------------
-- ^ beginning
-- $ ending
-- | logical or
-- [abcd] 
-- [a-f]

-- mySQL'in destekledigi regexp ozel karakterleri tabiki de bunlarla sinirli degil
-- ancak en sik kullanilan grup tam olarak burasi, bunlari bilmek bizim icin su seviyede oldukca yeterli	
-- -----------------------------------------------------------------------------------------------------------------------

-- -----------------------------------------------------------------------------------------------------------------------
-- ---------------------
-- 		EXERCISE
-- ---------------------
-- Get the customer whose
-- first names are ELKA  or AMBUR
-- last names end with EY or ON
-- last names start with MY or contains SE
-- last names contain B followed by R or U

SELECT *
FROM customers
WHERE first_name REGEXP 'ELKA|AMBUR';
      
SELECT *
FROM customers
WHERE last_name REGEXP 'EY$|ON$';

SELECT *
FROM customers
WHERE last_name REGEXP '^MY|SE';

SELECT *
FROM customers
WHERE last_name REGEXP 'B[RU]'; -- 'BR|BU' seklinde de yazabiliriz
-- -----------------------------------------------------------------------------------------------------------------------





