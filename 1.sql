SELECT COUNT(film_id) AS Количество, ct.name AS Категория
FROM film_category AS fct
INNER JOIN category AS ct
ON fct.category_id = ct.category_id
GROUP BY ct.name
ORDER BY count(film_id) DESC;


