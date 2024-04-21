use salesdata;
SELECT * FROM amazon;

DELETE FROM amazon
WHERE Invoice_ID = (SELECT MIN(Invoice_ID) FROM amazon);

SELECT DISTINCT product_line
FROM amazon;

SELECT 
    product_line,
    SUM(total) AS total_sales_amount
FROM 
    amazon
GROUP BY 
    product_line
ORDER BY 
    total_sales_amount DESC;
    
SELECT 
    product_line,
    SUM(total) AS total_sales_amount
FROM 
    amazon
GROUP BY 
    product_line
ORDER BY 
    total_sales_amount ASC;    
    
SELECT DISTINCT product_line
FROM sales_data;

-- 2. Analyze Sales Performance by Product Line (Top Performing)
SELECT 
    product_line,
    SUM(total) AS total_sales_amount
FROM 
    amazon
GROUP BY 
    product_line
ORDER BY 
    total_sales_amount DESC;

-- 3. Identify Product Lines Needing Improvement (Bottom Performing)
SELECT 
    product_line,
    SUM(total) AS total_sales_amount
FROM 
    amazon
GROUP BY 
    product_line
ORDER BY 
    total_sales_amount ASC;    
    
SELECT 
    YEAR(date) AS sales_year,
    MONTH(date) AS sales_month,
    SUM(total) AS monthly_sales_amount
FROM 
    amazon
GROUP BY 
    YEAR(date), MONTH(date)
ORDER BY 
    sales_year, sales_month;    
    


SELECT 
    YEAR(date) AS sales_year,
    MONTH(date) AS sales_month,
    SUM(total) AS monthly_sales_amount
FROM 
    amazon
GROUP BY 
    YEAR(date), MONTH(date)
ORDER BY 
    sales_year, sales_month;
    
SELECT 
    customer_type,
    gender,
    city,
    COUNT(*) AS customer_count
FROM 
    amazon
GROUP BY 
    customer_type, gender, city;    
    
SELECT 
    customer_type,
    gender,
    city,
    YEAR(date) AS purchase_year,
    MONTH(date) AS purchase_month,
    SUM(total) AS total_purchase_amount
FROM 
    amazon
GROUP BY 
    customer_type, gender, city, YEAR(date), MONTH(date)
ORDER BY 
    purchase_year, purchase_month;
    


-- 1. Identify Customer Segments
SELECT 
    customer_type,
    gender,
    city,
    COUNT(*) AS customer_count
FROM 
    sales_data
GROUP BY 
    customer_type, gender, city;

-- 2. Analyze Purchase Trends by Customer Segment Over Time
SELECT 
    customer_type,
    gender,
    city,
    YEAR(date) AS purchase_year,
    MONTH(date) AS purchase_month,
    SUM(total) AS total_purchase_amount
FROM 
    sales_data
GROUP BY 
    customer_type, gender, city, YEAR(date), MONTH(date)
ORDER BY 
    purchase_year, purchase_month;

-- 3. Calculate Profitability by Customer Segment
SELECT 
    customer_type,
    gender,
    city,
    SUM(total) AS total_sales_amount,
    SUM(cogs) AS total_cogs,
    SUM(total) - SUM(cogs) AS total_profit
FROM 
    amazon 
GROUP BY 
    customer_type, gender, city;

-- 1. Identify Customer Segments
SELECT 
    customer_type,
    gender,
    city,
    COUNT(*) AS customer_count
FROM 
    amazon 
GROUP BY 
    customer_type, gender, city;

-- 2. Analyze Purchase Trends by Customer Segment Over Time
SELECT 
    customer_type,
    gender,
    city,
    YEAR(date) AS purchase_year,
    MONTH(date) AS purchase_month,
    SUM(total) AS total_purchase_amount
FROM 
    amazon 
GROUP BY 
    customer_type, gender, city, YEAR(date), MONTH(date)
ORDER BY 
    purchase_year, purchase_month;

-- 3. Calculate Profitability by Customer Segment
SELECT 
    customer_type,
    gender,
    city,
    SUM(total) AS total_sales_amount,
    SUM(cogs) AS total_cogs,
    SUM(total) - SUM(cogs) AS total_profit
