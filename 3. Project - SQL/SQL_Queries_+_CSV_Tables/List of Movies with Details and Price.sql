-- This query collects all movies with their rental_rate, rental_duration, number_of_rentals, the total amount of times the movie was rented to compare the calculated overall rent the movie should've brought together with the overall rent the movie did bring together.

SELECT	A.title,
		A.rental_rate,
		A.rental_duration,
		COUNT(D.payment_id) AS number_of_rentals,
		SUM(D.amount) AS total_amount_movie,
		(COUNT(D.payment_id)*(A.rental_rate)) AS actual_rent,
		(SUM(D.amount)/COUNT(D.payment_id)) AS rental_price
		

FROM film A

FULL JOIN inventory B ON A.film_id = B.film_id
FULL JOIN rental C ON B.inventory_id = C.inventory_id
FULL JOIN payment D ON C.rental_id = D.rental_id

GROUP BY A.title, A.rental_rate, A.rental_duration

--ORDER BY total_amount_movie DESC

--ORDER BY actual_rent DESC

ORDER BY rental_price DESC