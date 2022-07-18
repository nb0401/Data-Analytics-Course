-- This query collects every customer by its names, total payments, city and country sorted by total amount paid

SELECT	A.first_name,
		A.last_name,
		SUM(B.amount) AS total_payment,
		D.city,
		E.country
FROM customer A

INNER JOIN payment B ON B.customer_id = A.customer_id
INNER JOIN address C ON A.address_id = C.address_id
INNER JOIN city D ON C.city_id = D.city_id
INNER JOIN country E ON D.country_id = E.country_id

GROUP BY A.first_name, A.last_name, D.city, E.country

ORDER BY total_payment DESC
