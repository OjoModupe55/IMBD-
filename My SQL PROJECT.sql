SELECT *
FROM imdb;

--The lister_item_header with the highest rating

SELECT TOP 1 lister_item_header, rating
FROM imdb
ORDER BY rating DESC;

 -- Retrieve lister_item_header with a runtime of less than or equal to  60 minutes
 SELECT * 
 FROM imdb
 WHERE runtime <= '60 min';

--The total number of votes for each genre 

SELECT genre, SUM(votes) AS total_votes
FROM imdb
GROUP BY genre
ORDER BY total_votes DESC;

--The lister_item_order with ratings above 7.5 and votes above 70000 

SELECT lister_item_header, rating, votes
FROM imdb
WHERE rating >= 7.5 AND votes > 70000
ORDER BY rating DESC;

--The lister_item_order with Sci-Fi genre and their ratings 

SELECT lister_item_header, rating,genre
FROM imdb
where genre LIKE '%Sci-Fi%';

--Retrieve lister_item_order and genre for certificate below 15 

SELECT lister_item_header, genre, certificate
FROM imdb
WHERE certificate <'15';

--In relation to runtime, which movie has the highest rating

SELECT MAX(runtime) AS Highestruntime  
FROM imdb;

SELECT TOP 1 lister_item_header, runtime, rating
FROM imdb
WHERE runtime = (SELECT MAX(runtime) 
				FROM imdb)
ORDER BY rating DESC;

--The genre of lister_item_order with the highest votes

SELECT MAX(votes) AS HighestVotes 
FROM imdb;

SELECT TOP 1 lister_item_header,Genre, votes
FROM imdb
WHERE votes = (SELECT MAX(votes) AS HighestVotes 
				FROM imdb)
ORDER BY genre;

--What genre of lister_item_header has rating higher than average rating

SELECT AVG(rating) AS AVG_RATING
FROM imdb;

SELECT lister_item_header, genre, AVG(rating) AS AVG_RATING
FROM imdb
WHERE rating > (SELECT AVG(rating) AS AVG_RATING
				FROM imdb)
GROUP BY lister_item_header, genre;









