select * from player;
select * from team;
select * from roster;
select * from batting;



select team.ID,
team.teamName,
batting.teamID,
batting.rank,
batting.battingAvg
FROM team
JOIN batting ON team.ID = batting.teamID;

select player.ID,
batting.playerID,
batting.battingAvg,
player.lastName as 'Last Name',
player.firstName
FROM player JOIN batting ON player.ID = batting.playerID where battingAvg = 331;

SELECT * from vteamRoster;

DESCRIBE vteamRoster;

SHOW columns from vteamRoster;

SHOW CREATE VIEW vteamRoster;

SELECT
batting.rank,
batting.battingAvg,
concat(player.firstName + player.lastName) as 'name'
FROM player 
JOIN batting ON player.ID = batting.playerID;

SELECT
player.firstName,
player.lastName,
batting.playerID
FROM player
LEFT JOIN batting ON player.ID = batting.playerID;

SELECT 
team.ID,
team.teamName,
roster.teamID
FROM team
JOIN roster ON team.ID = roster.playerID;

SELECT 
team.teamName AS team 
FROM team 
LEFT JOIN roster ON team.ID = roster.teamID WHERE roster.playerID IS NULL
ORDER BY team.teamName DESC; 

SELECT count(*) FROM team;

SELECT count(teamName) as 'How Many Teams' FROM team;

SELECT count(teamName) FROM team;

SELECT divisionName,
 count(ID) FROM team GROUP BY divisionName;
 
 SELECT league,
 count(teamName) as 'Team Num' FROM team GROUP BY league;

select birthplaceCountry,
count(bats) as 'bats L' FROM player WHERE bats = 'L' GROUP BY birthplaceCountry;

SELECT
/*
team.*,
roster. *
*/
team.teamName as 'No Players In Roster'
FROM team 
LEFT JOIN roster ON team.ID = roster.playerID where roster.playerID is null;

SELECT birthplaceCity, 
count(bats) as 'bats R' from player where bats = 'R' GROUP BY birthplaceCity desc;

SELECT
max(batting.hits),
player.lastName
from batting join player ON player.ID = batting.playerID;


SELECT birthplaceCountry, COUNT(*)as 'playerCount'
FROM player
GROUP BY birthplaceCountry
ORDER BY birthplaceCountry;

SELECT divisionName, COUNT(*)as 'teamCount'
FROM team
GROUP BY divisionName;

SELECT lastName, birthplaceCountry
FROM player
ORDER BY birthplaceCountry;

SELECT count(birthplaceCountry)vbattingleaders
FROM player
WHERE birthplaceCountry = 'USA'

SELECT
team.*,
batting.*
FROM team
INNER JOIN batting on team.ID = batting.teamID
WHERE batting.battingAvg > 320
ORDER BY batting.battingAvg;

SELECT avg(atbats), divisionName
FROM team INNER JOIN batting ON team.ID = batting.teamID
GROUP BY divisionName;

SELECT
player.lastName,
batting.runs,
batting.atbats
FROM player
LEFT JOIN batting on player.ID = batting.playerID
WHERE batting.runs > 70
ORDER BY runs desc;




















