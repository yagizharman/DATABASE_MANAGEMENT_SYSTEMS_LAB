--1) Saklý yordam yapýsýný kullanarak çalýþanlardan isimleri ve soyisimleri istenen harf ile 
--baþlayanlarý getiriniz (first_name, last_name)

CREATE PROCEDURE SelectbyNameandLastName
    @fn nvarchar(255),
    @ln nvarchar(255)
AS
SELECT s.first_name,s.last_name from sales.staffs s where 
s.first_name LIKE @fn+ '%' and s.last_name LIKE @ln+'%';

EXEC SelectbyNameandLastName @fn='f',@ln='j'
EXEC SelectbyNameandLastName @fn='b',@ln='h'


--2) Saklý yordam yapýsýný kullanarak sipariþlerde istenen sipariþ durumu ve maðaza 
--tanýmlayýcý numarasýna sahip sipariþleri müþterilerin isimlerine göre sýralayan sorguyu 
--yazýnýz (customer_id, first_name, last_name, product_id, email, order_status, store_id)

ALTER PROCEDURE ListOrderStatusandStoreID
    @order_status tinyint,
    @store_id int
AS
SELECT  c.customer_id,c.first_name,c.last_name,
p.product_id,c.email,o.order_status,sto.store_id
FROM sales.customers c INNER JOIN 
sales.orders o on o.customer_id=c.customer_id
INNER JOIN sales.stores sto on sto.store_id=o.store_id
INNER JOIN sales.order_items oi on oi.order_id=o.order_id
INNER JOIN production.products p on p.product_id=oi.product_id
WHERE order_status=@order_status and sto.store_id= @store_id


EXEC ListOrderStatusandStoreID '2','1'

EXEC ListOrderStatusandStoreID '2','2'

--3) Saklý yordam yapýsýný kullanarak istenen markanýn istenen kategorideki ürünlerini belirli 
--model aralýðýna(minimun-maksimum) göre sýralayan sorguyu yazýnýz (brand_name, 
--category_name, product_name, model_year, list_price)


ALTER PROCEDURE listProductsbyBrandCategoryandListPrice
	@brand varchar(255),
	@category varchar(255),
	@min smallint,
	@max smallint
AS
SELECT b.brand_name,c.category_name,p.product_name,p.list_price from production.products p 
INNER JOIN production.brands b on b.brand_id=p.brand_id
INNER JOIN production.categories c on c.category_id=p.category_id 
WHERE b.brand_name=@brand and c.category_name=@category and p.model_year between @min and @max ORDER BY p.model_year;

EXECUTE listProductsbyBrandCategoryandListPrice 'Electra','Children Bicycles',2017,2018

EXECUTE listProductsbyBrandCategoryandListPrice 'Heller','Mountain Bikes',2017,2018
