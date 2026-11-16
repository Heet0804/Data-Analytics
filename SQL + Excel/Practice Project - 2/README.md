# 🚖 Ride Hailing Analysis (SQL + Excel)

A two-step project. First, a **MySQL table** of 48,260 Mumbai ride requests (Ola/Uber style, all of 2025) is loaded and queried to answer 13 business questions. Then the results are taken into **Excel** and turned into a one-page dashboard.

![Ride Hailing Dashboard](../../Images/Project%20-%202%20SQL%20%2B%20Excel/2.%20Dashboard.png)

## Dataset

The data is stored in the `RIDE_HAILING` database, in one table called `ride_trips`. Each row is one trip request, either completed or cancelled.

- 🚕 **48,260 trip requests** from 1 January 2025 to 31 December 2025.
- ✅ **42,397 completed** trips and ❌ **5,863 cancelled** trips.
- 📍 **19 areas of Mumbai** (Andheri, Bandra, BKC, Lower Parel, Thane, Airport T2 and others) used as pickup and drop points.
- 🚗 **5 vehicle types:** Auto, Bike, Mini, Sedan and SUV.
- 👤 **8,116 customers** and 🧑‍✈️ **700 drivers**.
- 💳 **4 payment modes:** UPI, Wallet, Cash and Card.
- 🌦️ **4 weather types:** Clear, Cloudy, Light Rain and Heavy Rain.
- ⚡ **Surge multipliers** from 1.0x to 2.5x.

> Revenue is counted **only for completed trips**. Cancelled trips have a fare of 0, so most revenue queries filter on `TRIP_STATUS = "COMPLETED"`.

## Schema

```
RIDE_TRIPS (one table, one row per trip request)
```

| Column | Type | Notes |
|---|---|---|
| `trip_id` | `INT` (primary key) | Unique trip number |
| `customer_id`, `driver_id` | `VARCHAR(10)` | `driver_id` can be blank |
| `trip_date`, `pickup_time` | `DATE`, `TIME` | |
| `pickup_area`, `drop_area` | `VARCHAR(30)` | 19 Mumbai areas |
| `vehicle_type` | `VARCHAR(10)` | Auto, Bike, Mini, Sedan, SUV |
| `distance_km`, `trip_duration_mins`, `pickup_wait_mins` | numbers | Duration is `NULL` for cancelled trips |
| `base_fare`, `surge_multiplier`, `total_fare` | numbers | `total_fare` is 0 for cancelled trips |
| `payment_mode`, `trip_status`, `weather` | `VARCHAR` | |
| `cancellation_reason` | `VARCHAR(25)` | `NULL` for completed trips |
| `driver_rating` | `INT` | `NULL` for 9,209 trips (5,863 cancelled plus 3,346 completed trips that were not rated) |

## Files in This Project

| File | Purpose |
|---|---|
| `ride_trips.csv` | The raw data, 48,260 rows |
| `Database_Creation.sql` | Creates the `RIDE_HAILING` database and the `ride_trips` table, loads the CSV and runs three check queries |
| `Ride_Hailing_Scripts.sql` | All the solving queries, grouped A to M (the first group A holds 7 KPI queries) |
| `RIDE TRIPS SQL QUERIES.docx` | Step-by-step write-up of the setup, the questions and the query outputs |
| `ride_trips excel file.xlsx` | The same data in Excel, used as the starting point for the dashboard |
| `Ride_Hailing_Dashboard.xlsx` | The finished Excel dashboard |
| `Ride Dashboard Background.jpg` | Background image used on the dashboard |

## Setup

1. Copy `ride_trips.csv` into the MySQL uploads folder. The script expects `C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/`. Change the path in `Database_Creation.sql` if yours is different.
2. Run `Database_Creation.sql`. It creates the table and loads the data.

```sql
SOURCE Database_Creation.sql;
```

3. Check the import. These three checks are at the end of the script:

```sql
SELECT COUNT(*), MIN(trip_date), MAX(trip_date) FROM ride_trips;   -- 48260, 2025-01-01, 2025-12-31
SELECT trip_status, COUNT(*) FROM ride_trips GROUP BY trip_status; -- Completed 42397, Cancelled 5863
SELECT COUNT(*) FROM ride_trips WHERE driver_rating IS NULL;       -- 9209
```

4. Open `Ride_Hailing_Scripts.sql` and run the queries one at a time. None of them changes the data, so they can be run in any order.

> The load script turns blank cells into `NULL` (`NULLIF`) and reads dates in both `dd-mm-yyyy` and `yyyy-mm-dd` format.

