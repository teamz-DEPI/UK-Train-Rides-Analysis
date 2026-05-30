# Q1 Check missing values 
SELECT 
    COUNT(*) AS total_rows,
    SUM(CASE WHEN `Transaction ID` IS NULL OR TRIM(`Transaction ID`) = ''THEN 1 ELSE 0 END
    ) AS transaction_id_nulls,
    ROUND(100.0 * SUM(CASE WHEN `Transaction ID` IS NULL OR TRIM(`Transaction ID`) = ''THEN 1 ELSE 0 END) / COUNT(*),2
    ) AS transaction_id_null_percentage,
    SUM(CASE WHEN `Date of Purchase` IS NULL OR TRIM(`Date of Purchase`) = ''THEN 1 ELSE 0 END
    ) AS date_of_purchase_nulls,
    ROUND(100.0 * SUM(CASE WHEN `Date of Purchase` IS NULL OR TRIM(`Date of Purchase`) = ''THEN 1 ELSE 0 END) / COUNT(*),2
    ) AS date_of_purchase_null_percentage,
    SUM(CASE WHEN `Time of Purchase` IS NULL OR TRIM(`Time of Purchase`) = ''THEN 1 ELSE 0 END
    ) AS time_of_purchase_nulls,
    ROUND(100.0 * SUM(CASE WHEN `Time of Purchase` IS NULL OR TRIM(`Time of Purchase`) = ''THEN 1 ELSE 0 END) / COUNT(*),2
    ) AS time_of_purchase_null_percentage,
    SUM(CASE WHEN `Purchase Type` IS NULL OR TRIM(`Purchase Type`) = ''THEN 1 ELSE 0 END
    ) AS purchase_type_nulls,
    ROUND(100.0 * SUM(CASE WHEN `Purchase Type` IS NULL OR TRIM(`Purchase Type`) = ''THEN 1 ELSE 0 END) / COUNT(*),2
    ) AS purchase_type_null_percentage,
    SUM(CASE WHEN `Payment Method` IS NULL OR TRIM(`Payment Method`) = ''THEN 1 ELSE 0 END
    ) AS payment_method_nulls,
    ROUND(100.0 * SUM(CASE WHEN `Payment Method` IS NULL OR TRIM(`Payment Method`) = ''THEN 1 ELSE 0 END) / COUNT(*),2
    ) AS payment_method_null_percentage,
    SUM(CASE WHEN `Railcard` IS NULL OR TRIM(`Railcard`) = ''THEN 1 ELSE 0 END
    ) AS railcard_nulls,
    ROUND(100.0 * SUM(CASE WHEN `Railcard` IS NULL OR TRIM(`Railcard`) = ''THEN 1 ELSE 0 END) / COUNT(*),2
    ) AS railcard_null_percentage,
    SUM(CASE WHEN `Ticket Class` IS NULL OR TRIM(`Ticket Class`) = ''THEN 1 ELSE 0 END
    ) AS ticket_class_nulls,
    ROUND(100.0 * SUM(CASE WHEN `Ticket Class` IS NULL OR TRIM(`Ticket Class`) = ''THEN 1 ELSE 0 END) / COUNT(*),2
    ) AS ticket_class_null_percentage,
    SUM(CASE WHEN `Ticket Type` IS NULL OR TRIM(`Ticket Type`) = ''THEN 1 ELSE 0 END
    ) AS ticket_type_nulls,
    ROUND(100.0 * SUM(CASE WHEN `Ticket Type` IS NULL OR TRIM(`Ticket Type`) = ''THEN 1 ELSE 0 END) / COUNT(*),2
    ) AS ticket_type_null_percentage,
    SUM(CASE WHEN `Price` IS NULL THEN 1 ELSE 0 END) AS price_nulls,
    ROUND(100.0 * SUM(CASE WHEN `Price` IS NULL THEN 1 ELSE 0 END) / COUNT(*),2
    ) AS price_null_percentage,
    SUM(CASE WHEN `Departure Station` IS NULL OR TRIM(`Departure Station`) = ''THEN 1 ELSE 0 END
    ) AS departure_station_nulls,
    ROUND(100.0 * SUM(CASE WHEN `Departure Station` IS NULL OR TRIM(`Departure Station`) = ''THEN 1 ELSE 0 END) / COUNT(*),2
    ) AS departure_station_null_percentage,
    SUM(CASE WHEN `Arrival Destination` IS NULL OR TRIM(`Arrival Destination`) = ''THEN 1 ELSE 0 END
    ) AS arrival_destination_nulls,
    ROUND(100.0 * SUM(CASE WHEN `Arrival Destination` IS NULL OR TRIM(`Arrival Destination`) = ''THEN 1 ELSE 0 END) / COUNT(*),2
    ) AS arrival_destination_null_percentage,
    SUM(CASE WHEN `Date of Journey` IS NULL OR TRIM(`Date of Journey`) = ''THEN 1 ELSE 0 END
    ) AS date_of_journey_nulls,
    ROUND(100.0 * SUM(CASE WHEN `Date of Journey` IS NULL OR TRIM(`Date of Journey`) = ''THEN 1 ELSE 0 END) / COUNT(*),2
    ) AS date_of_journey_null_percentage,
    SUM(CASE WHEN `Departure Time` IS NULL OR TRIM(`Departure Time`) = ''THEN 1 ELSE 0 END
    ) AS departure_time_nulls,
    ROUND(
	100.0 * SUM(CASE WHEN `Departure Time` IS NULL OR TRIM(`Departure Time`) = ''THEN 1 ELSE 0 END) / COUNT(*),2
    ) AS departure_time_null_percentage,
    SUM(CASE WHEN `Arrival Time` IS NULL OR TRIM(`Arrival Time`) = ''THEN 1 ELSE 0 END) AS arrival_time_nulls,
    ROUND(100.0 * SUM(CASE WHEN `Arrival Time` IS NULL OR TRIM(`Arrival Time`) = ''THEN 1 ELSE 0 END) / COUNT(*),2
    ) AS arrival_time_null_percentage,
    SUM(CASE WHEN `Actual Arrival Time` IS NULL OR TRIM(`Actual Arrival Time`) = ''THEN 1 ELSE 0 END
    ) AS actual_arrival_time_nulls,
    ROUND(
	100.0 * SUM(CASE WHEN `Actual Arrival Time` IS NULL OR TRIM(`Actual Arrival Time`) = ''THEN 1 ELSE 0 END) / COUNT(*),2
    ) AS actual_arrival_time_null_percentage,
    SUM(CASE WHEN `Journey Status` IS NULL OR TRIM(`Journey Status`) = ''THEN 1 ELSE 0 END
    ) AS journey_status_nulls,
    ROUND(100.0 * SUM(CASE WHEN `Journey Status` IS NULL OR TRIM(`Journey Status`) = ''THEN 1 ELSE 0 END) / COUNT(*),2
    ) AS journey_status_null_percentage,
    SUM(CASE WHEN `Reason for Delay` IS NULL OR TRIM(`Reason for Delay`) = ''THEN 1 ELSE 0 END
    ) AS reason_for_delay_nulls,
    ROUND(100.0 * SUM(CASE WHEN `Reason for Delay` IS NULL OR TRIM(`Reason for Delay`) = ''THEN 1 ELSE 0 END) / COUNT(*),2
    ) AS reason_for_delay_null_percentage,
    SUM(CASE WHEN `Refund Request` IS NULL OR TRIM(`Refund Request`) = ''THEN 1 ELSE 0 END
    ) AS refund_request_nulls,
    ROUND(100.0 * SUM(CASE WHEN `Refund Request` IS NULL OR TRIM(`Refund Request`) = ''THEN 1 ELSE 0 END) / COUNT(*),2
    ) AS refund_request_null_percentage
