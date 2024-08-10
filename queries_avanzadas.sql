SELECT title AS titulo, length AS duracion
FROM film 
ORDER BY length -- ASC no necesario, es por defecto

SELECT customer_id AS id_cliente, (CONCAT (first_name, ' ', last_name)) as nombre_completo
FROM customer 
ORDER BY customer_id DESC
LIMIT 10

SELECT amount AS cantidad
FROM payment
ORDER BY payment_date DESC
OFFSET 2
LIMIT 1 -- para que quite dos y muestre SOLO el tercero. 

SELECT ROUND(AVG(rental_rate),2) AS precio_medio_pelicula
FROM film 
	
SELECT title AS titulo, rental_rate AS precio 
FROM film 
WHERE rental_rate > 2.98
ORDER BY rental_rate

SELECT COUNT (DISTINCT (title)) AS cantidad, rating AS clasificacion
	FROM film
GROUP BY rating 

SELECT rating AS clasificacion, ROUND(AVG("length"),0) AS media_duracion
FROM film 
		GROUP BY rating 
ORDER BY "media_duracion" 

SELECT COUNT (rental_id) AS alquileres,
DATE(rental_date) AS dia
FROM rental
GROUP BY dia 
ORDER BY alquileres DESC

SELECT COUNT(rental_id) AS alquileres,
	EXTRACT(MONTH FROM rental_date) AS mes_alquiler
FROM rental
GROUP BY mes_alquiler
ORDER BY mes_alquiler 


SELECT COUNT (DISTINCT(title)) as num_peliculas, rating AS categoria
FROM film 
WHERE release_year =2006
GROUP BY rating
ORDER BY num_peliculas
--HAVING es para filtrar por la agrupacion

SELECT actor_id, COUNT(DISTINCT(film_id)) AS num_peliculas
FROM film_actor
GROUP BY actor_id
	HAVING COUNT(DISTINCT(film_id))>40 -- HAVING Porque es sobre la agrupacion