LOAD DATA
INFILE './data.dat'
TRUNCATE
INTO TABLE geografia_d
FIELDS TERMINATED BY ","
(
	tienda,
	region,
	pais
) 

