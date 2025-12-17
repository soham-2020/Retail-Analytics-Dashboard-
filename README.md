1)Retail Analytics Dashboard
SQL & Power BI | Customer Profiling, Sales & Profit Trends, Forecasting & Drillthrough

2)Problem Statement
With growing market demand and cut-throat competition, a large retail superstore aims to make data-driven decisions to improve profitability, customer retention, and operational efficiency.The business wants to understand which products and sub-categories generate the highest profit, which regions and countries should be prioritized or optimized, which customer segments drive long-term value, how delivery times and shipping costs impact profitability, and whether future sales trends can be forecasted for better planning.This project addresses these questions by transforming raw transactional data into actionable business insights using SQL and Power BI.
3)Project Overview
This project delivers an end-to-end retail data analytics solution, covering SQL-based data modeling, cleaning, and KPI computation, analytical SQL queries for customer, product, and regional insights, and interactive Power BI dashboards with forecasting and drillthrough capabilities.The final solution enables stakeholders across marketing, finance, and supply chain teams to take informed decisions.
4)Tech Stack
•	SQL ( PostgreSQL) for data modeling, transformations, and analytical queries
•	Power BI for interactive dashboards, forecasting, and drillthrough analysis
•	Excel / CSV for raw data ingestion and preprocessing
5)Database Design and Data Modeling
A normalized relational schema (3NF) was designed to ensure data integrity and efficient querying.Tables include customers (customer details, geography, segment, and market), products (product category and sub-category hierarchy), orders (transaction-level sales, profit, discount, and shipping data), and raw_data (staging table for initial data load and transformation).Key data engineering steps included removing duplicates, handling missing values such as postal codes, enforcing primary and foreign key relationships, and splitting raw data into analytical fact and dimension tables.
6)Key SQL Analytics
•	Customer purchase frequency classification into Very Frequent, Frequent, Occasional, and Rare
•	Profit margin analysis across customer frequency buckets
•	Year-wise segment profitability trends
•	Country-level sales and customer distribution analysis
•	Top five profit-making sub-categories per year using window functions
•	Delivery time analysis using order and ship date differences

•	These SQL analyses form the backbone of the Power BI dashboards.

7)Power BI Dashboard Features
•	The Sales Overview page includes KPI cards for total sales, profit, quantity, and discounts, along with monthly and yearly sales trends, regional sales distribution, and top products by profit.
•	The Customer Analytics page focuses on frequency-based customer segmentation, average sales per customer by segment, and profit contribution by customer type.
•	The Product Performance page highlights profit margins by sub-category, year-over-year growth analysis, and drillthrough to individual product-level insights.
•	The Delivery and Logistics Insights page analyzes average delivery time by country and the relationship between shipping cost and profit.
•	The Forecasting and Trend Analysis page includes time-series forecasting for future sales and dynamic slicers for region, segment, and date.
Key Business Insights
•	High-frequency customers contribute over 60 percent of total profit, highlighting the importance of customer retention.
•	The top three countries generate more than 70 percent of overall sales, indicating strong regional concentration.
•	Certain product sub-categories consistently dominate profits across multiple years.
•	Reducing delivery delays in high-latency regions can improve profit margins by approximately eight percent.
•	Sales show a strong upward trend, supporting inventory planning and growth strategies.

8)Project Workflow
•	Data was ingested from raw retail files into a SQL database.
•	Data cleaning was performed to handle missing values, duplicates, and inconsistencies.
•	Normalized tables were created with proper relationships.
•	SQL queries were used to build KPIs and business metrics.
•	The SQL database was connected to Power BI for visualization.
•	Interactive dashboards and forecasting visuals were developed.

9)Business Impact
This solution helps marketing teams target high-value customers, supply chain teams identify and reduce delivery delays, finance teams track profitability and product health, and leadership make data-backed strategic decisions.

10)Conclusion
This project demonstrates strong skills in SQL data modeling and analytics, business-focused dashboard design, customer segmentation, trend analysis, and data storytelling. It bridges data engineering and analytics and is well suited for data analyst and BI roles.
⭐ *If you found this project useful, feel free to star the repository!*
Author-Soham Vashistha
