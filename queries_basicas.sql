SELECT DISTINCT (title) AS titulo 
FROM film;

SELECT DISTINCT (CONCAT (first_name, ' ', last_name)) as nombre_completo FROM actor 

SELECT title as titulo, rating AS clasificacion 
	FROM film WHERE rating = 'R'

SELECT title AS titulo FROM film WHERE language_id=original_language_id

SELECT CONCAT (first_name, ' ', last_name) AS nombre_completo
FROM actor 
WHERE last_name = 'ALLEN'

SELECT title AS titulo, length AS duracion
FROM film 
WHERE length >180

SELECT CONCAT (first_name, ' ', last_name) AS nombre_completo, actor_id
FROM actor
WHERE actor_id BETWEEN 30 AND 40

SELECT title AS titulo, rating AS clasificacion
FROM film 
WHERE NOT rating = 'NC-17' AND NOT rating = 'G'
-- TAMBIEN USAR ESTA OTRA OPCION: 
SELECT title AS titulo, rating AS clasificacion
FROM film 
WHERE rating <> 'NC-17' AND rating <> 'G'

SELECT title AS titulo, rating AS clasificacion, length AS duracion
FROM film 
WHERE rating = 'PG-13' OR length > 180

 
SELECT MAX ("length") AS mayor_duracion, MIN ("length") AS menor_duracion
FROM film 

SELECT (COUNT (film_id)) as recuento_peliculas
FROM film 

SELECT SUM (amount) as cantidad_total
FROM payment 

SELECT ROUND (AVG (rental_duration),2) as tiempo_medio_alquiler
FROM film

SELECT ROUND(STDDEV_SAMP (replacement_cost),2)
FROM film 
