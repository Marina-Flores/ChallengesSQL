-- The IN Operator 

-- The IN operator can be used to check if a value is included in some specified list of values.
-- The IN operator allows you to specify multiple values in the WHERE clause
-- We can also specify a subquery after the IN operator. 


-- IN Operator Syntax

SELECT *
FROM table1
WHERE column1
		IN (value1, value2, value3,...);