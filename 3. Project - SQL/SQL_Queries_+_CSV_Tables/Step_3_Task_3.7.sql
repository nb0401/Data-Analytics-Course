--This query shows the 5 best customers based on their total amount paid of a specified list of cities.

SELECT	SUM(amount) AS total_amount_paid,
		B.first_name,
		B.last_name,
		B.customer_id,
		D.city,
		E.country
FROM payment A

INNER JOIN customer B ON A.customer_id = B.customer_id
INNER JOIN address C ON B.address_id = C.address_id
INNER JOIN city D ON C.city_id = D.city_id
INNER JOIN country E ON D.country_id = E.country_id

WHERE D.city IN ('Aurora', 'Atlixco', 'Xintai', 'Adoni', 'Dhula (Dhulia)', 'Kurashiki',
				'Pingxiang', 'Sivas', 'Celaya', 'So Leopoldo')
				
GROUP BY B.customer_id, B.first_name, B.last_name, D.city, E.country

ORDER BY total_amount_paid DESC

LIMIT 5