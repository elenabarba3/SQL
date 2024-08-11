SELECT CONCAT (actor.first_name, ' ', actor.last_name) as nombre_actor
FROM actor 
WHERE actor.actor_id NOT IN (
	SELECT film_actor.actor_id
	FROM film_actor 
);



SELECT f.title as titulo_pelicula, f.rental_rate as precio_medio_alquiler
FROM film as f
WHERE rental_rate >(
	SELECT ROUND(AVG(f.rental_rate),2) as precio_medio_alquiler -- subconsulta
		FROM film as f
	
);


SELECT CONCAT (c.first_name,' ', c.last_name) as nombre_cliente
FROM customer AS "c"
WHERE c.customer_id IN (
	SELECT r.customer_id
	FROM rental as r
	GROUP BY r.customer_id
	HAVING COUNT(DISTINCT r.inventory_id)>7);
ORDER BY c.last_name;

SELECT f.title as titulo_pelicula
FROM film as f
WHERE f.film_id IN (
	SELECT fc.film_id
	FROM film_category as fc
	WHERE fc.category_id IN (
		SELECT c.category_id
		FROM category as "c"
		WHERE c.name = 'Animation'
	)
);


SELECT f.title as titulo_pelicula, f.film_id
FROM film as f
WHERE f.film_id IN (
	SELECT i.film_id
	FROM inventory as i
	WHERE i.inventory_id IN (
		SELECT r.inventory_id
		FROM rental as r 
		WHERE DATE_PART('day', r.return_date-r.rental_date)>8 -- funcion DATE_PART hace operaciones con fechas, PRIMERO por donde,nos devuelve TRUE false
	)
)
ORDER BY f.film_id;


SELECT f.title as titulo_pelicula, f.film_id
FROM film as f
WHERE f.film_id IN (
	SELECT i.film_id
	FROM inventory as i
	WHERE i.inventory_id IN (
		SELECT r.inventory_id
		FROM rental as r
		WHERE r.customer_id IN(
			SELECT c.customer_id
			FROM customer as "c"
			WHERE c.first_name = 'TAMMY' AND c.last_name = 'SANDERS')
		AND r.return_date IS NULL -- que no se haya devuelto, y pertenece a rental
	))
ORDER BY titulo_pelicula;


SELECT CONCAT (a.first_name, ' ', a.last_name) as nombre_actores
FROM actor as a
WHERE a.actor_id IN (
	SELECT fa.actor_id 
	FROM film_actor as fa
	WHERE fa.film_id IN (
		SELECT fc.film_id
		FROM film_category as fc
		WHERE fc.category_id IN(
			SELECT c.category_id
			FROM category as "c"
			WHERE c.name = 'Sci-Fi'
			
		)
	)
)
ORDER BY a.last_name;


SELECT c.name as categoria, 
	COUNT(fc.film_id) as recuento
FROM category as "c"
INNER JOIN film_category as fc
ON c.category_id = fc.category_id
WHERE fc.film_id IN (
	SELECT i.film_id
	FROM inventory as i
	WHERE i.inventory_id IN (
		SELECT r.inventory_id 
		FROM rental as r
	)
)
GROUP BY c.name;


SELECT CONCAT (a.first_name, ' ', a.last_name) as nombre_actores
FROM actor as a
WHERE actor_id IN (
	SELECT fa.actor_id
	FROM film_actor as fa
	WHERE fa.film_id IN(
		SELECT i.film_id 
		FROM inventory as i 
		WHERE i.inventory_id IN(
			SELECT r.inventory_id
			FROM rental as r
			WHERE r.inventory_id IN(
				SELECT i.inventory_id
				FROM inventory as i 
				WHERE i.film_id IN(
					SELECT f.film_id
					FROM film as f
					WHERE f.title = 'SPARTACUS CHEAPER'))
			ORDER BY r.rental_date
			LIMIT 1
	)))
ORDER BY a.last_name;