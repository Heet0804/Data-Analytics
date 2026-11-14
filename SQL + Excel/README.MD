# 🔗 SQL + Excel Projects

This folder combines the two skills. Each project builds a **MySQL database**, answers a set of questions with SQL, and then moves the results into **Excel** to build a dashboard.

## 📁 Projects

| # | Project | Database | Questions | What it shows | Skills | Open |
|---|---------|----------|-----------|---------------|--------|------|
| 1️⃣ | **IPL Data Analysis** | `IPL_ANALYSIS` | 20 (6 easy, 8 medium, 6 hard) | IPL champions, Orange and Purple Cap winners, venues and squads from 2008 to 2025 | Joins, `GROUP BY`, subqueries, window functions, Excel charts, dashboard design | [README](IPL%20Data%20Analysis/README.md) |

## 🖼️ Dashboards

| Project 1 |
|:---------:|
| <img src="../Images/Project%20-%201%20SQL%20%2B%20Excel/1.%20Dashboard.png" width="450" alt="Project 1 IPL Dashboard"> |

## 🔄 How These Projects Work

1. **Create the database:** run the numbered `.sql` files in order. Each file holds one table, with its `CREATE TABLE` and its `INSERT` statements.
2. **Solve the questions:** work through `Questions_Answers.sql`, which holds every question followed by its solving query.
3. **Move the results to Excel:** copy the result of each chosen query into a worksheet.
4. **Build the dashboard:** turn the results into charts and arrange them on one page.

> 💡 The numbered file format (`00_CREATE_DATABASE.sql`, `01_...`, `02_...`) is the same in every project, so any project can be set up the same way.

## 🗂️ Folder Contents

| Folder | Contains |
|--------|----------|
| `IPL Data Analysis` | Seven setup `.sql` files, `Questions_Answers.sql`, the dashboard data and a README |

Screenshots used in the READMEs are stored in the `Images/` folder at the root of the repository.

## 🛠️ Tools Used

MySQL, Joins, Aggregate functions, Subqueries, Window functions (`DENSE_RANK`, `RANK`, `LAG`), Excel Charts, Dashboard Design

## 🔙 Back to Main

[Data Analytics](../README.md)
