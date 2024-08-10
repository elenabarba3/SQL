/*Crea una base de datos llamada "MiBaseDeDatos".
Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "edad" (entero).*/
CREATE TABLE usuarios(
id INT PRIMARY KEY,
nombre VARCHAR(255),
EDAD INT
	)
/*Inserta dos registros en la tabla "Usuarios".*/
INSERT INTO usuarios (id, nombre, EDAD)
VALUES (1, 'Felipe', 28)
INSERT INTO usuarios (id, nombre, EDAD)
VALUES (2, 'Manuel', 37)
/*Actualiza la edad de un usuario en la tabla "Usuarios".*/
UPDATE public.usuarios
SET edad =30
WHERE id=1
/*Elimina un usuario de la tabla "Usuarios".*/
DELETE FROM public.usuarios
WHERE id=2


/*Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "pais" (texto).
*/
CREATE TABLE ciudades (
id INT PRIMARY KEY,
nombre VARCHAR(255),
pais VARCHAR (255)
)
/*Inserta al menos tres registros en la tabla "Ciudades".*/
INSERT INTO ciudades (id, nombre, pais)
VALUES (1, 'sydney', 'australia')
INSERT INTO ciudades (id, nombre, pais)
VALUES (2, 'amsterdam', 'holanda')
INSERT INTO ciudades (id, nombre, pais)
VALUES (3, 'california', 'usa')
/*Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id" de la tabla "Ciudades".*/
ALTER TABLE usuarios
ADD CONSTRAINT fk_usuarios_id
FOREIGN KEY (id) REFERENCES ciudades(id)
/*Realiza una consulta que muestre los nombres de los usuarios junto con el nombre de su ciudad y país (utiliza un LEFT JOIN).*/
SELECT usuarios.nombre
FROM usuarios
LEFT JOIN ciudades 
ON usuarios.id=ciudades.id
/*
Realiza una consulta que muestre solo los usuarios que tienen una ciudad asociada (utiliza un INNER JOIN).*/
SELECT usuarios.nombre, ciudades.nombre
FROM usuarios
INNER JOIN ciudades ON usuarios.id = ciudades.id