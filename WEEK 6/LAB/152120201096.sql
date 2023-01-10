--1.soru
CREATE VIEW [OrderAndStore] AS
SELECT
	o.order_id,
	c.first_name,
	c.last_name,
	s.store_name
FROM ((sales.orders o INNER JOIN sales.customers c ON o.customer_id = c.customer_id)
INNER JOIN sales.stores s ON o.store_id = s.store_id)

SELECT *
FROM [OrderAndStore]

--2.soru
CREATE VIEW [EmpsUnderManagers] AS
SELECT
	sup.staff_id,
	sup.first_name,
	sup.last_name,
	COUNT (sup.staff_id) AS number_of_staffs
FROM sales.staffs sub
INNER JOIN sales.staffs sup
ON sub.manager_id = sup.staff_id
GROUP BY sup.staff_id, sup.first_name, sup.last_name


SELECT *
FROM  [EmpsUnderManagers]

--3.soru
CREATE VIEW [WorkersEndWithL] AS
SELECT
	s.staff_id,
	s.first_name,
	s.last_name,
	COUNT(o.order_id) AS number_of_orders
FROM sales.staffs s
INNER JOIN sales.orders o
ON o.staff_id = s.staff_id
WHERE s.last_name LIKE '%l'
GROUP BY s.staff_id, s.first_name, s.last_name
HAVING COUNT(o.order_id) < 100


SELECT *
FROM [WorkersEndWithL]

--4.soru
CREATE VIEW [ProductsAtleastWithFiveStock] AS
SELECT
	p.product_id,
	p.product_name,
	p.model_year,
	p.list_price
FROM production.products p
WHERE EXISTS ( SELECT * FROM production.stocks s WHERE 
p.product_id = s.product_id AND s.quantity > 5)


SELECT *
FROM [ProductsAtleastWithFiveStock]

--5.soru
CREATE VIEW [ProductsUnderFiveStock] AS
SELECT
	p.product_id,
	p.product_name,
	p.model_year,
	p.list_price
FROM production.products p
WHERE p.product_id = ANY ( SELECT s.product_id  FROM production.stocks s 
WHERE s.quantity < 5)

SELECT *
FROM [ProductsUnderFiveStock]


--6.soru

CREATE VIEW [AllStocksOverFive] AS
SELECT
	p.product_id,
	p.product_name,
	p.model_year,
	p.list_price
FROM production.products p
WHERE p.product_id = ALL ( SELECT s.product_id  FROM production.stocks s WHERE s.quantity > 5)

SELECT *
FROM [AllStocksOverFive]


