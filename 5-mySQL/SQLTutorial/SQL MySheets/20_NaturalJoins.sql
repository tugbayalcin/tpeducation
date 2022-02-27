USE sql_store;

-- ------------------------------------------------------------
-- 			 *********  NATURAL JOINS  *********
-- ------------------------------------------------------------

-- sql iki tabloyu birlestirmenin daha kolay bir yolunu da bize sunar
-- buna natural join (dogal birlestirme) denir
-- kodlamasi daha kolaydir ancak tavsiye edilmez 
-- cunku beklenmedik sonuclar verebilir
-- ama yine de bil ;)

-- natural join ile spesific bir sutun adi belirtmeyiz
-- boylece database her iki tabloya bakacak ve buldugu ortak sutunlar uzerinden join islemini gerceklestirecektir
-- ortak sutundan kasit tam olarak ayni isme sahip olmalari anlamina gelmektedir
-- 

SELECT 
	o.order_id,
    c.first_name
FROM orders o
NATURAL JOIN customers c;

-- gordugumuz gibi kodlamasi gercekten cok kolay
-- ancak biraz tehlikelidir
-- cunku database motoru birlesmeyi tahmin etme gibi bir kontrolu yok 
-- bu yuzden natural join eklenmedik sonuclar uretebiliyor






