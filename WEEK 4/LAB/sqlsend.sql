--Müþterilerden isimleri 'a' ile soyisimleri 'b' ile baþlayanlarý getiriniz
SELECT * FROM sales.customers WHERE sales.customers.first_name LIKE 'a%'and sales.customers.last_name LIKE 'b%';
-- Kaç farklý ürün olduðunu saydýrýnýz.
SELECT COUNT(product_id) AS ProductCount from production.products;
--'Electra Cruiser 1 (24-Inch) - 2016' ürününü alan ve telefon numarasý bilgisi bulunan 
--kullanýcýlarýn customer_id, first_name, last_name, phone, order_date, order_status ve 
--product_name bilgilerini sipariþ tarihi yeniden eskiye doðru olacak þekilde getiriniz.
SELECT sales.customers.customer_id,first_name,last_name,phone,order_date,order_status,product_name
from sales.customers,sales.orders,sales.order_items,production.products where sales.customers.customer_id=sales.orders.customer_id and
sales.orders.order_id=sales.order_items.order_id and order_items.product_id=production.products.product_id and 
product_name='Electra Cruiser 1 (24-Inch) - 2016'order by order_date DESC;
--ELectra' markasýnýn 'Children Bicycles' kategorisindeki 2016-2018 model yýlýna sahip 
--ürünlerini fiyatýna göre sýralayýnýz (brand_name, category_name, product_name, 
--model_year, list_price).
SELECT brand_name,category_name,product_name,model_year,list_price from production.brands,production.categories,production.products where 
production.products.brand_id=production.brands.brand_id and production.products.category_id=production.categories.category_id and 
brand_name='Electra' and category_name='Children Bicycles' and model_year BETWEEN 2016 AND 2018 ORDER BY list_price DESC;
--Telefon numarasý NULL olan müþterilerin numaralarýný '0123456789' olarak 
--güncelleyiniz
UPDATE sales.customers SET phone='0123456789' where sales.customers.phone IS NULL;
