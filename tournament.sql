-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

DROP DATABASE IF EXISTS tournament;
CREATE DATABASE tournament;

\c tournament;
'''create table players with player id and player name'''
create table players (players_id serial Primary key, player_name varchar(50));

'''create table matches with winner and loser ids'''
create table matches (players_id serial Primary key, winner integer, loser integer, foreign key (winner) references player(player_id), foreign key (loser) references players (player_id); 

'''create view to return the player standings and joins the players tables with the matches table'''
CREATE VIEW standings as
        SELECT players.players_id, players.player_name,
                Count(nullif(matches.result, false)) AS wins,
        Count(matches.players_id) AS matches
    FROM players LEFT JOIN matches ON players.players_id = matches.players_id
    GROUP BY players.players_id ORDER BY wins desc;

