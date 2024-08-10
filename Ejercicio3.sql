/*Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "precio" (numérico).*/
CREATE TABLE productos (
    id INT PRIMARY KEY,
    nombre VARCHAR(255),
    precio DECIMAL
)
/*Inserta al menos cinco registros en la tabla "Productos".*/
INSERT INTO productos (id, nombre, precio)
VALUES (1, 'ruedas', 57)
INSERT INTO productos (id, nombre, precio)
VALUES (2, 'casco', 28)
INSERT INTO productos (id, nombre, precio)
VALUES (3, 'frenos', 95)
INSERT INTO productos (id, nombre, precio)
VALUES (4, 'agua', 2)
INSERT INTO productos (id, nombre, precio)
VALUES (5, 'barritas proteicas', 13)
/*Actualiza el precio de un producto en la tabla "Productos"*/
UPDATE productos
SET precio = 4 
WHERE id=4
/*Elimina un producto de la tabla "Productos"*/
DELETE FROM productos 
WHERE id=5
/* Realiza una consulta que muestre los nombres de los usuarios junto con los nombres de los productos que han comprado (utiliza un INNER JOIN con la tabla "Productos").*/
SELECT usuarios.nombre, productos.nombre
FROM usuarios
INNER JOIN productos ON usuarios.id = productos.id
