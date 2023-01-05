--Write a query to return employee details for all employees as well as the first and last name of each employee's manager. Include the following columns:
--- employee_id
--- first_name
--- last_name
--- manager_first_name (alias for first_name)
--- manager_last_name (alias for last_name)

SELECT
	emp.employee_id,
	emp.first_name,
	emp.last_name,
	man.first_name AS 'manager_first_name',
	man.last_name AS 'manager_last_name'
FROM
	hcm.employees emp
	LEFT JOIN hcm.employees man ON (emp.manager_id = man.employee_id) 
	
	--Write a query to return all the products at each warehouse. Include the following attributes:
	--- product_id
	--- product_name
	--- warehouse_id
	--- warehouse_name
	--- quantity_on_hand

SELECT
	p.product_id,
	p.product_name,
	w.warehouse_id,
	w.warehouse_name,
	i.quantity_on_hand
FROM
	oes.products p
	INNER JOIN oes.inventories i ON (i.product_id = p.product_id)
	INNER JOIN oes.warehouses w ON (w.warehouse_id = i.warehouse_id) 
	
	--Write a query to return the following attributes for all employees from Australia:
	--- employee_id
	--- first_name
	--- last_name
	--- department_name
	--- job_title
	--- state_province

SELECT
	emp.employee_id,
	emp.first_name,
	emp.last_name,
	dept.department_name,
	j.job_title,
	emp.state_province,
	c.country_name
FROM
	hcm.employees emp
	LEFT JOIN hcm.departments dept ON (emp.department_id = dept.department_id)
	INNER JOIN hcm.jobs j ON (emp.job_id = j.job_id)
	INNER JOIN hcm.countries c ON (emp.country_id = c.country_id)
WHERE
	c.country_name = 'Australia' 
	
	--Return the total quantity ordered of each product in each category. Do not include products which have never been ordered. Include the product name and category
	--name in the query. Order the results by category name from A to Z and then within each category name order by product name from A to Z.

SELECT
	p.product_name,
	c.category_name,
	SUM(oi.quantity) AS 'quantity_ordered'
FROM
	oes.products p
	INNER JOIN oes.product_categories c ON (p.category_id = c.category_id)
	INNER JOIN oes.order_items oi ON (p.product_id = oi.product_id)
GROUP BY
	product_name,
	c.category_name
ORDER BY
	c.category_name,
	p.product_name 
	
	--Return the total quantity ordered of each product in each category. Include products which have never been ordered and give these a total quantity ordered of 0. 
	--Include the product name and category name in the query. Order the results by category name from A to Z and then within each category name order by product name from A to Z.

SELECT
	p.product_name,
	c.category_name,
	COALESCE(SUM(oi.quantity), 0) AS 'quantity_ordered'
FROM
	oes.products p
	INNER JOIN oes.product_categories c ON (p.category_id = c.category_id)
	LEFT JOIN oes.order_items oi ON (p.product_id = oi.product_id)
GROUP BY
	product_name,
	c.category_name
ORDER BY
	c.category_name,
	p.product_name