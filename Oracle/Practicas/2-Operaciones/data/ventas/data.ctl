LOAD DATA
INFILE './data.dat'
TRUNCATE
INTO TABLE ventas_h
FIELDS TERMINATED BY ","
(
	tienda,
	producto,
	ventas
) 

