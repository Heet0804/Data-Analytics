# 🚲 Project 5: Bike Sales Dashboard

An interactive Excel dashboard that studies 1,026 customers and shows who buys a bike and who does not. It covers income, gender, commute distance and age, and every chart updates when you click a slicer for Marital Status, Region or Education.

![Bike Sales Dashboard](../../Images/Project%20-%205%20Excel/5.%20Dashboard.png)

## ❓ Questions the Dashboard Answers

- Do customers who buy a bike earn more than those who do not?
- Does income differ between male and female customers?
- Does commute distance affect who buys a bike?
- Which age group buys the most bikes?
- Do the answers change by marital status, region or education?

## 🗂️ Dataset

- 🧾 A practice dataset of **1,026 customers**, one row per customer.
- 📋 14 columns: ID, marital status, gender, income, children, education, occupation, home owner, cars, commute distance, region, age, age bracket and purchased bike (Yes or No).
- 🌍 3 regions: North America, Europe and Pacific.
- 🎓 5 education levels, from Partial High School to Graduate Degree.
- 🚗 5 commute bands, from 0-1 miles to 10+ miles.
- 🔧 The `Age Brackets` column is built with a formula from the age (see below).

## 🔎 Key Findings

Numbers below are for all 1,026 rows (no slicers selected).

- 🚲 **495 of 1,026 customers (48.2%) bought a bike.** The split is almost even, so there is no "typical" buyer from one number alone.
- 💰 **Buyers earn only slightly more.** Average income is 57,475 for buyers against 55,028 for non-buyers, a gap of about 4%. Income is a weak signal.
- 👨‍👩 **Men earn more than women on average** (58,000 against 54,331). In both groups, buyers earn more than non-buyers (men by about 3,100, women by about 1,800).
- 🧑 **Middle Age customers (31 to 54) are the core buyers.** They are 393 of the 495 buyers (79%) and 54.7% of them bought a bike. Old customers (55+) buy at 31.3% and the youngest group at 36.6%.
- 📍 **Short commutes buy the most in total.** 0-1 miles has the most buyers (207). The best buying rate is 2-5 miles (58.6%), and the worst is 10+ miles (29.2%).
- 🚶 **Long commutes buy the least.** Only 33 of 113 customers with a 10+ mile commute bought a bike.

> The workbook shows counts and averages only. The buying rates above (like 54.7% or 29.2%) are my own calculation from the same table, so they are not shown on the dashboard itself.

## 📊 The Three Charts

### 1. Avg Income Per Purchase
Clustered column chart of average income by gender, split by whether the customer bought a bike. Female customers average 53,450 (No) and 55,267 (Yes). Male customers average 56,520 (No) and 59,603 (Yes).

![Avg Income Per Purchase](../../Images/Project%20-%205%20Excel/5%20Avg%20Income%20Per%20Purchase.png)

### 2. Customer Commute
Line chart of the number of customers in each commute band, split into No and Yes. Customers with a 0-1 mile commute are the largest group (378). Those with 10+ miles are the smallest (113).

![Customer Commute](../../Images/Project%20-%205%20Excel/5.%20Customer%20Commute.png)

### 3. Customer Age Brackets
Line chart of customers by age bracket, split into No and Yes. Middle Age is the biggest group (719), followed by Old (195) and Adolescent (112). Only in Middle Age do buyers (393) outnumber non-buyers (326).

![Customer Age Brackets](../../Images/Project%20-%205%20Excel/5.%20Customer%20Age%20Brackets.png)

## ⚙️ How the Dashboard Is Built

1. **Clean table:** The data sits in an Excel table named `BIKE`. All pivot tables read from this table, so they stay linked to it.
2. **Age bracket formula:** A formula in the table groups each customer by age:
   ```
   =IF(BIKE[[#This Row],[Age]]>54,"Old",
    IF(BIKE[[#This Row],[Age]]>=31,"Middle Age",
    IF(BIKE[[#This Row],[Age]]<31,"Adolescent","Invalid")))
   ```
   Age above 54 is Old, 31 to 54 is Middle Age, and below 31 is Adolescent. Anything else shows "Invalid".
3. **Pivot tables:** Three pivot tables on the `Pre-Dashboard` sheet feed the three charts: average income by gender, customer count by commute distance and customer count by age bracket. Each one is split by `Purchased Bike`.
4. **Slicers:** Marital Status, Region and Education slicers are connected to all three pivot tables, so every chart changes together.
5. **Dashboard sheet:** The title, charts and slicers are placed on one page.

## 🗒️ Workbook Structure

- 📄 `Data`: raw customer data (Excel Table named `BIKE`)
- 📄 `Pre-Dashboard`: the three pivot tables and their charts
- 📄 `Dashboard`: the final one-page dashboard with slicers

## ⚠️ Limitations

- **The data has 26 duplicate rows.** The table has 1,026 rows but only 1,000 unique customers, and I did not remove the duplicates before building the pivots. After removing them, 481 of 1,000 (48.1%) bought a bike, and the findings stay almost the same, but the counts on the dashboard are slightly too high.
- **The "Adolescent" label is wrong.** The youngest customer is 25, so this group is really young adults (under 31), not adolescents.
- **This shows links, not causes.** A short commute or middle age goes with buying a bike. It does not prove that either one causes it.
- **Income is not adjusted for region or currency.** The data does not say which currency is used.
- **The dashboard shows counts, not rates.** A bigger bar can just mean a bigger group (for example, there are far more Middle Age customers than Old ones).

## 🚀 How to Use

1. Open [Project-5.xlsx](Project-5.xlsx) in Excel (Excel 2010 or later is needed for slicers).
2. Go to the `Dashboard` sheet.
3. Click a Marital Status, Region or Education option to filter all three charts. Hold Ctrl to select more than one.
4. Use the clear-filter icon on a slicer to go back to all customers.

## 🛠️ Skills Used

- 📊 PivotTables and PivotCharts
- 🎛️ Slicers connected to multiple pivots
- 🗂️ Excel tables with structured references
- 🧮 Nested IF formulas
- 🎨 Dashboard layout and formatting

## 📁 Files

- 📗 **Workbook:** [Project-5.xlsx](Project-5.xlsx)

## 🔙 Back to Main

[Excel Data Analytics](../README.md)
