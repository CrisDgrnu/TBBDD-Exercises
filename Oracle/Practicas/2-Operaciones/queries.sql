/* Apartado 1 */

-- CUBE => Saca todas las posibles combinaciones con totales y subtotales
--         sin orden

SELECT 
    tienda,
    producto,
    SUM(ventas) 
FROM 
    ventas_h 
GROUP BY 
    CUBE(tienda,producto);

-- ROLLUP => Saca las combinaciones en base a la jerarquia de orden
--           que indiquemos en la funcion, no incluye subtotales para
--           el caso en que el valor de la jerarquia sea null 

SELECT 
    tienda,
    producto,
    ventas,
    SUM(ventas) 
FROM 
    ventas_h 
GROUP BY 
    ROLLUP(tienda,producto,ventas);
    
-- GROUPING SETS => Saca las combinaciones entre las columnas indicadas,
--                  no incluye totales, solo subtotales

SELECT 
    tienda,
    producto,
    SUM(ventas) 
FROM 
    ventas_h 
GROUP BY 
    GROUPING SETS(
        (tienda,producto)
    );

/* Apartado 2 */

-- Total ventas por tienda

SELECT 
    tienda,SUM(ventas) 
FROM 
    ventas_h 
GROUP BY 
    CUBE(tienda);

-- Total ventas por producto

SELECT 
    producto,
    SUM(ventas) 
FROM 
    ventas_h 
GROUP BY 
    CUBE(producto);
    

-- Total y subtotal de ventas por producto y tienda

SELECT 
    producto,
    tienda,
    SUM(ventas)
FROM 
    ventas_h 
GROUP BY 
    CUBE(producto,tienda);


/* Apartado 3 */

-- Las columnas con nulos indican totales 
-- Las columnas con no nulos subtotales
-- Ej => Si tienda no es nulo y producto si, esa fila nos indica
--       el total de ventas en esa tienda

-- Grouping nos permite ver que columnas son null
-- Luego con Grouping podemos saber que registros son totales o subtotales

-- Grouping_id nos permite calcular el nivel de agreagación de
-- varias columnas que esten agrupadas.

-- A mayor nivel de agregación, mas general será el resultado (total de todo),
-- A menor nivel de agregación, mas especifico será el resultado (subtotal por tienda y producto)

SELECT 
    tienda,
    producto,
    GROUPING(producto),
    GROUPING(tienda),
    GROUPING_ID(producto,tienda),
    SUM(ventas)
FROM 
    ventas_h 
GROUP BY 
    CUBE(tienda,producto);
    
-- Sabiendo el nivel de agregación, le podemos dar nombres a estas filas más
-- descriptivos con el operador decode
-- Decode le da un nombre a una columna segun el nivel de agregación

SELECT 
    DECODE(
        GROUPING_ID(tienda,producto),
        3,'Total de ventas',
        2,'Total de ventas por tienda',
        1,'Total de ventas por producto',
        0,'Ventas de un producto en una tienda'
    ) AS total,
    tienda,
    producto,
    SUM(ventas)
FROM 
    ventas_h 
GROUP BY 
    CUBE(tienda,producto);
    
/* Apartado 4 */

-- Rank hace un ranking pero en caso de empate se salta tantas posiciones
-- para el siguiente valor de rank como casos de empate haya para una posicion
-- Ej => Para la posición 8 del ranking hay 2 casos de empate,
--       luego el siguiente valor de rank sera 10

SELECT 
    producto,
    tienda,
    SUM(ventas),
    RANK() OVER (ORDER BY SUM(ventas) DESC) ranking_ventas
FROM 
    ventas_h 
GROUP BY 
    CUBE(producto,tienda);

-- Dense Rank hace un ranking pero en caso de empate continua por la posicion que toca
-- Ej => Para la posicion del ranking 8 hay 2 casos de empate, pero la siguiente
--       posicion sera la 9

SELECT 
    producto,
    tienda,
    SUM(ventas),
    DENSE_RANK() OVER (ORDER BY SUM(ventas) DESC) ranking_ventas
FROM 
    ventas_h 
GROUP BY 
    CUBE(producto,tienda);
    
/* Apartado 5 */

-- LAG => https://www.oracletutorial.com/oracle-analytic-functions/oracle-lag/

-- Me permite añadir una columna extra con los valores especificados en la funcion
-- desplazados hacia abajo tantas posiciones como indique el offset
-- Ej => Comparar las ventas de 2 tiendas, la primera con la anterior 

SELECT 
    tienda,
    producto,
    SUM(ventas),
    LAG( SUM(ventas),1) OVER (ORDER BY producto)
FROM 
    ventas_h 
GROUP BY 
    CUBE(tienda,producto);

-- LEAD => https://www.oracletutorial.com/oracle-analytic-functions/oracle-lead/

-- Igual que LAG pero al reves, me añade una columna nueva con los valores de la 
-- columna que yo especifique, desplazados hacia arriba un cierto offset
-- Ej => Comparar las ventas de 2 tiendas, la primera con la siguiente 

SELECT 
    tienda,
    producto,
    SUM(ventas),
    LEAD( SUM(ventas),1) OVER (ORDER BY producto)
FROM 
    ventas_h 
GROUP BY 
    CUBE(tienda,producto);
    
-- FIRST & LAST
-- Son flags para RANK y DENSE_RANK que permiten sacar
-- el primer y ultimo valor de una columna asociados a una agrupacion
SELECT 
    tienda,
    SUM(ventas) KEEP (DENSE_RANK FIRST ORDER BY ventas) "Mayor nº de ventas",
    SUM(ventas) KEEP (DENSE_RANK LAST ORDER BY ventas)  "Menor nº de ventas"
FROM 
    ventas_h 
GROUP BY 
    tienda;
