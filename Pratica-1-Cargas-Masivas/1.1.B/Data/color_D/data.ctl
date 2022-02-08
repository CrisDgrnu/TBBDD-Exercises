LOAD DATA
INFILE './data.dat'
TRUNCATE
INTO TABLE color_D
FIELDS TERMINATED BY ","
(
    color,
    cod 
)
