# Cricket League SQL Practice (Q1–Q60)

A set of 60 SQL practice problems built around a small "Cricket League" database. It starts with basic `SELECT`/`INSERT`/`UPDATE` statements and moves through joins and subqueries to stored procedures, triggers and transactions.

## Contents

| File | Description |
|---|---|
| `Questions.md` | All 60 questions in plain English, grouped by difficulty (Basic → Intermediate → Advanced). |
| `Queries.md` | The SQL solution for each question. |
| `Expected_Answers.md` | The result of running every query, in order, on a fresh MySQL/MariaDB database. It includes row counts, affected-row messages and table snapshots after data-changing statements. |
| `Question-Answers.sql` | All questions with my solving queries in one file. |
| `teams_table.sql`, `players_table.sql`, `matches_table.sql`, `performances_table.sql` | Base setup scripts that create the database and load the starting data. |

> Table and column names are used exactly as created (`CRICKET_LEAGUE`, `TEAMS`, `PLAYERS`, `MATCHES`, `PERFORMANCES`, all uppercase). `USE CRICKET_LEAGUE;` is assumed before every query. For `CREATE PROCEDURE` / `CREATE TRIGGER` blocks, switch the client delimiter (for example `DELIMITER //`) so semicolons inside the routine body do not end the statement early.

## Schema

- **TEAMS**: team_id, team_name, country, coach_name, total_wins
- **PLAYERS**: player_id, player_name, team_id, role, date_of_birth (plus `jersey_number` and `is_captain`, added in Q7 and Q17)
- **MATCHES**: match_id, team1_id, team2_id, match_date, venue, winner_id
- **PERFORMANCES**: performance_id, match_id, player_id, runs_scored, balls_faced, wickets_taken, catches

## Topics Covered

**Basic (Q1–Q20):** `SELECT`/`WHERE`/`ORDER BY`, `INSERT`, `UPDATE`, `DELETE`, `ALTER TABLE`, `GROUP BY`, date functions, `DISTINCT`.

**Intermediate (Q21–Q40):** `INNER`/`LEFT JOIN`, self-joins, `GROUP BY` + `HAVING`, `UNION`, scalar subqueries, `VIEW`s, `INDEX`es.

**Advanced (Q41–Q60):** correlated subqueries, multi-table joins, `UNION ALL`, nested subqueries for top-N-per-group, `TRANSACTION`s (`COMMIT`/`ROLLBACK`), `STORED PROCEDURE`s, `TRIGGER`s.

## ⚠️ Important: Solve Strictly in Order

This is **not** a set of independent queries. It is one running database. The following questions **permanently change the data**, and every later question uses the changed data:

- **Basic:** Q4, Q5, Q6, Q7 (insert a player, update a coach, delete a performance, add a column) and Q14–Q17 (a second insert, another update/delete, another column)
- **Advanced:** Q46 (transfers a player between teams), Q48 and Q49 (create a trigger and insert new matches, which raises `total_wins`), Q56 (multi-statement transaction), Q58 and Q59 (recreate the trigger and insert two more matches)

If you run the queries out of order, or skip a data-changing step, your results will differ from `Expected_Answers.md`.

## How to Use

1. Load the four base setup files, in this order, into a fresh MySQL/MariaDB database: `teams_table.sql` → `players_table.sql` → `matches_table.sql` → `performances_table.sql`.
2. Run `USE CRICKET_LEAGUE;`.
3. Work through `Questions.md` in order (Q1 → Q60). Write your own query for each one before checking it against `Queries.md`.
4. Compare your output with the matching section in `Expected_Answers.md`.

## Notable Milestones

- **Q29 / Q39** create the `player_stats` and `team_summary` views.
- **Q30 / Q40** create indexes on `PLAYERS(TEAM_ID)` and `MATCHES(VENUE)`.
- **Q47 / Q57** create the `GetPlayerPerformances` and `GetTeamRoster` stored procedures.
- **Q48 / Q58** create (and recreate) the `trg_update_team_wins` trigger. It adds 1 to a team's `total_wins` whenever a match with a non-NULL `winner_id` is inserted.
- **Q49 / Q59** create procedures (`AddMatchResult`, `RecordMatchResult`) that insert matches inside a transaction and rely on the trigger to keep `total_wins` correct.
- By Q60, ROHIT VERMA leads all-time runs with 220, followed by VIKRAM SINGH with 205.

## 🔙 Back

[SQL Practice](../README.md)
