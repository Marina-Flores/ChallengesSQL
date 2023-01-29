-- INDEXES
-- An index is a data stucture which can speed up searches on a table if properly implemented. 

-- Terminology

	-- Heap: Is a table that does not have a clustered index on it. 
	-- Table Scan: Is where the SQL engine reads all the rows and columns.
	-- Index Scan: Is where the SQL engine reads all the rows (or index pages) and only the columns in the index.
	-- Index Seek: Uses the index to pinpoint only the rows that are needed to satisfy the query.
	-- Cardinality: Refres to the number of unique values in a column.
	-- Selectivity: Is a measure of how much an index can help to narrow the search for specific values in a table.
	--				There are two ways it can be expressed: 
					-- Average Selectivity is the cardinality divided by the total number of rows in a table;
					-- Selectivity of a specific value is the number of rows for a specific value divided by
					-- the total number of rows in a table. 

	SELECT 
		COUNT(DISTINCT(order_status)) AS cardinality
	FROM dbo.orders;

	SELECT 
		(COUNT(DISTINCT(order_status)) * 1.0 / COUNT(*)) AS avg_selectivity
	FROM dbo.orders;

	SELECT 
		(SELECT COUNT(*) FROM orders WHERE orders_status = 'Closed') * 1.0 / COUNT(*)
		AS selectivity_for_value_closed
	FROM orders; 

-- Implications of Selectivity
	-- when average selectivity is low for a column, then it is often best not to index that column
