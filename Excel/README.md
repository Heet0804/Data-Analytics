# Excel Data Analytics

Five Excel projects that turn raw data into clear answers. Projects 1 and 2 use a data jobs dataset to help job seekers see what data jobs pay and which skills matter. Project 3 uses IPL cricket data to find out what drives wins. Project 4 uses school student data to build a performance dashboard on marks, attendance and fees. Project 5 uses bike buyer data to see which customers buy a bike.

## Datasets

### 💼 Data Jobs Dataset (Projects 1 and 2)

- 📅 Real-world data science job postings from 2023.
- 📚 Taken from an Excel course I followed.
- 🧾 Includes job titles, salaries, locations and skills.

### 🏏 IPL Dataset (Project 3)

- 📅 696 Indian Premier League matches from 2008 to 2018.
- 🏟️ 13 teams, 35 venues and 32 cities.
- 🧾 Includes teams, venues, toss details, winners, Man of the Match awards and season results.

### 🎓 School Student Dataset (Project 4)

- 🧪 A synthetic (generated) practice dataset, not real student data.
- 👩‍🎓 300 students in Classes 8 to 10, Sections A to C, from 5 cities.
- 🧾 Includes marks in 5 subjects, attendance, fees, city, admission date, activities and transport.

### 🚲 Bike Buyers Dataset (Project 5)

- 🧪 A practice dataset, used for learning.
- 👥 1,026 customers across 3 regions: Europe, North America and Pacific.
- 🧾 Includes income, gender, marital status, education, occupation, cars, children, commute distance, age and whether the customer bought a bike.

## Projects

### 1️⃣ [Excel Salary Dashboard](Project-1/README.md)

An interactive dashboard to look up median salaries by job title, country and schedule type.

![Salary Dashboard](Images/1_Salary_Dashboard.png)

- 🛠️ **Skills:** Charts, Formulas and Functions, Data Validation
- 📗 **Workbook:** [Project-1.xlsx](Project-1/Project-1.xlsx)
- 👉 **Full write-up:** [Project-1/README.md](Project-1/README.md)

### 2️⃣ [Data Jobs Market Analysis](Project-2/README.md)

An analysis of skills, pay and regions in the data job market. It answers four questions:

- Do more skills get you better pay?
- What is the salary for data jobs in different regions?
- What are the top skills of data professionals?
- What is the pay for the top 10 skills?

![Pay of Top Skills](Images/Skill_Salary_Analysis.png)

- 🛠️ **Skills:** Power Query, Power Pivot, PivotTables, PivotCharts, DAX
- 👉 **Full write-up:** [Project-2/README.md](Project-2/README.md)

### 3️⃣ [IPL Analysis Dashboard](Project-3/README.md)

An interactive dashboard that studies 11 IPL seasons. It answers five questions:

- Which teams have won the most matches?
- Does the toss decision (bat or field) matter?
- Which venues host the most matches and what do they favour?
- Which players win the most Man of the Match awards?
- Which teams have won the most titles?

![IPL Dashboard](Images/3_IPL_Dashboard.png)

- 🔎 **Key findings:** Mumbai Indians lead with 98 wins, captains chose to field first in 59.3% of matches, CH Gayle has the most Man of the Match awards (20), and Chennai Super Kings and Mumbai Indians lead with 3 titles each.
- 🛠️ **Skills:** PivotTables, PivotCharts, Slicers, XLOOKUP, GETPIVOTDATA, Treemap Chart
- 📗 **Workbook:** [Project-3.xlsx](Project-3/Project-3.xlsx)
- 👉 **Full write-up:** [Project-3/README.md](Project-3/README.md)

### 4️⃣ [School Performance Dashboard](Project-4/README.md)

An interactive dashboard that tracks 300 students across Classes 8 to 10. Slicers for Class, Section and Gender update four KPI cards and six charts at once. It answers five questions:

