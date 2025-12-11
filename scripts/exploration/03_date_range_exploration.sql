/*
===============================================================================
Date Range Exploration 
===============================================================================
Purpose:
    - To determine the temporal boundaries of key data points.
    - To understand the range of historical data.

SQL Functions Used:
    - MIN(), MAX(), DATEDIFF()
===============================================================================
*/

-- Determine the first and last order date and the total duration in months
SELECT 
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date,
    DATEDIFF(MONTH, MIN(order_date), MAX(order_date)) AS order_range_months
FROM gold.fact_sales;

-- Find the youngest and oldest customer based on birthdate
SELECT
    MIN(birthdate) AS oldest_birthdate,
    DATEDIFF(YEAR, MIN(birthdate), GETDATE()) AS oldest_age,
    MAX(birthdate) AS youngest_birthdate,
    DATEDIFF(YEAR, MAX(birthdate), GETDATE()) AS youngest_age
FROM gold.dim_customers;

/*
=============================
Date Exploration short report
=============================

*/
select 'Birth_date_Range', cast(MIN(birthdate) as nvarchar) +' ->> ' + cast(MAX(birthdate)  as nvarchar) from gold.dim_customers
union all
select 'youngest_oldest_ages', cast(DATEDIFF(YEAR,MAX(birthdate),GETDATE())  as nvarchar)+' ->> ' + cast(DATEDIFF(YEAR,MIN(birthdate),GETDATE())  as nvarchar) from gold.dim_customers
union all
SELECT 'order_date_Range', CAST(MIN(order_date) AS NVARCHAR) +' ->> ' + CAST(MAX(order_date) AS NVARCHAR) FROM gold.fact_sales
UNION ALL
SELECT 'Shipping_date_Range', CAST(MIN(shipping_sate) AS NVARCHAR) +' ->> ' + CAST(MAX(shipping_sate) AS NVARCHAR)FROM gold.fact_sales

