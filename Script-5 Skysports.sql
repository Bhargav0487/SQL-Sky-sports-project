CREATE DATABASE Sky_Sports;
USE Sky_Sports;
show tables;
select * from groupstageteam;
select * from overallwc;

#Questions:

#Write an sql query to show all the UNIQUE team names
SELECT DISTINCT team FROM groupstageteam;

#Write an SQL query to show name of team which has rank 1 from group 7.
SELECT team FROM groupstageteam WHERE `group` = 7 AND `rank` = 1;

#Write an sql query to show count of all teams
SELECT COUNT(team) FROM groupstageteam;

#Write an SQL query to show matches_played by each team
SELECT team, matches_played FROM groupstageteam;

#Write an SQL query to show team, percent of wins with respect to matches_played by each team and name the resulting column as wins_percent
SELECT team, (wins / matches_played) * 100 AS wins_percent 
FROM groupstageteam;

#Write an SQL query to show which team has maximum goals_scored and their count
SELECT team, goals_scored FROM groupstageteam 
WHERE goals_scored = (SELECT MAX(goals_scored) FROM groupstageteam);

#Write an SQL query to show percent of draws with respect to matches_played round of to 2 digits by each team
SELECT team, ROUND((draws / matches_played) * 100, 2) AS draw_percent 
FROM groupstageteam;

#Write an SQL query to show which team has minimum goals_scored and their count
SELECT team, goals_scored FROM groupstageteam 
WHERE goals_scored = (SELECT MIN(goals_scored) FROM groupstageteam);

#Write an SQL query to show percent of losses with respect to matches_played by each team in ascending order by losses and name the resulting column as losses_percent
SELECT team, (losses / matches_played) * 100 AS losses_percent FROM groupstageteam 
ORDER BY losses ASC;

#Write an SQL query to show the average goal_difference
SELECT AVG(goal_difference) FROM groupstageteam;

#Write an SQL query to show name of the team where points are 0.
SELECT team FROM groupstageteam WHERE points = 0;

#Write a SQL query to show all data where expected_goal_scored is less than exp_goal_conceded
SELECT * FROM groupstageteam 
WHERE expected_goal_scored < exp_goal_conceded;

#Write an SQL query to show data where exp_goal_difference is in between -0.5 and 0.5
SELECT * FROM groupstageteam 
WHERE exp_goal_difference BETWEEN -0.5 AND 0.5;

#Write an SQL query to show all data in ascending order by exp_goal_difference_per_90
SELECT * FROM groupstageteam 
ORDER BY exp_goal_difference_per_90 ASC;

#Write an SQL query to show team which has maximum number of players_used
SELECT team, players_used FROM overallwc 
WHERE players_used = (SELECT MAX(players_used) FROM overallwc);

#Write an SQL query to show each team name and avg_age in ascending order by avg_age
SELECT team, avg_age FROM overallwc ORDER BY avg_age ASC;

#Write an sql query to show average possession of teams
SELECT AVG(possession) FROM overallwc;

#Write a SQL query to show team which has played atleast 5 games
SELECT team FROM overallwc WHERE games >= 5;

#Write an SQL query to show all data for which minutes is greater than 600
SELECT * FROM overallwc WHERE minutes > 600;

#Write an SQL query to show team, goals, assists in ascending order by goals
SELECT team, goals, assists FROM overallwc ORDER BY goals ASC;

#Write an SQL query to show team, pens_made, pens_att in descending order by pens_made
SELECT team, pens_made, pens_att FROM overallwc ORDER BY pens_made DESC;

#Write an SQL query to show team, cards_yellow, cards_red where cards_red is equal to 1 in ascending order by cards_yellow
SELECT team, cards_yellow, cards_red FROM overallwc 
WHERE cards_red = 1 
ORDER BY cards_yellow ASC;

#Write an SQL query to show team, goals_per90, assists_per90, goals_assists_per90 in descending order by goals_assists_per90
SELECT team, goals_per90, assists_per90, goals_assists_per90 FROM overallwc 
ORDER BY goals_assists_per90 DESC;

#Write an SQL query to show team, shots, shots_on_target, shots_on_target_pct where shots_on_target_pct is less than 30 in ascending order by shots_on_target_pct
SELECT team, shots, shots_on_target, shots_on_target_pct FROM overallwc
WHERE shots_on_target_pct < 30 ORDER BY shots_on_target_pct ASC;

#Write an SQL query to show team, shots_per90, shots_on_target_per90 for team Belgium
SELECT team, shots_per90, shots_on_target_per90 FROM overallwc 
WHERE team = 'Belgium';

#Write an SQL query to show team, goals_per_shot, goals_per_shot_on_target, average_shot_distance in descending order by average_shot_distance
SELECT team, goals_per_shot, goals_per_shot_on_target, average_shot_distance FROM overallwc 
ORDER BY average_shot_distance DESC;

#Write an SQL query to show team, errors, touches for which errors is 0 and touches is less than 1500
SELECT team, errors, touches FROM overallwc 
WHERE errors = 0 AND touches < 1500;

#Write an SQL query to show team, fouls which has maximum number of fouls
SELECT team, fouls FROM overallwc 
WHERE fouls = (SELECT MAX(fouls) FROM overallwc);

