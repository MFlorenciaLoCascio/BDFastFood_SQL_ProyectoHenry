----------------CREAR BASE DE DATOS------------------- 

CREATE DATABASE FastFoodDB

-----------------USAR BASE DE DATOS-------------------

USE FastFoodDB;

-------------------CREAR TABLAS-----------------------
--(definiendo sus respectivas PK)

CREATE TABLE Categorias(
	CategoriaID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR(255));


CREATE TABLE Productos(
	ProductoID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR(255) NOT NULL, 
	CategoriaID INT,
	Precio DECIMAL(10,2) NOT NULL); --Primer argumento: cant de digitos totales que puede alojar el campo, el segundo argumento la cantidad de decimales
	

CREATE TABLE Ordenes(
	OrdenID INT PRIMARY KEY IDENTITY,
	ClienteID INT,
	EmpleadoID INT,
	SucursalID INT,
	MensajeroID INT,
	TipoPagoID INT,
	OrigenID INT,
	HorarioVenta VARCHAR(50), 
	TotalCompra DECIMAL(10,2),
	KilometrosRecorrer DECIMAL(10,2),
	FechaDespacho DATETIME,
	FechaEntrega DATETIME,
	FechaOrdenTomada DATETIME,
	FechaOrdenLista DATETIME,
	);



CREATE TABLE DetalleOrdenes (
	OrdenID INT,	 
	ProductoID INT,
	Cantidad INT NOT NULL,
	Precio DECIMAL (10,2) NOT NULL
);

ALTER TABLE DetalleOrdenes  
	ADD CONSTRAINT FK_Producto_DetalleOrden
	FOREIGN KEY (ProductoID) 
	REFERENCES Productos(ProductoID); 


ALTER TABLE DetalleOrdenes
	ADD CONSTRAINT FK_Ordenes
	FOREIGN KEY (OrdenID) 
	REFERENCES Ordenes(OrdenID);


ALTER TABLE DetalleOrdenes
ALTER COLUMN OrdenID INT NOT NULL; --cambie la columna a not null, porque no me dejaba crear la pk


ALTER TABLE DetalleOrdenes
ALTER COLUMN ProductoID INT NOT NULL; --cambie la columna a not null, porque no me dejaba crear la pk


ALTER TABLE DetalleOrdenes
ADD PRIMARY KEY (OrdenID, ProductoID); -- creo mi pk para las columnas: OrdenID y ProductoID


CREATE TABLE OrigenesOrden(
	OrigenID INT PRIMARY KEY IDENTITY,
	Descripcion VARCHAR(255));


CREATE TABLE Clientes (
	ClienteID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR (255) NOT NULL,
	Direccion VARCHAR (255) NOT NULL );


CREATE TABLE Sucursales (
	SucursalID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR (255) NOT NULL,
	Direccion VARCHAR (255) NOT NULL );


CREATE TABLE Empleados (
	EmpleadosID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR (255) NOT NULL,
	Posicion VARCHAR (255) NOT NULL,
	Departamento VARCHAR (255) NOT NULL,
	SucursalID INT,
	Rol VARCHAR (255) NOT NULL );


CREATE TABLE Mensajeros (
	MensajerosID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR (255) NOT NULL, 
	EsExterno VARCHAR (255) NOT NULL );		


ALTER TABLE Mensajeros
ALTER COLUMN EsExterno BIT;	--cambio el tipo de datos de la tabla mensajeros, columna EsExterno, de tipo varchar a tipo bit
	

CREATE TABLE TiposPago (
	TipoPagoID INT PRIMARY KEY IDENTITY,
	Descripcion VARCHAR (255) NOT NULL ); 



-----------GENERAR RELACIONES ENTRE TABLAS------------

	-- AÑADIR LAS CLAVES FORANEAS:

ALTER TABLE Productos  -- TABLA DONDE QUIERO CREAR MI FK
ADD CONSTRAINT FK_Productos_Categorias -- NOMBRE QUE LE QUIERO PONER A MI FK
FOREIGN KEY (CategoriaID) 
REFERENCES Categorias(CategoriaID); 

/* FOREIGN KEY:NOMBRE DE COLUMNA DE MI FK
REFERENCES: NOMBRE DE LA TABLA CON LA QUE SE RELACIONA Y ENTRE () LA COLUMNA DE LA PK */


ALTER TABLE Empleados	
ADD CONSTRAINT FK_Sucursales	
FOREIGN KEY (SucursalID)
REFERENCES Sucursales(SucursalID);


ALTER TABLE Ordenes
ADD CONSTRAINT FK_Origen
FOREIGN KEY (OrigenID)
REFERENCES OrigenesOrden(OrigenID) ;


ALTER TABLE Ordenes
ADD CONSTRAINT FK_Tipo_pago
FOREIGN KEY (TipoPagoID)
REFERENCES TiposPago(TipoPagoID) ;


ALTER TABLE Ordenes
ADD CONSTRAINT FK_Mensajero
FOREIGN KEY (MensajeroID)
REFERENCES Mensajeros(MensajerosID) ;


ALTER TABLE Ordenes
ADD CONSTRAINT FK_Sucursal
FOREIGN KEY (SucursalID)
REFERENCES Sucursales(SucursalID) ;


ALTER TABLE Ordenes
ADD CONSTRAINT FK_Empleado
FOREIGN KEY (EmpleadoID)
REFERENCES Empleados(EmpleadosID) ;


ALTER TABLE Ordenes
ADD CONSTRAINT FK_Clientes
FOREIGN KEY (ClienteID)
REFERENCES Clientes(ClienteID) ;