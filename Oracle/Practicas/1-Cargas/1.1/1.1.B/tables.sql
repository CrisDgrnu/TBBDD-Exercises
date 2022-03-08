CREATE TABLE articulo_D(
    articulo        VARCHAR2(20)    PRIMARY KEY,
    descripcion     VARCHAR2(30)
);

CREATE TABLE color_D(
    color           VARCHAR2(10)    PRIMARY KEY,
    cod             VARCHAR2(3)
);

CREATE TABLE talla_D(
    talla           VARCHAR2(10)    PRIMARY KEY,
    cod             VARCHAR2(1)
);

CREATE TABLE productos_H(
    articulo        VARCHAR2(20),
    color           VARCHAR2(10),
    talla           VARCHAR2(10),
    numero          NUMBER,

    CONSTRAINT      pk_productos    PRIMARY KEY     (articulo, color, talla),
    CONSTRAINT      fk_prod_art     FOREIGN KEY     (articulo)                  REFERENCES      articulo_D      /*ON DELETE CASCADE*/,
    CONSTRAINT      fk_prod_color   FOREIGN KEY     (color)                     REFERENCES      color_D         /*ON DELETE CASCADE*/,
    CONSTRAINT      fk_prod_talla   FOREIGN KEY     (talla)                     REFERENCES      talla_D         /*ON DELETE CASCADE*/
);

