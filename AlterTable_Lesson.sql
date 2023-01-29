-- add column to a table

ALTER TABLE <table_name>
	ADD <column_name> <column_data_type>

ALTER TABLE dbo.products
	ADD product_code INT;

-- modify an existing column

ALTER TABLE <table_name>
	ALTER COLUMN <column_name> <column_data_type>

ALTER TABLE dbo.products
	ALTER COLUMN product_name VARCHAR(50) NOT NULL;

-- drop a column in a table

ALTER TABLE <table_name>
	DROP COLUMN <column_name>;

ALTER TABLE dbo.products
	DROP COLUMN color;

-- rename a column in a table

sp_rename '<schema_name>.<table_name>.<old_column_name>', '<new_column_name>', 'COLUMN';

sp_rename 'dbo.parks1.name_park', 'park_name', 'COLUMN';

