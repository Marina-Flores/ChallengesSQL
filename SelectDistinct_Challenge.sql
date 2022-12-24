-- Use a SELECT DISTINCT statement to get the distinct (i.e. unique) values that occur in the locality column from the bird.antarctic_populations table.

SELECT DISTINCT 
		locality 
FROM 
		bird.antarctic_populations (NOLOCK);

--Use a SELECT DISTINCT statement to get the distinct combinations of values for both the locality and species_id columns from the bird.antarctic_populations table 

SELECT DISTINCT 
		locality, 
		species_id 
FROM bird.antarctic_populations (NOLOCK);