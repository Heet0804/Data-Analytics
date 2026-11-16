🛒 E-Commerce Orders Analysis (SQL + Excel)
A two-step project. First, a MySQL table of 48,360 e-commerce orders from 2025 is loaded and queried to answer 13 groups of business questions. Then selected results are taken into Excel and turned into a one-page dashboard.

Dataset
The data is stored in the E_COMMERCE database, in one table called ecommerce_orders. Each row represents one order.
- 🛍️ 48,360 orders from 1 January to 31 December 2025.
- ✅ 40,281 delivered, ↩️ 4,830 returned and ❌ 3,249 cancelled orders.
- 🏷️ Product categories, brands, sellers, cities and sale events allow comparisons of performance.
- 💳 5 payment modes: UPI, Card, COD, Wallet and Net Banking.
- ⭐ Customer ratings, delivery times, discounts and cancellation/return reasons are included.
- 📦 Each order records its quantity, unit price, shipping fee and order value.
Revenue queries count delivered orders only. Return rates use delivered plus returned orders, while cancellation rates use all orders.

Schema
ECOMMERCE_ORDERS (one table, one row per order)
Column	Type	Notes
order_id	INT (primary key)	Unique order number
customer_id, seller_id	VARCHAR(10)	Customer and seller identifiers
order_date, order_time	DATE, TIME	When the order was placed
city, category, brand	VARCHAR	Location and product information
quantity, unit_price, discount_pct, shipping_fee, order_value	Numbers	Order and pricing details
payment_mode, order_status	VARCHAR	Payment method and order outcome
cancel_return_reason	VARCHAR(30)	NULL for delivered orders
delivery_days, customer_rating	INT	Delivery days are NULL for cancelled orders; ratings may be missing
sale_event	VARCHAR(25)	Sale or promotion event


Files in This Project
File	Purpose
ecommerce_orders.csv	Raw dataset containing 48,360 orders
Database_Creation.sql	Creates the database and table, loads the CSV and runs three checks
E_Commerce_Analysis_Scripts.sql	SQL solutions grouped A to M (group A contains 8 KPI queries)
ECOMMERCE ORDERS SQL QUERIES.docx	Written record of the SQL questions and analysis
ecommerce_orders excel file.xlsx	Dataset in Excel format
E-Commerce_Orders_Analysis.xlsx	Completed Excel dashboard and analysis
dashboard_background_final_2765x1016.png	Dashboard background image


Setup
1. Copy ecommerce_orders.csv into the MySQL uploads folder. The script uses C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/; change the path in Database_Creation.sql if needed.
2. Run Database_Creation.sql to create the E_COMMERCE database, create the ecommerce_orders table and load the CSV.
SOURCE Database_Creation.sql;
3. Check the import using the queries at the end of the setup script:
SELECT COUNT(*), MIN(order_date), MAX(order_date) FROM ecommerce_orders; -- 48360, 2025-01-01, 2025-12-31
SELECT order_status, COUNT(*) FROM ecommerce_orders GROUP BY order_status; -- Delivered 40281, Returned 4830, Cancelled 3249
SELECT COUNT(*) FROM ecommerce_orders WHERE customer_rating IS NULL; -- 10947
4. Open E_Commerce_Analysis_Scripts.sql and run the questions one at a time. They only read data and can be run in any order.
The load script handles dates in dd-mm-yyyy or yyyy-mm-dd format and converts blank reasons, delivery days and ratings into NULL.

The Questions
Group	Question	Main SQL used
A	KPIs: revenue, orders placed, delivered orders, average order value, cancellation rate, return rate, average rating and delivery days	SUM, COUNT, AVG, CASE
B	Which days of the week receive the most orders?	DAYNAME, GROUP BY
C	How do orders and discounts vary by hour?	HOUR, AVG
D	What percentage of delivered revenue comes from each category?	Subquery for total revenue
E	Which 10 cities generate the most delivered revenue?	ORDER BY, LIMIT
F	How does delivered revenue change month by month?	MONTHNAME, MONTH
G	Which categories have the highest return rates?	CASE inside SUM
H	Why are orders cancelled?	GROUP BY, percentage subquery
I	Which payment methods do customers use?	GROUP BY, percentage subquery
J	How do discount bands compare on cancellations, returns and order value?	Derived table, CASE
K	Which 5 brand/category pairs earn the most revenue?	GROUP BY, LIMIT
L	Which 5 brand/category pairs earn the least revenue?	GROUP BY, LIMIT
M	Which 5 sellers earn the most revenue?	GROUP BY, AVG


