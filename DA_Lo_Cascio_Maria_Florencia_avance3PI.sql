-------CONSULTAS CON FUNCIONES DE AGREGRACIÓN, CLAUSULAS Y UNION DE TABLAS---------

/* Funciones de agregación: SUM/MAX/MIN/AVG/COUNT
Clausulas:GROUPBY/ORDERBY/HAVING
Union de tablas: UNION */

------------------------------------------------------------------------------------

/* 1- Total de ventas globales
¿Cuál es el total de ventas (TotalCompra) a nivel global?*/

SELECT SUM(TotalCompra) AS TotalVentas
FROM Ordenes;


------------------------------------------------------------------------------------

/* 2- Promedio de precios de productos por categoría
¿Cuál es el precio promedio de los productos dentro de cada categoría?*/

SELECT CategoriaID, AVG(Precio) AS PromedioPrecios 
FROM Productos
GROUP BY CategoriaID;


------------------------------------------------------------------------------------

/* 3- Orden mínima y máxima por sucursal
¿Cuál es el valor de la orden mínima y máxima por cada sucursal?*/

SELECT SucursalID, MIN (TotalCompra) AS OrdenMinima, MAX (TotalCompra) AS OrdenMaxima
FROM Ordenes
GROUP BY SucursalID;


------------------------------------------------------------------------------------

/* 4- Mayor número de kilómetros recorridos para entrega
¿Cuál es el mayor número de kilómetros recorridos para una entrega?*/

SELECT MAX(KilometrosRecorrer) AS MayorKilometrosRecorridos
FROM Ordenes


------------------------------------------------------------------------------------

/* 5- Promedio de cantidad de productos por orden
¿Cuál es la cantidad promedio de productos por orden?*/

SELECT AVG(Cantidad) AS /*ARRGELARRRR*/
FROM Ordenes


------------------------------------------------------------------------------------

/* 6- Total de ventas por tipo de pago
¿Cuál es el total de ventas por cada tipo de pago?*/

SELECT TipoPagoID, SUM (TotalCompra) AS TotalVenta
FROM Ordenes
GROUP BY TipoPagoID;


------------------------------------------------------------------------------------

/* 7-Sucursal con la venta promedio más alta
¿Cuál sucursal tiene la venta promedio más alta?*/

SELECT TOP 1 SucursalID, 
	AVG (TotalCompra) AS TotalCompra 
FROM Ordenes
GROUP BY SucursalID
ORDER BY TotalCompra DESC;


------------------------------------------------------------------------------------

/* 8- Sucursal con la mayor cantidad de ventas por encima de un umbral
¿Cuáles son las sucursales que han generado ventas por orden por encima de $100, y cómo se comparan en términos del total de ventas?*/

SELECT SucursalID, 
	COUNT(OrdenID) AS NumeroOrdenes, -- metrica1
	SUM(TotalCompra) AS TotalVentas -- metrica2
FROM Ordenes
GROUP BY SucursalID
HAVING SUM(TotalCompra) > 50 AND COUNT(OrdenID) = 5; 



------------------------------------------------------------------------------------

/* 9- Comparación de ventas promedio antes y después de una fecha específica
¿Cómo se comparan las ventas promedio antes y después del 1 de julio de 2023?*/

SELECT 
	'Antes del 01-077-2023' AS Periodo, AVG(TotalCompra) AS VentasPromedio
FROM 
	Ordenes
WHERE 
	FechaOrdenTomada < '2023-07-01'

UNION -- Conecta dos consultas (tiene que tener la misma cant de columnas y que tengan el mismo tipo de dato)

SELECT
	'Despues del 01-07-2023' AS Periodo, AVG (TotalCompra) AS VentasPromedio
FROM 
	Ordenes	
WHERE 
	FechaOrdenTomada >= '2023-07-01';


------------------------------------------------------------------------------------

/* 10- Análisis de actividad de ventas por horario
¿Durante qué horario del día (mañana, tarde, noche) se registra la mayor cantidad de ventas, cuál es el valor promedio de estas ventas, y cuál ha sido la venta máxima alcanzada?*/

SELECT TOP 1 HorarioVenta, 
	COUNT (OrdenID) AS NumeroVentas, 
	AVG (TotalCompra) AS PromedioVenta,
	MAX (TotalCompra) AS VentaMaxima
FROM Ordenes
GROUP BY HorarioVenta
ORDER BY NumeroVentas DESC, PromedioVenta DESC;