--A

SELECT a.name,ROUND(AVG((a.rating + p.rating)/2),2) AS total_rating, MAX(a.price) AS price,
MAX(p.review_count) AS play_store_reviews, MAX(a.review_count) AS app_store_reviews,
p.genres,a.primary_genre
FROM app_store_apps AS a 
INNER JOIN play_store_apps AS p
ON a.name = p.name
WHERE p.review_count >= 444153 AND CAST(a.review_count AS int) >= 12892
GROUP BY a.name,p.genres,a.primary_genre
ORDER BY total_rating DESC
LIMIT 10;


--B
-- BRENNAN
SELECT a.name,ROUND(AVG(a.rating + p.rating)/2,2) AS total_rating,
ROUND((FLOOR(AVG(a.rating + p.rating)/2/.25)*.25),2) AS rounded_total_rating,
MAX(a.price) AS price,
MAX(p.review_count) AS play_store_reviews, 
MAX(a.review_count) AS app_store_reviews,
p.genres,a.primary_genre,MAX(a.price) + 25000 AS price_to_buy_app,
ROUND((((ROUND((FLOOR(AVG(a.rating + p.rating)/2/.25)*.25),2) *24)+12)),2) AS longevity_in_months,
ROUND((((ROUND((FLOOR(AVG(a.rating + p.rating)/2/.25)*.25),2) *24)+12)/12),2) AS longevity_in_years,
ROUND((((ROUND((FLOOR(AVG(a.rating + p.rating)/2/.25)*.25),2) *24)+12)*5000),2) AS money_made_from_app,
ROUND((((ROUND((FLOOR(AVG(a.rating + p.rating)/2/.25)*.25),2) *24)+12)*1000),2) AS app_maintenance,
(ROUND((((ROUND((FLOOR(AVG(a.rating + p.rating)/2/.25)*.25),2) *24)+12)*5000),2)-ROUND((((ROUND((FLOOR(AVG(a.rating + p.rating)/2/.25)*.25),2) *24)+12)*1000)+25000,2)) AS profit 
FROM app_store_apps AS a 
INNER JOIN play_store_apps AS p
ON a.name = p.name
WHERE p.review_count >= 444153 AND CAST(a.review_count AS int) >= 12892
GROUP BY a.name,p.genres,a.primary_genre
ORDER BY total_rating DESC
LIMIT 10