## The Questions

| Group | Question | Main SQL used |
|---|---|---|
| A | **KPIs:** revenue, trips requested, completed trips, average fare, average distance, cancellation rate, average rating | `SUM`, `COUNT`, `AVG`, `CASE` |
| B | Which days of the week are the busiest? | `DAYNAME`, `GROUP BY` |
| C | Which hours are the rush hours, and when does surge kick in? | `HOUR`, `AVG` |
| D | Which vehicle type brings in the most revenue (in %)? | Subquery for the total |
| E | Which 10 pickup areas earn the most? | `ORDER BY`, `LIMIT` |
| F | How does revenue move month by month? | `MONTHNAME`, `GROUP BY` |
| G | Does bad weather push up cancellations? | `CASE` inside `SUM` |
| H | Why are trips cancelled? | `GROUP BY`, percentage with subquery |
| I | How do customers prefer to pay? | `GROUP BY`, percentage with subquery |
| J | Does surge pricing hurt demand? | Subquery with `CASE` to build surge bands |
| K | Which 5 routes are the busiest? | `CONCAT`, `LIMIT` |
| L | Which 5 routes are the least booked? | `CONCAT`, `LIMIT` |
| M | Who are the top 5 drivers by earnings? | `GROUP BY` two columns, `AVG` |

## Dashboard

The Excel dashboard takes the results of A, B, C, D, E, F, G, I and K and puts them on one page. H, J, L and M are answered in SQL only.

### 1️⃣ KPIs (A)

![KPIs](../../Images/Project%20-%202%20SQL%20%2B%20Excel/2.%20KPI%27S.png)

- **Total revenue: ₹1,37,49,522** (about ₹1.37 crore) from completed trips.
- **48,260 trips requested**, of which **42,397 were completed**.
- **Average fare per trip: ₹324.30** and **average trip distance: 12.94 km**.
- **Cancellation rate: 12.15%**, which is about 1 in every 8 requests.
- **Average driver rating: 4.53** (taken only from completed trips that have a rating).

### 2️⃣ Trips by day of week (B)

![Trips by Day of Week](../../Images/Project%20-%202%20SQL%20%2B%20Excel/2.%20Trips%20by%20Day%20of%20Week.png)

- **Saturday is the busiest day** with 7,702 trips, followed by **Friday** with 7,353.
- Tuesday is the quietest with 6,454 trips.
- The gap between the best and the worst day is about 19%, so demand is fairly even, with a small lift towards the weekend.

### 3️⃣ Hourly trips and surge (C)

![Hourly Trips](../../Images/Project%20-%202%20SQL%20%2B%20Excel/2.%20Hourly%20Trips.png)

- There are **two rush periods:** the morning peak at **8 to 10 AM** (about 2,950 trips an hour at 8 and 9) and a bigger evening peak at **5 to 8 PM**.
- **7 PM is the busiest hour** with 3,916 trips, and 6 PM is close behind with 3,898.
- The quietest hours are 3 and 4 AM, with about 250 trips each.
- Surge is highest in the rush hours, at an average of about **1.21x**, and 8 PM reaches 1.23x. Outside the rush it stays near 1.08x.

### 4️⃣ Revenue by vehicle type (D)

![Revenue by Vehicle](../../Images/Project%20-%202%20SQL%20%2B%20Excel/2.%20Revenue%20by%20Vehicle.png)

- **Mini** earns the most with **33.3%** of the revenue, followed by **Sedan** with **29.9%** and **SUV** with **20.1%**.
- **Auto (8.7%)** and **Bike (8.0%)** together bring in under 17%.
- SUV has the fewest trips of the cars (5,113) but a much higher share of revenue, because each trip pays more.

### 5️⃣ Top 10 pickup areas by revenue (E)

![Top-10 Pickup Areas](../../Images/Project%20-%202%20SQL%20%2B%20Excel/2.%20Top-10%20Pickup%20Areas.png)

- **Lower Parel** is the top earner with about **₹13.8 lakh**, even though **Andheri** has more completed trips (4,880 against 3,668).
- The next ones are Andheri (₹11.7 lakh), Bandra (₹9.8 lakh), Thane (₹9.7 lakh) and Borivali (₹9.4 lakh).
- Thane and Borivali rank high with far fewer trips, which points to long and expensive rides from the suburbs.

### 6️⃣ Monthly revenue (F)

![Monthly Revenue](../../Images/Project%20-%202%20SQL%20%2B%20Excel/2.%20Monthly%20Revenue.png)

