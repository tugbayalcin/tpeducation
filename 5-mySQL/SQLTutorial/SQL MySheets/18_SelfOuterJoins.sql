USE sql_hr;

-- ------------------------------------------------------------
-- 			 *********  SELF OUTER JOINS  *********
-- ------------------------------------------------------------

-- employees talosuna bakalim
-- cunku burada self join ornegini gorebilecegiz 
-- her calisan icin bir yonetici oldugunu ve, aslinda yoneticiler de bir calisan oldugundan 
-- onlarin da bu tabloda yer aldigindan bahsetmistik

-- calisanlar ve yoneticileri tablosunu yeniden olusturalim
SELECT 
	e.employee_id,
    e.first_name,
    m.first_name AS manager
FROM employees e
JOIN employees m 
	ON e.reports_to = m.employee_id;
-- bu sorgunun sonucuna bakarsak yoneticisi null olan kimseyi goremeyiz
-- yani ceo bu tabloda yok
-- bunun sebebinin inner join oldugunu biliyoruz, ceo datasi ON ile yazdigimiz kosulumuzu saglamadigi icin result tale'da yer almadi
-- bu sorunu LEFT JOIN ile cozebilecegimizi biliyoruz, hadi yapalim
SELECT 
	e.employee_id,
    e.first_name,
    m.first_name AS manager
FROM employees e
LEFT JOIN employees m 
	ON e.reports_to = m.employee_id;







