# 🗄️ SQL Practice

This folder has **three separate SQL practice sets**. Each one uses its own database and its own data, and none depends on the others. You can do them in any order, or just one.

| Practice Set | Database | Questions | Focus |
|---|---|---|---|
| [Cricket League](Practice%20-%201/README.md) | `CRICKET_LEAGUE` | Q1–Q60 | Teams, players, matches, performances |
| [Company Project Tracker](Practice%20-%202/README.md) | `COMPANY_TRACKER` | Q1–Q30 | Departments, employees, projects, assignments |
| [Student Grades](Practice%20-%203/README.md) | `STUDENT_GRADES` | Q1–Q30 | Teachers, students, courses, enrollments |

All three sets follow the same format:

- A `Questions.md` file with the problems in plain English.
- A `Queries.md` file with the reference SQL solutions.
- An `Expected_Answers.md` file with the real output of running every query, in order, on a fresh database.
- A `Question-Answers.sql` file with all the questions and my solving queries in one file.
- Base setup `.sql` files that create the tables and load the starting data.

Each set is **sequential**. Several questions in each set change the data or the schema permanently, so later questions depend on earlier ones. If you skip a step or run questions out of order, your results will differ from `Expected_Answers.md`. Details are in each set's own README.

---

## 1. Cricket League (Q1–Q60)

Built around `TEAMS`, `PLAYERS`, `MATCHES` and `PERFORMANCES`. It goes from basic `SELECT`/`INSERT`/`UPDATE` through joins and subqueries to stored procedures, triggers and transactions.

- **Levels:** Basic (Q1–Q20), Intermediate (Q21–Q40, includes views and indexes), Advanced (Q41–Q60, includes correlated subqueries, transactions, stored procedures and triggers)
- **Questions that change data:** Q4–Q7 and Q14–Q17 (basic), Q46, Q48, Q49, Q56, Q58 and Q59 (advanced). These include a player transfer, a trigger that updates `total_wins`, and multi-statement transactions.

## 2. Company Project Tracker (Q1–Q30)

Built around `DEPARTMENTS`, `EMPLOYEES`, `PROJECTS` and `EMPLOYEE_PROJECTS`. It has the same progression as the Cricket set, in 30 questions instead of 60.

- **Levels:** Basic (Q1–Q10), Intermediate (Q11–Q20, includes a view and an index), Advanced (Q21–Q30, includes a transaction, two stored procedures and a trigger)
- **Questions that change data:** Q4 (insert employee), Q5 (update salary), Q6 (delete assignment), Q7 (add `EMAIL` column), Q26 (move an employee between departments), Q28 (create trigger and insert project), Q29 (procedure that inserts another project through the same trigger)
- **Note:** `Question-Answers.sql` is a separate solution attempt and does not fully match `Expected_Answers.md`. A few queries select different columns, leave out an `ORDER BY`, or (Q19) leave out a `COALESCE`. If they disagree, use `Queries.md`.

## 3. Student Grades (Q1–Q30)

Built around `TEACHERS`, `STUDENTS`, `COURSES` and `ENROLLMENTS`, which model a small college. It goes from basic filtering through joins, subqueries, views and indexes to CTEs and window functions (`RANK`, `DENSE_RANK`, `NTILE`, running averages).

- **Levels:** Basic (Q1–Q10), Intermediate (Q11–Q20), Advanced (Q21–Q30)
- **Questions that change data:** Q4 (insert student), Q5 (grade an enrollment), Q6 (delete an enrollment), Q7 (add a column). All are in the Basic section. Q11 onward only reads data.
- **Built-in edge cases:** a teacher with no courses, students with no enrollments, an ungraded enrollment (NULL marks), a low-attendance and high-marks case, a student who retook a course, a failing student, and semester names that do not sort in time order (`Fall2023`, `Spring2024`, `Fall2024`).

---

## ⚙️ Setup Order

Use MySQL or a MariaDB-compatible database. Load the files for one set in this order, then work through the questions.

**Cricket League:**
`teams_table.sql` → `players_table.sql` → `matches_table.sql` → `performances_table.sql` → `USE CRICKET_LEAGUE;` → `Questions.md` Q1 → Q60

**Company Project Tracker:**
`departments.sql` → `employees.sql` → `projects.sql` → `employee_projects.sql` → `Questions.md` Q1 → Q30
(`departments.sql` creates the `COMPANY_TRACKER` database and selects it.)

**Student Grades:**
`teachers.sql` → `students.sql` → `courses.sql` → `enrollments.sql` → `Questions.md` Q1 → Q30
(`teachers.sql` creates the `STUDENT_GRADES` database. Solve Q1–Q7 in order, because Q4–Q7 change the data. From Q8 onward, the order of the questions no longer matters.)

## 🔙 Back to Main

[Data Analytics](../README.md)
