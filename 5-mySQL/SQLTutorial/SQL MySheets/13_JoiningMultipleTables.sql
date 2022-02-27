USE sql_store;

-- -------------------------------------------------------
-- 		*********  JOINING MULTIPLE TABLES *********
-- -------------------------------------------------------

-- Bu derste birden fala taloyu birbirine nasil baglariz (join ederiz) bunu ogrenecegiz

-- sql_store database'imizdeki orders tablosuna bakalim
-- status diye bir sutun oldugunu goruyoruz
-- burada da bilgilr acikca verilmek yerine order_status talosundaki id'ler ile referans edilmisler
-- benzer sekilde customer_id sutununda da customers tablosundaki verilerin id'leri yazilarak referans olusturulmus
-- dolayisiyla benim customers ve order_status tablolarini bu tabloya baglamam gerekiyor

--
SELECT 
	o.order_id,
    o.order_date,
    c.first_name,
    c.last_name,
    os.name AS status
FROM orders o
JOIN customers c
	ON o.customer_id = c.customer_id
JOIN order_statuses os
	ON o.status = os.order_status_id;
    -- boylece 3 tabloyu birbirine baglamis olduk 
    
    
-- ------------------
-- 		EXERCISE    
-- ------------------
-- sql_invoicing database'indeki payments tablosunu, payment_methods ve clients tablolariyla birlestirin
-- payment methods tablosunun yani sira musterinin adini ve odeme yontemini gosteren bir rapor olusturun
USE sql_invoicing;

SELECT 
	p.date,
    p.invoice_id,
    p.amount,
    c.name,
    pm.name AS payment_methods
FROM payments p
JOIN clients c
	ON p.client_id = c.client_id
JOIN payment_methods pm
	ON p.payment_method = pm.payment_method_id;

    
    
    
    
    
    
    