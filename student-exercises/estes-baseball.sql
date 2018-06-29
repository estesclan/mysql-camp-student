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




