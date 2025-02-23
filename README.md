# MySQL-Assignments -- Classic-Models-Database-Solution

## Table Contents
- [Introduction](#Introduction)
- [Dataset Overview](#Dataset-Overview)
- [Assignments Objective](#Assignments-Overview)
- [Data Cleaning](#DataCleaning)
- [Data Exploration and Insights](#Data-Exploration-and-Insights)
- [Recommendation](#Recommendation)
- [Conclusion](#Conclusion)
- [Database Schema](#Database-Schema)
- [Questions](#Questions)
- [Solutions](#Solutions)


## Introduction
This project is a MySQL-based data analysis assignment using the Classic Models database. It involves executing structured queries, implementing database constraints, performing aggregations, and analyzing business trends using SQL. The project demonstrates the application of SQL concepts such as joins, subqueries, views, stored procedures, and triggers to derive meaningful insights from business data.

## Dataset Overview
The dataset consists of multiple relational tables representing different aspects of business operations:

Customers – Contains customer details such as name, country, and contact information.
Orders – Stores order records, including order status and dates.
OrderDetails – Provides item-level details of each order, including product, quantity, and price.
Products – Contains information about product descriptions, stock levels, and pricing.
Employees – Stores employee data, including roles, reporting hierarchy, and job titles.
Payments – Records payment transactions with customer details and amounts paid.

## Assignments Overview
* SQL Queries: Implemented using SELECT, WHERE, AND, DISTINCT, and LIKE wildcards.
* CASE Statements: Segmenting customers based on regions.
* Aggregate Functions and Grouping: Using GROUP BY, HAVING, and date functions for analysis.
* Table Constraints: Implementing PRIMARY KEY, FOREIGN KEY, UNIQUE, NOT NULL, and CHECK constraints.
* Joins: Performing INNER JOIN, LEFT JOIN, RIGHT JOIN, and SELF JOIN.
* DDL Commands: Creating, altering, and renaming tables.
* Views: Developing views for sales performance analysis.
* Stored Procedures: Creating parameterized stored procedures with error handling.
* Window Functions: Utilizing RANK, DENSE_RANK, LEAD, and LAG for data analytics.
* Subqueries: Advanced data retrieval using subqueries.
* Error Handling: Implementing exception handling in SQL procedures.
* Triggers: Creating BEFORE INSERT triggers for data validation.

## Data Cleaning
Before analysis, the dataset was cleaned to ensure data accuracy and consistency:

Duplicate records were removed to avoid redundancy.
NULL values were handled by filling in missing data or applying appropriate filters.
String formats were standardized for consistency in querying.
Referential integrity was enforced between related tables.

## Data Exploration and Insights
The project explored various business trends through SQL queries:
📌 Identified top-selling products based on order quantity.
📌 Analyzed monthly payment trends to understand revenue flow.
📌 Ranked customers by order frequency to determine key buyers.
📌 Extracted regional sales insights based on shipping destinations.
📌 Created views and stored procedures for better data accessibility.

## Recommendation
Based on the analysis, the following recommendations were made:
🔹 Optimize inventory for high-demand products to prevent stockouts.
🔹 Target top-paying customers with loyalty programs and personalized offers.
🔹 Improve sales efficiency by focusing on high-order regions.
🔹 Monitor payment trends to optimize cash flow and revenue management.

## Conclusion
This project demonstrates how structured SQL queries, database management, and automation can drive data-driven decision-making. By utilizing various SQL operations, businesses can extract valuable insights to improve performance, optimize operations, and enhance customer engagement.

## Database Schema
Classic-Models
![Classicmodels](https://github.com/user-attachments/assets/12f0a9ca-8d4e-4f27-9ed3-c1e14fd411a6)

## Questions
- <a href = "https://github.com/sitanshusingh/MySQL-Assignments---Classic-Models-Database-Solution/blob/main/MYSQL%20questions.docx">Question File</a>

## Solutions
- <a href = "https://github.com/sitanshusingh/MySQL-Assignments---Classic-Models-Database-Solution/blob/main/Solution.sql">Solution File</a>

