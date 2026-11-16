CREATE DATABASE IF NOT EXISTS RIDE_HAILING;
USE RIDE_HAILING;

DROP TABLE IF EXISTS ride_trips;
CREATE TABLE ride_trips (
  trip_id INT PRIMARY KEY, customer_id VARCHAR(10), driver_id VARCHAR(10) NULL,
  trip_date DATE, pickup_time TIME, pickup_area VARCHAR(30), drop_area VARCHAR(30),
  vehicle_type VARCHAR(10), distance_km DECIMAL(6,1), trip_duration_mins INT NULL,
  pickup_wait_mins INT, base_fare DECIMAL(10,2), surge_multiplier DECIMAL(3,1),
  total_fare DECIMAL(10,2), payment_mode VARCHAR(10), trip_status VARCHAR(12),
  cancellation_reason VARCHAR(25) NULL, driver_rating INT NULL, weather VARCHAR(12)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/ride_trips.csv'
INTO TABLE ride_trips
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(trip_id, customer_id, @driver_id, @trip_date, pickup_time, pickup_area, drop_area,
 vehicle_type, distance_km, @duration, pickup_wait_mins, base_fare, surge_multiplier,
 total_fare, payment_mode, trip_status, @reason, @rating, weather)
SET trip_date = IF(SUBSTRING(@trip_date,5,1) = '-', @trip_date, STR_TO_DATE(@trip_date, '%d-%m-%Y')),
    driver_id = NULLIF(@driver_id, ''),
    trip_duration_mins = NULLIF(@duration, ''),
    cancellation_reason = NULLIF(@reason, ''),
    driver_rating = NULLIF(@rating, '');
    
SELECT COUNT(*), MIN(trip_date), MAX(trip_date) FROM ride_trips;   -- 48260, 2025-01-01, 2025-12-31
SELECT trip_status, COUNT(*) FROM ride_trips GROUP BY trip_status; -- Completed 42397, Cancelled 5863
SELECT COUNT(*) FROM ride_trips WHERE driver_rating IS NULL;       -- 9209