--M��terilerden isimleri 'a' ile soyisimleri 'b' ile ba�layanlar� getiriniz
SELECT * FROM sales.customers WHERE sales.customers.first_name LIKE 'a%'and sales.customers.last_name LIKE 'b%';
-- Ka� farkl� �r�n oldu�unu sayd�r�n�z.
SELECT COUNT(product_id) AS ProductCount from production.products;
--'Electra Cruiser 1 (24-Inch) - 2016' �r�n�n� alan ve telefon numaras� bilgisi bulunan 
--kullan�c�lar�n customer_id, first_name, last_name, phone, order_date, order_status ve 
--product_name bilgilerini sipari� tarihi yeniden eskiye do�ru olacak �ekilde getiriniz.
SELECT sales.customers.customer_id,first_name,last_name,phone,order_date,order_status,product_name
from sales.customers,sales.orders,sales.order_items,production.products where sales.customers.customer_id=sales.orders.customer_id and
sales.orders.order_id=sales.order_items.order_id and order_items.product_id=production.products.product_id and 
product_name='Electra Cruiser 1 (24-Inch) - 2016'order by order_date DESC;
--ELectra' markas�n�n 'Children Bicycles' kategorisindeki 2016-2018 model y�l�na sahip 
--�r�nlerini fiyat�na g�re s�ralay�n�z (brand_name, category_name, product_name, 
--model_year, list_price).
SELECT brand_name,category_name,product_name,model_year,list_price from production.brands,production.categories,production.products where 
production.products.brand_id=production.brands.brand_id and production.products.category_id=production.categories.category_id and 
brand_name='Electra' and category_name='Children Bicycles' and model_year BETWEEN 2016 AND 2018 ORDER BY list_price DESC;
--Telefon numaras� NULL olan m��terilerin numaralar�n� '0123456789' olarak 
--g�ncelleyiniz
UPDATE sales.customers SET phone='0123456789' where sales.customers.phone IS NULL;
