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

    