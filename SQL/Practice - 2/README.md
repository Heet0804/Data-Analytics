# Company Project Tracker SQL Practice (Q1–Q30)

A set of 30 SQL practice problems built around a small "Company Project Tracker" database. It starts with basic `SELECT`/`INSERT`/`UPDATE` statements and moves through joins and subqueries to views, indexes, transactions, stored procedures and triggers.

## Contents

| File | Description |
|---|---|
| `Questions.md` | All 30 questions in plain English, grouped by difficulty (Basic → Intermediate → Advanced). |
| `Queries.md` | The reference SQL solution for each question. |
| `Expected_Answers.md` | The result of running every query, in order, on a fresh MariaDB 10.11 database. It includes row counts and table snapshots after data-changing statements. |
| `Question-Answers.sql` | A separate solution attempt, with all questions and queries in one file. It is not fully aligned with `Queries.md` / `Expected_Answers.md`. See the note below. |
| `departments.sql`, `employees.sql`, `projects.sql`, `employee_projects.sql` | Base setup scripts that create the database and load the starting data. |

> Table and column names are used exactly as created (`COMPANY_TRACKER`, `DEPARTMENTS`, `EMPLOYEES`, `PROJECTS`, `EMPLOYEE_PROJECTS`, all uppercase). `USE COMPANY_TRACKER;` is assumed before every query. For `CREATE PROCEDURE` / `CREATE TRIGGER` blocks, switch the client delimiter (for example `DELIMITER //`) so semicolons inside the routine body do not end the statement early.

## Schema

- **DEPARTMENTS**: dept_id, dept_name, location, total_projects
- **EMPLOYEES**: emp_id, emp_name, dept_id, designation, salary, date_of_joining (plus `email`, added in Q7)
- **PROJECTS**: project_id, project_name, dept_id, budget, start_date, end_date
- **EMPLOYEE_PROJECTS**: assignment_id, emp_id, project_id, hours_worked

## Topics Covered

**Basic (Q1–Q10):** `SELECT`/`WHERE`/`ORDER BY`, `INSERT`, `UPDATE`, `DELETE`, `ALTER TABLE`, `GROUP BY`, date functions, `DISTINCT`.

**Intermediate (Q11–Q20):** `INNER`/`LEFT JOIN`, self-joins, `GROUP BY` + `HAVING`, `UNION`, scalar subqueries, `VIEW`s, `INDEX`es.

**Advanced (Q21–Q30):** correlated subqueries, multi-table joins, `UNION ALL`, nested subqueries for max-per-group, `TRANSACTION`s (`COMMIT`/`ROLLBACK`), `STORED PROCEDURE`s, `TRIGGER`s.

## ⚠️ Important: Solve Strictly in Order

This is **not** a set of independent queries. It is one running database. The following questions **permanently change the data or schema**, and every later question uses the changed state:

- Q4: inserts a new employee (Aakash Iyer)
- Q5: updates Priya Nair's salary
- Q6: deletes a row from `EMPLOYEE_PROJECTS`
- Q7: adds the `EMAIL` column to `EMPLOYEES`
- Q26: moves Rahul Mehta from Engineering to Marketing (his hours move with him in Q30)
- Q28: creates a trigger and inserts a new project, which raises `DEPARTMENTS.TOTAL_PROJECTS`
- Q29: creates a procedure that inserts another project and relies on the Q28 trigger

If you run the queries out of order, or skip a data-changing step, your results will differ from `Expected_Answers.md`.

## How to Use

1. Load the four base setup files in this order: `departments.sql` → `employees.sql` → `projects.sql` → `employee_projects.sql`. `departments.sql` also creates and selects the `COMPANY_TRACKER` database.
2. Work through `Questions.md` in order (Q1 → Q30). Write your own query for each one before checking it against `Queries.md`.
3. Compare your output with the matching section in `Expected_Answers.md`.
4. Treat `Question-Answers.sql` as a second attempt to check yourself against, not as a guaranteed match for `Expected_Answers.md`.

> **Note on `Question-Answers.sql`:** Some of its queries select different columns, leave out an `ORDER BY`, or (in Q19) leave out a `COALESCE`. That `COALESCE` turns NULL hour totals into 0 in the reference solution. Because of this, its raw output will not always match `Expected_Answers.md`. If the two disagree, use `Queries.md`.

## Notable Milestones

- **Q19** creates the `employee_stats` view (total hours and project count per employee).
- **Q20** creates an index on `EMPLOYEES(DEPT_ID)`.
- **Q26** is a full transaction walkthrough (`START TRANSACTION` → `UPDATE` → verify → `COMMIT`), with a written explanation of what `ROLLBACK` would have done instead.
- **Q27** creates the `GetEmployeeProjects` stored procedure.
- **Q28** creates the `trg_update_dept_projects` trigger. It adds 1 to a department's `total_projects` whenever a matching row is inserted into `PROJECTS`.
- **Q29** creates the `AddProject` procedure. It inserts a project inside a transaction and relies on the Q28 trigger to keep `total_projects` correct.
- By Q30, the top performers by department are: Neha Sharma (Engineering), Rahul Mehta (Marketing, after his Q26 transfer), Amit Bhatia (HR) and Divya Reddy (Sales).

## 🔙 Back

[SQL Practice](../README.md)
