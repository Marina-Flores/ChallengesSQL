-- Query the INFORMATION_SCHEMA.COLUMNS view to find the collation used for the hcm.countries table

SELECT 
	table_schema,
	table_name,
	column_name,
	data_type,
	collation_name
FROM 
	INFORMATION_SCHEMA.COLUMNS
WHERE 
	TABLE_SCHEMA = 'hcm' AND TABLE_NAME = 'countries';

-- Select countries from hcm.countries table which start with the letter 'N'.

SELECT * 
FROM 
	[hcm].[countries]
WHERE 
	country_name LIKE 'N%';

-- Select customers from the oes.customers table who have a Gmail email addres.

SELECT *
FROM 
	[oes].[customers]
WHERE
	email LIKE '%gmail.com';

-- Select product names from the oes.products table which contain the word 'mouse' anywhere within the product name.

SELECT *
FROM
	[oes].[products]
WHERE 
	product_name LIKE '%mouse%';

-- Select all product names from the oes.products table which end in a number

SELECT *
FROM 
	[oes].[products]
WHERE 
	product_name LIKE '%[0-9]';