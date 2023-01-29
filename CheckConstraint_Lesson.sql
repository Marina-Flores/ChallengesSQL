-- CHECK constraint 
-- A CHECK constraint is a type of integrity constraint. It can be applied to a column and checks that each value
-- in the column meets a certain condition. 

ALTER TABLE <table_name>
	ADD CONSTRAINT <constraint_name> CHECK (column_name condition);


-- thiS CHECK constraint ensures that the column called quantity will always have a value greater than zero
ALTER TABLE dbo.order_details
	ADD CONSTRAINT chk_order_details_quantity CHECK (quantity > 0);

ALTER TABLE dbo.products 
	ADD CONSTRAINT chk_products_color
	CHECK (color IN ('Red', 'Blue', 'Yellow'));

-- ##TASK: Use an ALTER TABLE statement to add a CHECK constraint on the salary column in the hcm.employees
--		   table to ensure that salary is greater than or equal to zero. 

ALTER TABLE hcm.employees
	ADD CONSTRAINT chk_employees_salary CHECK (salary >= 0);