- **July is the best month** with about **₹13.9 lakh**, followed by August (₹13.7 lakh).
- **February is the weakest** at about ₹9.2 lakh.
- The four monsoon months (June to September) bring in about **₹53.3 lakh, or 39% of the year's revenue**, so the monsoon lifts demand and does not hurt it.

### 7️⃣ Cancellation rate by weather (G)

![Cancellation by Weather](../../Images/Project%20-%202%20SQL%20%2B%20Excel/2.%20Cancellation%20by%20Weather.png)

- **Heavy Rain has the highest cancellation rate at 18.7%**, then Light Rain at 15.6%.
- Clear (10.6%) and Cloudy (10.6%) are almost the same.
- Heavy Rain cancels nearly **1.8 times as often** as clear weather.

### 8️⃣ Payment mode (I)

![Payment Mode](../../Images/Project%20-%202%20SQL%20%2B%20Excel/2.%20Payment%20Mode.png)

- **UPI is the favourite** with **49.9%** of completed trips, which is about half.
- Wallet follows at 18.4%, Cash at 17.2% and Card at 14.5%.
- Digital payments (UPI, Wallet and Card) make up about 83% of trips.

### 9️⃣ Top 5 busiest routes (K)

![Top-5 Busiest Routes](../../Images/Project%20-%202%20SQL%20%2B%20Excel/2.%20Top-5%20Busiest%20Routes.png)

- **Andheri to Airport T2** is the busiest route with 682 completed trips, and the reverse direction is second with 615.
- The rest of the top 5 are Lower Parel to Bandra (604), Andheri to Powai (584) and Lower Parel to Dadar (580).
- **Lower Parel to Bandra** earns the most of the five, about ₹1.58 lakh, because the average fare on it is higher.

### 🔎 Findings from the other queries (not on the dashboard)

- **Why trips are cancelled (H):** Driver Cancelled is the top reason at **43.0%** (2,520 trips), then Customer Cancelled at 29.4%, No Driver Found at 18.4% and Customer No-Show at 9.3%. So more than 60% of cancellations come from the driver side or from no driver being available.
- **Surge impact (J):** Cancellations rise with surge, from **11.5%** with no surge to **12.8%** with low surge (1.2x to 1.5x) and **16.1%** with high surge (1.8x to 2.5x). The average fare goes from ₹268 to ₹386 to ₹710.
- **Bottom 5 routes (L):** Thane to Colaba (2 trips), Ghatkopar to Colaba (3), Mulund to Colaba (5), Malad to Colaba (6) and Mulund to Churchgate (7). Long cross-city routes to South Mumbai are rarely booked.
- **Top drivers (M):** DR0678 (SUV) earns the most at about ₹1.32 lakh from 227 trips, followed by DR0631 (Sedan), DR0578 (Sedan), DR0654 (SUV) and DR0687 (SUV). Three of the top five drive SUVs.

## Workflow

1. Place the CSV in the MySQL uploads folder and run `Database_Creation.sql`.
2. Check the row counts with the three check queries.
3. Solve groups A to M in `Ride_Hailing_Scripts.sql`.
4. Pick the results that make the best charts and bring them into Excel.
5. Build the charts and KPI cards and arrange them on one dashboard page with a background image.

## Limitations

- The data is **synthetic**. It is built to look like Ola/Uber trips in Mumbai and is not a real company export.
- There is only **one table**, so the project does not practise joins. Driver and customer details are only IDs.
- `driver_rating` is blank for 3,346 completed trips, so the average rating of 4.53 is based on rated trips only.
- Cancelled trips have a fare of 0, so revenue questions must filter on completed trips. The percentage queries (D, I) divide by the completed-trip totals for this reason.
- The data covers one year, so year-on-year growth cannot be measured.

## Skills Used

- **🗄️ MySQL:** `CREATE TABLE`, `LOAD DATA INFILE`, `NULLIF`, `STR_TO_DATE`
- **🧮 Aggregation:** `COUNT`, `SUM`, `AVG`, `GROUP BY`, `ORDER BY`, `LIMIT`
- **🔀 Conditional logic:** `CASE WHEN` for cancellation rates and surge bands
- **🕒 Date and time functions:** `DAYNAME`, `MONTHNAME`, `MONTH`, `HOUR`
- **🧩 Subqueries and string functions:** percentages of a total, `CONCAT` for routes
- **📊 Excel:** charts, KPI cards and dashboard design

## 🔙 Back

[SQL + Excel](../README.md)
