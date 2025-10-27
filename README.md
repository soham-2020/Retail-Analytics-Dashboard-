# Retail-Analytics-Dashboard-
Retail Analytics Dashboard using SQL &amp; Power BI | Customer Profiling, Sales &amp; Profit Trends, Forecasting, and Drillthrough

Retail Analytics Dashboard using SQL & Power BI

Customer Profiling | Sales & Profit Trends | Forecasting | Drillthrough Analysis

📊 Overview

This project delivers an end-to-end Retail Data Analytics Solution — from SQL-based data modeling and cleaning to an interactive Power BI dashboard.
The goal is to provide actionable insights into customer behavior, sales performance, and profitability trends across different regions, segments, and time periods.

🧩 Tech Stack

SQL (SQLite / PostgreSQL) – Data modeling, transformation, and KPI calculations

Power BI – Dashboarding, forecasting, and interactive analytics

Excel / CSV – Raw data handling and integration

🏗️ Database Design

Structured a 3NF relational schema with the following tables:

Customers: Customer details with segmentation and regional attributes

Products: Product category and subcategory hierarchy

Orders: Transaction-level data with profit, sales, discount, and shipping details

Raw_Data: Staging table for initial load and transformation

Key analytical SQL queries included:

Customer frequency classification (Frequent, Occasional, Rare)

Profit margin analysis per frequency bucket

Yearly segment profitability trends

Delivery time computation by country

Top 5 profitable subcategories per year using window functions

📈 Power BI Dashboard
Dashboard Pages & Features

1️⃣ Sales Overview Dashboard

KPI cards for Total Sales, Profit, Discount, and Quantity

Monthly and yearly sales trends

Sales by Region map view

Top 10 Products by Profit bar chart

2️⃣ Customer Analytics

Frequency-based customer segmentation (Frequent / Occasional / Rare)

Average Sales per Customer by segment

Profit Contribution by customer type

3️⃣ Product Performance

Profit Margin by Subcategory

Year-over-Year Growth Analysis

Drillthrough pages to analyze individual product performance

4️⃣ Delivery Insights

Average Delivery Time by country

Shipping Cost vs Profit correlation scatter plot

5️⃣ Forecasting & Trend Analysis

Built-in Power BI time series forecasting for next-quarter sales

Dynamic date slicers to filter trends by region and segment

🧠 Key Insights Derived

Customers with high purchase frequency drive over 60% of total profit.

Top 3 countries contribute more than 70% of total sales.

Certain subcategories maintain profit dominance consistently across multiple years.

Delivery time optimization can increase profit margin by ~8% in high-delay countries.

🚀 Project Workflow

Data Ingestion → Loaded raw retail dataset into SQL database.

Data Cleaning → Handled nulls, duplicates, and inconsistent postal codes.

Data Modeling → Created normalized schema with foreign keys.

Analytics Queries → Built KPIs and aggregated metrics in SQL.

Power BI Integration → Connected SQL to Power BI via DirectQuery.

Dashboarding & Forecasting → Designed visuals and predictive trends.

🧾 Business Impact

This dashboard enables data-driven decisions for:

Marketing teams to target frequent customers

Supply chain teams to reduce delivery lag

Finance departments to track profit margins and product health

🏁 Conclusion

The project bridges data engineering and analytics, transforming raw sales data into business intelligence insights.
It demonstrates SQL querying, data modeling, visualization design, and storytelling — essential skills for data analyst and BI engineering roles.
