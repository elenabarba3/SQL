/*  Ejercicio Práctico SQL
Tutorial de diseño y operación sobre una base de datos SQL
En este ejercicio práctico se pretende que el alumno aplique el conocimiento derivado de los microlearnings correspondientes al módulo de Prework de SQL, así como de los ejercicios prácticos. Diseñaremos una base de datos SQL en base a unos requisitos específicados por un determinado cliente, el cuál nos facilitará la información que desea almacenar en su nueva base de datos y que datos querría conultar.
Enunciado Práctico:
Un cliente del ámbito educacional quiere que se le diseñe un sistema para llevar un control de los alumnos que están matriculados en sus cursos de formación. Al cliente le preocupa poder llevar una buena trazabilidad de sus alumnos en cada lección, así como que los mismos no pierdan el hilo del curso y avancen en las lecciones, con el fin de que mejore el porcentaje de satisfacción de sus alumnos.
Concretamente, el cliente tiene unas deadlines o hitos para cada alumno respecto a como debería ser su progreso en función del número de semanas que el alumno lleve matriculado.
Por ello, el cliente quiere almacenar en su base de datos el nombre y apellidos de los alumnos, así como los cursos en los que están inscritos. Respecto a los cursos, necesita almacenar el nombre del curso, las semanas que dura y la fecha en la que comenzó.
Respecto a las inscripciones, se necesita saber qué alumno se matriculó en que curso y en qué fecha comenzó. Por último, el cliente quiere llevar un control de la cantidad de participaciones que sus alumnos realizan tanto a través de los medios comunitarios (foro, github), como en sus clases, así como las fechas en las que los alumnos han intervenido.
1

 Restricciones:
1. El esquema de base de datos resultante debe tener 4 tablas, con identificadores únicos y las referencias entre sí mismas.
2. La base de datos debe ser modificable y adjuntar consultas que permitan la alteración de las columnas por cada tabla.
3. La tabla participaciones debe tener un valor de datos acotado, es decir, debe ser un valor de cadena de caracteres dentro de las opciones mencionadas en el enunciado.
4. Se poblará la base de datos inicialmente con dos juegos de valores por tabla, para demostrar su funcionalidad.
5. Se requiere que se adjunten 5 consultas tipo SELECT en las que se pueda demostrar que los datos cumplen con las restricciones anteriores y el esquema. Es decir, que se vean todas las tablas, sus datos y las relaciones entre las mismas.*/

CREATE TABLE alumnos (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR (255),
	apellido VARCHAR (255)
);
CREATE TABLE cursos (
	id SERIAL PRIMARY KEY,
	nombre_curso VARCHAR (255),
	duracion_semanas INT,
	fecha_inicio DATE
);
CREATE TABLE inscripciones (
	id SERIAL PRIMARY KEY,
	id_alumno INT REFERENCES alumnos (id),
	id_curso INT REFERENCES cursos (id),
);
CREATE TABLE participaciones (
	id SERIAL PRIMARY KEY,
	id_alumno INT REFERENCES alumnos (id),
	id_curso INT REFERENCES cursos (id),
	tipo VARCHAR (10) CHECK (tipo IN('foro','clase','tareas')),
	fecha DATE
);

ALTER TABLE inscripciones
ADD COLUMN fecha DATE;

INSERT INTO alumnos (nombre, apellido) VALUES 
('Juan', 'Perez'),
('Maria', 'Gonzalez');
INSERT INTO cursos (nombre_curso, duracion_semanas, fecha_inicio) VALUES 
('Pyhton', 12, '2023-01-15'),
('SQL', 8, '2023-02-01');
INSERT INTO inscripciones (id_alumno, id_curso, fecha) VALUES 
(9,7,'2023-01-20'),
(10,8, '2023-01-22');
INSERT INTO participaciones (id_alumno, id_curso, tipo, fecha) VALUES 
(9,7,'foro', '2023-01-21'),
(10,8,'clase','2023-01-25');

SELECT alumnos.nombre, alumnos.apellido, inscripciones.fecha AS fecha_inscripcion, participaciones.fecha AS fecha_participacion, participaciones.tipo, cursos.nombre_curso
FROM alumnos 
INNER JOIN inscripciones ON alumnos.id = inscripciones.id_alumno
INNER JOIN participaciones ON alumnos.id = participaciones.id_alumno
INNER JOIN cursos ON cursos.id = participaciones.id_curso
WHERE alumnos.nombre = 'Juan' AND alumnos.apellido = 'Perez'