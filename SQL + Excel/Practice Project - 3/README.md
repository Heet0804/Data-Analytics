# 🛒 E-Commerce Orders Analysis (SQL + Excel)

A two-step project. First, a **MySQL table** of 48,360 orders from an Indian online marketplace (all of 2025) is loaded and queried to answer 13 business questions. Then the results are taken into **Excel** and turned into a one-page dashboard.

![E-Commerce Dashboard](../../Images/Project%20-%203%20SQL%20%2B%20Excel/3.%20Dashboard.png)

## Dataset

The data is stored in the `E_COMMERCE` database, in one table called `ecommerce_orders`. Each row is one order, and every order ends up as delivered, returned or cancelled.

- 🛒 **48,360 orders** from 1 January 2025 to 31 December 2025.
- ✅ **40,281 delivered**, ↩️ **4,830 returned** and ❌ **3,249 cancelled** orders.
- 🏙️ **12 cities** (Delhi, Mumbai, Bengaluru, Hyderabad, Chennai, Pune, Kolkata, Ahmedabad, Lucknow, Indore, Jaipur and Chandigarh).
- 🗂️ **8 categories:** Electronics, Fashion, Home & Kitchen, Sports & Fitness, Toys & Baby, Beauty & Personal Care, Grocery & Gourmet and Books & Stationery.
- 🏷️ **47 brands**, 👤 **16,064 customers** and 🏪 **320 sellers**.
- 💳 **5 payment modes:** UPI, Card, COD, Wallet and Net Banking.
- 🎉 **7 sale event values:** No Sale, plus six sales (Festive, Year End, Summer, Black Friday, Republic Day and Independence Day).
- 💸 **Discounts** from 0% to 60%.

> Revenue is counted **only for delivered orders**. Returned orders are refunded and cancelled orders never ship, but both keep their `order_value` in the data, so most revenue queries filter on `ORDER_STATUS = "DELIVERED"`.

## Schema

```
ECOMMERCE_ORDERS (one table, one row per order)
```

| Column | Type | Notes |
|---|---|---|
| `order_id` | `INT` (primary key) | Unique order number |
| `customer_id`, `seller_id` | `VARCHAR(10)` | IDs only, no separate customer or seller table |
| `order_date`, `order_time` | `DATE`, `TIME` | |
| `city`, `category`, `brand` | `VARCHAR` | 12 cities, 8 categories, 47 brands |
| `quantity`, `unit_price`, `discount_pct`, `shipping_fee` | numbers | Discount is 0 to 60% |
| `order_value` | `DECIMAL(12,2)` | Quantity × unit price after discount, plus the shipping fee |
| `payment_mode`, `order_status`, `sale_event` | `VARCHAR` | Status is Delivered, Returned or Cancelled |
| `cancel_return_reason` | `VARCHAR(30)` | `NULL` for the 40,281 delivered orders |
| `delivery_days` | `INT` | `NULL` for the 3,249 cancelled orders |
| `customer_rating` | `INT` | `NULL` for 10,947 orders (3,249 cancelled plus 7,698 shipped orders that were not rated: 6,865 delivered and 833 returned) |

## Files in This Project

| File | Purpose |
|---|---|
| `ecommerce_orders.csv` | The raw data, 48,360 rows |
| `Database_Creation.sql` | Creates the `E_COMMERCE` database and the `ecommerce_orders` table, loads the CSV and runs three check queries |
| `E_Commerce_Analysis_Scripts.sql` | All the solving queries, grouped A to M (the first group A holds 8 KPI queries) |
| `ECOMMERCE ORDERS SQL QUERIES.docx` | Step-by-step write-up of the setup, the questions and the query outputs |
| `ecommerce_orders excel file.xlsx` | The same data in Excel, used as the starting point for the dashboard |
| `E-Commerce_Orders_Analysis.xlsx` | The finished Excel dashboard |
| `dashboard_background_final_2765x1016.png` | Background image used on the dashboard |

## Dashboard

