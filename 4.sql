SELECT title from film
LEFT JOIN inventory USING (film_id)
WHERE inventory_id IS NULL;