CREATE OR REPLACE DIRECTORY external_tables AS '/home/oracle/external_tables';
SELECT * FROM DBA_DIRECTORIES;

DROP TABLE TE_Personas;
CREATE TABLE TE_Personas(
    id          VARCHAR2(3),
    nombre      CHAR(30)
)

ORGANIZATION EXTERNAL(
    TYPE ORACLE_LOADER 
    DEFAULT DIRECTORY external_tables
    ACCESS PARAMETERS(
        RECORDS DELIMITED BY NEWLINE   
            BADFILE '%a_%p.bad' 
            LOGFILE '%a_%p.log'
        FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LRTRIM                              
        MISSING FIELD VALUES ARE NULL
        REJECT ROWS WITH ALL NULL FIELDS(
            id      CHAR(3),
            nombre  CHAR(30)
        )
    )
    
    LOCATION ('data.txt')
      
)REJECT LIMIT 0 ;

SELECT * FROM TE_Personas;




