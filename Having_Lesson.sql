-- The HAVING Clause

-- The HAVING clause is used to filter groups.
-- The WHERE clause filters rows whereas the HAVING clause filters groups of rows. 
-- The HAVING clause is written after a GROUP BY clause.
-- Aggregate function can be used in the HAVING clause.

-- Syntax

SELECT	
	column1, 
	aggregate_function(column2)
FROM
	table_name
[WHERE conditions]
GROUP BY column1
HAVING condition;

-- Logical query processing order

-- Keyed-in Order				Logical Query Processing Order
-- 1. SELECT					1. FROM
-- 2. FROM						2. WHERE
-- 3. WHERE						3. GROUP BY
-- 4. GROUP BY					4. HAVING
-- 5. HAVING					5. SELECT
-- 6. ORDER BY					6. ORDER BY 