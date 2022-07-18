-- This query is for controlling/comparing the paymend_date column with the last_update columns from the rental, customer and store tables

SELECT	A.payment_date,
		B.last_update,
		C.last_update, 
		D.last_update
FROM payment A

INNER JOIN rental B ON B.rental_id = A.rental_id
INNER JOIN customer C ON B.customer_id = C.customer_id
INNER JOIN store D ON C.store_id = D.store_id

ORDER BY A.payment_date DESC