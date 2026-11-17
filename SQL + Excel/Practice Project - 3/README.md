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

The Excel dashboard puts the results of A to I and K to M on one page, with slicers for month, city, category and payment mode. J is answered in SQL only. The numbers below are for the full year, with no slicer applied.

### 1️⃣ KPIs (A)

- **Total revenue: ₹9,08,38,804** (about ₹9.08 crore) from delivered orders.
- **48,360 orders placed**, of which **40,281 were delivered**.
- **Average order value: ₹2,255.13**.
- **Cancellation rate: 6.72%** of all orders (about 1 in 15).
- **Return rate: 10.71%** of shipped orders (about 1 in 9).
- **Average customer rating: 4.40** and **average delivery time: 3.25 days**.

<table>
  <tr><th width="50%">2️⃣ Daily trend for total orders (B)</th><th width="50%">3️⃣ Hourly trend for orders and discounts (C)</th></tr>
  <tr><td align="center"><img src="../../Images/Project%20-%203%20SQL%20%2B%20Excel/3.%20Daily%20Trend%20for%20Total%20Orders.png" width="450" alt="Daily trend for total orders"></td><td align="center"><img src="../../Images/Project%20-%203%20SQL%20%2B%20Excel/3.%20Hourly%20Trend%20for%20Orders%20%26%20Discounts.png" width="450" alt="Hourly trend for orders and discounts"></td></tr>
  <tr><td valign="top"><ul><li><b>Sunday is the busiest day</b> with 7,989 orders, then Saturday with 7,676.</li><li>Monday and Tuesday are the quietest, with 6,368 orders each.</li><li>Weekends bring about 32% of all orders.</li></ul></td><td valign="top"><ul><li><b>9 PM is the busiest hour</b> with 4,339 orders. The rush runs from 8 to 10 PM.</li><li>4 AM is the quietest hour, with 228 orders.</li><li>The average discount stays flat at 19% to 20.5%, so discounts do not drive the rush.</li></ul></td></tr>
</table>

<table>
  <tr><th width="50%">4️⃣ % of revenue by category (D)</th><th width="50%">5️⃣ Top 10 cities by revenue (E)</th></tr>
  <tr><td align="center"><img src="../../Images/Project%20-%203%20SQL%20%2B%20Excel/3.%20%25%20of%20Revenue%20by%20Category.png" width="450" alt="% of revenue by category"></td><td align="center"><img src="../../Images/Project%20-%203%20SQL%20%2B%20Excel/3.%20Top%2010%20Cities%20by%20Revenue.png" width="450" alt="Top 10 cities by revenue"></td></tr>
  <tr><td valign="top"><ul><li><b>Electronics earns 54.28%</b> of the revenue (about ₹4.93 crore).</li><li>Fashion (13.62%) and Home &amp; Kitchen (12.10%) follow. The top three bring 80%.</li><li>Books &amp; Stationery is the lowest at 1.66%.</li></ul></td><td valign="top"><ul><li><b>Delhi leads</b> with about ₹1.53 crore from 6,379 delivered orders.</li><li>Mumbai (₹1.29 crore) and Bengaluru (₹1.23 crore) follow. The top three bring 44.7%.</li><li>The data has only 12 cities, so the top 10 hold 92.8% of the revenue.</li></ul></td></tr>
</table>

<table>
  <tr><th width="50%">6️⃣ Monthly revenue trend (F)</th><th width="50%">7️⃣ Return rate by category (G)</th></tr>
  <tr><td align="center"><img src="../../Images/Project%20-%203%20SQL%20%2B%20Excel/3.%20Monthly%20Revenue%20Trend.png" width="450" alt="Monthly revenue trend"></td><td align="center"><img src="../../Images/Project%20-%203%20SQL%20%2B%20Excel/3.%20Return%20Rate%20by%20Category.png" width="450" alt="Return rate by category"></td></tr>
  <tr><td valign="top"><ul><li><b>October is the best month</b> with about ₹1.24 crore, 55% more than September.</li><li>October and November together bring 24.3% of the year's revenue.</li><li>February is the weakest, at about ₹56.5 lakh.</li></ul></td><td valign="top"><ul><li><b>Fashion has the highest return rate at 26.04%</b> (2,829 of 10,865 shipped orders), about 2.4 times the overall 10.71%.</li><li>Fashion makes up 58.6% of all returns.</li><li>Grocery &amp; Gourmet is the lowest at 1.34%.</li></ul></td></tr>
</table>

