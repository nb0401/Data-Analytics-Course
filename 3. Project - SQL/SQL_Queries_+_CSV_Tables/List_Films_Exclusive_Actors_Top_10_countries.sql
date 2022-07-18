-- This query shows a list of the most successful movies within specified countries. It shows additional information, but is sorted by its earnings.

SELECT	M.country AS rental_country,
		A.title,
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
INNER JOIN customer J ON H.customer_id = J.customer_id
INNER JOIN address K ON J.address_id = K.address_id
INNER JOIN city L ON K.city_id = L.city_id
INNER JOIN country M ON L.country_id = M.country_id

WHERE M.country IN ('India', 'China', 'United States', 'Japan', 'Mexico', 'Brazil', 
					'Russian Federation', 'Philippines', 'Turkey', 'Indonesia')

GROUP BY 	rental_country, A.title, film_language, category, /*first_name, last_name,*/ length, rating, 
			rental_rate, replacement_cost

ORDER BY total_earning DESC