FROM data_test.railway;

# Q2 Explore delay reasons
SELECT 
    `Reason for Delay`,
    COUNT(*) AS total_count
FROM data_test.railway
GROUP BY `Reason for Delay`
ORDER BY total_count DESC;

# Q3 Standardize delay reasons
SET SQL_SAFE_UPDATES = 0;
UPDATE data_test.railway
SET `Reason for Delay` =
CASE
    WHEN LOWER(TRIM(`Reason for Delay`)) IN 
    ('weather', 'weather conditions')
    THEN 'Weather'
    WHEN LOWER(TRIM(`Reason for Delay`)) IN 
    ('signal failure', 'signal failure ')
    THEN 'Signal Failure'
    WHEN LOWER(TRIM(`Reason for Delay`)) IN 
    ('staffing', 'staff shortage')
    THEN 'Staff Shortage'
    WHEN LOWER(TRIM(`Reason for Delay`)) IN 
    ('technical issue', 'technical issues')
    THEN 'Technical Issue'
    ELSE `Reason for Delay`
END
WHERE `Reason for Delay` IS NOT NULL;

# َ Q4 Fill missing delay reasons
UPDATE data_test.railway
SET `Reason for Delay` = 'No Delay'
WHERE `Journey Status` = 'On Time'
AND (`Reason for Delay` IS NULL OR TRIM(`Reason for Delay`) = '');

