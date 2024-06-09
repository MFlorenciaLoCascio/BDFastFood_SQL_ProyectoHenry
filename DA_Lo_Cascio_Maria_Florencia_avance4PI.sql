---------------------CONSULTAS CON LOS DISTINTOS TIPOS DE JOINS---------------------

/* 1- Listar todos los productos y sus categorías
Pregunta: ¿Cómo puedo obtener una lista de todos los productos junto con sus categorías?*/

/*tabla Productos  y tabla categorias
a la tabla productos (productoID, categoriaIDy nombre)
a la tabla categorias (catergoriaID y nombre)
usar inner join para traer todos los datos coincidentes de productos y categorias*/

SELECT 
	P.ProductoID,
	P.Nombre as Producto, 
	--Productos.CategoriaID,
	--Categorias.CategoriaID,
	C.Nombre as Categoria

FROM Categorias AS C --Crear alias "P" a la tabla productos 

INNER JOIN Productos AS P ON C.CategoriaID = P.CategoriaID 

------------------------------------------------------------------------------------

/* 2- Obtener empleados y su sucursal asignada
Pregunta: ¿Cómo puedo saber a qué sucursal está asignado cada empleado? */

/*tabla sucursales y tabla empleados
sucursales (sucursal id y nombre)
empleados (empleados id, sucursal id y nombre)
puedo usar innner join para que me traiga las coincidencias exactas sobre las sucursales y empleados*/

SELECT
	--S.SucursalID,
	S.Nombre AS Sucursal,
	E.EmpleadosID,
	--E.SucursalID,
	E.Nombre AS Empleado

FROM Empleados AS E

INNER JOIN Sucursales AS S ON E.SucursalID = S.SucursalID 


------------------------------------------------------------------------------------

/* 3- Identificar productos sin categoría asignada
Pregunta: ¿Existen productos que no tienen una categoría asignada?*/

/*tabla categorias y tabla productos
categorias: categoriaid y nombre
productos: productoid, categoriaid y nombre
debo usar un leftjoin 
en productos traer todos los resultados, para saber si hay algun null con la categoria*/

SELECT 
	Productos.Nombre AS Productos,
	Categorias.Nombre AS Categorias

FROM Productos
LEFT JOIN Categorias ON Productos.CategoriaID = Categorias.CategoriaID WHERE Categorias.CategoriaID IS NULL;

--No hay Productos que no tengan una categoria asignada


------------------------------------------------------------------------------------

/* 4- Detalle completo de órdenes
Pregunta: ¿Cómo puedo obtener un detalle completo de las órdenes, 
incluyendo cliente, empleado que tomó la orden, y el mensajero que la entregó?*/

SELECT 
	O.OrdenID, O.TotalCompra, O.FechaOrdenLista,
	C.Nombre AS Cliente,
	E.Nombre AS Empleados,
	M.Nombre AS Mensajeros, 
	OO.Descripcion AS Origen,
	TP.Descripcion AS TipoPago

FROM Ordenes AS O

INNER JOIN Clientes AS C 
		ON O.ClienteID = C.ClienteID

INNER JOIN Empleados AS E
	ON O.EmpleadoID = E.EmpleadosID

INNER JOIN Mensajeros AS M
	ON O.MensajeroID = M.MensajerosID

INNER JOIN OrigenesOrden AS OO
	ON O.OrigenID = OO.OrigenID

INNER JOIN TiposPago AS TP 
	ON O.TipoPagoID = TP.TipoPagoID

	   
------------------------------------------------------------------------------------

/* 5-Productos vendidos por sucursal
Pregunta: ¿Cuántos productos de cada tipo se han vendido en cada sucursal?*/

SELECT
	--Sucursales.SucursalID,
	P.Nombre AS Producto,
	S.Nombre AS Sucursal,
	SUM(DO.Cantidad) AS CantidadProductos


FROM DetalleOrdenes AS DO

INNER JOIN Ordenes AS O
	ON DO.OrdenID = O.OrdenID

INNER JOIN Productos AS P
	ON DO.ProductoID = P.ProductoID 

INNER JOIN Sucursales AS S
	ON O.SucursalID = S.SucursalID 

GROUP BY S.Nombre,P.Nombre
