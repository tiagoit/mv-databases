#1
SELECT name 
  FROM world
 WHERE population > (SELECT population 
                       FROM world
                      WHERE name='Russia')

#2
SELECT name
  FROM world
 WHERE gdp/population > (SELECT gdp/population 
                           FROM world 
                          WHERE name = 'United Kingdom')
   AND continent = 'Europe'

#3
SELECT name, continent
  FROM world
 WHERE continent IN (SELECT DISTINCT continent 
                                FROM world
                               WHERE name IN ('Argentina','Australia'))
ORDER BY name

#4
SELECT name, population
  FROM world
 WHERE population > (SELECT population
                       FROM world
                      WHERE name = 'Canada')
   AND population < (SELECT population
                       FROM world
                      WHERE name = 'Poland')

#5
SELECT name, CONCAT(ROUND(population / (SELECT population 
                                          FROM world
                                         WHERE name = 'Germany') * 100), '%') as pop_germany
  FROM world
 WHERE continent = 'Europe'

#6
SELECT name
  FROM world
 WHERE gdp > (SELECT gdp
                FROM world
               WHERE continent = 'Europe' 
            ORDER BY gdp DESC LIMIT 1)

#7
SELECT continent, name, area
  FROM world x
 WHERE area >= ALL (SELECT area
                      FROM world y
                     WHERE y.continent=x.continent AND area>0)

#8
SELECT continent, name
  FROM world as x
 WHERE name <= ALL (SELECT name
                      FROM world as y
                     WHERE y.continent=x.continent)

#9
SELECT name, continent, population
  FROM world
 WHERE continent IN (SELECT continent 
                       FROM world x
                      WHERE population >= ALL (SELECT population
                                                 FROM world y
                                                WHERE y.continent=x.continent)
                        AND population <= 25000000)

#10
SELECT population 
  FROM world y 
 WHERE population <= ALL (SELECT population 
                            FROM world z 
                           WHERE z.continent=y.continent 
                             AND population>0)