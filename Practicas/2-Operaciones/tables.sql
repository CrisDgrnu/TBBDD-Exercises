--DROP TABLE producto_d;
CREATE TABLE producto_d(
    producto        VARCHAR2(30)    PRIMARY KEY,
    subseccion      VARCHAR2(30),
    seccion         VARCHAR2(30),
    marca           VARCHAR2(30),
    fabricante      VARCHAR2(30)
);

SELECT * FROM producto_d;

--DROP TABLE geografia_d;
CREATE TABLE geografia_d(
    tienda          VARCHAR2(30)    PRIMARY KEY,
    region          VARCHAR2(30),
    pais            VARCHAR2(30)
);

SELECT * FROM geografia_d;

--DROP TABLE ventas_h;
CREATE TABLE ventas_h(
    tienda          VARCHAR2(30),
    producto        VARCHAR2(30),
    ventas          VARCHAR2(30),
    
    CONSTRAINT PK_T_P PRIMARY KEY(tienda,producto),
    CONSTRAINT FK_G_V FOREIGN KEY (producto) REFERENCES producto_d,
    CONSTRAINT FK_T_P FOREIGN KEY (tienda) REFERENCES geografia_d
);

SELECT * FROM ventas_h;


