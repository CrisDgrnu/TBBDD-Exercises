-- Initialize directories
CREATE OR REPLACE DIRECTORY external_articulos AS '/home/oracle/external_tables/1.2B/articulos';
CREATE OR REPLACE DIRECTORY external_colores AS '/home/oracle/external_tables/1.2B/colores';
CREATE OR REPLACE DIRECTORY external_tallas AS '/home/oracle/external_tables/1.2B/tallas';
CREATE OR REPLACE DIRECTORY external_productos AS '/home/oracle/external_tables/1.2B/productos';

SELECT * FROM DBA_DIRECTORIES;

-- Create table articulos
DROP TABLE TE_Articulos;
CREATE TABLE TE_Articulos(
    articulo          CHAR(30),
    descripcion       CHAR(30)
)

ORGANIZATION EXTERNAL(
    TYPE ORACLE_LOADER 
    DEFAULT DIRECTORY external_articulos
    ACCESS PARAMETERS(
        RECORDS DELIMITED BY NEWLINE   
            BADFILE '%a_%p.bad' 
            LOGFILE '%a_%p.log'
        FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LRTRIM                              
        MISSING FIELD VALUES ARE NULL
        REJECT ROWS WITH ALL NULL FIELDS(
            articulo      CHAR(30),
            descripcion   CHAR(30)
        )
    )
    
    LOCATION ('articulos.txt')
      
) REJECT LIMIT 0;

SELECT * FROM TE_Articulos;

-- Create table colores
DROP TABLE TE_Colores;
CREATE TABLE TE_Colores(
    color             CHAR(30),
    cod               CHAR(30)
)

ORGANIZATION EXTERNAL(
    TYPE ORACLE_LOADER 
    DEFAULT DIRECTORY external_colores
    ACCESS PARAMETERS(
        RECORDS DELIMITED BY NEWLINE   
            BADFILE '%a_%p.bad' 
            LOGFILE '%a_%p.log'
        FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LRTRIM                              
        MISSING FIELD VALUES ARE NULL
        REJECT ROWS WITH ALL NULL FIELDS(
            color         CHAR(30),
            cod           CHAR(30)
        )
    )
    
    LOCATION ('colores.txt')
      
) REJECT LIMIT 0;

SELECT * FROM TE_Colores;

-- Create table colores
DROP TABLE TE_Tallas;
CREATE TABLE TE_Tallas(
    talla             CHAR(30),
    cod               CHAR(30)
)

ORGANIZATION EXTERNAL(
    TYPE ORACLE_LOADER 
    DEFAULT DIRECTORY external_tallas
    ACCESS PARAMETERS(
        RECORDS DELIMITED BY NEWLINE   
            BADFILE '%a_%p.bad' 
            LOGFILE '%a_%p.log'
        FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LRTRIM                              
        MISSING FIELD VALUES ARE NULL
        REJECT ROWS WITH ALL NULL FIELDS(
            talla         CHAR(30),
            cod           CHAR(30)
        )
    )
    
    LOCATION ('tallas.txt')
      
) REJECT LIMIT 0;

SELECT * FROM TE_Tallas;


-- Create table colores
DROP TABLE TE_Productos;
CREATE TABLE TE_Productos(
    articulo            CHAR(30),
    color               CHAR(30),
    talla               CHAR(30),
    numero              NUMBER(5)
)

ORGANIZATION EXTERNAL(
    TYPE ORACLE_LOADER 
    DEFAULT DIRECTORY external_productos
    ACCESS PARAMETERS(
        RECORDS DELIMITED BY NEWLINE   
            BADFILE '%a_%p.bad' 
            LOGFILE '%a_%p.log'
        FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LRTRIM                              
        MISSING FIELD VALUES ARE NULL
        REJECT ROWS WITH ALL NULL FIELDS(
            articulo            CHAR(30),
            color               CHAR(30),
            talla               CHAR(30),
            numero              CHAR(5)
        )
    )
    
    LOCATION ('productos.txt')
      
) REJECT LIMIT 0;

SELECT * FROM TE_Productos;





