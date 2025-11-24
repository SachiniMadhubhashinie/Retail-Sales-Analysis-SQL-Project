--Sql Retal Sales Analysis
CREATE DATABASE RetailSales
USE RetailSales


--Create Table
DROP TABLE IF EXISTS Sales_Retail
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

SELECT*FROM Sales_Retail
SELECT COUNT(*) FROM Sales_Retail

--Data Cleaning
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


--DELETE From SalesRetail
DELETE FROM Sales_Retail
WHERE transactions_id is NULL OR
sale_date IS NULL OR
sale_time IS NULL OR
gender IS NULL OR
category IS NULL OR
quantiy IS NULL OR
cogs IS NULL OR
total_sale IS NULL


--Data Exploration
--How many sales we have
SELECT COUNT(*) AS Total_Sale FROM Sales_Retail

--How many customer we have?
SELECT COUNT(DISTINCT Customer_id) AS Total_Customers FROM Sales_Retail

--How many category we have?
SELECT DISTINCT category FROM Sales_Retail


--Data Analysis & Business Key Problems & Answers

--Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05'
SELECT * FROM Sales_Retail
WHERE sale_date ='2022-11-05'

--Q.2 Write a SQL Query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022
SELECT * FROM Sales_Retail
WHERE category='Clothing' AND YEAR(sale_date)='2022' AND MONTH(sale_date)='11' AND quantiy>=4

--Q.3 Write a SQL query to calculate the total sales for each category
SELECT Category,SUM(total_sale) AS NetSales,COUNT(*) AS TotalOrders FROM Sales_Retail
GROUP BY Category

--Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category
SELECT AVG(age) AS AverageAge FROM Sales_Retail
WHERE category='Beauty'

--Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000
SELECT * FROM Sales_Retail
WHERE total_sale>1000

--Q.6 Write a SQL query to find the total number of transactions(transaction_id) made by each gender in each category
SELECT category,gender,COUNT(*) AS Total_Transaction FROM Sales_Retail
GROUP BY category,gender
ORDER BY 1

--Q.7.Write a SQL query to calculate the average sale for each month.Find out best selling month in each year
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
    ORDER BY Year,Sale_Rank;


--Q.8 Write a SQL query to find the top 5 customers based on the highest total sales
SELECT TOP 5
customer_id,
SUM(total_sale) AS total_sales
FROM Sales_Retail
GROUP BY customer_id
ORDER BY total_sales DESC;

--Q.9 Write a SQL query to findthe number of unique customers who purchased items from each category.

SELECT category,COUNT(DISTINCT customer_id) AS  No_of_UniqueCustomers
FROM Sales_Retail
GROUP BY category


--Q.10 Write a SQL Query to create each shift and number of orders(Example Morning <=12 ,Afternoon Between 12 & 17,Evening >17)

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
ORDER BY Total_Orders DESC;







