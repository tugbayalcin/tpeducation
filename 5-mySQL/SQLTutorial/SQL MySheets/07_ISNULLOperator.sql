USE sql_store;

-- ----------------------------------------------------
-- 		*********  THE IS NULL OPERATOR  *********
-- ----------------------------------------------------

/*
	Bu egitimde, talolarimizdaki degeri atanmamis ve null olarak kalmis veri iceren elemanlqri sorgulamayi ogrenecegiz
    
*/

-- -----------------------------------------------------------------------------------------------------------------------
-- telefonu yazili olmayan musterileri listeleyip onlara bir email gondermek istedigimizi dusunelim
SELECT *
FROM customers
WHERE phone IS NULL;
-- -----------------------------------------------------------------------------------------------------------------------

-- -----------------------------------------------------------------------------------------------------------------------
-- bunun tersi olarak yalnizca telefonu kayitli musterileri sorgulamak da isteyebiliriz
SELECT *
FROM customers
WHERE phone IS NOT NULL;
-- -----------------------------------------------------------------------------------------------------------------------

-- -----------------------------------------------------------------------------------------------------------------------
-- ---------------------
-- 		EXERCISE
-- ---------------------
-- Get the orders that are not shipped 
--  u sorgu gercek hayatta oldukca kullanisli bir sorgudur
-- bir yonetici oldugumuzu ve henuz kargoya verilmemis siparislerimizi sorgulamak istedigimizi dusuneiliriz
SELECT *
FROM orders
WHERE shipped_date IS NULL; -- shipper_id IS NULL da kullanabilirsin






