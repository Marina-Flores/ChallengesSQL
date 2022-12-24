--Write a query that returns all employees ordered alphabetically by their last name from A to Z.

SELECT * FROM 
	hcm.employees 
ORDER BY 
	last_name ASC;

-- Write a query that returns all employees ordered by salary from highest to lowest.

SELECT * FROM
	hcm.employees
ORDER BY 
	salary DESC;

-- Write a query to return all employees ordered by most recently hired to longest serving.

SELECT * FROM
	hcm.employees
ORDER BY 
	hire_date DESC; 


-- Write a query to return all employees ordered by department_id in ascending order and within each department_id, order by salary from highest to lowest.

SELECT * FROM
	hcm.employees
ORDER BY 
	department_id ASC, 
	salary DESC;

-- Write a query to return the employee_id, first_name, last_name and salary for the top 10 employees who get paid the most

SELECT TOP(10)
	employee_id,
	first_name,
	last_name,
	salary
FROM
	hcm.employees
ORDER BY 
	salary DESC;

-- Write a query to return the employee_id, first_name, last_name and salary for the employee or employees who get paid the least.SELECT TOP 1 WITH TIES	employee_id,	first_name,	last_name,	salaryFROM 	hcm.employeesORDER BY 	salary ASC;