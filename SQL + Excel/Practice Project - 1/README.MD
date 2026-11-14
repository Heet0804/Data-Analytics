# 🏏 IPL Data Analysis (SQL + Excel)

A two-step project. First, a **MySQL database** of real IPL facts (2008 to 2025) is built and queried to answer 20 questions. Then the results are taken into **Excel** and turned into a one-page dashboard.

![IPL Dashboard](../../Images/Project%20-%201%20SQL%20%2B%20Excel/1.%20Dashboard.png)

## Dataset

The data is stored in the `IPL_ANALYSIS` database, which has **6 related tables**.

- 🏏 **15 franchises:** 10 active teams and 5 defunct ones (Deccan Chargers, Kochi Tuskers Kerala, Pune Warriors India, Rising Pune Supergiant and Gujarat Lions).
- 🏟️ **13 venues** in India, South Africa and the UAE.
- 👤 **130 players:** 105 are in a 2025 squad and 25 are past Orange Cap and Purple Cap winners and other legends with no current team.
- 📅 **18 seasons (2008 to 2025):** 1,180 matches in total, with the champion, runner-up and final venue of every season.
- 🟠🟣 **18 Orange Cap and 18 Purple Cap winners**, one of each per season, with the runs or wickets.
- All names, table names and values are stored in **capital letters**.

> The data was compiled by hand from public IPL records. It is not an official export. Venue capacities are approximate, and the 2025 squads are partial (10 to 12 players per team).

## Schema

```
VENUES (1) ──< SEASONS (many) >── (1) TEAMS
                  │
        ┌─────────┴─────────┐
ORANGE_CAP_WINNERS   PURPLE_CAP_WINNERS  ──> PLAYERS ──> TEAMS
```

| Table | Rows | Columns |
|---|---|---|
| `VENUES` | 13 | `VENUE_ID`, `VENUE_NAME`, `CITY`, `STATE`, `COUNTRY`, `CAPACITY` |
| `TEAMS` | 15 | `TEAM_ID`, `TEAM_NAME`, `SHORT_NAME`, `CITY`, `OWNER`, `FIRST_SEASON`, `LAST_SEASON`, `IS_ACTIVE` |
| `PLAYERS` | 130 | `PLAYER_ID`, `PLAYER_NAME`, `ROLE`, `NATIONALITY`, `CURRENT_TEAM_ID` |
| `SEASONS` | 18 | `SEASON_ID`, `SEASON_YEAR`, `TEAMS_PARTICIPATED`, `TOTAL_MATCHES`, `CHAMPION_TEAM_ID`, `RUNNER_UP_TEAM_ID`, `FINAL_VENUE_ID` |
| `ORANGE_CAP_WINNERS` | 18 | `SEASON_ID`, `PLAYER_ID`, `TEAM_ID`, `RUNS_SCORED` |
| `PURPLE_CAP_WINNERS` | 18 | `SEASON_ID`, `PLAYER_ID`, `TEAM_ID`, `WICKETS_TAKEN` |

`PLAYERS.CURRENT_TEAM_ID` is `NULL` for players who are not in a 2025 squad. This is deliberate, for practising `IS NULL` and `LEFT JOIN`.

## Files in This Project

| File | Purpose |
|---|---|
| `00_CREATE_DATABASE.sql` | Drops and creates the `IPL_ANALYSIS` database and selects it |
| `01_VENUES.sql` | Creates the `VENUES` table and loads its data |
| `02_TEAMS.sql` | Creates the `TEAMS` table and loads its data |
| `03_PLAYERS.sql` | Creates the `PLAYERS` table and loads its data |
| `04_SEASONS.sql` | Creates the `SEASONS` table and loads its data |
| `05_ORANGE_CAP_WINNERS.sql` | Creates the `ORANGE_CAP_WINNERS` table and loads its data |
| `06_PURPLE_CAP_WINNERS.sql` | Creates the `PURPLE_CAP_WINNERS` table and loads its data |
| `Questions_Answers.sql` | All 20 questions, each followed by my solving query |
| `DashBoard.csv` | Query results used to build the Excel dashboard |

## Setup

Run the files in this order. The numbers matter because the tables refer to each other through foreign keys.

```sql
SOURCE 00_CREATE_DATABASE.sql;
SOURCE 01_VENUES.sql;
SOURCE 02_TEAMS.sql;
SOURCE 03_PLAYERS.sql;
SOURCE 04_SEASONS.sql;
SOURCE 05_ORANGE_CAP_WINNERS.sql;
SOURCE 06_PURPLE_CAP_WINNERS.sql;
```

Then open `Questions_Answers.sql` and run the queries one at a time. None of the 20 questions changes the data, so they can be solved in any order.

## The 20 Questions

- **Easy (Q1 to Q6):** filtering, sorting, `COUNT`, `SUM`, `GROUP BY` and a `CASE` expression
- **Medium (Q7 to Q14):** `JOIN`s across two to four tables (including joining `TEAMS` twice), `HAVING`, `NOT IN` subqueries and `LIMIT`
- **Hard (Q15 to Q20):** `UNION ALL` inside a subquery, `LEFT JOIN`, window functions (`DENSE_RANK`, `RANK`, `LAG`) and percentage calculations with `HAVING`