FROM 
    amazon 
GROUP BY 
    customer_type, gender, city;

ALTER TABLE amazon
ADD COLUMN timeofday VARCHAR(15);

UPDATE amazon
SET timeofday = CASE 
                    WHEN HOUR(time) >= 0 AND HOUR(time) < 12 THEN 'Morning'
                    WHEN HOUR(time) >= 12 AND HOUR(time) < 18 THEN 'Afternoon'
                    ELSE 'Evening'
                END
WHERE invoice_id IS NOT NULL; -- Assuming invoice_id is the primary key

ALTER TABLE amazon
ADD COLUMN dayname VARCHAR(10);

UPDATE amazon
SET dayname = CASE DAYOFWEEK(date)
                WHEN 1 THEN 'Sunday'
                WHEN 2 THEN 'Monday'
                WHEN 3 THEN 'Tuesday'
                WHEN 4 THEN 'Wednesday'
                WHEN 5 THEN 'Thursday'
                WHEN 6 THEN 'Friday'
                WHEN 7 THEN 'Saturday'
             END;
    
ALTER TABLE amazon 
ADD COLUMN monthname VARCHAR(15);

UPDATE amazon
SET monthname = CASE MONTH(date)
                WHEN 1 THEN 'Jan'
                WHEN 2 THEN 'Feb'
                WHEN 3 THEN 'Mar'
                WHEN 4 THEN 'Apr'
                WHEN 5 THEN 'May'
                WHEN 6 THEN 'Jun'
                WHEN 7 THEN 'Jul'
                WHEN 8 THEN 'Aug'
                WHEN 9 THEN 'Sep'
                WHEN 10 THEN 'Oct'
                WHEN 11 THEN 'Nov'
                WHEN 12 THEN 'Dec'
             END;
-- Q1             
SELECT COUNT(DISTINCT city) AS distinct_city_count
FROM amazon; 

-- Q2
SELECT DISTINCT branch, city
FROM amazon;         

-- Q3
SELECT COUNT(DISTINCT product_line) AS distinct_product_line_count
FROM amazon;   

-- Q4
SELECT payment_method, COUNT(*) AS frequency
FROM amazon
GROUP BY payment_method
ORDER BY frequency DESC
LIMIT 1;             

-- Q5
SELECT product_line, SUM(total) AS total_sales
FROM amazon
GROUP BY product_line
ORDER BY total_sales DESC
LIMIT 1;    

-- Q6
SELECT 
    YEAR(date) AS sales_year,
    MONTH(date) AS sales_month,
    SUM(total) AS monthly_revenue
FROM 
    amazon
GROUP BY 
    YEAR(date), MONTH(date)
ORDER BY 
    sales_year, sales_month;

-- Q7
SELECT 
    YEAR(date) AS sales_year,
    MONTH(date) AS sales_month,
    SUM(cogs) AS total_cogs
FROM 
    amazon
GROUP BY 
    YEAR(date), MONTH(date)
ORDER BY 
    total_cogs DESC
LIMIT 1;

-- Q8
SELECT 
    product_line,
    SUM(total) AS total_revenue
FROM 
    amazon
GROUP BY 
    product_line
ORDER BY 
    total_revenue DESC
LIMIT 1;

-- Q9
SELECT 
    city,
    SUM(total) AS total_revenue
FROM 
    amazon 
GROUP BY 
    city
ORDER BY 
    total_revenue DESC
LIMIT 1;

-- Q10
SELECT 
    product_line,
    SUM(VAT) AS total_VAT
FROM 
    amazon
GROUP BY 
    product_line
ORDER BY 
    total_VAT DESC
LIMIT 1;

-- Q11

SELECT 
    a.product_line,
    CASE 
        WHEN a.total > avg_sales THEN 'Good'
        ELSE 'Bad'
    END AS sales_status
FROM 
    amazon a
JOIN 
    (SELECT 
        product_line,
        AVG(total) AS avg_sales
    FROM 
        amazon
    GROUP BY 
        product_line) avg_table
ON 
    a.product_line = avg_table.product_line;

-- Q12
SELECT 
    branch,
    SUM(quantity) AS total_quantity
FROM 
    amazon 
GROUP BY 
    branch
