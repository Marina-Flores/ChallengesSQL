-- #TASK: Concatenate the first name and last name of each employee. Include a single space between the first and last name. Name the new expression employee_name.
--		   Include: 
			-- employee_id
			-- first_name
			-- last_name
			-- employee_name

SELECT 
	employee_id,
	first_name,
	last_name,
	CONCAT(first_name, ' ', last_name) AS employee_name
FROM hcm.employees;

-- #TASK: Concatenate the first name, middle name and last name of each employee. Include a single space between each of the names. Name the new expression employee_name.
--		   Include: 
			-- employee_id
			-- first_name
			-- last_name
			-- employee_name

SELECT 
	employee_id,
	first_name,
	middle_name,
	last_name,
	CONCAT(first_name, ' ' + middle_name, ' ', last_name) AS employee_name
FROM hcm.employees;

-- #TASK: Extract the genus name from the scientific_name as given in the bird.antarctic_species table.

SELECT
	LEFT(scientific_name, CHARINDEX(' ', scientific_name) - 1 ) AS genus_name
FROM 
	bird.antarctic_species;

-- #TASK: Extract the species name from the scientific_name as given in the bird.antarctic_species table. 

SELECT 
	scientific_name,
	SUBSTRING(scientific_name, CHARINDEX(' ', scientific_name) + 1, LEN(scientific_name)) AS species_name
FROM 
	bird.antarctic_species;

-- #TASK: Return the age in years for all employees. Name this expression as employee_age.
--		   Include: 
			-- employee_id
			-- first_name
			-- last_name
			-- birth_date
			-- employee_age

SELECT 
	employee_id,
	first_name,
	last_name,
	birth_date,
	DATEDIFF(YEAR, birth_date, CURRENT_TIMESTAMP) employee_age
FROM hcm.employees;

-- #TASK: Assuming an estimated shipping date of 7 days after the order date, add a column expression called estimated_shipping_date for all unshipped ordes.
--		   Include: 
			-- order_id
			-- order_date
			-- estimated_shipping_date

SELECT 
	order_id,
	order_date,
	DATEADD(day, 7, order_date) AS estimated_shipping_date
FROM
	oes.orders
WHERE 
	shipped_date IS NULL;

-- #TASK: Calculate the average number of days it takes each shipping company to ship an order. Call this expression avg_shipping_days. 
--		   Include: 
			-- company_name
			-- avg_shipping_days

SELECT 
	s.company_name,
	AVG(DATEDIFF(DAY, o.order_date, o.shipped_date)) AS avg_shipping_days
FROM
	oes.orders o
JOIN oes.shippers s ON (o.shipper_id = s.shipper_id)
WHERE 
	o.shipped_date IS NOT NULL
GROUP BY s.company_name;