<table>
  <tr><th width="50%">8️⃣ Why orders are cancelled (H)</th><th width="50%">9️⃣ % of orders by payment mode (I)</th></tr>
  <tr><td align="center"><img src="../../Images/Project%20-%203%20SQL%20%2B%20Excel/3.%20Why%20Orders%20are%20Cancelled.png" width="450" alt="Why orders are cancelled"></td><td align="center"><img src="../../Images/Project%20-%203%20SQL%20%2B%20Excel/3.%20%25%20of%20Orders%20by%20Payment%20Mode.png" width="450" alt="% of orders by payment mode"></td></tr>
  <tr><td valign="top"><ul><li><b>Changed Mind is the top reason</b> at 29.67%, then Found Cheaper Elsewhere (17.67%) and Delayed Delivery (15.70%).</li><li>About 59% of cancellations are the customer's own choice (Changed Mind, Found Cheaper Elsewhere, Ordered by Mistake).</li><li>Seller Cancelled and Out of Stock add another 18.2%.</li></ul></td><td valign="top"><ul><li><b>UPI is the favourite</b> with 42.46% of orders, then Card with 25.13%.</li><li>COD is 17.54%, Wallet 7.48% and Net Banking 7.38%.</li><li>Online payments make up about 82% of orders.</li></ul></td></tr>
</table>

<table>
  <tr><th width="50%">🔟 Top 5 brands by revenue (K)</th><th width="50%">1️⃣1️⃣ Bottom 5 brands (L)</th></tr>
  <tr><td align="center"><img src="../../Images/Project%20-%203%20SQL%20%2B%20Excel/3.%20Top%205%20Brands%20by%20Revenue.png" width="450" alt="Top 5 brands by revenue"></td><td align="center"><img src="../../Images/Project%20-%203%20SQL%20%2B%20Excel/3.%20Bottom%205%20Brands.png" width="450" alt="Bottom 5 brands"></td></tr>
  <tr><td valign="top"><ul><li><b>Apple leads</b> with about ₹1.72 crore (18.9% of revenue) from 999 orders.</li><li>Samsung (₹79.6 lakh), OnePlus (₹74.1 lakh), Realme (₹52.4 lakh) and Xiaomi (₹42.9 lakh) follow.</li><li>All five are Electronics brands.</li></ul></td><td valign="top"><ul><li><b>Camlin</b> (₹2.17 lakh), HarperCollins (₹2.29 lakh), Navneet (₹2.69 lakh), Penguin (₹3.57 lakh) and Amul (₹3.76 lakh).</li><li>Four of the five are Books &amp; Stationery brands.</li><li>They sell low-priced items, so they earn little even with 400 to 630 orders each.</li></ul></td></tr>
</table>

<table>
  <tr><th>1️⃣2️⃣ Top 5 sellers by revenue (M)</th></tr>
  <tr><td align="center"><img src="../../Images/Project%20-%203%20SQL%20%2B%20Excel/3.Top%205%20Sellers%20by%20Revenue.png" width="450" alt="Top 5 sellers by revenue"></td></tr>
  <tr><td valign="top"><ul><li><b>SE065 leads</b> with about ₹28.2 lakh from 1,123 orders (rating 4.41), about 3.1% of revenue across 320 sellers.</li><li>SE229 (₹22.6 lakh), SE135 (₹18.6 lakh), SE148 (₹16.6 lakh) and SE282 (₹14.6 lakh) follow.</li><li>All five are rated 4.35 to 4.41, close to the 4.40 average.</li></ul></td></tr>
</table>

### 🔎 Findings from the other query (not on the dashboard)

- **Discount impact (J):** Deeper discounts bring more cancellations and returns, and lower order values.
- Cancellations rise from **5.62%** (no discount) to **9.18%** (50% to 60% discount). Returns go from 8.18% to **16.70%**, about twice as often.
- The average order value is ₹2,499.73 with no discount and ₹2,551.63 with a low discount (5% to 20%), then falls to ₹1,069.37 in the high band.
- The **low band is the sweet spot:** it is the biggest band (22,614 orders) with the highest order value and returns close to the no-discount level.

## Workflow

1. Place the CSV in the MySQL uploads folder and run `Database_Creation.sql`.
2. Check the row counts with the three check queries.
3. Solve groups A to M in `E_Commerce_Analysis_Scripts.sql`.
4. Pick the results that make the best charts and bring them into Excel.
5. Build the pivot tables, charts and KPI cards, add slicers, and arrange them on one dashboard page with a background image.

## Limitations

- The data is **synthetic**. It is built to look like orders on an Indian online marketplace and is not a real company export.
- There is only **one table**, so the project does not practise joins. Customers and sellers are only IDs.
- `customer_rating` is blank for 10,947 orders, so the average rating of 4.40 is based on rated delivered orders only.
- Cancelled and returned orders keep their `order_value`, so revenue questions must filter on delivered orders.
- The `sale_event` column is in the data, but no query uses it, so the effect of each sale is not measured.
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
