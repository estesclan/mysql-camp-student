-- List the names of movies made in the 1990's.  Order the results by the movie name.
SELECT title, year
from movie
ORDER BY title;

-- Count the movies by genre.  Include the columns in the result:  `Genre` and `Movie Count`.
SELECT genre, COUNT(*)
from movie
GROUP BY genre;

-- List the movies by rating from highest to lowest.
SELECT title, rottenTomatoes as ratings
from movie
ORDER BY ratings desc;

-- What is the average amount made by genre?
SELECT genre, avg(boxOffice)
FROM movie
GROUP BY genre;

-- Count the movies by director.  Include the director name and the movie count in the result.
SELECT director.name, count(movie.ID)
from movie join director
ON movie.directorID = director.ID
GROUP BY director.name;

-- Count the number of actors for each movie.  Include the movie name and the actor count in the result.
SELECT movie.title as 'movie name', count(role.actorID)as'actor count'
FROM role JOIN movie
ON role.movieID = movie.ID
GROUP BY movie.title
ORDER BY movie.title;

-- Which comedy made the least money?  Hint:  `LIMIT` clause.
SELECT title, boxOffice as'lowestGrossAmmount'
FROM movie 
WHERE genre = 'Comedy' 
GROUP BY title
ORDER BY boxOffice
LIMIT 1;

-- JOIN 3 TABLES!!
--  List the actors in The Shining.  Include the actor name and role name in the result.
SELECT concat(actor.firstName, " ", actor.lastName)as ActorName , roleName
FROM actor Join role
ON actor.ID = role.actorID
JOIN movie ON role.movieID = movie.ID
Where movie.title = 'The Shining';

-- List all the actors that starred in movies before 1990.  
-- Include the actor names, movie name, movie year, and role in the result.
SELECT concat_ws(" ", actor.firstName, actor.lastName)as ActorName, movie.title, movie.year, role.roleName
FROM actor JOIN role
ON actor.ID = role.actorID
JOIN movie ON role.movieID = movie.ID
WHERE year < 1990;

--  List the movie name, year and director for each drama made after 1980.
SELECT movie.title, movie.year, director.name
FROM movie JOIN director
ON director.ID = movie.directorID
WHERE movie.genre = 'Drama'
HAVING movie.year > 1980

-- What is the average rotten tomato's score by genre?
SELECT genre, avg(rottenTomatoes)
FROM movie
GROUP BY genre;

-- Oldest Movies
select title, YEAR(current_date()) - year as MovieAge
from movie
ORDER BY MovieAge desc;

-- List movies, actors, and directors for movies that are between 10 and 20 years old.
SELECT movie.title, concat_ws(" ", actor.firstName, actor.lastName)as ActorName, director.name as Director,
year(now()) - movie.year as MovieAge
FROM movie JOIN director
ON director.ID = movie.directorID
JOIN role
ON role.movieID = movie.ID
JOIN actor
ON role.actorID = actor.ID
WHERE year(now()) - movie.year BETWEEN 10 and 20
ORDER BY MovieAge desc;







