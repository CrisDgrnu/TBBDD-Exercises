SELECT * FROM articulo_d;
SELECT * FROM color_D;
SELECT * FROM talla_D;
SELECT * FROM productos_H;

-- ~0.004 - 0.010 seconds
SELECT 
    articulo, color, talla, SUM(numero) 
FROM productos_h GROUP BY articulo, color, talla
UNION

SELECT 
    articulo, NULL,  talla, SUM(numero) 
FROM productos_h GROUP BY articulo, NULL,  talla
UNION

SELECT 
    articulo, color, NULL, SUM(numero) 
FROM productos_h GROUP BY articulo, color, NULL
UNION

SELECT 
    articulo, NULL, NULL, SUM(numero)
FROM productos_h GROUP BY articulo, NULL, NULL
UNION

SELECT 
    NULL, color, talla, SUM(numero) 
FROM productos_h GROUP BY NULL, color, talla
UNION

SELECT 
    NULL, color, NULL, SUM(numero) 
FROM productos_h GROUP BY NULL, color, NULL
UNION

SELECT 
    NULL, NULL, talla , SUM(numero)
FROM productos_h GROUP BY NULL, NULL, talla
UNION

SELECT NULL, NULL, NULL , SUM(numero) 
FROM productos_h GROUP BY NULL, NULL, NULL;

/* ESTAS DOS SON EQUIVALENTES A LA GRANDE DE ARRIBA */

-- 0.003 - 0.004 seconds
SELECT 
    Articulo, Color, Talla, Sum(Numero)
FROM 
    productos_H
GROUP BY 
    Cube(Articulo, Color, Talla); 

-- ~0.003 - 0.004 seconds
SELECT 
    Articulo, color, talla, SUM( numero )
FROM 
    productos_h
GROUP BY 
    Grouping sets (
        (Articulo, color),
        (color, talla), 
        (Articulo, talla),
        (Articulo), 
        (color), 
        (talla), 
        ( ) 
    );

