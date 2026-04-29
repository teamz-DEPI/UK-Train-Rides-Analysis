-----Data Cleaning-----

select *  from railway;

--2-Handle Missing Reasons for Delay
UPDATE railway
SET reason_for_delay = 'No Delay'
WHERE journey_status = 'On Time' AND ("reason_for_delay" IS NULL OR "reason_for_delay" = '');

--3-Sync Actual Arrival Times for On-Time Trains
UPDATE railway
SET actual_arrival_t = arrival_time
WHERE journey_status = 'On Time' 
  AND actual_arrival_t IS NULL;
  
--4-clean white spaces
UPDATE railway
SET 
    "purchase_type" = TRIM("purchase_type"),
    "payment_method" = TRIM("payment_method"),
    "ticket_class" = TRIM("ticket_class"),
    "ticket_type" = TRIM("ticket_type"),
    "departure_statio" = TRIM("departure_statio"),
    "arrival_destinat" = TRIM("arrival_destinat");
    
    
--6-delete duplicate purches
DELETE FROM railway
WHERE transaction_id IN (
    SELECT transaction_id
    FROM (
        SELECT transaction_id,
               ROW_NUMBER() OVER (PARTITION BY transaction_id ORDER BY date_of_purchase) AS row_num
        FROM railway
    ) sub
    WHERE row_num > 1
);


--9- convert null to not dalayed 
UPDATE railway
SET "actual_arrival_t" = 'Cancelled'
WHERE "actual_arrival_t" IS NULL OR "actual_arrival_t" = '';
---------------------------------------------------------------------------------------------\



--***************ANALYSIS******************

--1. Operational Performance & Reliability (The "Train Running" Questions)
-- =========================================================
-- 1.1: Most common reasons for delays and cancellations
-- =========================================================

SELECT
    COALESCE(TRIM(reason_for_delay), 'Unknown') AS Delay_Reason,

    COUNT(*) AS Total_Problem_Cases,

    SUM(CASE WHEN journey_status = 'Delayed' THEN 1 ELSE 0 END) AS Delayed_Count,

    SUM(CASE WHEN journey_status = 'Cancelled' THEN 1 ELSE 0 END) AS Cancelled_Count,

    ROUND(
        COUNT(*) * 100.0 /
        (
            SELECT COUNT(*)
            FROM railway
            WHERE journey_status IN ('Delayed', 'Cancelled')
        ),
        2
    ) AS Problem_Percentage

FROM railway
WHERE journey_status IN ('Delayed', 'Cancelled')
GROUP BY COALESCE(TRIM(reason_for_delay), 'Unknown')
ORDER BY Total_Problem_Cases DESC;



-- =========================================================
-- 1.2: Least reliable routes
-- =========================================================

