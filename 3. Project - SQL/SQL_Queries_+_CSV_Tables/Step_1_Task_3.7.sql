--This query shows a list of countries, with their amount of customers, their total_payments and their pay per customer rate.
--Please note, that in an earlier version there was a limit as to how much customers the country should have. This limit is deactivated.
--Furthermore, I also ranked the table by pay per customer as well, but this is also disabled now.

SELECT	D.country,
		COUNT(DISTINCT A.customer_id) AS amount_customers,
		SUM(E.amount) AS total_payment,
		(SUM(E.amount)/COUNT(DISTINCT A.customer_id)) AS pay_per_customer
FROM customer A

INNER JOIN address B ON A.address_id = B.address_id
INNER JOIN city C ON B.city_id = C.city_id
INNER JOIN country D ON C.country_id = D.country_id
INNER JOIN payment E ON A.customer_id = E.customer_id

GROUP BY D.country

--HAVING COUNT(DISTINCT A.customer_id)>=10
--HAVING COUNT(DISTINCT A.customer_id)>10

ORDER BY amount_customers DESC
--ORDER BY pay_per_customer DESC