-- #TASK: Return the following product details for the cheapest product(s) in the oes.products table:
	-- product_id
	-- product_name
	-- list_price
	-- category_id

SELECT 
	product_id,
	product_name,
	list_price,
	category_id
FROM 
	oes.products
WHERE 
	list_price = (
					SELECT 
						MIN(list_price) 
					FROM oes.products
				);

	-- using TOP

SELECT TOP(1) WITH TIES
	product_id,
	product_name,
	list_price,
	category_id
FROM 
	oes.products
ORDER BY 
	list_price;

-- #TASK: Use a correlated subquery to return the following product details for the cheapest product(s) in each product category as given by the category_id column:
	-- product_id
	-- product_name
	-- list_price
	-- category_id

SELECT 
	product_id,
	product_name,
	list_price,
	category_id
FROM 
	oes.products p1
WHERE 
	list_price = (
					SELECT 
						MIN(list_price) 
					FROM 
						oes.products p2
					WHERE 
						p1.category_id = p2.category_id						
				);

-- #TASK: Return the same result as challenge 2 i.e. the cheapest product(s) in each product category except this time by using an inner join to a derived table. 

SELECT 
	p.product_id,
	p.product_name,
	p.list_price,
	p.category_id
FROM 
	oes.products p
INNER JOIN 
		(
			SELECT 
				category_id,
				MIN(list_price) as min_list_price
			FROM 
				oes.products
			GROUP BY
				category_id
		) p2
ON p.category_id = p2.category_id
AND p.list_price = p2.min_list_price;

-- #TASK: Return the same result as challenge 2 and 3 i.e. the cheapest product(s) in each product category except this time by using a common table expression.

WITH cheapest_product_by_category
	AS 
		(
			SELECT 
				category_id,
				MIN(list_price) as min_list_price
			FROM
				oes.products
			GROUP BY
				category_id
		)
SELECT 
	p.product_id,
	p.product_name,
	p.list_price,
	p.category_id
FROM 
	oes.products p
INNER JOIN 
	cheapest_product_by_category p2
ON p.category_id = p2.category_id
AND p.list_price = p2.min_list_price;

-- #TASK: Repeat challenge 4, except this time include the product category name as given in the oes.product_categories table.

WITH cheapest_product_by_category
	AS 
		(
			SELECT 
				category_id,
				MIN(list_price) as min_list_price
			FROM
				oes.products
			GROUP BY
				category_id
		)
SELECT 
	p.product_id,
	p.product_name,
	p.list_price,
	p.category_id,
	pc.category_name
FROM 
	oes.products p
INNER JOIN oes.product_categories pc ON (p.category_id = pc.category_id)
INNER JOIN cheapest_product_by_category p2 ON (p.category_id = p2.category_id AND p.list_price = p2.min_list_price)

-- #TASK: Use the NOT IN operator to return all employees who have never been the salesperson for any customer order. Include the following columns from hcm.employees:
	-- employee_id
	-- first_name
	-- last_name

SELECT 
	employee_id,
	first_name,
	last_name
FROM
	hcm.employees
WHERE	
	employee_id NOT IN 
					(
						SELECT 
							employee_id
						FROM 
							oes.orders
						WHERE 
							employee_id IS NOT NULL
						);

-- #TASK: Return the same result as challenge 6, except use WHERE NOT EXISTS

SELECT 
	e.employee_id,
	e.first_name,
	e.last_name
FROM
	hcm.employees e
WHERE	
	 NOT EXISTS 
					(
						SELECT *							
						FROM 
							oes.orders O
						WHERE 
							o.employee_id = e.employee_id
						);

-- #TASK: Return unique customers who have ordered the 'PBX Smart Watch 4'. Include:
	-- customer-id
	-- first_name
	-- last_name
	-- email

SELECT 
	c.customer_id,
	c.first_name,
	c.last_name,
	c.email
FROM 
	oes.customers c
WHERE
	c.customer_id IN (
						SELECT 
							o.customer_id
						FROM 
							oes.orders o
						JOIN oes.order_items oi 
						ON oi.order_id = o.order_id
						JOIN oes.products p
						ON p.product_id = oi.product_id
						WHERE product_name = 'PBX Smart Watch 4')