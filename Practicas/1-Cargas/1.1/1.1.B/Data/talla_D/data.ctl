LOAD DATA
INFILE './data.dat'
TRUNCATE
INTO TABLE talla_D
FIELDS TERMINATED BY ","
(
    talla,
    cod 
)
