--This query simply collect some basic statistical information about specific columns (min, max, avg, mode)

SELECT	MIN(customer_id) AS min_customer_id,
		MAX(customer_id) AS max_customer_id,
		AVG(customer_id) AS avg_customer_id,
		MIN(store_id) AS min_store_id,
		MAX(store_id) AS max_store_id,
		AVG(store_id) AS avg_store_id,
		MODE() WITHIN GROUP (ORDER BY first_name) AS mode_first_name,
		MODE() WITHIN GROUP (ORDER BY last_name) AS mode_last_name,
		MODE() WITHIN GROUP (ORDER BY email) AS mode_email,
		MIN(address_id) AS min_address_id,
		MAX(address_id) AS max_address_id,
		AVG(address_id) AS avg_address_id,
		MODE() WITHIN GROUP (ORDER BY activebool) AS mode_activebool,
		MODE() WITHIN GROUP (ORDER BY create_date) AS mode_create_date,
		MODE() WITHIN GROUP (ORDER BY last_update) AS mode_last_update,
		MODE() WITHIN GROUP (ORDER BY active) AS mode_active
FROM customer