-- ##TASK: Create a non-clustered index on the location_id column in the oes.warehouses table. Also, specify warehouse_name as a non-key included column. 

CREATE NONCLUSTERED INDEX ix_warehouses_warehouse_name ON oes.warehouses (location_id) INCLUDE (warehouse_name); 

-- ##TASK: Create a UNIQUE index on the product_name column in the oes.products table.

CREATE UNIQUE INDEX ix_products_product_name ON oes.products (product_name);

-- ##TASK: Rewrite the following query to make it sargable:

/*SELECT 
	order_id,
	order_date
FROM 
	oes.orders
WHERE 
	YEAR(order_date) = 2019;
*/
--

SELECT 
	order_id,
	order_date
FROM 
	oes.orders
WHERE 
	order_date >= '20190101' AND order_date < '20200101';

-- ##TASK: Most queries against the oes.orders table are for unshipped orders i.e. orders where the shipped_date is null. Put an appropriete filtered index on the shipped_date column.

CREATE NONCLUSTERED INDEX ix_orders_shipped_date ON oes.orders (shipped_date) WHERE shipped_date IS NULL;

-- ##TASK: Rewrite the following query to make it sargable and create an index which covers the query, once rewritten:

/*SELECT 
	customer_id,
	first_name,
	last_name,
	email,
	street_address
FROM 
	oes.customers
WHERE 
	LEFT(first_name, 2) = 'Vi'
AND last_name = 'Jones'; */

-- 

SELECT 
	customer_id,
	first_name,
	last_name,
	email,
	street_address
FROM 
	oes.customers
WHERE
	first_name LIKE 'Vi%'
AND last_name = 'Jones';

CREATE NONCLUSTERED INDEX ix_customers_all ON oes.customers (first_name, last_name) INCLUDE (email, street_address);