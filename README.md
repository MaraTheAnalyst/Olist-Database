# Olist-Database
### Project Overview
This project analyzes the Olist E-commerce dataset using advanced SQL and Power BI to generate actionable business insights.

A key aspect of this project is the creation of a master table by joining multiple datasets (customers, orders, products, payments, and reviews). Using SQL techniques such as joins, data cleaning, transformations, and aggregations, the raw data was converted into a structured, analysis-ready format.

Additional steps included standardizing fields, removing unnecessary columns, and creating new features like total cost and time-based attributes (year, month, day).

The final dataset was used to explore key metrics such as revenue trends, customer behavior, product performance, and regional sales, which were then visualized in an interactive Power BI dashboard.

### Tools Used
SQL: ETL analysis, EDA analysis, Data modelling, and Data preparation
Power BI: Interactive data visualization and dashboard development

### Objectives
-	Clean and transform raw e-commerce data using SQL 
-	Create a unified dataset for analysis 
-	Analyze customer purchasing behavior 
-	Identify top-performing products and categories 
-	Track revenue trends over time 
-	Evaluate customer satisfaction using review scores 
-	Build an interactive Power BI dashboard for storytelling

## Data Cleaning & Transformation (SQL)
### Key Steps Performed:
-	Standardized customer state names using CASE statements
-	Added a new column: customer_state_full
-	Removed unnecessary columns to optimize performance
-	Created calculated fields: Total_cost = price + freight_value 
-	Converted date formats: Extracted purchase_year, purchase_month, purchase_day
-	Built a master table using multiple joins

## Exploratory Data Analysis (SQL)
### Key Business Questions Answered:
1.	Revenue Analysis
  -	Total revenue by year 
  -	Revenue by product category 
  -	Revenue by state and city 
2.	Product Insights
  -	Top-selling products 
  -	Top revenue-generating categories 
  -	Product performance vs customer ratings 
3.	Customer Behavior
  -	One-time vs repeat customers 
  -	Average order value by state 
  -	Customer distribution by location
4.	Customer Satisfaction
  -	Review score distribution 
  -	Average rating per category 
5.	Payment Analysis
  -	Most used payment methods 
  -	Installment trends 
6.	Time-Based Trends
  -	Monthly and yearly sales trends 
  -	Order distribution over time 

## Power BI Dashboard
The Power BI dashboard provides interactive visualizations, including:
-	Revenue trends (Yearly & Monthly) 
-	Top product categories 
-	Customer distribution by state 
-	Payment method breakdown 
-	Customer review analysis 

## Key Insights
-	Revenue shows clear growth trends across years 
-	Certain product categories dominate total sales 
-	Some states contribute significantly more revenue 
-	A large portion of customers are one-time buyers 
-	Higher-rated products tend to perform better in sales 
-	Credit card is the most common payment method 

## Limitations
-	Loss of time-level detail due to date conversion 
-	Dropped columns limit delivery and sentiment analysis 
-	Potential duplication from multi-table joins 
-	Revenue metrics may vary between payment and item data 
-	Dataset limited to one geographic region (Brazil) 
-	No advanced customer segmentation or predictive modeling

