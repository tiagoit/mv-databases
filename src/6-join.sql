#1
SELECT matchid, player
  FROM goal 
 WHERE teamid = 'GER'

#2
SELECT id,stadium,team1,team2
  FROM game
 WHERE id=1012

#3
SELECT player,teamid,stadium,mdate
  FROM game
  JOIN goal ON (id=matchid)
 WHERE goal.teamid = 'GER'

#4
SELECT game.team1, game.team2, goal.player
  FROM goal
  JOIN game ON game.id = goal.matchid
 WHERE player LIKE 'Mario%'

#5
SELECT goal.player, eteam.id, eteam.coach, goal.gtime
  FROM goal 
  JOIN eteam ON eteam.id = goal.teamid
 WHERE gtime<=10

#6
SELECT game.mdate, eteam.teamname
  FROM game
  JOIN eteam ON eteam.id = game.team1
 WHERE coach = 'Fernando Santos'

#7
SELECT goal.player 
  FROM game 
  JOIN goal ON goal.matchid = game.id
 WHERE stadium = 'National Stadium, Warsaw'

#8
SELECT DISTINCT goal.player
           FROM goal
           JOIN game ON game.id = goal.matchid
          WHERE goal.teamid != 'GER'
            AND (team1 = 'GER' OR team2 = 'GER')

#9
SELECT teamname, COUNT(*) as goals
  FROM eteam
  JOIN goal ON id=teamid
GROUP BY teamname

#10
SELECT stadium, COUNT(*) as goals
  FROM game
  JOIN goal ON id=matchid
GROUP BY stadium

#11
SELECT matchid, mdate, COUNT(*)
  FROM game
  JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid, mdate

#12
SELECT matchid, mdate, COUNT(*)
  FROM game
  JOIN goal ON matchid = id 
 WHERE teamid = 'GER'
GROUP BY matchid, mdate

#13
SELECT 
  mdate, 
  team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
  FROM game 
LEFT JOIN goal ON matchid = id
GROUP BY mdate, team1, team2
ORDER BY mdate, matchid, team1, team2