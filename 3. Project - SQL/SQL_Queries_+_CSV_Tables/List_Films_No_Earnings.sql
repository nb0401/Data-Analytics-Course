-- This query simply collects a list of movie which had no (null) earnings at all.

SELECT	DISTINCT A.title,
		SUM(D.amount) AS money
FROM film A

FULL JOIN inventory B ON A.film_id = B.film_id
FULL JOIN rental C ON B.inventory_id = C.inventory_id
FULL JOIN payment D ON C.rental_id = D.rental_id

GROUP BY A.title

HAVING SUM(D.amount) IS NULL

ORDER BY money
