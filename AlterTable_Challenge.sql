-- ##Task: Add a new column called 'termination_date' into the hcm.employees table. Give this new column a data type of date

ALTER TABLE hcm.employees
	ADD termination_date DATE;

-- ##Task: Write two SQL statements to change the data type of the first_name and last_name columns to NVARCHAR(60)
--		   in the oes.customers table; 

ALTER TABLE oes.customers
	ALTER COLUMN first_name NVARCHAR(60);

ALTER TABLE oes.customers
	ALTER COLUMN last_name NVARCHAR(60);

-- ##Task: Use sp_rename to rename the column name 'phone' to 'main_phone' in the oes.customers table. 

sp_rename 'oes.customers.phone', 'main_phone', 'COLUMN';

