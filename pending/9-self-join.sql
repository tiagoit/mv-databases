#1
SELECT COUNT(*) FROM stops

#2
SELECT id FROM stops WHERE name = 'Craiglockhart'

#3 TODO
SELECT DISTINCT id, name FROM stops
JOIN route ON stop = id
WHERE company = 'LRT'
AND pos = 4

#4
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) > 1

#5
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53
AND b.stop = (SELECT id FROM stops WHERE name = 'London Road')

#6

#7

#8

#9

#10