The Excel dashboard takes the results of A, B, C, D, E, F, G, H, I, K, L and M and puts them on one page, with slicers for month, city, category and payment mode. J is answered in SQL only. The numbers below are for the full year, with no slicer applied.

### 1️⃣ KPIs (A)

- **Total revenue: ₹9,08,38,804** (about ₹9.08 crore) from delivered orders.
- **48,360 orders placed**, of which **40,281 were delivered**.
- **Average order value: ₹2,255.13**.
- **Cancellation rate: 6.72%** of all orders, which is about 1 in every 15.
- **Return rate: 10.71%** of shipped orders (delivered plus returned), which is about 1 in every 9.
- **Average customer rating: 4.40** (taken only from delivered orders that have a rating).
- **Average delivery time: 3.25 days** (taken from delivered and returned orders).

| **Daily trend for total orders (B)** | **Hourly trend for orders and discounts (C)** |
|:---:|:---:|
| <img src="../../Images/Project%20-%203%20SQL%20%2B%20Excel/3.%20Daily%20Trend%20for%20Total%20Orders.png" width="450" alt="Daily Trend for Total Orders"> | <img src="../../Images/Project%20-%203%20SQL%20%2B%20Excel/3.%20Hourly%20trend%20for%20orders%20and%20discounts.png" width="450" alt="Hourly Trend for Orders and Discounts"> |

### 2️⃣ Daily trend for total orders (B)

- **Sunday is the busiest day** with 7,989 orders, followed by **Saturday** with 7,676.
- Monday and Tuesday are the quietest, with 6,368 orders each.
- The gap between the best and the worst day is about 25%. Saturday and Sunday together bring about 32% of all orders, against 29% if the days were equal.

### 3️⃣ Hourly trend for orders and discounts (C)

- The big rush is in the **late evening, 8 to 10 PM.** **9 PM is the busiest hour** with 4,339 orders, then 8 PM with 3,994 and 10 PM with 3,736.
- There is a smaller midday peak at 11 AM and 12 PM, with about 2,800 orders an hour.
- The quietest hour is 4 AM with 228 orders.
- The average discount stays flat all day, between **19.2% and 20.5%**, so the rush hours are not driven by deeper discounts.

| **% of revenue by category (D)** | **Top 10 cities by revenue (E)** |
|:---:|:---:|
| <img src="../../Images/Project%20-%203%20SQL%20%2B%20Excel/3.%20%25%20of%20revenue%20by%20category.png" width="450" alt="% of Revenue by Category"> | <img src="../../Images/Project%20-%203%20SQL%20%2B%20Excel/3.%20Top%2010%20cities%20by%20revenue.png" width="450" alt="Top 10 Cities by Revenue"> |

### 4️⃣ % of revenue by category (D)

- **Electronics** earns more than half of the revenue, **54.28%** (about ₹4.93 crore), followed by **Fashion** with **13.62%** and **Home & Kitchen** with **12.10%**.
- These top three categories bring in **80%** of the revenue.
- Sports & Fitness (7.95%), Toys & Baby (4.10%), Beauty & Personal Care (3.33%), Grocery & Gourmet (2.96%) and Books & Stationery (1.66%) share the remaining 20%.
- Fashion ships more orders than Electronics (10,865 against 9,150) but earns only about a quarter of the revenue, because each Fashion order is worth much less.

### 5️⃣ Top 10 cities by revenue (E)

- **Delhi** is the top earner with about **₹1.53 crore** from 6,379 delivered orders.
- **Mumbai** (₹1.29 crore, 5,964 orders) and **Bengaluru** (₹1.23 crore, 5,523 orders) follow. These three cities bring in **44.7%** of the revenue.
- The next ones are Hyderabad (₹84.4 lakh) and Chennai (₹78.8 lakh).
- The data has only 12 cities, so the top 10 hold 92.8% of the revenue. Only Jaipur and Chandigarh are left out.

