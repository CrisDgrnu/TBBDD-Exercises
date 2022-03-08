LOAD DATA
INFILE './data.dat'
TRUNCATE
INTO TABLE articulo_D
FIELDS TERMINATED BY ","
(
    articulo,
    descripcion 
)