SELECT
    departure_statio AS Departure_Station,
    arrival_destinat AS Arrival_Destination,

    COUNT(*) AS Total_Journeys,

    SUM(CASE WHEN journey_status IN ('Delayed', 'Cancelled') THEN 1 ELSE 0 END) AS Problem_Journeys,

    ROUND(
        SUM(CASE WHEN journey_status IN ('Delayed', 'Cancelled') THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Problem_Percentage

FROM railway
GROUP BY departure_statio, arrival_destinat
HAVING COUNT(*) >= 30
ORDER BY Problem_Percentage DESC, Problem_Journeys DESC;



-- =========================================================
-- 1.3-A: Delays by departure time period
-- =========================================================

SELECT
    CASE
        WHEN CAST(substr(departure_time, 1, instr(departure_time, ':') - 1) AS INTEGER) BETWEEN 6 AND 9
            THEN 'Morning Peak'

        WHEN CAST(substr(departure_time, 1, instr(departure_time, ':') - 1) AS INTEGER) BETWEEN 10 AND 15
            THEN 'Midday / Off-Peak'

        WHEN CAST(substr(departure_time, 1, instr(departure_time, ':') - 1) AS INTEGER) BETWEEN 16 AND 19
            THEN 'Evening Peak'

        ELSE 'Night / Other'
    END AS Time_Period,

    COUNT(*) AS Total_Journeys,

    SUM(CASE WHEN journey_status = 'Delayed' THEN 1 ELSE 0 END) AS Delayed_Journeys,

    SUM(CASE WHEN journey_status = 'Cancelled' THEN 1 ELSE 0 END) AS Cancelled_Journeys,

    ROUND(
        SUM(CASE WHEN journey_status = 'Delayed' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Delayed_Percentage,

    ROUND(
        SUM(CASE WHEN journey_status = 'Cancelled' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Cancelled_Percentage,

    ROUND(
        SUM(CASE WHEN journey_status IN ('Delayed', 'Cancelled') THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Problem_Percentage

FROM railway
GROUP BY Time_Period
ORDER BY Problem_Percentage DESC;



-- =========================================================
-- 1.3-B: Delays by journey month
-- =========================================================

SELECT
    CASE CAST(substr(date_of_journey, 1, instr(date_of_journey, '/') - 1) AS INTEGER)
        WHEN 1 THEN 'January'
        WHEN 2 THEN 'February'
        WHEN 3 THEN 'March'
        WHEN 4 THEN 'April'
        WHEN 5 THEN 'May'
        WHEN 6 THEN 'June'
        WHEN 7 THEN 'July'
        WHEN 8 THEN 'August'
        WHEN 9 THEN 'September'
        WHEN 10 THEN 'October'
        WHEN 11 THEN 'November'
        WHEN 12 THEN 'December'
    END AS Journey_Month,

    COUNT(*) AS Total_Journeys,

    SUM(CASE WHEN journey_status = 'Delayed' THEN 1 ELSE 0 END) AS Delayed_Journeys,

    SUM(CASE WHEN journey_status = 'Cancelled' THEN 1 ELSE 0 END) AS Cancelled_Journeys,

    ROUND(
        SUM(CASE WHEN journey_status = 'Delayed' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Delayed_Percentage,

    ROUND(
        SUM(CASE WHEN journey_status = 'Cancelled' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Cancelled_Percentage,

    ROUND(
        SUM(CASE WHEN journey_status IN ('Delayed', 'Cancelled') THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Problem_Percentage

FROM railway
GROUP BY CAST(substr(date_of_journey, 1, instr(date_of_journey, '/') - 1) AS INTEGER)
ORDER BY CAST(substr(date_of_journey, 1, instr(date_of_journey, '/') - 1) AS INTEGER);



-- =========================================================
-- 1.4: Average delay severity in minutes
-- =========================================================

SELECT
    COUNT(*) AS Delayed_Journeys,

    ROUND(AVG(Delay_Minutes), 2) AS Avg_Delay_Minutes,

    MIN(Delay_Minutes) AS Min_Delay_Minutes,

    MAX(Delay_Minutes) AS Max_Delay_Minutes,

    ROUND(
        SUM(CASE WHEN Delay_Minutes <= 15 THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS Pct_Delay_15_Minutes_Or_Less

FROM (
    SELECT
        (
            CAST(substr(actual_arrival_t, 1, instr(actual_arrival_t, ':') - 1) AS INTEGER) * 60
            +
            CAST(substr(actual_arrival_t, instr(actual_arrival_t, ':') + 1, 2) AS INTEGER)
        )
        -
        (
            CAST(substr(arrival_time, 1, instr(arrival_time, ':') - 1) AS INTEGER) * 60
            +
            CAST(substr(arrival_time, instr(arrival_time, ':') + 1, 2) AS INTEGER)
        ) AS Delay_Minutes

    FROM railway
    WHERE journey_status = 'Delayed'
      AND actual_arrival_t IS NOT NULL
      AND TRIM(actual_arrival_t) <> ''
      AND arrival_time IS NOT NULL
      AND TRIM(arrival_time) <> ''
) AS delay_calc

WHERE Delay_Minutes >= 0;

---------------------------------------------------------------------------------------

--2. Revenue & Financial Health (The "Business" Questions)

-- 2.1: Most Lucrative Routes
SELECT
    departure_statio AS Departure_Station,
    arrival_destinat AS Arrival_Destination,
    COUNT(*) AS Total_Tickets,
    SUM(price) AS Gross_Revenue,
    SUM(CASE WHEN refund_request = 'Yes' THEN price ELSE 0 END) AS Total_Refunded,
    SUM(price) - SUM(CASE WHEN refund_request = 'Yes' THEN price ELSE 0 END) AS Net_Revenue,
    ROUND(AVG(price), 2) AS Avg_Ticket_Price

FROM railway

GROUP BY departure_statio, arrival_destinat
ORDER BY Net_Revenue DESC
LIMIT 10;
-- ===================================
-- 2.2: Revenue Lost Due to Refunds
SELECT
    reason_for_delay AS Reason,
    COUNT(*) AS Refund_Count,
    SUM(price) AS Total_Refunded,
    ROUND(AVG(price), 2) AS Avg_Refund_Amount

FROM railway
WHERE refund_request = 'Yes'

GROUP BY reason_for_delay
ORDER BY Total_Refunded DESC;
-- ===================================
-- 2.3: Revenue Split Between Standard and First Class
SELECT
    departure_statio AS Departure_Station,
    arrival_destinat AS Arrival_Destination,
    ticke

---------------------------------------------------------------------------

--3. Customer Purchasing Behavior (The "Sales Channel" Questions)

--3.1_How do passengers prefer to buy their tickets?
SELECT COUNT(purchase_type) AS NO_OF_ONLINE_PURCHUSE from railway

WHERE purchase_type = 'Online';


SELECT COUNT(purchase_type) AS NO_OF_Station_PURCHUSE from railway

WHERE purchase_type = 'Station';

SELECT COUNT(payment_method) AS NO_OF_Contactless_pay from railway

WHERE payment_method = 'Contactless';

SELECT COUNT(payment_method) AS NO_OF_CreditCard_pay from railway

WHERE payment_method = 'Credit Card';

SELECT COUNT(payment_method) AS NO_OF_DebitCard_pay from railway

WHERE payment_method = 'Debit Card';


--3.3_Who are the primary users of Railcards? and the heaviest roats

SELECT COUNT(railcard) AS NO_ADULT_RAILCARD from railway
WHERE railcard = 'Adult';

SELECT COUNT(railcard) AS NO_None_RAILCARD from railway
WHERE railcard = 'None';

SELECT COUNT(railcard) AS NO_Senior_RAILCARD from railway
WHERE railcard = 'Senior';

SELECT COUNT(railcard) AS NO_Disabled_RAILCARD from railway
WHERE railcard = 'Disabled';

--which Roats .
SELECT DISTINCT departure_statio, arrival_destinat 
FROM railway 
WHERE railcard = 'None';



--3.4 When do people buy tickets the most?--extract the peek hour purchuse
SELECT 
    substr("time_of_purchase", 1, 2) AS PurchaseHour, 
    COUNT(*) as OnlinePurchases
FROM railway
WHERE "purchase_type" = 'Online'
GROUP BY PurchaseHour
ORDER BY PurchaseHour ASC;
------------------------------------------------------------------------------
--4. Customer Experience & Policy (The "Satisfaction" Questions)


-- 4.1: What triggers a refund request?(Refund Requests vs Delay Threshold)
SELECT 
    CASE 
        WHEN delay_minutes <= 0 THEN '0. No Delay'
        WHEN delay_minutes <= 15 THEN '1. 0-15 Minutes'
        WHEN delay_minutes <= 30 THEN '2. 15-30 Minutes'
        ELSE '3. More than 30 Minutes'
    END AS Delay_Category,

    COUNT(*) AS Total_Journeys,

    SUM(CASE WHEN refund_request = 'Yes' THEN 1 ELSE 0 END) AS Refund_Count,

    ROUND(
        SUM(CASE WHEN refund_request = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2
    ) AS Refund_Percentage

FROM (
    SELECT 
        refund_request,
        ROUND(
            (julianday(actual_arrival_t) - julianday(arrival_time)) * 24 * 60
        ) AS delay_minutes
    FROM railway
    WHERE actual_arrival_t IS NOT NULL 
      AND arrival_time IS NOT NULL
)

GROUP BY Delay_Category
ORDER BY Delay_Category
 -- 4.2: Refund Requests by Departure Station (Cancelled Journeys Only)

SELECT
    departure_statio AS Departure_Station,

    COUNT(*) AS Total_Cancelled,

    SUM(CASE WHEN refund_request = 'Yes' THEN 1 ELSE 0 END) AS Refund_Count,

    ROUND(
        SUM(CASE WHEN refund_request = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2
    ) AS Refund_Percentage

FROM railway
WHERE journey_status = 'Cancelled'

GROUP BY departure_statio
ORDER BY Refund_Percentage DESC
-- 4.3:Do different ticket types have different delay tolerances( Refund Requests by Ticket Type and Ticket Class)
SELECT
    ticket_type AS Ticket_Type,
    ticket_class AS Ticket_Class,

    COUNT(*) AS Total_Journeys,

    SUM(CASE WHEN refund_request = 'Yes' THEN 1 ELSE 0 END) AS Refund_Count,

    ROUND(
        SUM(CASE WHEN refund_request = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2
    ) AS Refund_Percentage

FROM railway

GROUP BY ticket_type, ticket_class
ORDER BY Refund_Percentage DESC