HAVING 
    SUM(quantity) > (
        SELECT AVG(quantity) 
        FROM amazon 
    );

-- Q13
SELECT 
    gender,
    product_line,
    COUNT(*) AS frequency
FROM 
    amazon 
GROUP BY 
    gender, product_line
ORDER BY 
    gender, frequency DESC;
    
-- Q14
SELECT 
    product_line,
    AVG(rating) AS average_rating
FROM 
    amazon 
GROUP BY 
    product_line;
    
-- Q15    
SELECT 
    DAYNAME(date) AS weekday,
    CASE 
        WHEN HOUR(time) >= 0 AND HOUR(time) < 12 THEN 'Morning'
        WHEN HOUR(time) >= 12 AND HOUR(time) < 18 THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day,
    COUNT(*) AS sales_occurrences
FROM 
    amazon 
GROUP BY 
    weekday, time_of_day
ORDER BY 
    FIELD(weekday, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'), 
    FIELD(time_of_day, 'Morning', 'Afternoon', 'Evening');


-- Q16
SELECT 
    customer_type,
    SUM(total) AS total_revenue
FROM 
    amazon 
GROUP BY 
    customer_type
ORDER BY 
    total_revenue DESC
LIMIT 1;
    
-- Q17
SELECT 
    city,
    SUM(VAT) AS total_VAT,
    SUM(total) AS total_sales,
    (SUM(VAT) / SUM(total)) * 100 AS VAT_percentage
FROM 
    amazon 
GROUP BY 
    city
ORDER BY 
    VAT_percentage DESC
LIMIT 1;
    
-- Q18
SELECT 
    customer_type,
    SUM(VAT) AS total_VAT_payments
FROM 
    amazon
GROUP BY 
    customer_type
ORDER BY 
    total_VAT_payments DESC
LIMIT 1;    

-- Q19
SELECT COUNT(DISTINCT customer_type) AS distinct_customer_types_count
FROM amazon;


-- Q20
SELECT COUNT(DISTINCT payment_method) AS distinct_payment_methods_count
FROM amazon;

-- Q21
SELECT 
    customer_type,
    COUNT(*) AS frequency
FROM 
    amazon
GROUP BY 
    customer_type
ORDER BY 
    frequency DESC
LIMIT 1;

-- Q22
SELECT 
    customer_type,
    COUNT(*) AS purchase_frequency
FROM 
    amazon
GROUP BY 
    customer_type
ORDER BY 
    purchase_frequency DESC
LIMIT 1;

-- Q23

SELECT 
    gender,
    COUNT(*) AS frequency
FROM 
    amazon 
WHERE 
    gender IS NOT NULL
GROUP BY 
    gender
ORDER BY 
    frequency DESC
LIMIT 1;


-- Q24
SELECT 
    branch,
    gender,
    COUNT(*) AS frequency
FROM 
    amazon
WHERE 
    gender IS NOT NULL
GROUP BY 
    branch, gender
ORDER BY 
    branch, frequency DESC;

-- Q25
SELECT 
    HOUR(time) AS hour_of_day,
    COUNT(*) AS rating_count
FROM 
    amazon 
WHERE 
    rating IS NOT NULL
GROUP BY 
    HOUR(time)
ORDER BY 
    rating_count DESC
LIMIT 1;

-- Q26
SELECT 
    branch,
    HOUR(time) AS hour_of_day,
    AVG(rating) AS average_rating
FROM 
    amazon 
WHERE 
    rating IS NOT NULL
GROUP BY 
    branch, HOUR(time)
ORDER BY 
    branch, average_rating DESC;

-- Q27
SELECT 
    DAYNAME(date) AS day_of_week,
    AVG(rating) AS average_rating
FROM 
    amazon 
WHERE 
    rating IS NOT NULL
GROUP BY 
    DAYNAME(date)
ORDER BY 
    average_rating DESC
LIMIT 1;

-- Q28
SELECT 
    branch,
    DAYNAME(date) AS day_of_week,
    AVG(rating) AS average_rating
FROM 
    amazon 
WHERE 
    rating IS NOT NULL
GROUP BY 
    branch, DAYNAME(date)
ORDER BY 
    branch, average_rating DESC;
