LOAD DATA
INFILE ./data.data
TRUNCATE
INTO TABLE PERSONA
FIELDS TERMINATED BY ","
(
    id,
    nombre
)