- How many students pass, and how are grades spread?
- Which subjects are the strongest and weakest?
- Does attendance affect marks?
- How much fee is collected, and which class owes the most?
- Where do students come from, and how has admission changed by year?

![School Performance Dashboard](Images/4_School_Dashboard.png)

- 🔎 **Key findings:** 94.3% of students pass, Maths is the weakest subject (61.7 on average), students below 75% attendance average about 51% against 68% for the rest, 90.8% of fees are collected, and Class 10 holds the largest pending fee (₹5,68,750).
- ✏️ **Practice first:** Before building the dashboard, I solved 27 practice questions on the same data using formulas and pivot tables.
- 🛠️ **Skills:** PivotTables, PivotCharts, Slicers, GETPIVOTDATA, XLOOKUP, MAXIFS, COUNTIFS, AVERAGEIFS, SUMIFS, FILTER
- 📗 **Workbook:** [Project-4.xlsx](Project-4/Project-4.xlsx)
- 👉 **Full write-up:** [Project-4/README.md](Project-4/README.md)

### 5️⃣ [Bike Sales Dashboard](Project-5/README.md)

An interactive dashboard that studies 1,026 customers and compares bike buyers with non-buyers. Slicers for Marital Status, Region and Education update all three charts at once. It answers four questions:

- Do bike buyers earn more than non-buyers?
- Does gender affect income or the decision to buy?
- How does commute distance relate to buying a bike?
- Which age group buys the most bikes?

![Bike Sales Dashboard](Images/5.%20Dashboard.png)

- 🔎 **Key findings:** 48.2% of customers bought a bike, buyers earn about 4.4% more than non-buyers, gender barely changes the buying rate (48.5% for women, 48.0% for men), buying drops to 29.2% for commutes of 10+ miles, and customers aged 31 to 54 make up 79% of all buyers.
- ⚠️ **Data note:** The data has 26 exact duplicate rows. Without them the buying rate is 48.1%, so the findings hold.
- 🛠️ **Skills:** Excel Tables, Nested IF, PivotTables, PivotCharts, Slicers
- 📗 **Workbook:** [Project-5.xlsx](Project-5/Project-5.xlsx)
- 👉 **Full write-up:** [Project-5/README.md](Project-5/README.md)

## Repository Structure

- 📁 `Images/`: screenshots and charts used in the project READMEs
- 📁 `Project-1/`: salary dashboard (workbook and README)
- 📁 `Project-2/`: market analysis (README)
- 📁 `Project-3/`: IPL analysis dashboard (workbook and README)
- 📁 `Project-4/`: school performance dashboard (workbook, dataset and README)
- 📁 `Project-5/`: bike sales dashboard (workbook and README)

## Course Practice Files

Before the projects, I practised each topic in its own workbook:

- 📁 `1. Charts`: choosing the right chart, plus practice problems
- 📁 `2. Advanced SpreadSheets`: Excel Tables and practice problems
- 📁 `3. Pivot Tables`: PivotTables and PivotCharts
- 📁 `4. Advanced-Data-Analytics`: Add-ins, Analysis ToolPak and Data Tables
- 📁 `5. Power Query`: editor, advanced transformations, append vs merge and M language
- 📁 `6. Power Pivot`: Power Pivot window and DAX
- 📁 `7. Data Cleaning`: cleaning messy data in Excel
- 📗 `DATE-TIME & TEXT FUNCTIONS.xlsx`, `Practice_Problems.xlsx` and `Excel-Final.xlsx`

## Tools Used

- **📉 Charts**
- **🧮 Formulas and Functions**
- **❎ Data Validation**
- **🗂️ Excel Tables**
- **📊 Pivot Tables and Pivot Charts**
- **🎛️ Slicers**
- **🔍 XLOOKUP and GETPIVOTDATA**
- **🧮 COUNTIFS, AVERAGEIFS, SUMIFS and IFS**
- **🧮 DAX**
- **🔍 Power Query**
- **💪 Power Pivot**
