CREATE DATABASE COMPANY;
use company;
select * from sales;

show tables;

select * from company.sales;

-- 1.Find all orders shipped via 'Economy' mode with a total amount greater than Rs.25000.
select * from sales where Ship_Mode='Economy' and Total_Amount>25000;

-- 2.Retreive all sales data fro 'Techempnology' category in 'Ireland' made after 2020-01-01.
select * from sales where category='Technology' and country='Ireland' and Order_Date>'2020-01-01';

-- 3.List the top 10 most profitable sales transactions in descending order
select * from sales 
order by Unit_Profit DESC  
limit 10,20;	-- skips 10 records and shows next 20 records

-- 4.Find all customers whose name starts with 'J' and ends with 'n'
select Order_ID,Customer_Name from sales
where Customer_Name LIKE 'J%N';

-- 5.Retreive all product names that contain 'Acco' anywhere in the name 
select Order_ID,Product_Name from sales 
where Product_Name LIKE '%Acco%';

-- 6.get top 5 cities with the highest total sales amount
select City, sum(Total_Amount) as total 
from sales
group by City
order by total DESC
limit 5;

-- 7.Display the second set of 10 records for Customer_Name and Total_Amount in desc order
select Customer_Name,Total_Amount from sales
order by Total_Amount DESC
limit 10,10;

-- 8.Find the total revenue ,average unit cost,and total number of orders
select sum(Total_Amount) as `Total revenue`,avg(Unit_Cost) as `average unit cost`,count(Order_ID) as `Total orders` from sales;

-- 9.Count unique no of regions
select count(distinct Region) as count from sales;

-- 10.Find the number of orders placed by each customer
select Customer_Name,count(Order_ID) as `No of orders` from sales
group by Customer_Name
order by `No of orders` DESC ;

-- 11.Rank 5 products based on total sales using RANK()
select Product_Name,sum(Total_Amount) as Total_Sales,
RANK() OVER(ORDER BY SUM(Total_Amount) DESC) as Sales_Rank
from sales
group by Product_Name
limit 5; 