#  Q5 Fill missing railcard values
UPDATE data_test.railway
SET `Railcard` = 'None'
WHERE `Railcard` IS NULL
   OR TRIM(`Railcard`) = '';
   
# Q6  Fix missing arrival times
UPDATE data_test.railway
SET `Actual Arrival Time` = `Arrival Time`
WHERE `Journey Status` = 'On Time'
AND (`Actual Arrival Time` IS NULL OR TRIM(`Actual Arrival Time`) = '');

# Q7 Trim whitespace
UPDATE data_test.railway
SET
    `Purchase Type`       = TRIM(`Purchase Type`),
    `Payment Method`      = TRIM(`Payment Method`),
    `Ticket Class`        = TRIM(`Ticket Class`),
    `Ticket Type`         = TRIM(`Ticket Type`),
    `Departure Station`   = TRIM(`Departure Station`),
    `Arrival Destination` = TRIM(`Arrival Destination`),
    `Journey Status`      = TRIM(`Journey Status`),
    `Railcard`            = TRIM(`Railcard`);
   
# Q8  Remove duplicate rows
DELETE FROM data_test.railway
WHERE `Transaction ID` IN (SELECT `Transaction ID`FROM (SELECT `Transaction ID`, ROW_NUMBER() OVER 
(PARTITION BY `Transaction ID`ORDER BY `Date of Purchase`) AS rn FROM data_test.railway ) AS duplicates WHERE rn > 1
);

# Q9 Calculate delay minutes
SELECT `Transaction ID`, `Journey Status`, `Arrival Time`, `Actual Arrival Time`,
    TIMESTAMPDIFF(MINUTE, STR_TO_DATE(`Arrival Time`, '%H:%i'), STR_TO_DATE(`Actual Arrival Time`, '%H:%i')
) AS delay_minutes
FROM data_test.railway
WHERE `Journey Status` = 'Delayed';

# Q10  Calculate booking lead time
SELECT`Transaction ID`, `Date of Purchase`, `Date of Journey`,
    DATEDIFF (STR_TO_DATE(`Date of Journey`, '%d/%m/%Y'), STR_TO_DATE(`Date of Purchase`, '%d/%m/%Y')
    ) AS days_to_journey
FROM data_test.railway
ORDER BY days_to_journey DESC
LIMIT 20;

# Q11  Feature engineering
SELECT
    `Transaction ID`,
    `Date of Purchase`,
    `Time of Purchase`,
    `Date of Journey`,
    HOUR(STR_TO_DATE(`Time of Purchase`, '%H:%i')) AS purchase_hour,
    DAYNAME(STR_TO_DATE(`Date of Journey`, '%d/%m/%Y')) AS journey_day_name,
    MONTHNAME(STR_TO_DATE(`Date of Journey`, '%d/%m/%Y')) AS journey_month_name,
    CASE WHEN DAYOFWEEK(STR_TO_DATE(`Date of Journey`, '%d/%m/%Y')) IN (1, 7) THEN 1 ELSE 0
    END AS is_weekend
FROM data_test.railway
LIMIT 10;

# Q12 Confirm dataset quality
SELECT COUNT(*) AS total_row_count, COUNT(DISTINCT `Transaction ID`) AS unique_transaction_count,
SUM(CASE WHEN `Actual Arrival Time` IS NULL OR TRIM(`Actual Arrival Time`) = ''
THEN 1 ELSE 0 END) AS remaining_actual_arrival_nulls,
SUM(CASE WHEN (`Actual Arrival Time` IS NULL OR TRIM(`Actual Arrival Time`) = '')
AND `Journey Status` = 'Cancelled' THEN 1 ELSE 0 END) AS justified_cancelled_nulls
FROM data_test.railway;

