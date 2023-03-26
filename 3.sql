SELECT ct.name AS category FROM payment pm
INNER JOIN rental r
ON pm.rental_id = r.rental_id
INNER JOIN inventory i
ON r.inventory_id = i.inventory_id
INNER JOIN film_category fc
ON i.film_id = fc.film_id
INNER JOIN category ct
ON fc.category_id = ct.category_id
GROUP BY ct.name
ORDER BY SUM(pm.amount) DESC
LIMIT 1;
 

SELECT ct.name AS category FROM payment pm
INNER JOIN rental r
ON pm.rental_id = r.rental_id
INNER JOIN inventory i
ON r.inventory_id = i.inventory_id
INNER JOIN film_category fc
ON i.film_id = fc.film_id
INNER JOIN category ct
ON fc.category_id = ct.category_id
GROUP BY ct.name
HAVING SUM(pm.amount) = (
	SELECT MAX(total_amount) FROM 
		(
		SELECT SUM(pm.amount) AS total_amount FROM payment pm
		INNER JOIN rental r
		ON pm.rental_id = r.rental_id
		INNER JOIN inventory i
		ON r.inventory_id = i.inventory_id
		INNER JOIN film_category fc
		ON i.film_id = fc.film_id
		INNER JOIN category ct
		ON fc.category_id = ct.category_id
		GROUP BY ct.name) query_in
	);