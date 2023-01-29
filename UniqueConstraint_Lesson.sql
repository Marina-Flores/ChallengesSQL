-- UNIQUE constraint challenge
	-- ##Task: Use an ALTER TABLE statement to add a UNIQUE constraint to the department_name column in the 
	--		   hcm.departments table. 

	ALTER TABLE hcm.departments
		ADD CONSTRAINT uk_departments_department_name UNIQUE (department_name);

SELECT * FROM hcm.departments; 

--- query information schema views to get metadata on constraints on hcm.departments table:

SELECT 
	tc.TABLE_SCHEMA,
	tc.TABLE_NAME,
	tc.CONSTRAINT_TYPE,
	ccu.COLUMN_NAME
FROM
	INFORMATION_SCHEMA.TABLE_CONSTRAINTS tc
JOIN INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE ccu
ON tc.CONSTRAINT_NAME = ccu.CONSTRAINT_NAME
AND tc.TABLE_NAME = ccu.TABLE_NAME
AND tc.TABLE_SCHEMA = ccu.TABLE_SCHEMA
WHERE
	tc.TABLE_SCHEMA = 'hcm' 
AND tc.TABLE_NAME = 'departments';

-- check that the department_name column has only unique values

SELECT 
	COUNT(*) as total_count, 
	COUNT(DISTINCT department_name) as unique_value_count
FROM	
	hcm.departments;