| **Monthly revenue trend (F)** | **Return rate by category (G)** |
|:---:|:---:|
| <img src="../../Images/Project%20-%203%20SQL%20%2B%20Excel/3.%20Monthly%20Revenue%20Trend.png" width="450" alt="Monthly Revenue Trend"> | <img src="../../Images/Project%20-%203%20SQL%20%2B%20Excel/3.%20Return%20rate%20by%20category.png" width="450" alt="Return Rate by Category"> |

### 6️⃣ Monthly revenue trend (F)

- **October is the best month** with about **₹1.24 crore** from 5,754 delivered orders, which is 55% more than September (₹80.0 lakh).
- The festive months of October and November bring in about **₹2.20 crore, or 24.3% of the year's revenue**. October to December together bring 33.4%.
- **February is the weakest** at about ₹56.5 lakh.
- From January to September, monthly revenue stays between ₹56 lakh and ₹80 lakh, so the festive sales lift the year in a clear step.

### 7️⃣ Return rate by category (G)

- **Fashion has by far the highest return rate at 26.04%**, with 2,829 of its 10,865 shipped orders coming back. That is about 2.4 times the overall rate of 10.71%.
- Sports & Fitness (9.66%) and Electronics (7.58%) come next.
- **Grocery & Gourmet is the lowest at 1.34%**, then Books & Stationery at 2.49%.
- Fashion alone makes up **58.6% of all 4,830 returns**.

| **Why orders are cancelled (H)** | **% of orders by payment mode (I)** |
|:---:|:---:|
| <img src="../../Images/Project%20-%203%20SQL%20%2B%20Excel/3.%20Why%20orders%20are%20cancelled%20.png" width="450" alt="Why Orders Are Cancelled"> | <img src="../../Images/Project%20-%203%20SQL%20%2B%20Excel/3.%20%25%20of%20orders%20by%20payment%20mode.png" width="450" alt="% of Orders by Payment Mode"> |

### 8️⃣ Why orders are cancelled (H)

- **Changed Mind is the top reason at 29.67%** (964 orders), then Found Cheaper Elsewhere at 17.67% (574), Delayed Delivery at 15.70% (510) and Ordered by Mistake at 11.91% (387).
- Seller Cancelled (9.45%), Out of Stock (8.74%) and Payment Issue (6.86%) make up the rest.
- About **59% of cancellations are the customer's own choice** (Changed Mind, Found Cheaper Elsewhere and Ordered by Mistake). Seller Cancelled and Out of Stock together add another 18.2%.

### 9️⃣ % of orders by payment mode (I)

- **UPI is the favourite** with **42.46%** of all orders, then Card at 25.13%.
- COD follows at 17.54%, Wallet at 7.48% and Net Banking at 7.38%.
- Everything except COD is paid online, which makes up about 82% of orders.

| **Top 5 brands by revenue (K)** | **Bottom 5 brands (L)** |
|:---:|:---:|
| <img src="../../Images/Project%20-%203%20SQL%20%2B%20Excel/3.%20Top%205%20brands%20by%20revenue.png" width="450" alt="Top 5 Brands by Revenue"> | <img src="../../Images/Project%20-%203%20SQL%20%2B%20Excel/3.%20Bottom%205%20brands.png" width="450" alt="Bottom 5 Brands"> |

### 🔟 Top 5 brands by revenue (K)

- **Apple** is far ahead with about **₹1.72 crore** from 999 delivered orders, which is 18.9% of the total revenue.
- The rest of the top 5 are Samsung (₹79.6 lakh), OnePlus (₹74.1 lakh), Realme (₹52.4 lakh) and Xiaomi (₹42.9 lakh).
- **All five are Electronics brands.**
- Apple earns more than twice as much as Samsung with fewer orders (999 against 1,533), because each Apple order is worth much more.

### 1️⃣1️⃣ Bottom 5 brands (L)

