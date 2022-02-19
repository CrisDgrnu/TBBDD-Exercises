LOAD DATA
INFILE './data.dat'
TRUNCATE
INTO TABLE producto_d
FIELDS TERMINATED BY ","
(
	producto,
	subseccion,
	seccion,
	marca,
	fabricante
) 