# Analysis
# Q1 Top routes by net revenue
SELECT 
    CONCAT(`Departure Station`, ' to ', `Arrival Destination`) AS route,
    SUM(`Price`) AS gross_revenue,
    SUM(CASE WHEN `Refund Request` = 'Yes' THEN `Price` ELSE 0 END) AS total_refunds,
    SUM(`Price`) - SUM(CASE WHEN `Refund Request` = 'Yes' THEN `Price` ELSE 0
	END) AS net_revenue,ROUND(AVG(`Price`), 2) AS average_ticket_price
FROM data_test.railway
GROUP BY route
ORDER BY net_revenue DESC
LIMIT 10;

# Q2 Revenue breakdown by ticket type and class

SELECT `Ticket Type`,`Ticket Class`,
SUM(`Price`) AS total_revenue,
ROUND(SUM(`Price`) * 100.0 /(SELECT SUM(`Price`)
FROM data_test.railway),2 ) AS percentage_of_total_revenue
FROM data_test.railway
GROUP BY `Ticket Type`, `Ticket Class`
ORDER BY total_revenue DESC;

# Q3 Monthly revenue trend
SELECT 
    MONTH(
        STR_TO_DATE(`Date of Purchase`, '%d/%m/%Y')) AS month,COUNT(*) AS total_tickets,
    SUM(`Price`) AS total_revenue,
    ROUND(AVG(`Price`), 2) AS average_ticket_price,
    SUM(CASE WHEN `Refund Request` = 'Yes'THEN `Price`ELSE 0 END) AS total_refunded
FROM data_test.railway
WHERE MONTH(STR_TO_DATE(`Date of Purchase`, '%d/%m/%Y')) IN (1, 2, 3, 4)
GROUP BY month
ORDER BY month;

# Q4 Online vs station purchases

SELECT `Purchase Type`,
    COUNT(*) AS total_tickets,
    ROUND(COUNT(*) * 100.0 /(SELECT COUNT(*)
FROM data_test.railway), 2) AS ticket_percentage,
SUM(`Price`) AS total_revenue, ROUND(SUM(`Price`) * 100.0 /(SELECT SUM(`Price`)
FROM data_test.railway ),2) AS revenue_percentage, ROUND(AVG(`Price`), 2) AS average_ticket_price
FROM data_test.railway
GROUP BY `Purchase Type`;

# Q5: Railcard holder spending analysis

SELECT 
CASE WHEN `Railcard` = 'None'THEN 'No Railcard'ELSE 'Railcard Holder'
END AS railcard_status,
COUNT(*) AS total_customers,
ROUND(COUNT(*) * 100.0 /(SELECT COUNT(*)FROM data_test.railway),2) AS customer_percentage,
SUM(`Price`) AS total_revenue,
ROUND(SUM(`Price`) * 100.0 /(SELECT SUM(`Price`)
FROM data_test.railway),2) AS revenue_percentage,
ROUND(AVG(`Price`), 2) AS average_ticket_price
FROM data_test.railway
GROUP BY railcard_status;

# Operations & Reliability
#  Q6 Journey status breakdown

SELECT `Journey Status`, COUNT(*) AS total_journeys, 
ROUND(COUNT(*) * 100.0 /(SELECT COUNT(*) FROM data_test.railway),2) AS percentage
FROM data_test.railway
GROUP BY `Journey Status`
ORDER BY total_journeys DESC;

# Q7 Top causes of disruption

SELECT `Reason for Delay`, `Journey Status`,
COUNT(*) AS problem_count,
ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM data_test.railway WHERE `Journey Status` IN ('Delayed', 'Cancelled')),2) AS percentage_of_problem_journeys
FROM data_test.railway
WHERE `Journey Status` IN ('Delayed', 'Cancelled')
GROUP BY `Reason for Delay`, `Journey Status`
ORDER BY problem_count DESC;

# Q8 Refund request rate by journey status

SELECT `Journey Status`,
COUNT(*) AS total_journeys,
SUM(CASE WHEN `Refund Request` = 'Yes' THEN 1 ELSE 0 END) AS refund_count,
ROUND(SUM(CASE WHEN `Refund Request` = 'Yes' THEN 1 ELSE 0 END) * 100.0/ COUNT(*),2) AS refund_rate_percentage
FROM data_test.railway
WHERE `Journey Status` IN ('Delayed', 'Cancelled')
GROUP BY `Journey Status`;