## Dashboard

The Excel dashboard takes the results of Q2, Q5, Q6, Q8, Q12, Q13, Q14, Q15 and Q19 and puts them on one page.

### 1️⃣ Franchises (Q2)

- There have been **15 franchises** in total: **10 active** and **5 defunct**.

### 2️⃣ Players in each role (Q5)

![Players in Each Role](../../Images/Project%20-%201%20SQL%20%2B%20Excel/1.%20Players%20in%20Each%20Role.png)

- The database has 130 players: **45 bowlers (34.6%)**, **39 batters (30.0%)**, **29 all-rounders (22.3%)** and **17 wicketkeepers (13.1%)**.
- Bowlers are the largest group, because every Purple Cap winner and most squad bowlers are included.

### 3️⃣ Indian vs overseas players (Q6)

![Indian vs Overseas](../../Images/Project%20-%201%20SQL%20%2B%20Excel/1.%20Indian%20vs%20Overseas.png)

- Of the 105 players in a 2025 squad, **69 are Indian (66%)** and **36 are overseas (34%)**.

### 4️⃣ Title winners (Q8)

![Title Winners](../../Images/Project%20-%201%20SQL%20%2B%20Excel/1.%20Title%20Winners.png)

- **Chennai Super Kings** and **Mumbai Indians** lead with 5 titles each, followed by **Kolkata Knight Riders** with 3.
- Five teams have 1 title each: Deccan Chargers, Gujarat Titans, Rajasthan Royals, Royal Challengers Bengaluru and Sunrisers Hyderabad.
- 8 different franchises have won the 18 seasons.

### 5️⃣ Orange Cap winners (Q12)

![Orange Cap](../../Images/Project%20-%201%20SQL%20%2B%20Excel/1.%20Orange%20Cap.png)

- **David Warner** is the only player with 3 Orange Caps.
- **Chris Gayle** and **Virat Kohli** have 2 each.

### 6️⃣ Purple Cap winners (Q13)

![Purple Cap](../../Images/Project%20-%201%20SQL%20%2B%20Excel/1.%20Purple%20Cap.png)

- **Bhuvneshwar Kumar**, **Dwayne Bravo** and **Harshal Patel** have 2 Purple Caps each.
- No bowler has won it 3 times.

### 7️⃣ Top 5 Orange Cap seasons (Q14)

![Top-5 Highest](../../Images/Project%20-%201%20SQL%20%2B%20Excel/1.%20Top-5%20Highest.png)

- **Virat Kohli's 973 runs in 2016** is the highest total by a distance.
- The next four are Shubman Gill (890, 2023), Jos Buttler (863, 2022), Sai Sudharsan (759, 2025) and Virat Kohli again (741, 2024).
- 4 of the top 5 seasons are from 2022 onwards.

### 8️⃣ Caps won by team (Q15)

![Caps Won](../../Images/Project%20-%201%20SQL%20%2B%20Excel/1.%20Caps%20Won.png)

- **Chennai Super Kings** have the most caps with 7 (3 Orange and 4 Purple).
- **Sunrisers Hyderabad** have 6 (4 Orange and 2 Purple) and **Royal Challengers Bengaluru** have 5 (4 Orange and 1 Purple).
- Mumbai Indians have 5 titles but only 2 caps. Titles and individual awards do not always go together.

### 9️⃣ Squads with many overseas players (Q19)

![Squad Size](../../Images/Project%20-%201%20SQL%20%2B%20Excel/1.%20Squad%20Size.png)

- Six active teams have more than 30% overseas players in this dataset.
- **Chennai Super Kings**, **Punjab Kings** and **Rajasthan Royals** are the highest at 40%.
- Delhi Capitals and Lucknow Super Giants are at 36.4%, and Royal Challengers Bengaluru at 33.3%.
- The chart shows the squad size of these six teams: 10, 10, 10, 11, 11 and 12 players.

## Workflow

1. Build the `IPL_ANALYSIS` database with the numbered `.sql` files.
2. Solve the 20 questions in `Questions_Answers.sql`.
3. Pick the results that make the best charts and bring them into Excel.
4. Build the charts and arrange them on one dashboard page.

## Limitations

- There is **no match-by-match or ball-by-ball data**. The project works at season level, so it cannot show batting averages or strike rates.
- The 2025 squads are partial, with 10 to 12 players per team, so squad-based answers (Q6, Q7, Q19) describe this dataset and not the full squads.
- Venue capacities are approximate, and the total match counts per season come from public records and should be checked before they are quoted.
- Orange Cap and Purple Cap show one winner per season. They do not show who finished second.

## Skills Used

- **🗄️ MySQL:** `CREATE TABLE`, primary and foreign keys, `INSERT`
- **🔗 Joins:** `INNER JOIN`, `LEFT JOIN` and joining the same table twice with aliases
- **🧮 Aggregation:** `COUNT`, `SUM`, `ROUND`, `GROUP BY`, `HAVING`
- **🧩 Subqueries and `UNION ALL`**
- **🪟 Window functions:** `DENSE_RANK`, `RANK`, `LAG`
- **📊 Excel:** charts, KPI cards and dashboard design

## 🔙 Back

[SQL + Excel](../README.md)
