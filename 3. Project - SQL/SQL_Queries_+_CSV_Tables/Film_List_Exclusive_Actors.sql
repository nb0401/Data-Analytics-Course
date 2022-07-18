-- This query collects a list of all movies with additional data based/sorted on their earnings.

SELECT	A.title,
		B.name AS film_language,
		D.name AS category,
--		F.first_name,
--		F.last_name,
		A.length,
		A.rating,
		A.rental_rate,
		A.replacement_cost,
		SUM(I.amount) AS total_earning		

FROM film A

INNER JOIN language B ON A.language_id = B.language_id
INNER JOIN film_category C ON A.film_id = C.film_id
INNER JOIN category D ON C.category_id = D.category_id
--INNER JOIN film_actor E ON A.film_id = E.film_id
--INNER JOIN actor F ON E.actor_id = F.actor_id
INNER JOIN inventory G ON A.film_id = G.film_id
INNER JOIN rental H ON G.inventory_id = H.inventory_id
INNER JOIN payment I ON H.rental_id = I.rental_id

GROUP BY 	A.title, film_language, category, /*first_name, last_name,*/ length, rating, rental_rate,
			replacement_cost

ORDER BY total_earning DESC