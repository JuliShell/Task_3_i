
SELECT first_name, last_name FROM actor
INNER JOIN film_actor USING (actor_id)
INNER JOIN film USING (film_id)
INNER JOIN inventory USING (film_id)
INNER JOIN rental USING (inventory_id)
GROUP BY actor_id
ORDER BY SUM(return_date - rental_date) DESC
LIMIT 10;


SELECT first_name, last_name FROM actor
INNER JOIN film_actor USING (actor_id)
INNER JOIN film USING (film_id)
INNER JOIN inventory USING (film_id)
INNER JOIN rental USING (inventory_id)
GROUP BY actor_id
ORDER BY COUNT(rental_id) DESC, SUM(return_date - rental_date) DESC
LIMIT 10;