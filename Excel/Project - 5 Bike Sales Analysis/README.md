# 🚲 Project 5: Bike Sales Dashboard

An interactive Excel dashboard that shows who buys a bike. It studies 1,026 customers and compares buyers with non-buyers by income, gender, commute distance and age. Slicers for Marital Status, Region and Education update all three charts at once.

![Bike Sales Dashboard](../Images/5.%20Dashboard.png)

## ❓ Questions the Dashboard Answers

- Do bike buyers earn more than non-buyers?
- Does gender affect income or the decision to buy?
- How does commute distance relate to buying a bike?
- Which age group buys the most bikes?
- Do the answers change by marital status, region or education?

## 🗂️ Dataset

- 🚲 A practice dataset of bike buyers, used here for learning.
- 👥 1,026 customer rows and 14 columns.
- 🧾 Columns: ID, marital status, gender, income, children, education, occupation, home owner, cars, commute distance, region, age, age bracket and purchased bike (Yes or No).
- 🔧 `Age Brackets` is a helper column built with a formula:
    - **Adolescent:** age below 31
    - **Middle Age:** age 31 to 54
    - **Old:** age above 54
- 🌍 3 regions: Europe, North America and Pacific.
- 📏 5 commute bands: 0-1, 1-2, 2-5, 5-10 and 10+ miles.

## 🔎 Key Findings

Numbers below are for all 1,026 rows, with no slicers selected.

- 🛒 **495 of 1,026 customers (48.2%) bought a bike.** The split is almost even.
- 💰 **Buyers earn a little more than non-buyers.** Average income is 57,475 for buyers and 55,028 for non-buyers. That is a gap of about 2,450, or 4.4%. This is a small difference.
- 🚻 **Gender barely changes the decision to buy.** 48.5% of women and 48.0% of men bought a bike.
- 💵 **Men earn more than women in this data.** Average income is 58,000 for men and 54,331 for women. Buyers earn more than non-buyers in both groups.
- 📍 **Short commutes buy more, but not in a straight line.** 2-5 miles has the best rate (58.6%), then 0-1 miles (54.8%). The rate drops to 29.2% for 10+ miles.
- 🧑 **Middle-aged customers are the core buyers.** The Middle Age group (31 to 54) bought 393 bikes, which is 79% of all buyers. Their buying rate is 54.7%, against 36.6% for Adolescent and 31.3% for Old.

> Use the slicers to see more. For example, Pacific customers buy at 58.9% (119 of 202), while North America buys at 43.3% (220 of 508).

## 📊 The Three Charts

### 1. Avg Income Per Purchase
Average income by gender, split into customers who bought (Yes) and did not buy (No). Buyers earn more than non-buyers for both genders.

| Gender | Did not buy | Bought |
|---|---|---|
| Female | 53,450 | 55,267 |
| Male | 56,520 | 59,603 |

![Avg Income Per Purchase](../Images/5%20Avg%20Income%20Per%20Purchase.png)

### 2. Customer Commute
Number of customers in each commute band, split by Yes and No.

| Commute | Did not buy | Bought | Buying rate |
|---|---|---|---|
| 0-1 Miles | 171 | 207 | 54.8% |
| 1-2 Miles | 93 | 83 | 47.2% |
| 2-5 Miles | 67 | 95 | 58.6% |
| 5-10 Miles | 120 | 77 | 39.1% |
| 10+ Miles | 80 | 33 | 29.2% |

![Customer Commute](../Images/5.%20Customer%20Commute.png)

### 3. Customer Age Brackets
Number of customers in each age bracket, split by Yes and No.

| Age bracket | Did not buy | Bought | Buying rate |
|---|---|---|---|
| Adolescent | 71 | 41 | 36.6% |
| Middle Age | 326 | 393 | 54.7% |
| Old | 134 | 61 | 31.3% |

![Customer Age Brackets](../Images/5.%20Customer%20Age%20Brackets.png)

## ⚙️ How the Dashboard Is Built

1. **Clean table:** The data sits in an Excel table named `BIKE`, on the `Data` sheet.
2. **Helper column:** `Age Brackets` uses a nested `IF` formula with structured references to group ages.
3. **Pivot tables:** Three pivot tables on the `Pre-Dashboard` sheet feed the charts:
    - Average of Income by Gender, split by Purchased Bike
    - Count of Purchased Bike by Commute Distance
    - Count of Purchased Bike by Age Brackets
4. **Slicers:** Marital Status, Region and Education slicers are connected to all three pivot tables, so every chart changes together.
5. **Dashboard sheet:** The three charts and slicers sit under a title banner, with gridlines hidden.

## 📁 Workbook Structure

- 📄 `Data`: raw customer data (Excel Table named `BIKE`)
- 📄 `Pre-Dashboard`: the three pivot tables
- 📄 `Dashboard`: the final one-page dashboard

## ⚠️ Limitations

- 🔁 **The data has 26 exact duplicate rows** (same ID and same values in every column). The dashboard counts all 1,026 rows. Without the duplicates there are 1,000 customers and the buying rate is 48.1%, so the headline numbers hardly change.
- 🔗 **This shows links, not causes.** Short commutes go with higher buying rates, but the data cannot say that distance is the reason.
- 🏷️ **"Adolescent" is a loose label.** The youngest customer is 25, so this group is really young adults under 31.
- 🌐 **Small groups can mislead.** After you apply two or three slicers, some groups have very few customers, so rates swing widely.
- 📅 The dataset has no date column, so it cannot show trends over time.

## 🧭 How to Use

1. Open [Project-5.xlsx](Project-5.xlsx) in Excel.
2. Go to the `Dashboard` sheet.
3. Click a Marital Status, Region or Education value in the slicers.
4. Hold `Ctrl` while clicking to select more than one value.

## 🛠️ Skills Used

- 🗂️ Excel Tables with structured references
- 🧮 Nested `IF` formulas
- 📊 PivotTables and PivotCharts
- 🎛️ Slicers connected to multiple pivots
- 🎨 Dashboard layout and formatting

## 📁 Files

- 📗 **Workbook:** [Project-5.xlsx](Project-5.xlsx)

## 🔙 Back to Main

[Excel Data Analytics](../README.md)
