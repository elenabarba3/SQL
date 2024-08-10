/*Crear una tabla llamada "Clientes" con las columnas: id (entero, clave primaria), nombre (texto) y email (texto).*/
CREATE TABLE Clientes(
	id INT PRIMARY KEY,
	Nombre VARCHAR(255),
	email VARCHAR(255)
)
/*nsertar un nuevo cliente en la tabla "Clientes" con id=1, nombre="Juan" y email="juan@example.com".*/

INSERT INTO public.clientes (id, nombre, email)
VALUES (1, 'Juan', 'juan@example.com')

/*Actualizar el email del cliente con id=1 a "juan@gmail.com".*/

UPDATE public.Clientes
SET email = 'juan@gmail.com' 
	WHERE id=1
 /*Eliminar el cliente con id=1 de la tabla "Clientes".*/
 DELETE FROM public.Clientes 
WHERE id=1
/*Crear una tabla llamada "Pedidos" con las columnas: id (entero, clave primaria), cliente_id (entero, clave externa referenciando a la tabla "Clientes"), producto (texto) y cantidad (entero).*/

CREATE TABLE Pedidos (
    id INT PRIMARY KEY,
    producto VARCHAR(255),
    cantidad INT,
    Cliente_id INT,
    FOREIGN KEY (Cliente_id) REFERENCES clientes(id)
)
/*Insertar un nuevo pedido en la tabla "Pedidos" con id=1, cliente_id=1, producto="Camiseta" y cantidad=2.*/
INSERT INTO public.pedidos(id, Cliente_id, producto, cantidad)
VALUES (1,1,'Camiseta',2)
/*Actualizar la cantidad del pedido con id=1 a 3.*/
UPDATE pedidos 
SET cantidad = 3
WHERE id=1
/*Eliminar el pedido con id=1 de la tabla "Pedidos".*/
DELETE FROM pedidos 
WHERE id=1
/* Crear una tabla llamada "Productos" con las columnas: id (entero, clave primaria), nombre (texto) y precio (decimal).*/
CREATE TABLE productos (
    id INT PRIMARY KEY,
    nombre VARCHAR(255),
    precio DECIMAL
)

/*Insertar varios productos en la tabla "Productos" con diferentes valores.*/
INSERT INTO productos (id, nombre, precio)
VALUES (1, 'pantalon', 80)
INSERT INTO productos (id, nombre, precio)
VALUES (2, 'bikini', 50)
INSERT INTO productos (id, nombre, precio)
VALUES (3, 'vestido', 150)
INSERT INTO productos (id, nombre, precio)
VALUES (4, 'calcetines', 10)

/*Consultar todos los clientes de la tabla "Clientes"*/

SELECT * FROM clientes
/*Consultar todos los pedidos de la tabla "Pedidos" junto con los nombres de los clientes correspondientes.*/
SELECT nombre FROM clientes 
LEFT JOIN public.pedidos 
ON clientes.id=pedidos.cliente_id
/*Consultar los productos de la tabla "Productos" cuyo precio sea mayor a $50*/

SELECT * FROM productos 
WHERE precio>50
/*Consultar los pedidos de la tabla "Pedidos" que tengan una cantidad mayor o igual a 5.*/
SELECT * FROM pedidos 
WHERE cantidad>5
/*Consultar los clientes de la tabla "Clientes" cuyo nombre empiece con la letra "A".*/
SELECT * FROM clientes 
WHERE nombre ILIKE 'A%'
/*Realizar una consulta que muestre el nombre del cliente y el total de pedidos realizados por cada cliente.
*/
SELECT clientes.nombre, pedidos.cantidad
FROM clientes
INNER JOIN pedidos ON clientes.id = pedidos.cliente_id;
/*Realizar una consulta que muestre el nombre del producto y la cantidad total de pedidos de ese producto.*/
SELECT productos.nombre, pedidos.cantidad
FROM productos
LEFT JOIN pedidos 
ON productos.id=pedidos.id
/*Agregar una columna llamada "fecha" a la tabla "Pedidos" de tipo fecha.*/ 
ALTER TABLE public.pedidos
ADD COLUMN fecha DATE 
/*Agregar una clave externa a la tabla "Pedidos" que haga referencia a la tabla "Productos" en la columna "producto".*/ 
ALTER TABLE public.pedidos
ADD CONSTRAINT fk_producto_nombre
FOREIGN KEY (producto) REFERENCES productos(nombre)
/*Realizar una consulta que muestre los nombres de los clientes, los nombres de los productos y las cantidades de los pedidos donde coincida la clave externa.*/
SELECT 
    clientes.nombre, 
    productos.nombre, 
    pedidos.cantidad
FROM 
    Pedidos
JOIN 
    Clientes ON Pedidos.cliente_id = Clientes.id
JOIN 
    Productos ON Pedidos.producto = Productos.nombre



