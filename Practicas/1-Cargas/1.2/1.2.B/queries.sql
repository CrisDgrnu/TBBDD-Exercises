SELECT * FROM te_articulos;
SELECT * FROM te_colores;
SELECT * FROM te_tallas;
SELECT * FROM te_productos;


-- Queries para sacar todas las posibles combinaciones

-- 0.100 seconds
SELECT 
    articulo, color, talla, SUM(numero) 
FROM te_productos GROUP BY articulo, color, talla
UNION

SELECT 
    articulo, NULL,  talla, SUM(numero) 
FROM te_productos GROUP BY articulo, NULL,  talla
UNION

SELECT 
    articulo, color, NULL, SUM(numero) 
FROM te_productos GROUP BY articulo, color, NULL
UNION

SELECT 
    articulo, NULL, NULL, SUM(numero)
FROM te_productos GROUP BY articulo, NULL, NULL
UNION

SELECT 
    NULL, color, talla, SUM(numero) 
FROM te_productos GROUP BY NULL, color, talla
UNION

SELECT 
    NULL, color, NULL, SUM(numero) 
FROM te_productos GROUP BY NULL, color, NULL
UNION

SELECT 
    NULL, NULL, talla , SUM(numero)
FROM te_productos GROUP BY NULL, NULL, talla
UNION

SELECT NULL, NULL, NULL , SUM(numero) 
FROM te_productos GROUP BY NULL, NULL, NULL;

-- Equivalentes a la de arriba pero mas eficiente

-- 0.015 - 0.020 seconds
SELECT 
    articulo, color, talla, SUM(numero)
FROM 
    te_productos
GROUP BY 
    CUBE(articulo, color, talla); 
    
-- 0.015 - 0.020 seconds
SELECT 
    articulo, color, talla, SUM( numero )
FROM 
    te_productos
GROUP BY 
    GROUPING SETS (
        (articulo, color),
        (color, talla), 
        (articulo, talla),
        (articulo), 
        (color), 
        (talla), 
        ( ) 
    );

-- ROLL UP => Sirve para establecer jerarquia en el GROUP BY

-- 0.018 seconds
SELECT 
    articulo, color, talla, SUM(numero)
FROM 
    te_productos
GROUP BY 
    ROLLUP(articulo, color, talla);

-- GROUPING SETS => Permite usar varios GROUP BY en uno solo 
--                  ¿No tiene jerarquia ni orden?

-- 0.020 seconds
SELECT 
    articulo, color, talla, SUM(numero)
FROM 
    te_productos
GROUP BY 
    GROUPING SETS ((articulo,color), (articulo, talla));


-- GROUPING => Devuelve 1 si encuentra un NULL creado por las operaciones
--             CUBE o ROLLUP

-- 0.020 seconds
SELECT 
    articulo, color, talla, SUM(numero), 
    GROUPING (articulo) garticulo,
    GROUPING (color) gcolor, 
    GROUPING (talla) gtalla
FROM   
    te_productos
GROUP BY 
    CUBE (articulo, color, talla);
   
-- GROUPING ID => Asigna un numero segun la posicion de los NULL.
--                Parece que si vemos los NULL como 1 y los valores 
--                como 0, el numero que se presenta en binario es el
--                correspondiente, ej vestido | null | pequena = 010 = 2                       

-- 0.020 seconds
SELECT 
    articulo, color, talla, SUM(numero),
    GROUPING (articulo) GID_Ar,
    GROUPING (color) GID_Co, 
    GROUPING (talla) GID_Ta, 
    GROUPING_ID (articulo, color, talla) GID
FROM 
    te_productos
GROUP BY   
    CUBE (articulo, color, talla);
    
-- SILICING => La maestra no puso ni media y me tengo que ir a entrenar


-- RANK => Permite crear un ranking segun el criterio
--         que se establezca

-- 0.017 seconds
SELECT 
    Articulo, Color, Talla,
DENSE_RANK() OVER (
    ORDER BY numero DESC
    )
FROM 
    te_productos;
    