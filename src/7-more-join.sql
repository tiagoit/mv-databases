#1
SELECT id, title
  FROM movie
 WHERE yr=1962

#2
SELECT yr
  FROM movie
 WHERE title = 'Citizen Kane'

#3
SELECT id, title, yr
  FROM movie
 WHERE title LIKE '%Star Trek%'
ORDER BY yr

#4
SELECT id
  FROM actor
 WHERE name = 'Glenn Close'

#5
SELECT id
  FROM movie
 WHERE title = 'Casablanca'

#6
SELECT name
  FROM casting 
  JOIN actor ON (actor.id = actorid)
 WHERE movieid = 11768

#7
SELECT name
  FROM casting
  JOIN actor ON actor.id = actorid
  JOIN movie ON movie.id = movieid
 WHERE title = 'Alien'

#8
SELECT movie.title
  FROM movie
  JOIN casting ON movieid = movie.id
  JOIN actor ON actorid = actor.id
 WHERE actor.name = 'Harrison Ford'

#9
SELECT movie.title
  FROM movie
  JOIN casting ON movieid = movie.id
  JOIN actor ON actorid = actor.id
 WHERE actor.name = 'Harrison Ford'
   AND ord > 1

#10
SELECT movie.title, actor.name 
  FROM movie
  JOIN casting ON movieid = movie.id
  JOIN actor ON actorid = actor.id
 WHERE yr = 1962
   AND ord = 1

#11
SELECT yr, COUNT(title) 
  FROM movie 
  JOIN casting ON movie.id = movieid
  JOIN actor   ON actorid = actor.id
 WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

#12
SELECT movie.title, actor.name 
  FROM movie
  JOIN casting ON movieid = movie.id
  JOIN actor ON actorid = actor.id
 WHERE movie.id IN (
SELECT movie.id
  FROM movie
  JOIN casting ON movieid = movie.id
  JOIN actor ON actorid = actor.id
 WHERE actor.name = 'Julie Andrews')
   AND ord = 1

#13
SELECT actor.name
  FROM casting
  JOIN actor ON actor.id = actorid
 WHERE ord = 1
GROUP BY actor.name
HAVING COUNT(actorid) >= 30
ORDER BY actor.name

#14
SELECT m.title, COUNT(m.id)
  FROM movie m
  JOIN casting c ON c.movieid = m.id
 WHERE yr = 1978
GROUP BY m.title
ORDER BY COUNT(m.id) DESC, m.title

#15
SELECT a.name FROM actor a
  JOIN casting c ON c.actorid = a.id
  JOIN movie m ON m.id = c.movieid
 WHERE m.id IN (SELECT movieid FROM casting WHERE actorid = (SELECT id FROM actor WHERE name = 'Art Garfunkel'))
   AND a.name != 'Art Garfunkel'
