--This query collects a list of cities in countries and their amount of customers. It is limited to 10 and ordered by the amount of customers.
--Furthermore, the countries are specified.

SELECT	COUNT(customer_id) AS amount_customers,
		D.country,
		C.city
FROM customer A

INNER JOIN address B ON A.address_id = B.address_id
INNER JOIN city C ON B.city_id = C.city_id
INNER JOIN country D ON C.country_id = D.country_id

WHERE D.country IN ('India', 'China', 'United States', 'Japan', 'Mexico', 'Brazil',
				   'Russian Federation', 'Philippines', 'Turkey', 'Indonesia')
				   
GROUP BY C.city, D.country

ORDER BY amount_customers DESC

LIMIT 10