- The five lowest earners are **Camlin** (₹2.17 lakh from 398 orders), **HarperCollins** (₹2.29 lakh), **Navneet** (₹2.69 lakh), **Penguin** (₹3.57 lakh) and **Amul** (₹3.76 lakh).
- **Four of the five are Books & Stationery brands.** Amul (Grocery & Gourmet) is the exception.
- These brands sell low-priced items, so they earn little even with 400 to 630 orders each. Apple earns about 79 times as much as Camlin.

| **Top 5 sellers by revenue (M)** |
|:---:|
| <img src="../../Images/Project%20-%203%20SQL%20%2B%20Excel/3.Top%205%20sellers%20by%20revenue.png" width="450" alt="Top 5 Sellers by Revenue"> |

### 1️⃣2️⃣ Top 5 sellers by revenue (M)

- **SE065** is the top seller with about **₹28.2 lakh** from 1,123 delivered orders and a rating of 4.41. That is about 3.1% of the total revenue, out of 320 sellers.
- The next four are SE229 (₹22.6 lakh, 4.41), SE135 (₹18.6 lakh, 4.39), SE148 (₹16.6 lakh, 4.35) and SE282 (₹14.6 lakh, 4.37).
- All five are rated between 4.35 and 4.41, close to the overall average of 4.40, so the top sellers earn more by selling more, not by being rated higher.

### 🔎 Findings from the other query (not on the dashboard)

- **Discount impact (J):** Deeper discounts bring more cancellations and returns, and lower order values.
- **Cancellations** rise from **5.62%** with no discount to 6.30% with a low discount (5% to 20%), 7.20% with a medium discount (25% to 40%) and **9.18%** with a high discount (50% to 60%).
- **Returns** go from 8.18% with no discount to 8.78% (low), 13.25% (medium) and **16.70%** (high), so the high band returns about **twice** as often.
- **Average order value** is ₹2,499.73 with no discount and ₹2,551.63 with a low discount, then falls to ₹1,954.90 (medium) and ₹1,069.37 (high), less than half.
- The **low band is the sweet spot:** it is the biggest band (22,614 orders), with the highest average order value and returns close to the no-discount level. Only 3,922 orders (about 8%) fall in the high band.

## Workflow

1. Place the CSV in the MySQL uploads folder and run `Database_Creation.sql`.
2. Check the row counts with the three check queries.
3. Solve groups A to M in `E_Commerce_Analysis_Scripts.sql`.
4. Pick the results that make the best charts and bring them into Excel.
5. Build the pivot tables, charts and KPI cards, add slicers for month, city, category and payment mode, and arrange them on one dashboard page with a background image.

## Limitations

- The data is **synthetic**. It is built to look like orders on an Indian online marketplace and is not a real company export.
- There is only **one table**, so the project does not practise joins. Customer and seller details are only IDs.
- `customer_rating` is blank for 10,947 orders, so the average rating of 4.40 is based on the 33,416 rated delivered orders only.
- Cancelled and returned orders keep their `order_value`, so revenue questions must filter on delivered orders. The revenue percentage query (D) divides by the delivered-order total for this reason.
- The return rate and the delivery days are worked out on shipped orders (delivered plus returned), because cancelled orders never ship.
- The `sale_event` column is in the data, but none of the queries use it, so the effect of each individual sale is not measured.
- The data covers one year, so year-on-year growth cannot be measured.

## Skills Used

- **🗄️ MySQL:** `CREATE TABLE`, `LOAD DATA INFILE`, `NULLIF`, `STR_TO_DATE`
- **🧮 Aggregation:** `COUNT`, `SUM`, `AVG`, `GROUP BY`, `ORDER BY`, `LIMIT`
- **🔀 Conditional logic:** `CASE WHEN` for cancellation rates, return rates and discount bands
- **🕒 Date and time functions:** `DAYNAME`, `MONTHNAME`, `MONTH`, `HOUR`
- **🧩 Subqueries:** percentages of a total and a derived table for discount bands
- **📊 Excel:** pivot tables, charts, slicers, KPI cards and dashboard design

## 🔙 Back

[SQL + Excel](../README.md)
