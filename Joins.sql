SELECT (CONCAT (first_name, ' ', last_name)) as nombre_completo, 
	st.store_id AS id_tienda
FROM staff AS s
CROSS JOIN store AS st

SELECT (CONCAT (s.first_name, ' ', s.last_name)) as Empleado,
st.store_id AS id_tienda
FROM staff AS s 
INNER JOIN store AS st
ON s.staff_id = st.manager_staff_id

SELECT c.customer_id as id_cliente, (CONCAT (c.first_name, ' ', c.last_name)) as nombre_cliente,
	COUNT (r.inventory_id) as cantidad_alquileres
FROM customer AS c
LEFT JOIN rental as r 
ON c.customer_id = r.customer_id
GROUP BY c.customer_id -- siempre que hagamos una funcion agregatoria, GROUP BY 
ORDER BY cantidad_alquileres 

/* si es relacion MANY TO MANY, tabla intermedia*/
SELECT (CONCAT (first_name, ' ', last_name)) as nombre_actor, f.title AS titulo_pelicula
FROM film AS f 
INNER JOIN film_actor AS fa
ON f.film_id=fa.film_id
LEFT JOIN actor AS a 
ON a.actor_id=fa.actor_id
ORDER BY nombre_actor DESC, titulo_pelicula DESC

SELECT f.title AS titulo_pelicula, r.rental_date as fecha_alquiler
FROM film AS f
INNER JOIN inventory AS i 
ON f.film_id = i.film_id
FULL JOIN rental as r
ON i.inventory_id=r.inventory_id
ORDER BY titulo_pelicula


SELECT f.title as titulo_pelicula, f.length as duracion_pelicula, cat.name as categoria
FROM category as cat
INNER JOIN film_category as fc 
ON cat.category_id = fc.category_id
INNER JOIN film as f
ON fc.film_id = f.film_id
WHERE f.length > 120 AND cat.name = 'Animation'

	
SELECT cat.name AS nombre_categoria, 
	ROUND(AVG(f.length),0) as media_duracion
FROM category AS cat
INNER JOIN film_category AS fc
ON cat.category_id=fc.category_id
INNER JOIN film as f
ON fc.film_id=f.film_id
	GROUP BY cat.name
HAVING AVG(f.length)>110
ORDER BY media_duracion
