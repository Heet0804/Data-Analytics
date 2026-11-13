# Student Grades SQL Practice (Q1–Q30)

A 4-table practice database built around a small college's records: who is enrolled in which course, who teaches it, and how each student scored. It starts with basic `SELECT` statements and moves through joins, subqueries, views, CTEs and window functions.

## Files in This Project

| File | Purpose |
|---|---|
| `teachers.sql` | Creates the `STUDENT_GRADES` database and the `TEACHERS` table, and loads its data |
| `students.sql` | Creates the `STUDENTS` table and loads its data |
| `courses.sql` | Creates the `COURSES` table and loads its data |
| `enrollments.sql` | Creates the `ENROLLMENTS` table and loads its data |
| `Questions.md` | The 30 questions, organized into Basic / Intermediate / Advanced |
| `Queries.md` | The SQL query for every question |
| `Expected_Answers.md` | The output for every question |
| `Question-Answers.sql` | All 30 questions, each followed by my solving query |

## Setup

Run the files in this order. `teachers.sql` must come first, because it creates the database and the other tables refer to it.

```sql
SOURCE teachers.sql;
SOURCE students.sql;
SOURCE courses.sql;
SOURCE enrollments.sql;
```

After that, `STUDENT_GRADES` is a fully loaded database ready for the questions.

> **Column names:** The tables are created with short uppercase names (for example `S_NAME`, `ENROLL_DATE`, `MARKS`). `Questions.md` and `Queries.md` describe the same columns in plain words (for example `student_name`, `enrollment_date`, `marks_obtained`). `Question-Answers.sql` uses the short names exactly as created, so copy from it when you need names that run as-is.

## Schema Overview

**`TEACHERS`** (7 rows): `T_ID`, `T_NAME`, `DEPT`, `HIRE_DATE`
One teacher (Dr. Alok Verma, Biology) has no courses assigned. This is deliberate, for `LEFT JOIN` practice.

**`STUDENTS`** (25 rows, 26 after the Q4 insert): `S_ID`, `S_NAME`, `GENDER`, `DATE_OF_BIRTH`, `ENROLL_DATE`, `CITY`
One student (Om Prakash) has no enrollments from the start. The student added in Q4 (Ayesha Khan) also has none. Both are useful for `LEFT JOIN` and "students with no activity" questions.

**`COURSES`** (10 rows): `C_ID`, `C_NAME`, `DEPT`, `CREDITS`, `T_ID` (links to `TEACHERS`)
Spans 5 departments (Mathematics, Physics, Computer Science, Chemistry, English), with 2 to 4 credits each.

**`ENROLLMENTS`** (73 rows, changed by Q5 and Q6): `E_ID`, `S_ID`, `C_ID`, `SEMESTER`, `MARKS`, `ATTENDANCE`
The main table. One row per student, course and semester. Semesters are `'Fall2023'`, `'Spring2024'` and `'Fall2024'`. Alphabetical order is **not** chronological order here, because `Spring2024` falls between the two Fall semesters. This matters for any "in chronological order" question.

### Relationships

```
TEACHERS (1) ──< COURSES (many)
STUDENTS (1) ──< ENROLLMENTS (many) >── (1) COURSES
```

### Built-in Edge Cases

Useful for testing NULL and empty-result handling:

- A teacher with no courses assigned
- A student with no enrollments at all (before any inserts)
- An enrollment with no marks (NULL), which is graded in Q5
- A low-attendance, high-marks case (attendance 42%, marks 95)
- A student who retook a course and improved (Reyansh Gupta, Data Structures: 80, then 95)
- A failing student (several enrollments under 40 marks)

## How the Questions Are Organized

30 questions, split evenly:

- **Basic (Q1–Q10):** filtering, sorting, `INSERT`/`UPDATE`/`DELETE`/`ALTER TABLE`, `GROUP BY`, `DISTINCT`, date functions
- **Intermediate (Q11–Q20):** `INNER`/`LEFT`/`SELF` joins, `CASE` expressions, `HAVING`, `UNION`, subqueries, `VIEW`s, indexes
- **Advanced (Q21–Q30):** correlated subqueries, `UNION ALL`, CTEs, and window functions (`RANK`, `DENSE_RANK`, `NTILE`, running averages) combined with `CASE` for multi-step logic

**Important:** Q4 to Q7 in the Basic section permanently change the data (insert a student, grade an enrollment, delete an enrollment, add a column). Every question from Q8 onward assumes those changes are done, so solve the Basic section in order. Q11 onward only reads data, and those questions can be done in any order.

## 🔙 Back

[SQL Practice](../README.md)