# Q9 Stations causing the most disruptions

SELECT `Departure Station`,
SUM(CASE WHEN `Journey Status` = 'Delayed' THEN 1 ELSE 0 END) AS delayed_count,
SUM(CASE WHEN `Journey Status` = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_count,
COUNT(*) AS total_disruptions,
ROUND(
COUNT(*) * 100.0 /
(SELECT COUNT(*) FROM data_test.railway WHERE `Journey Status` IN ('Delayed', 'Cancelled')),2) AS percentage_of_all_disruptions
FROM data_test.railway
WHERE `Journey Status` IN ('Delayed', 'Cancelled')
GROUP BY `Departure Station`
ORDER BY total_disruptions DESC;

# Passenger Behaviour
# Q10: Payment method distribution

SELECT `Payment Method`, COUNT(*) AS total_transactions,
ROUND(COUNT(*) * 100.0 /(SELECT COUNT(*)FROM data_test.railway),2) AS percentage
FROM data_test.railway
GROUP BY `Payment Method`
ORDER BY total_transactions DESC;

# Q11 Revenue and journeys by day of week

SELECT 
DAYNAME(STR_TO_DATE(`Date of Journey`, '%d/%m/%Y')) AS day_name,
COUNT(*) AS total_journeys,
ROUND(SUM(`Price`), 2) AS total_revenue
FROM data_test.railway
GROUP BY DAYOFWEEK(STR_TO_DATE(`Date of Journey`, '%d/%m/%Y')),
DAYNAME(STR_TO_DATE(`Date of Journey`, '%d/%m/%Y'))
ORDER BY DAYOFWEEK(STR_TO_DATE(`Date of Journey`, '%d/%m/%Y'));

-- Q12: Weekday vs weekend analysis

SELECT CASE WHEN DAYOFWEEK(STR_TO_DATE(`Date of Journey`, '%d/%m/%Y')) IN (1, 7) THEN 'Weekend' ELSE 'Weekday'
END AS journey_type,
COUNT(*) AS total_journeys,
ROUND(SUM(`Price`), 2) AS total_revenue,
ROUND(AVG(`Price`), 2) AS avg_ticket_price,
ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM data_test.railway),2) AS percentage_share
FROM data_test.railway
GROUP BY journey_type;

# Q13: Booking lead time by ticket type

SELECT `Ticket Type`, ROUND(AVG(DATEDIFF(
STR_TO_DATE(`Date of Journey`, '%d/%m/%Y'),STR_TO_DATE(`Date of Purchase`, '%d/%m/%Y'))),2) AS avg_lead_days,
MIN(DATEDIFF(STR_TO_DATE(`Date of Journey`, '%d/%m/%Y'), STR_TO_DATE(`Date of Purchase`, '%d/%m/%Y'))) AS min_lead_days,
MAX(DATEDIFF(STR_TO_DATE(`Date of Journey`, '%d/%m/%Y'), STR_TO_DATE(`Date of Purchase`, '%d/%m/%Y'))) AS max_lead_days
FROM data_test.railway
GROUP BY `Ticket Type`
ORDER BY avg_lead_days DESC;

