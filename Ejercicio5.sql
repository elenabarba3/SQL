/*Crea una tabla llamada "Clientes" con las columnas id (entero) y nombre (cadena de texto).*/
CREATE TABLE clientes (
	id INT PRIMARY KEY, 
	nombre VARCHAR(255)
)
/*Inserta un cliente con id=1 y nombre='John' en la tabla "Clientes".*/

INSERT INTO clientes (id, nombre)
VALUES (1, 'John')
/* Actualiza el nombre del cliente con id=1 a 'John Doe' en la tabla "Clientes".*/
UPDATE clientes
SET nombre='John Doe'
WHERE id=1
/*Elimina el cliente con id=1 de la tabla "Clientes".*/
DELETE FROM clientes
WHERE id=1
/*Lee todos los clientes de la tabla "Clientes".*/
SELECT * FROM clientes
/*Crea una tabla llamada "Pedidos" con las columnas id (entero) y cliente_id (entero).*/
CREATE TABLE pedidos2(
	id INT PRIMARY KEY, 
	cliente_id2 INT
)
/*Inserta un pedido con id=1 y cliente_id=1 en la tabla "Pedidos".*/
INSERT INTO pedidos2 (id, cliente_id2)
VALUES (1,1)
/*Actualiza el cliente_id del pedido con id=1 a 2 en la tabla "Pedidos".*/
UPDATE pedidos2
SET cliente_id2 = 2
WHERE cliente_id2=1
/*Elimina el pedido con id=1 de la tabla "Pedidos".*/
DELETE FROM pedidos2
WHERE id=1
/*Lee todos los pedidos de la tabla "Pedidos".*/
SELECT * FROM pedidos2
/*Crea una tabla llamada "Productos" con las columnas id (entero) y nombre (cadena de texto).*/
CREATE TABLE productos2 (
  id INT PRIMARY KEY,
  nombre VARCHAR(255)
)

/*Inserta un producto con id=1 y nombre='Camisa' en la tabla "Productos".*/
INSERT INTO productos2 (id, nombre)
VALUES (1, 'Camisa')
/*Actualiza el nombre del producto con id=1 a 'Pantalón' en la tabla "Productos"*/
UPDATE productos2 
SET nombre='pantalon'
WHERE id=1
/*Elimina el producto con id=1 de la tabla "Productos".*/
DELETE FROM productos2
WHERE id=1
/*Lee todos los productos de la tabla "Productos".*/
SELECT * FROM productos2
/*Crea una tabla llamada "DetallesPedido" con las columnas pedido_id (entero) y producto_id (entero).*/
CREATE TABLE DetallesPedido(
  pedido_id INT, 
  producto_id INT
)
/*Inserta un detalle de pedido con pedido_id=1 y producto_id=1 en la tabla "DetallesPedido".
*/
INSERT INTO DetallesPedido (pedido_id,producto_id)
VALUES (1,1)
/*Actualiza el producto_id del detalle de pedido con pedido_id=1 a 2 en la tabla "DetallesPedido".*/
UPDATE DetallesPedido
SET pedido_id=2
WHERE pedido_id=1
/*Elimina el detalle de pedido con pedido_id=1 de la tabla "DetallesPedido".*/
DELETE FROM DetallesPedido
WHERE pedido_id=1
/*Lee todos los detalles de pedido de la tabla "DetallesPedido".*/
SELECT * FROM DetallesPedido
/*Realiza una consulta para obtener todos los clientes y sus pedidos correspondientes utilizando un inner join.*/
SELECT clientes.nombre, pedidos2.id
FROM clientes
INNER JOIN pedidos2 ON clientes.id = pedidos2.cliente_id2
/*Realiza una consulta para obtener todos los clientes y sus pedidos correspondientes utilizando un left join.*/
SELECT clientes.nombre
FROM clientes
LEFT JOIN pedidos2 
ON clientes.id = pedidos2.cliente_id2

/*Realiza una consulta para obtener todos los productos y los detalles de pedido correspondientes utilizando un inner join.*/
SELECT productos2.nombre, DetallesPedido.producto_id
FROM productos2
INNER JOIN DetallesPedido ON productos2.id = DetallesPedido.producto_id
/*Realiza una consulta para obtener todos los productos y los detalles de pedido correspondientes utilizando un left join.*/
SELECT productos2.nombre
FROM productos2
LEFT JOIN DetallesPedido 
ON productos2.id = DetallesPedido.producto_id
/*Crea una nueva columna llamada "telefono" de tipo cadena de texto en la tabla "Clientes".*/
ALTER TABLE Clientes
ADD telefono VARCHAR(255)
/*Modifica la columna "telefono" en la tabla "Clientes" para cambiar su tipo de datos a entero.*/
ALTER TABLE clientes
ALTER COLUMN telefono TYPE INT
/*Elimina la columna "telefono" de la tabla "Clientes".*/
ALTER TABLE clientes
DROP COLUMN telefono
/*Cambia el nombre de la tabla "Clientes" a "Usuarios".*/
ALTER TABLE clientes
RENAME TO Usuarios2

/*Cambia el nombre de la columna "nombre" en la tabla "Usuarios" a "nombre_completo".*/
ALTER TABLE Usuarios2
RENAME COLUMN nombre TO nombre_completo

/*Agrega una restricción de clave primaria a la columna "id" en la tabla "Usuarios".*/
ALTER TABLE Usuarios2
ADD CONSTRAINT pk_usuarios2 PRIMARY KEY (id)
