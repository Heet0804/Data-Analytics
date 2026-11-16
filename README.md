# 📊 Data Analytics

A collection of hands-on data analytics work in **Excel** and **SQL**. The Excel part is five dashboard and analysis projects. The SQL part is three practice sets with 120 questions in total.

The **SQL + Excel** part combines both: a MySQL database is queried to answer 20 questions, and the results are turned into an Excel dashboard. A second project does the same with 48,260 ride-hailing trips from Mumbai.

![School Performance Dashboard](Images/Project%20-%204%20Excel/4.%20School%20Performance%20Dashboard.png)

## 📂 What's Inside

| Folder | What it has | Tools |
|---|---|---|
| [📗 Excel](Excel/README.md) | 5 projects: dashboards and analysis on salaries, IPL matches, school data and bike sales | Pivot Tables, Power Query, DAX, Power Pivot, slicers, charts, formulas |
| [🗄️ SQL](SQL/README.md) | 3 practice sets: 120 questions from basic to advanced | MySQL / MariaDB |
| [🔗 SQL + Excel](SQL%20%2B%20Excel/README.md) | 2 projects: a MySQL database of IPL data with 20 SQL questions, and a ride-hailing trips table with 13 groups of SQL questions, each turned into an Excel dashboard | MySQL, Joins, Window Functions, Aggregation, `CASE WHEN`, Excel Charts, Dashboard Design |
| 🖼️ Images | Screenshots used in the project READMEs | |

---

## 📗 Excel Projects

| # | Project | What it shows |
|---|---|---|
| 1 | [Salary Dashboard](Excel/Project%20-%201%20Dashboard/README.md) | Data job salaries by job title, country and job type |
| 2 | [Data Jobs Analysis](Excel/Project%20-%202%20Analysis/README.md) | How skills, regions and pay are linked in data jobs |
| 3 | [IPL Analysis](Excel/Project%20-%203%20IPL%20Analysis/README.md) | What drives wins in 11 IPL seasons (2008 to 2018) |
| 4 | [School Performance Dashboard](Excel/Project%20-%204%20School%20Analysis/README.md) | Marks, attendance and fees of 300 students |
| 5 | [Bike Sales Dashboard](Excel/Project%20-%205%20Bike%20Sales%20Analysis/README.md) | Who buys a bike, by income, commute distance, age and region (1,026 customers) |

## 🗄️ SQL Practice Sets

| # | Practice set | Questions | Topics |
|---|---|---|---|
| 1 | [Cricket League](SQL/Practice%20-%201/README.md) | 60 | Teams, players, matches and performances |
| 2 | [Company Project Tracker](SQL/Practice%20-%202/README.md) | 30 | Departments, employees, projects and assignments |
| 3 | [Student Grades](SQL/Practice%20-%203/README.md) | 30 | Teachers, students, courses and enrollments |

Each set goes from basic `SELECT` queries to joins, subqueries, views and indexes. The Cricket League and Company Project Tracker sets go on to transactions, stored procedures and triggers. Student Grades goes on to CTEs and window functions.

> ⚠️ Solve the SQL sets in order. Some questions change the data, and later questions depend on those changes.

---

## 🔗 SQL + Excel Projects

| # | Project | Database | What it shows |
|---|---|---|---|
| 1 | [IPL Data Analysis](SQL%20%2B%20Excel/IPL%20Data%20Analysis/README.md) | `IPL_ANALYSIS` | Champions, Orange and Purple Cap winners, venues and squads of the IPL from 2008 to 2025, answered with 20 SQL questions and shown in an Excel dashboard |
| 2 | [Ride Hailing Analysis](SQL%20%2B%20Excel/Practice%20Project%20-%202/README.MD) | `RIDE_HAILING` | Revenue, trips, cancellations, surge pricing, routes and drivers of 48,260 Mumbai cab, auto and bike trips in 2025, answered with 13 groups of SQL queries and shown in an Excel dashboard |

![IPL Data Analysis Dashboard](Images/Project%20-%201%20SQL%20%2B%20Excel/1.%20Dashboard.png)

![Ride Hailing Dashboard](Images/Project%20-%202%20SQL%20%2B%20Excel/2.%20Dashboard.png)

Each project is set up from numbered `.sql` files, one per table, each with its `CREATE TABLE` and `INSERT` statements. Run them in order, solve the questions, then build the dashboard in Excel. The ride-hailing project has a single table, so it loads the CSV with one `Database_Creation.sql` file instead. Details are in each project's README.

---

## 🚀 How to Use This Repo

- **Excel:** Open the `.xlsx` file inside any project folder. Excel 365 or 2021 is needed for XLOOKUP and the treemap chart in Project 3.
- **SQL:** Open a practice set folder, load the setup `.sql` files in the order given in its README, then work through the questions.
- **SQL + Excel:** Open a project folder, run the numbered `.sql` files from `00` upwards, then work through `Questions_Answers.sql`. The dashboard images are in the `Images/` folder.

## 🗂️ Repository Structure

```
Data-Analytics/
├── Excel/
│   ├── Project - 1 Dashboard/
│   ├── Project - 2 Analysis/
│   ├── Project - 3 IPL Analysis/
│   ├── Project - 4 School Analysis/
│   └── Project - 5 Bike Sales Analysis/
├── SQL/
│   ├── Practice - 1/
│   ├── Practice - 2/
│   └── Practice - 3/
├── SQL + Excel/
│   ├── IPL Data Analysis/
│   └── Practice Project - 2/
└── Images/
```
