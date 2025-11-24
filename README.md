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
    <li>
      <strong>Database Setup</strong>
      <p><strong>Database Creation:</strong> The project starts by creating a database named <em>p1_retail_db</em>.</p>
      <p><strong>Table Creation:</strong> A table named <em>retail_sales</em> is created to store the sales data. The table structure includes columns for transaction ID, sale date, sale time, customer ID,        gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount.</p>
    </li>
  </ol>

  CREATE DATABASE RetailSales;
USE RetailSales;

`` ` `` sql
DROP TABLE IF EXISTS Sales_Retail;
CREATE TABLE Sales_Retail
(
transactions_id INT PRIMARY KEY,
sale_date DATE,
sale_time TIME,
customer_id INT,
gender VARCHAR(10),
age INT,
category VARCHAR(15),
quantiy INT,
price_per_unit FLOAT,
cogs FLOAT,
total_sale FLOAT
`` ` ``





