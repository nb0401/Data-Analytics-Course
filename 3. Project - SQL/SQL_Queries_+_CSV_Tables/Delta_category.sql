-- This query collects the top 100 and bot 100 movie categories sorted by their earnings and subtracts them from each other to get the delta of how many movies are
-- in the delta based on their category. In short, it shows the most successful category based on how many movies of these categories are in the top 100 and bot 100.

WITH Recursive top100count (category, total_earning) AS -- This CTE will create a list with the top 100 movies and their total earnings, but takes only the category from the movie. Therefore there's a list of the top 100 movies with each movie's category and it's total earnings
		(SELECT	
				C.name AS category,
				SUM(F.amount) AS total_earning		

		FROM film A

		INNER JOIN film_category B ON A.film_id = B.film_id
		INNER JOIN category C ON B.category_id = C.category_id
		INNER JOIN inventory D ON A.film_id = D.film_id
		INNER JOIN rental E ON D.inventory_id = E.inventory_id
		INNER JOIN payment F ON E.rental_id = F.rental_id

		GROUP BY 	A.film_id, category

		ORDER BY total_earning DESC

		LIMIT 100),
		
		top100select (selecttop100category, sumtop100_earning, counttop100) AS -- This CTE takes the previous created list, counts every category and the sums up the total earning of each category and creates a new list, with each category, its count and its total earnings.
		
		(SELECT top100count.category AS selecttop100category,
				SUM(top100count.total_earning) AS sumtop100_earning,
				COUNT(top100count.category) AS counttop100
		FROM top100count

		GROUP BY selecttop100category

		ORDER BY sumtop100_earning DESC),
		
		bot100count (category, total_earning) AS -- This CTE will create a list with the bot 100 movies and their total earnings, but takes only the category from the movie. Therefore there's a list of the bot 100 movies with each movie's category and it's total earnings
		
		(SELECT	
				C.name AS category,
				SUM(F.amount) AS total_earning		

		FROM film A

		INNER JOIN film_category B ON A.film_id = B.film_id
		INNER JOIN category C ON B.category_id = C.category_id
		INNER JOIN inventory D ON A.film_id = D.film_id
		INNER JOIN rental E ON D.inventory_id = E.inventory_id
		INNER JOIN payment F ON E.rental_id = F.rental_id

		GROUP BY 	A.film_id, category

		ORDER BY total_earning ASC

		LIMIT 100),
		
		bot100select (selectbot100category, sumbot100_earning, countbot100) AS -- This CTE takes the previous created list, counts every category and the sums up the total earning of each category and creates a new list, with each category, its count and its total earnings.
		
		(SELECT 	bot100count.category AS selectbot100category,
					SUM(bot100count.total_earning) AS sumbot100_earning,
					COUNT(bot100count.category) AS countbot100
		FROM bot100count

		GROUP BY selectbot100category

		ORDER BY sumbot100_earning ASC),
		
		delta_cte (delta_category, delta_top100, delta_bot100) AS -- This final CTE then lists every category and it's count of the top 100 and the bot 100 list

		(SELECT top100select.selecttop100category AS delta_category,
				top100select.counttop100 AS delta_top100,
				bot100select.countbot100 AS delta_bot100
		FROM top100select

		FULL JOIN bot100select ON top100select.selecttop100category = bot100select.selectbot100category

		GROUP BY delta_category, delta_top100, delta_bot100)
		
		
SELECT 	delta_cte.delta_category, -- This query subtracts the bot 100 category count from the top 100 category count and creates a list with the categories and the count subtraction
		SUM(delta_cte.delta_top100-delta_cte.delta_bot100) AS resulting
FROM delta_cte

GROUP BY delta_cte.delta_category

ORDER BY resulting DESC





		

		







