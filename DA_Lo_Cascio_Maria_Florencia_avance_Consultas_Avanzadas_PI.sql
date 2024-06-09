------------------------------CONSULTAS FINALES AVANZADAS-------------------------------

/* 1- Eficiencia de los mensajeros: 
�Cu�l es el tiempo promedio desde el despacho hasta la entrega de los pedidos por los mensajeros?*/

SELECT 
    AVG(DATEDIFF(MINUTE, O.FechaDespacho, O.FechaEntrega)) AS TiempoPromedioEntrega
FROM 
    Ordenes AS O
WHERE MensajeroID IS NOT NULL;


----------------------------------------------------------------------------------------

/* 2- An�lisis de Ventas por Origen de Orden: 
�Qu� canal de ventas genera m�s ingresos?*/

SELECT TOP 1
	O.origenID AS IdOrigen,
	OO.Descripcion AS CanalVenta,
	SUM(O.TotalCompra) AS TotalIngresos

FROM Ordenes AS O

JOIN OrigenesOrden AS OO 
	ON O.OrigenID = OO.OrigenID

GROUP BY O.origenID, OO.Descripcion
ORDER�BY�TotalIngresos�DESC;


----------------------------------------------------------------------------------------

/* 3-Productividad de los Empleados: 
�Cu�l es el volumen de ventas promedio gestionado por empleado?*/

--Cantidad de ventas promedio por empleado

SELECT E.Nombre AS Empleado,
		COUNT(O.OrdenId) AS VolumenVentas

FROM Ordenes AS O

INNER JOIN Empleados AS E 
	ON O.EmpleadoID = E.EmpleadosID

GROUP BY E.Nombre 
ORDER BY VolumenVentas DESC;


select * from ordenes 


----------------------------------------------------------------------------------------

/* 4- An�lisis de Demanda por Horario y D�a: 
�C�mo var�a la demanda de productos a lo largo del d�a?*/

SELECT 
	P.Nombre, 
	O.HorarioVenta AS Horario, 
	COUNT(DO.Cantidad) AS DemandaProductos

FROM DetalleOrdenes AS DO 

INNER JOIN Ordenes AS O
	ON DO.OrdenID = O.OrdenID

INNER JOIN Productos AS P
	ON DO.ProductoID = P.ProductoID

GROUP BY P.Nombre, O.HorarioVenta


----------------------------------------------------------------------------------------

/* 5- Comparaci�n de Ventas Mensuales: 
�C�mo se comparan las ventas mensuales de este a�o con el a�o anterior?*/

SELECT 
	YEAR(FechaOrdenTomada) AS PeriodoAnual,
	MONTH(FechaOrdenTomada)AS PeriodoMensual,
	SUM(TotalCompra) AS Total 

FROM Ordenes

GROUP BY YEAR(FechaOrdenTomada),
		MONTH(FechaOrdenTomada)

ORDER BY Total DESC


----------------------------------------------------------------------------------------

/* 6- An�lisis de Fidelidad del Cliente: 
�Qu� porcentaje de clientes son recurrentes versus nuevos clientes cada mes? 
NOTA: La consulta se enfocar�a en la frecuencia de �rdenes por cliente para inferir la fidelidad.*/


SELECT C.Nombre, 
		COUNT (O.ordenID) AS CantidadOrdenes

FROM Ordenes as O

INNER JOIN Clientes AS C 
ON C.ClienteID = o.ClienteID
GROUP BY C.Nombre 


select * from Ordenes
select * from DetalleOrdenes
select * from Clientes


----------------------------------------------------------------------------------------

/* 7- IDOrden con mayor valor
�Cu�l fue la orden con mayor valor junto con su monto y franja horaria?*/

SELECT OrdenID, ClienteID, HorarioVenta, TotalCompra
FROM Ordenes
ORDER BY TotalCompra DESC;


SELECT * FROM Ordenes


----------------------------------------------------------------------------------------

/* 8- IDOrden con menor valor
�Cu�l fue la orden con menor valor junto con su monto y franja horaria?*/

SELECT OrdenID, HorarioVenta, TotalCompra
FROM Ordenes
ORDER BY TotalCompra ASC;


select * from Productos
select * from TiposPago


----------------------------------------------------------------------------------------

/* 9- Cantidad de ventas por franja horaria:
�Cu�l fue el producto m�s vendido, cantidad y sucursal? */

SELECT 
P.Nombre AS PRODUCTO,
S.Nombre AS SUCURSAL, 
SUM(DO.Cantidad) AS CANTIDAD


FROM DetalleOrdenes AS DO

INNER JOIN ORDENES AS O
	ON DO.OrdenID = O.OrdenID
INNER JOIN Productos AS P
	ON DO.ProductoID = P.ProductoID
INNER JOIN Sucursales AS S
	ON O.SucursalID = S.SucursalID

GROUP BY P.Nombre, S.Nombre
ORDER BY CANTIDAD DESC;