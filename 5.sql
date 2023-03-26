SELECT COUNT(fa.actor_id) AS max_times, first_name, last_name FROM film_category fc
INNER JOIN category ct
ON fc.category_id = ct.category_id
INNER JOIN film_actor fa
ON fc.film_id = fa.film_id
INNER JOIN actor
ON fa.actor_id = actor.actor_id
GROUP BY fa.actor_id, first_name, last_name, ct.name 
HAVING ct.name = 'Children'
ORDER BY 1 DESC
LIMIT 19;


SELECT COUNT(fa.actor_id) AS max_times, first_name, last_name FROM film_category fc
INNER JOIN category ct
ON fc.category_id = ct.category_id
INNER JOIN film_actor fa
ON fc.film_id = fa.film_id
INNER JOIN actor
ON fa.actor_id = actor.actor_id
GROUP BY fa.actor_id, first_name, last_name, ct.name 
HAVING ct.name = 'Children'
AND COUNT(fa.actor_id) IN (
	SELECT MAX(max_times) FROM (
		SELECT COUNT(fa.actor_id) AS max_times, first_name, last_name FROM film_category fc
		INNER JOIN category ct
		ON fc.category_id = ct.category_id
		INNER JOIN film_actor fa
		ON fc.film_id = fa.film_id
		INNER JOIN actor
		ON fa.actor_id = actor.actor_id
		GROUP BY fa.actor_id, first_name, last_name, ct.name 
		HAVING ct.name = 'Children') new_table
	)
ORDER BY 1 DESC;