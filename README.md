Project Overview
This project explores retail sales data using MySQL. It uses SQL queries to examine sales, customers, product categories, and order timing, and answers practical business questions.

Project Objectives
Explore the retail sales dataset.
Review the number of sales records, customers, and product categories.
Analyze sales by product category and customer gender.
Calculate monthly average sales and identify the highest-average month in each year.
Identify the top 5 customers by total sales.
Count unique customers in each category.
Analyze orders by time-of-day shift.
Tools and Technologies
Database: MySQL
SQL Editor: MySQL Workbench
Language: SQL
Version Control: GitHub
Dataset
The dataset contains transaction-level retail sales information, including transaction ID, sale date and time, customer ID, gender, age, category, quantity, price per unit, cost of goods sold (COGS), and total sale amount.

Note: The quantity column in the existing MySQL table is spelled quantiy. The SQL script uses that exact column name.

Repository Structure
retail-sales-analysis-sql/
├── README.md
└── sql_p1.sql
Business Questions
The SQL script includes queries for these 10 questions:

Retrieve all sales made on November 5, 2022.
Retrieve Clothing transactions with a quantity of at least 4 in November 2022.
Calculate total sales for each product category.
Calculate the average customer age for the Beauty category.
Retrieve transactions with a total sale of at least 1,000.
Count transactions by gender within each product category.
Calculate average sales for each month and identify the highest-average month in each year.
Find the top 5 customers based on total sales.
Count unique customers in each product category.
Group orders into Morning, Afternoon, and Evening shifts and count the orders in each shift.
SQL Concepts Used
Filtering with WHERE
Sorting with ORDER BY
Aggregate functions: COUNT(), SUM(), and AVG()
GROUP BY and DISTINCT
Conditional logic with CASE
Common Table Expressions (CTEs)
Window functions with DENSE_RANK()
Date and time functions
LIMIT
How to Run the Project
Open MySQL Workbench.
Create or select the database containing the retail sales table.
Import the retail sales dataset into the table.
Open sql_p1.sql.
Select the retail_sales database before running the queries, or update the table references to match your database.
Execute the queries individually and review the results.
The first exploratory query references retail_sales.sales. The remaining queries reference sales, so the retail_sales database should be selected as the active schema.

Author
Aditya Gupta
Aspiring Data Analyst | BSc Data Science Student

This project is part of my data analytics learning journey and demonstrates practical SQL skills through retail sales analysis.
