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

DELETE FROM Sales_Retail
WHERE transactions_id is NULL OR
sale_date IS NULL OR
sale_time IS NULL OR
gender IS NULL OR
category IS NULL OR
quantiy IS NULL OR
cogs IS NULL OR
total_sale IS NULL

```

### 3. Data Analysis & Findings

The following SQL queries were developed to answer specific business questions:
1. **Write a SQL query to retrieve all columns for sales made on '2022-11-05**:
   
```sql
SELECT * FROM Sales_Retail
WHERE sale_date ='2022-11-05'
```

2. **Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022**:

```sql
SELECT * FROM Sales_Retail
WHERE category='Clothing' AND YEAR(sale_date)='2022' AND MONTH(sale_date)='11' AND quantiy>=4
```
3. **Write a SQL query to calculate the total sales (total_sale) for each category.**:
   
```sql
SELECT Category,SUM(total_sale) AS NetSales,COUNT(*) AS TotalOrders FROM Sales_Retail
GROUP BY Category
```

4. **Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.**:

```sql
SELECT AVG(age) AS AverageAge FROM Sales_Retail
WHERE category='Beauty'
```

5. **Write a SQL query to find all transactions where the total_sale is greater than 1000.**:

 ```sql
SELECT * FROM Sales_Retail
WHERE total_sale>1000
 ```

6. **Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.**:

```sql
SELECT category,gender,COUNT(*) AS Total_Transaction FROM Sales_Retail
GROUP BY category,gender
ORDER BY 1
```

7. **Write a SQL query to calculate the average sale for each month. Find out best selling month in each year**:

```sql
SELECT 
    YEAR(sale_date) AS Year,
    MONTH(sale_date) AS Month,
    AVG(total_sale) AS Avg_Sale
FROM Sales_Retail
GROUP BY 
    YEAR(sale_date),
    MONTH(sale_date)
ORDER BY 
    Year, Month,Avg_Sale DESC

--Give Sale Rank
    SELECT 
    YEAR(sale_date) AS Year,
    MONTH(sale_date) AS Month,
    AVG(total_sale) AS Avg_Sale,
    RANK() OVER(
        PARTITION BY YEAR(sale_date)
        ORDER BY AVG(total_sale) DESC) AS Sale_Rank
    FROM Sales_Retail
    GROUP BY YEAR(sale_date),MONTH(sale_date)
    ORDER BY Year,Sale_Rank
```

8. **Write a SQL query to find the top 5 customers based on the highest total sales **:

```sql
SELECT TOP 5
customer_id,
SUM(total_sale) AS total_sales
FROM Sales_Retail
GROUP BY customer_id
ORDER BY total_sales DESC
```

9. **Write a SQL query to find the number of unique customers who purchased items from each category.**:

```sql
SELECT category,COUNT(DISTINCT customer_id) AS  No_of_UniqueCustomers
FROM Sales_Retail
GROUP BY category
```

10. **Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)**:

```sql
SELECT 
    CASE 
        WHEN DATEPART(HOUR, sale_time) < 12 THEN 'Morning'
        WHEN DATEPART(HOUR, sale_time) BETWEEN 12 AND 16 THEN 'Afternoon'
        ELSE 'Evening'
    END AS Shift,
    COUNT(*) AS Total_Orders
FROM Sales_Retail
GROUP BY 
    CASE 
        WHEN DATEPART(HOUR, sale_time) < 12 THEN 'Morning'
        WHEN DATEPART(HOUR, sale_time) BETWEEN 12 AND 16 THEN 'Afternoon'
        ELSE 'Evening'
    END
ORDER BY Total_Orders DESC

```

## Findings

- **Customer Demographics**: The dataset includes customers from various age groups, with sales distributed across different categories such as Clothing and Beauty.
- **High-Value Transactions**: Several transactions had a total sale amount greater than 1000, indicating premium purchases.
- **Sales Trends**: Monthly analysis shows variations in sales, helping identify peak seasons.
- **Customer Insights**: The analysis identifies the top-spending customers and the most popular product categories.

## Reports

- **Sales Summary**: A detailed report summarizing total sales, customer demographics, and category performance.
- **Trend Analysis**: Insights into sales trends across different months and shifts.
- **Customer Insights**: Reports on top customers and unique customer counts per category.


## Conclusion

This project serves as a comprehensive introduction to SQL for data analysts, covering database setup, data cleaning, exploratory data analysis, and business-driven SQL queries. The findings from this project can help drive business decisions by understanding sales patterns, customer behavior, and product performance.   
   
   

   






