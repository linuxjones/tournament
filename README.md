Uses the PostgreSQL database to keep track of players and matches in a game tournament.
The game tournament will use the Swiss system for pairing up players in each round: players are not eliminated, and each player should be paired with another player with the same number of wins, or as close as possible.
To get started

## Table of contents

* [Contents](#quick-start)
* [Quick start](#quick-start)
* [Creators](#creators)

## Contents
There are three files there: tournament.sql, tournament.py, and tournament_test.py.
Tournament.sql - Has the SQL statements that create the tournament tables to keep track of players, matches and creates a view that returns standings.
Tournament.py - The implementation file that performs the sql statements such as add and delete from the tournament tables. 
Tournament_test.py - Contains unit tests that run the functions written in tournament.py

## Quick Start

Required to run the project

Postgres database
Python 2.7
1. Connect to the postgres database by typing psql
2. Execute \i tournment.sql
3. Disconnect from psql by executing \q
4. Execute in terminal python tournament_test.py


## Creators
**Jonathan Jones**
