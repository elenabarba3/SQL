/*Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y "id_producto" (entero, clave foránea de la tabla "Productos").*/
CREATE TABLE pedidos (
    id INT PRIMARY KEY,
    id_usuarios INT,
    FOREIGN KEY (id_usuarios) REFERENCES usuarios(id),
	id_producto INT,
	FOREIGN KEY (id_producto) REFERENCES productos (id)
)
/*Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con productos.*/
INSERT INTO pedidos (id, id_usuarios, id_producto)
VALUES
(4, 1, 2),
(5, 2, 3),
(6, 3, 1)

/*Realiza una consulta que muestre los nombres de los usuarios y los nombres de los productos que han comprado, incluidos aquellos que no han realizado ningún pedido (utiliza LEFT JOIN y COALESCE).
*/

SELECT 
    usuarios.nombre AS usuario_nombre, 
    COALESCE(productos.nombre, 'Sin pedidos') AS producto_nombre
FROM 
    usuarios
LEFT JOIN 
    pedidos ON usuarios.id = pedidos.id_usuarios
LEFT JOIN 
    productos ON pedidos.id_producto = productos.id

/*Realiza una consulta que muestre los nombres de los usuarios que han realizado un pedido, pero también los que no han realizado ningún pedido (utiliza LEFT JOIN).*/
SELECT 
    usuarios.nombre  
FROM 
    usuarios
LEFT JOIN 
    pedidos ON usuarios.id = pedidos.id_usuarios

/*Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza los registros existentes con un valor (utiliza ALTER TABLE y UPDATE)*/

ALTER TABLE pedidos
ADD COLUMN cantidad INT
UPDATE pedidos
SET cantidad = 5
WHERE id = 1


