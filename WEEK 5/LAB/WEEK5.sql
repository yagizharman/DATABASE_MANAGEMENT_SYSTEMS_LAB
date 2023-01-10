--1.sýra
SELECT o.order_id,c.first_name,c.last_name from sales.customers c
INNER JOIN sales.orders o on o.customer_id=c.customer_id;

--2.sýra
SELECT m.staff_id,m.first_name,m.last_name,COUNT(e.staff_id) from
sales.staffs m
INNER JOIN sales.staffs e on e.manager_id=m.staff_id
GROUP BY m.staff_id,m.first_name,m.last_name
;
--3.sýra
SELECT e.staff_id,e.first_name,e.last_name,COUNT(o.order_id) from
sales.staffs e 
INNER JOIN sales.orders o on e.staff_id=o.staff_id
GROUP BY e.staff_id,e.first_name,e.last_name
HAVING COUNT(o.order_id)>100 and e.last_name LIKE '%l';


--4.Sýra 

Select DISTINCT production.products.product_id, 
production.products.product_name,production.products.model_year,production.products.list_price from production.products,production.stocks
where production.products.product_id=production.stocks.product_id and production.stocks.quantity>5 and EXISTS(SELECT DISTINCT
production.stocks.product_id from production.stocks,production.products where production.products.product_id=production.stocks.product_id and production.stocks.quantity>5 
);


--5.Sýra
Select DISTINCT production.products.product_id, 
production.products.product_name,production.products.model_year,production.products.list_price from production.products,production.stocks
where production.products.product_id=production.stocks.product_id and production.stocks.product_id= ANY(SELECT 
production.stocks.product_id from production.stocks,production.products where production.products.product_id=production.stocks.product_id and production.stocks.quantity<5 
);


--6.sýra

SELECT
p.product_id,
p.product_name,
p.model_year,
p.list_price from
production.products p
WHERE p.product_id= ALL(SELECT s.product_id from production.stocks s
where s.quantity>5
);