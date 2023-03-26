SELECT city.city, SUM(cs.active) AS active, 
(COUNT(cs.active) - SUM(active)) AS non_active
 FROM customer cs
INNER JOIN address ad
ON cs.address_id = ad.address_id
INNER JOIN city
ON ad.city_id = city.city_id
GROUP BY city.city
ORDER BY 2, 1;