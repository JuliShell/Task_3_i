SELECT
SUM(return_date - rental_date) AS rental_time_total,
category.name, city.city
FROM rental
	INNER JOIN customer
	ON rental.customer_id = customer.customer_id
	INNER JOIN address
	ON customer.address_id = address.address_id
	INNER JOIN city
	ON address.city_id = city.city_id
	INNER JOIN inventory
	USING (inventory_id)
	INNER JOIN film_category
	USING (film_id)
	INNER JOIN category
	USING (category_id)
WHERE city.city LIKE 'a%' AND return_date - rental_date IS NOT NULL
AND city.city LIKE '%-%' 
GROUP BY city.city, category.name
ORDER BY rental_time_total DESC
LIMIT 1;