# SQL-Only Extras 
# QB1 Delays by time period
SELECT
CASE WHEN HOUR(STR_TO_DATE(`Departure Time`, '%H:%i')) BETWEEN 6 AND 9 THEN 'Morning Peak (06-09)'
WHEN HOUR(STR_TO_DATE(`Departure Time`, '%H:%i')) BETWEEN 10 AND 15 THEN 'Midday/Off-Peak (10-15)' WHEN HOUR(
STR_TO_DATE(`Departure Time`, '%H:%i')) BETWEEN 16 AND 19
THEN 'Evening Peak (16-19)' ELSE 'Night/Other' END AS time_period, COUNT(*) AS total_journeys,
SUM(CASE WHEN `Journey Status` = 'Delayed' THEN 1 ELSE 0 END) AS delayed_count,
SUM(CASE WHEN `Journey Status` = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_count, ROUND(100.0 *
SUM(CASE WHEN `Journey Status` IN ('Delayed', 'Cancelled') THEN 1 ELSE 0 END) / COUNT(*),2) AS problem_rate_pct
FROM data_test.railway
GROUP BY time_period
ORDER BY time_period;

# QB2  Revenue lost to refunds by delay reason

SELECT`Reason for Delay` AS delay_reason, COUNT(*) AS refund_count,
ROUND(SUM(`Price`), 2) AS total_revenue_lost,
ROUND(AVG(`Price`), 2) AS avg_refund_amount
FROM data_test.railway
WHERE `Refund Request` = 'Yes'
  AND `Reason for Delay` IS NOT NULL
  AND `Reason for Delay` <> ''
GROUP BY `Reason for Delay`
ORDER BY total_revenue_lost DESC;

# QB3  Does delay length predict refund behaviour?

SELECT
CASE WHEN `Journey Status` <> 'Delayed' OR `Reason for Delay` IS NULL OR `Reason for Delay` = ''THEN 'No Delay'
WHEN TIMESTAMPDIFF(MINUTE,
STR_TO_DATE(`Arrival Time`, '%H:%i'),
STR_TO_DATE(`Actual Arrival Time`, '%H:%i')) BETWEEN 0 AND 15 THEN '0-15 min'
WHEN TIMESTAMPDIFF(MINUTE, STR_TO_DATE(`Arrival Time`, '%H:%i'),
STR_TO_DATE(`Actual Arrival Time`, '%H:%i')) BETWEEN 16 AND 30 THEN '15-30 min' ELSE '30+ min' END AS delay_band,COUNT(*) AS journey_count,
SUM(CASE WHEN `Refund Request` = 'Yes' THEN 1 ELSE 0 END) AS refund_count,
ROUND(100.0 *SUM(CASE WHEN `Refund Request` = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),2) AS refund_rate_pct
FROM data_test.railway
GROUP BY delay_band
ORDER BY delay_band;

# Q14  Monthly ticket volume by class and type

SELECT
DATE_FORMAT( STR_TO_DATE(`Date of Journey`, '%d/%m/%Y'),'%Y-%m') AS month, `Ticket Class`, `Ticket Type`,
COUNT(*) AS ticket_volume
FROM data_test.railway
GROUP BY DATE_FORMAT(
STR_TO_DATE(`Date of Journey`, '%d/%m/%Y'), '%Y-%m'), `Ticket Class`, `Ticket Type` ORDER BY month, `Ticket Class`, `Ticket Type`;

# Q15 Month-over-month growth

WITH monthly_volumes AS ( SELECT DATE_FORMAT(STR_TO_DATE(`Date of Journey`, '%d/%m/%Y'), '%Y-%m') AS month, `Ticket Class`, `Ticket Type`,
COUNT(*) AS current_volume
FROM data_test.railway
GROUP BY
DATE_FORMAT( STR_TO_DATE(`Date of Journey`, '%d/%m/%Y'), '%Y-%m'), `Ticket Class`, `Ticket Type`)
SELECT month, `Ticket Class`, `Ticket Type`, LAG(current_volume) OVER ( PARTITION BY `Ticket Class`, `Ticket Type` ORDER BY month) AS prev_month_volume,
current_volume,
ROUND(100.0 *(current_volume - LAG(current_volume) OVER (PARTITION BY `Ticket Class`, `Ticket Type`ORDER BY month))/
NULLIF(LAG(current_volume) OVER (PARTITION BY `Ticket Class`, `Ticket Type`
ORDER BY month),0),2) AS growth_pct
FROM monthly_volumes
ORDER BY `Ticket Class`, `Ticket Type`,
month;

# Q16 Rolling 3-month average revenue

WITH monthly_revenue AS (
SELECT DATE_FORMAT(STR_TO_DATE(`Date of Journey`, '%d/%m/%Y'),'%Y-%m') AS month, ROUND(SUM(`Price`),2) AS total_revenue
FROM data_test.railway
GROUP BY
DATE_FORMAT(STR_TO_DATE(`Date of Journey`, '%d/%m/%Y'),'%Y-%m'))
SELECT month,
    total_revenue,
ROUND(AVG(total_revenue) OVER (ORDER BY month ROWS BETWEEN 2 PRECEDING AND CURRENT ROW),2) AS rolling_3month_avg
FROM monthly_revenue
ORDER BY month;
