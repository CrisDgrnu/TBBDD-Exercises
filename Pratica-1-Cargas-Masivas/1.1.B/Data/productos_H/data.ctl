LOAD DATA
INFILE './data.dat'
TRUNCATE
INTO TABLE productos_H
FIELDS TERMINATED BY ","
(
    articulo,
    color,
    talla,
    numero 
)
