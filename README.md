# Retail-Sales-Analysis-SQL-Project
A simple SQL project analyzing retail sales data. Includes database setup, data cleaning, EDA, and answering business questions using SQL queries.

<h2>Project overview </h2>
<p>This repository contains a Retail Sales Analysis project built using SQL. It includes database creation, data cleaning, exploratory analysis, and solutions to key business questions using SQL queries. The project is designed to help beginners understand how to work with real-world sales data and apply essential SQL concepts such as filtering, grouping, aggregation, ranking, and customer insights.</p>

<h2>Objectives</h2>
<ol>
  <li><i>Set up a retail sales database: </i>Create and populate a retail sales database with the provided sales data.</li>
  <li><i>Data Cleaning:</i>Identify and remove any records with missing or null values.</li>
  <li><i>Exploratory Data Analysis (EDA):</i>Perform basic exploratory data analysis to understand the dataset.</li>
  <li><i>Business Analysis:</i>Business Analysis:</li>
</ol>

<h2>Project Structure</h2>
<ol>
<li><h3>Database Setup</h3><li></li>
  <ul>
    <li>Database Creation: The project starts by creating a database named RetailSales</li>
    <li>Table Creation: A table named retail_sales is created to store the sales data. The table structure includes columns for transaction ID, sale date, sale time, customer ID, gender, age, product category,         quantity sold, price per unit, cost of goods sold (COGS), and total sale amount.</li>
  </ul>
</ol>
'''sql
SELECT 
    customer_id,
    SUM(total_sale) AS total_sales
FROM Sales_Retail
GROUP BY customer_id
ORDER BY total_sales DESC;
'''

SELECT 
    CASE 
        WHEN DATEPART(HOUR, sale_time) < 12 THEN 'Morning'
        WHEN DATEPART(HOUR, sale_time) BETWEEN 12 AND 16 THEN 'Afternoon'
        ELSE 'Evening'
    END AS Shift,
    COUNT(*) AS Total_Orders
FROM Sales_Retail
GROUP BY CASE 
             WHEN DATEPART(HOUR, sale_time) < 12 THEN 'Morning'
             WHEN DATEPART(HOUR, sale_time) BETWEEN 12 AND 16 THEN 'Afternoon'
             ELSE 'Evening'
         END
ORDER BY Total_Orders DESC;








