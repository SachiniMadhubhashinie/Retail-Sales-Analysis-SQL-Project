# Retail-Sales-Analysis-SQL-Project
A simple SQL project analyzing retail sales data. Includes database setup, data cleaning, EDA, and answering business questions using SQL queries.

<h2>Project overview </h2>
<p>This repository contains a Retail Sales Analysis project built using SQL. It includes database creation, data cleaning, exploratory analysis, and solutions to key business questions using SQL queries. The project is designed to help beginners understand how to work with real-world sales data and apply essential SQL concepts such as filtering, grouping, aggregation, ranking, and customer insights.</p>

## Objectives

1. **Set up a retail sales database**: Create and populate a retail sales database with the provided sales data.
2. **Data Cleaning**: Identify and remove any records with missing or null values.
3. **Exploratory Data Analysis (EDA)**: Perform basic exploratory data analysis to understand the dataset.
4. **Business Analysis**: Use SQL to answer specific business questions and derive insights from the sales data.



 ## Project Structure

### 1. Database Setup

- **Database Creation**: The project starts by creating a database named `RetailSales`.
- **Table Creation**: A table named `Sales_Retail` is created to store the sales data. The table structure includes columns for transaction ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount.

  CREATE DATABASE RetailSales;
USE RetailSales;

```sql
CREATE DATABASE RetailSales

CREATE TABLE Sales_Retail
(
transactions_id INT PRIMARY KEY ,
sale_date DATE,
sale_time TIME,
customer_id INT,
gender VARCHAR(10),
age INT,
category VARCHAR(15),
quantiy INT ,
price_per_unit FLOAT,
cogs FLOAT,
total_sale FLOAT
)
```

### 2. Data Exploration & Cleaning

- **Record Count**: Determine the total number of records in the dataset.
- **Customer Count**: Find out how many unique customers are in the dataset.
- **Category Count**: Identify all unique product categories in the dataset.
- **Null Value Check**: Check for any null values in the dataset and delete records with missing data.

```sql
SELECT*FROM Sales_Retail
SELECT COUNT(*) FROM Sales_Retail
SELECT DISTINCT category FROM Sales_Retail

SELECT *FROM Sales_Retail
WHERE transactions_id is NULL

SELECT *FROM Sales_Retail
WHERE sale_date is NULL

SELECT *FROM Sales_Retail
WHERE sale_time is NULL

SELECT *FROM Sales_Retail
WHERE transactions_id is NULL OR
sale_date IS NULL OR
sale_time IS NULL OR
gender IS NULL OR
category IS NULL OR
quantiy IS NULL OR
cogs IS NULL OR
total_sale IS NULL

```