#Write an SQL query to show team, offisdes which has offsides less than 10 or greater than 20
SELECT team, offsides FROM overallwc 
WHERE offsides < 10 OR offsides > 20;

#Write an SQL query to show team, aerials_won, aerials_lost, aerials_won_pct in descending order by aerials_won_pct
SELECT team, aerials_won, aerials_lost, aerials_won_pct 
FROM overallwc 
ORDER BY aerials_won_pct DESC;

#Write an SQL query to show number of teams each group has!
SELECT "group", COUNT(team) FROM groupstageteam 
GROUP BY "group";

#Write a SQL query to show team names group 6 has
SELECT team FROM groupstageteam WHERE "group" = 6;

#Write an SQL query to show Australia belongs to which group
SELECT "group" FROM groupstageteam WHERE team = 'Australia';

#Write an SQL query to show group, average wins by each group
SELECT "group", AVG(wins) FROM groupstageteam GROUP BY "group";

#Write an SQL query to show group, maximum expected_goal_scored by each group in ascending order by expected_goal_scored
SELECT "group", MAX(expected_goal_scored) FROM groupstageteam 
GROUP BY "group" ORDER BY MAX(expected_goal_scored) ASC;

#Write an SQL query to show group, minimum exp_goal_conceded by each group in descending order by exp_goal_conceded
SELECT "group", MIN(exp_goal_conceded) FROM groupstageteam 
GROUP BY "group" ORDER BY MIN(exp_goal_conceded) DESC;

#Write an SQL query to show group, average exp_goal_difference_per_90 for each group in ascending order by exp_goal_difference_per_90
SELECT "group", AVG(exp_goal_difference_per_90) FROM groupstageteam
GROUP BY "group" ORDER BY AVG(exp_goal_difference_per_90) ASC;

#Write an SQL query to show which team has equal number of goals_scored and goals_against
SELECT team FROM groupstageteam WHERE goals_scored = goals_against;

#Write an SQL query to show which team has maximum players_used
SELECT team, players_used FROM overallwc 
WHERE players_used = (SELECT MAX(players_used) FROM overallwc);

#Write an SQL query to show team, players_used, avg_age, games, minutes where minutes lessthan 500 and greater than 200
SELECT team, players_used, avg_age, games, minutes FROM overallwc 
WHERE minutes > 200 AND minutes < 500;

#Write an SQL query to show all data of group_stats in ascending order BY points.
SELECT * FROM groupstageteam ORDER BY points ASC;

#Write an SQL query to show ALL UNIQUE team in ascending order by team.
SELECT DISTINCT team FROM groupstageteam ORDER BY team ASC;

#Write an SQL query to show average avg_age of each group and arrange it in descending order by avg_age.
SELECT groupstageteam.`group`, AVG(overallwc.avg_age) FROM groupstageteam 
inner JOIN overallwc ON groupstageteam.team = overallwc.team 
GROUP BY groupstageteam.`group` 
ORDER BY AVG(overallwc.avg_age) DESC;

#Write an SQL query to show sum of fouls for each group and arrange it in ascending order by fouls.
SELECT groupstageteam.`group`, SUM(overallwc.fouls) 
FROM groupstageteam 
inner JOIN overallwc ON groupstageteam.team = overallwc.team 
GROUP BY groupstageteam.`group` 
ORDER BY SUM(overallwc.fouls) ASC;

#Write an SQL query to show total number of games for each group and arrange it in descending order by games.
SELECT groupstageteam.`group`, SUM(overallwc.games) 
FROM groupstageteam 
JOIN overallwc ON groupstageteam.team = overallwc.team 
GROUP BY groupstageteam.`group` 
ORDER BY SUM(overallwc.games) DESC;

#Write an SQL query to show total number of players_used for each group and arrange it in ascending order by players_used.
SELECT groupstageteam.`group`, SUM(overallwc.players_used) 
FROM groupstageteam 
JOIN overallwc ON groupstageteam.team = overallwc.team 
GROUP BY groupstageteam.`group` 
ORDER BY SUM(overallwc.players_used) ASC;

#Write an SQL query to show total number of offsides for each group and arrange it in ascending order by offsides.
SELECT groupstageteam.`group`, SUM(overallwc.offsides) 
FROM groupstageteam 
JOIN overallwc ON groupstageteam.team = overallwc.team 
GROUP BY groupstageteam.`group` 
ORDER BY SUM(overallwc.offsides) ASC;

#Write an SQL query to show average passes_pct for each group and arrange it in descending order by passes_pct.
SELECT groupstageteam.`group`, AVG(overallwc.passes_pct) 
FROM groupstageteam 
JOIN overallwc ON groupstageteam.team = overallwc.team 
GROUP BY groupstageteam.`group` 
ORDER BY AVG(overallwc.passes_pct) DESC;

#Write an SQL query to show average goals_per90 for each group and arrange it in ascending order by goals_per90.
SELECT groupstageteam.`group`, AVG(overallwc.goals_per90) 
FROM groupstageteam 
JOIN overallwc ON groupstageteam.team = overallwc.team 
GROUP BY groupstageteam.`group` 
ORDER BY AVG(overallwc.goals_per90) ASC;
