SELECT 
	table_schema,
	table_name,
	column_name,
	data_type,
	character_maximum_length AS char_max_length,
	character_octet_length AS char_octet_length,
	collation_name
FROM INFORMATION_SCHEMA.COLUMNS
WHERE table_schema = 'oes' AND TABLE_NAME = 'products'

-- character octet length refers to the maximum length and bytes for character data