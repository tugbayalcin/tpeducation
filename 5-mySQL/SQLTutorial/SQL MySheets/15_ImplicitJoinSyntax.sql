USE sql_store;

-- -------------------------------------------------------
-- 		 *********  IMPLICIT JOIN SYNTAX *********
-- -------------------------------------------------------

-- Bu derste ortulu/dahili join yazimindan bahsedecegiz
-- 

-- asagidaki sorgu basic bicimde iki tabloyu birbirine (inner) join yapmaya, birlestirmeye, yarar
SELECT *
FROM orders o
JOIN customers c
	ON o.customer_id = c.customer_id;

-- ayni sorguyu implicitly join syntax ile su sekilde yazabiliriz // Implicit Join Syntax
SELECT *
FROM orders o, customers c -- burada birden fazla tablo adi yazabiliyoruz ve onlara alias vereiliyoruz
WHERE o.customer_id = c.customer_id; -- ardindan join ifadesinin ON keywordu ile yazdigimiz
									 -- kosulunu WHERE keywordune yazariz
                                     
-- her ne kadar sql boyle farkli sözdizimlerine izin verse de bu pek de tavsiye edilen bir kullanim degildir
-- cunku eger burada where kosulunu yazmayi unutursak capraz birlesim elde ederiz (cross join)
-- bunun nasil bir sey oldugunu gorelim
-- yukaridaki sorguyu calistirdigimizda 10 satir sonuc aliyoruz, cunku 10 order'imiz var
SELECT *
FROM orders o, customers c; -- where kosulunu yazmadik ve burada muhtamelen 100 sonuc satiri elde edecegiz 
-- cunku her orders satiri tum customer satirlari ile birlestirildi 1-1, 1-2, 1-3, ... , 10-9, 10-10 gibi


-- cross joinden daha sonra bahsedecegiz
-- ancak amacimiz basic bir join islemi ise implicitly join yerine  JOIN keywordunu acik acik kullanmakta fayda oldugunu goruyoryz 
