 Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

DROP DATABASE IF EXISTS tournament;
CREATE DATABASE tournament;

\c tournament;

/*create table players with player id and player name*/
create table players (players_id serial Primary key, player_name varchar(50));

/*create table matches with winner and loser ids*/
create table matches (players_id serial Primary key, winner int, loser int, foreign key (winner) references players (players_id), foreign key (loser) references players (players_id));

/*CREATE VIEW standings as
 SELECT players.players_id, players.player_name,
  Count((matches.winner)) as wins,
  Count(matches.players_id) as played_matches
 FROM players left join matches on players.players_id = matches.players_id
 GROUP BY players.players_id ORDER BY wins desc;*/

/*create view to return the player standings and joins the players tables with the matches table*/
create view standings as
  select players.players_id, players.player_name, 
           count(won_games.players_id) as wins, 
           count(games_played.players_id) as matches
   from players left join matches as won_games 
         on players.players_id = won_games.winner
    left join matches as games_played
         on players.players_id = games_played.winner or players.players_id = games_played.loser
   group by players.players_id, players.player_name
   order by wins desc
