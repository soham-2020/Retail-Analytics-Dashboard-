CREATE TABLE orders (
    order_id TEXT PRIMARY KEY,
    order_date DATE,
    ship_date DATE,
    customer_id TEXT,
    product_id TEXT,
    quantity INTEGER,
    discount NUMERIC(4,2),
    sales NUMERIC(10,2),
    profit NUMERIC(10,2),
    shipping_cost NUMERIC(10,2),
    order_priority TEXT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
CREATE TABLE products (
    product_id TEXT PRIMARY KEY,
    product_name TEXT,
    category TEXT,
    sub_category TEXT
);
CREATE TABLE customers (
    customer_id TEXT PRIMARY KEY,
    customer_name TEXT,
    city TEXT,
    state TEXT,
    country TEXT,
    postal_code TEXT,
    segment TEXT,
    market TEXT,
    region TEXT
);
CREATE TABLE raw_data (
    row_id TEXT,
    order_id TEXT,
    order_date DATE,
    ship_date DATE,
    ship_mode TEXT,
    customer_id TEXT,
    customer_name TEXT,
    segment TEXT,
    city TEXT,
    state TEXT,
    country TEXT,
    postal_code TEXT,
    market TEXT,
    region TEXT,
    product_id TEXT,
    category TEXT,
    sub_category TEXT,
    product_name TEXT,
    sales NUMERIC(10,2),
    quantity INTEGER,
    discount NUMERIC(4,2),
    profit NUMERIC(10,2),
    shipping_cost NUMERIC(10,2),
    order_priority TEXT
);
INSERT INTO customers (
    customer_id, customer_name, city, state, country,
    postal_code, segment, market, region
)
SELECT
    DISTINCT customer_id, customer_name, city, state, country,
    postal_code, segment, market, region
FROM raw_data
WHERE customer_id IS NOT NULL
ON CONFLICT (customer_id) DO NOTHING;

INSERT INTO products (
    product_id, product_name, category, sub_category
)
SELECT DISTINCT
    product_id, product_name, category, sub_category
FROM raw_data
WHERE product_id IS NOT NULL
ON CONFLICT(product_id) DO NOTHING;
INSERT INTO orders (
    order_id, order_date, ship_date, customer_id, product_id,
    quantity, discount, sales, profit, shipping_cost, order_priority
)
SELECT DISTINCT
    order_id, order_date, ship_date, customer_id, product_id,
    quantity, discount, sales, profit, shipping_cost, order_priority
FROM raw_data
WHERE (order_id) IS NOT NULL
ON CONFLICT(order_id) DO NOTHING;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM products;

SELECT customer_id,
COUNT(*)
FROM customers 
GROUP BY customer_id 
HAVING COUNT(*)>1

SELECT product_id, COUNT(*) 
FROM products 
GROUP BY product_id 
HAVING COUNT(*) > 1;

SELECT order_id, COUNT(*) 
FROM orders 
GROUP BY order_id 
HAVING COUNT(*) > 1;

SELECT * FROM orders
WHERE order_id IS NULL
   OR order_date IS NULL
   OR ship_date IS NULL
   OR customer_id IS NULL
   OR product_id IS NULL
   OR quantity IS NULL
   OR discount IS NULL
   OR sales IS NULL
   OR profit IS NULL
   OR shipping_cost IS NULL
   OR order_priority IS NULL;

SELECT * FROM customers
WHERE customer_id IS NULL
   OR customer_name IS NULL
   OR city IS NULL
   OR state IS NULL
   OR country IS NULL
   OR postal_code IS NULL
   OR segment IS NULL
   OR market IS NULL
   OR region IS NULL;
UPDATE customers
SET postal_code = 'UNKNOWN'
WHERE postal_code IS NULL;

SELECT * FROM products
WHERE product_id IS NULL
   OR product_name IS NULL
   OR category IS NULL
   OR sub_category IS NULL;
--calculate frequency of purchase for each customer
CREATE VIEW customer_frequency AS
SELECT customer_id, 
COUNT(DISTINCT order_id) AS Total_orders,
CASE
    WHEN  COUNT(DISTINCT order_id)>=20 THEN'VERY FREQUENT'
	WHEN  COUNT(DISTINCT order_id)>=10 THEN'FREQUENT'
	WHEN  COUNT(DISTINCT order_id)>=5 THEN'OCCASIONAL'
    else 'RARE'
    END AS frequency_bucket
FROM orders
GROUP BY customer_id
ORDER BY total_orders DESC;
SELECT * FROM customer_frequency LIMIT 10;



SELECT 
    customer_frequency.frequency_bucket,
    COUNT(DISTINCT customer_frequency.customer_id) AS num_customers,
    ROUND(SUM(orders.sales), 2) AS total_sales,
    ROUND(SUM(orders.sales) / COUNT(DISTINCT customer_frequency.customer_id), 2) AS avg_sales_per_customer
FROM customer_frequency
JOIN orders ON customer_frequency.customer_id = orders.customer_id
GROUP BY customer_frequency.frequency_bucket
ORDER BY total_sales DESC;

--what is the profit margin across the frequency buckets?
SELECT 
    cf.frequency_bucket,
    ROUND(SUM(o.profit), 2) AS total_profit,
    ROUND(SUM(o.sales), 2) AS total_sales,
    ROUND(SUM(o.profit) / NULLIF(SUM(o.sales), 0) * 100, 2) AS profit_margin_percent
FROM customer_frequency cf
JOIN orders o ON cf.customer_id = o.customer_id
GROUP BY cf.frequency_bucket
ORDER BY profit_margin_percent DESC;
--Which customer segment is most profitable in each year?
SELECT 
    EXTRACT(YEAR FROM o.order_date) AS year,
    c.segment,
    ROUND(SUM(o.profit), 2) AS total_profit
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY year, c.segment
ORDER BY year, total_profit DESC;

--How are customers distributed across countries?

SELECT 
    country, 
    COUNT(DISTINCT customer_id) AS num_customers
FROM customers
GROUP BY country
ORDER BY num_customers DESC;
 --Which country has top sales?

SELECT 
    c.country,
    ROUND(SUM(o.sales), 2) AS total_sales
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.country
ORDER BY total_sales DESC
LIMIT 1;

--Top 5 profit-making product types (sub_category) on a yearly basis

SELECT 
    EXTRACT(YEAR FROM o.order_date) AS year,
    p.sub_category,
    ROUND(SUM(o.profit), 2) AS total_profit
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY year, p.sub_category
ORDER BY year, total_profit DESC;

WITH ranked_products AS (
    SELECT 
        EXTRACT(YEAR FROM o.order_date) AS year,
        p.sub_category,
        SUM(o.profit) AS total_profit,
        RANK() OVER (PARTITION BY EXTRACT(YEAR FROM o.order_date) ORDER BY SUM(o.profit) DESC) AS rnk
    FROM orders o
    JOIN products p ON o.product_id = p.product_id
    GROUP BY year, p.sub_category
)
SELECT * FROM ranked_products WHERE rnk <= 5;
--Is there an increase in sales with a decrease in price (at day level)?
SELECT 
    order_date,
    ROUND(SUM(sales) / NULLIF(SUM(quantity), 0), 2) AS avg_price,
    ROUND(SUM(sales), 2) AS total_sales
FROM orders
GROUP BY order_date
ORDER BY order_date;

--What is the average delivery time across countries (bar plot)
SELECT 
    c.country,
    ROUND(AVG(julianday(o.ship_date) - julianday(o.order_date)), 2) AS avg_delivery_days
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.country
ORDER BY avg_delivery_days;







