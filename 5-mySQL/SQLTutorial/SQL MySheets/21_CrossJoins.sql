USE sql_store;

-- ------------------------------------------------------------
-- 			 *********  CROSS JOINS  *********
-- ------------------------------------------------------------

-- Bu derste sql'deki capraz birlesimlere bakacagiz
-- croos join: bir tablodaki her bir kaydi, ikinci tablodaki her bir kayit ile eslestirir
-- cross join'de ON ile kosul belirtilmez 
SELECT 
	c.first_name AS customer,
    p.name AS product
FROM customers c
CROSS JOIN products p 
ORDER BY c.first_name;
-- yukaridaki ornek'te cross join kullanildigi acikca belirtilmistir // impilicit syntax

-- ortulu olarak cross join kullanabiliriz, buy durumda cross satirini siler ve from'un yanina birden fazla tablo adi yazariz // explicit syntax
SELECT 
	c.first_name AS customer,
    p.name AS product
FROM customers c, products p
ORDER BY c.first_name;


-- -----------------------
-- 		 EXERCISE
-- -----------------------
-- Do a cross join between shippers an products 
-- using the implicit syntax
-- and then using the explicit syntax

SELECT 
	sh.name AS shipper,
    p.name AS product
FROM shippers sh
CROSS JOIN products p
ORDER BY sh.name;

SELECT 
	sh.name AS shipper,
    p.name AS product
FROM shippers sh, products p
ORDER BY sh.name;