Dashboard
The Excel dashboard presents the KPIs and charts for daily orders, hourly orders and discounts, revenue by category, top cities, monthly revenue, return rates, payment modes, brands and sellers. Other questions are also answered in SQL.
1️⃣ KPIs (A)
- Total delivered revenue: ₹90,838,804.
- 48,360 orders placed, including 40,281 delivered orders.
- Average delivered order value: ₹2,255.13.
- Cancellation rate: 6.72% of all orders.
- Return rate: 10.71% of delivered plus returned orders.
- Average delivered customer rating: 4.40 (where a rating is available).
- Average delivery time: 3.25 days for delivered and returned orders.
2️⃣ Daily orders (B)

- Orders are grouped by weekday to compare the busiest and quietest days.
3️⃣ Hourly orders and discounts (C)

- Hourly order counts and average discounts are compared to show changes through the day.
4️⃣ Revenue by category (D)

- Category contributions are measured using delivered-order revenue only.
5️⃣ Top 10 cities (E)

- Cities are ranked by delivered-order revenue.
6️⃣ Monthly revenue (F)

- Monthly delivered revenue is ordered from January through December.
7️⃣ Return rate by category (G)

- Return rate is calculated from delivered and returned orders in each category.
8️⃣ Payment methods (I)

- UPI is the most-used payment method with 42.5% of all orders.
9️⃣ Brands and sellers (K, L, M)
Top 5 brands	Bottom 5 brands
<img src="../../Images/Project%20-%203%20SQL%20%2B%20Excel/3.%20Top%205%20brands%20by%20revenue.png" width="450" alt="Top brands">	<img src="../../Images/Project%20-%203%20SQL%20%2B%20Excel/3.%20Bottom%205%20brands.png" width="450" alt="Bottom brands">



- Brands are ranked by delivered revenue for each brand/category combination; sellers are ranked by delivered revenue.
🔎 Findings from the other queries

- Cancellation reasons (H): groups cancelled orders by reason and shows each reason's share of cancellations.
- Discount impact (J): compares no, low, medium and high discount bands for cancellation rate, return rate and average delivered order value.
Workflow
1. Place the CSV in the MySQL uploads folder and run Database_Creation.sql.
2. Check the row counts, date range and missing ratings.
3. Solve groups A to M in E_Commerce_Analysis_Scripts.sql.
4. Bring the useful query results into Excel and check the analysis.
5. Build charts and KPI cards, then arrange them on the dashboard background.
Limitations
- The supplied data covers 2025 only, so year-on-year comparisons are not possible.
- The database has one table, so this project does not practise joins between tables.
- 10,947 customer ratings are missing, so average rating calculations exclude blank ratings.
- Cancelled orders have no delivery days; return and cancellation rates use different denominators.
- The dataset's provenance is not established in the supplied files, so it should not be described as an official retailer export.
Skills Used
- 🗄️ MySQL: CREATE DATABASE, CREATE TABLE, LOAD DATA INFILE, NULLIF, STR_TO_DATE
- 🧮 Aggregation: COUNT, SUM, AVG, ROUND, GROUP BY, ORDER BY, LIMIT
- 🔀 Conditional logic: CASE WHEN for status rates and discount bands
- 🕒 Date and time functions: DAYNAME, MONTHNAME, MONTH, HOUR
- 🧩 Subqueries and derived tables: percentages and discount-band comparisons
- 📊 Excel: charts, KPI cards and dashboard design
🔙 Back
[SQL + Excel](../README.md)
