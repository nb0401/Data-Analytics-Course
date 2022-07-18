-- This Code counts every film based on its rating

SELECT	COUNT(rating) FILTER(WHERE rating = 'PG-13') AS rating_pg13,
		COUNT(rating) FILTER(WHERE rating = 'R') AS rating_r,
		COUNT(rating) FILTER(WHERE rating = 'NC-17') AS rating_nc17,
		COUNT(rating) FILTER(WHERE rating = 'G') AS rating_g,
		COUNT(rating) FILTER(WHERE rating = 'PG') AS rating_pg
		
FROM film