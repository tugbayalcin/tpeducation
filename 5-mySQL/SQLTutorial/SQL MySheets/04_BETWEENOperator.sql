USE sql_store;

-- ----------------------------------------------------
-- 		*********  BETWEEN OPERATOR  *********
-- ----------------------------------------------------

-- 1000'den daha cok ancak 3000'den daha az puana sahip olan musterileri listeleyelim
SELECT *
FROM customers
WHERE points >= 1000 AND points <= 3000;

-- burada yine tekrarli bir yazim soz konusu ve bu bizim hic de hosumuza giden bir durum degil
-- oyleyse daha kisa ve daha guzel olani yazalim
SELECT *
FROM customers
WHERE points BETWEEN 1000 AND 3000;
-- yazdigimiz sinir degerler inclusive olarak degerlendirildigi icin esitlik durumuna ekstra bir sey yapmamiz gerekmez 

-- --------------
-- 	  EXERCISE
-- --------------
-- Return customer born between 1/1/1990 and 1/1/2000
SELECT *
FROM customers
WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01';




