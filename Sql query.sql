SELECT count(*) FROM sales;
-- Total revenue
select sum(total_price) as `Total Revenue` from sales;

-- Average Order Value 
select * from sales;
select sum(total_price)/ count(distinct order_id ) as Average_Order_Value from sales;

-- Total Pizza Sold 
select sum(quantity) as Total_Pizza_Sold from sales;

-- Total Orders 
select count(distinct order_id) as Total_Orders from sales;

-- Avg pizzas per order
select * from sales;
select sum(quantity)/count(distinct order_id) as Avg_Pizza_Per_Order from sales;

-- Daily Trends for total orders 
select * from sales;
SELECT 
    dayname(STR_TO_DATE(order_date, '%Y-%m-%d')) AS ConvertedDate,count(distinct order_id) as Total_Orders
FROM sales
group by convertedDate;

-- Hourly Trends for total orders 
select * from sales;
select left(order_time,2) as Hour, count(distinct order_id) as Pizza_Sold from sales
group by Hour;

-- Percentage of sales by pizza category
select * from sales;
select pizza_category as category, sum(total_price) as revenue from sales
group by category;

SELECT 
    pizza_category AS category,
    SUM(total_price) / (SELECT SUM(total_price) FROM sales) * 100 AS percentage
FROM sales
GROUP BY pizza_category;

-- Percemtage of sales by pizza size 
select * from sales;
SELECT 
    pizza_size AS size,
    SUM(total_price) / (SELECT SUM(total_price) FROM sales) * 100 AS percentage
FROM sales
GROUP BY size;

-- Total Pizza Sold by Category 
select * from sales;
select pizza_category as Category,sum(quantity) as Pizza_Sold from sales 
group by Category;

-- Top 5 Best Sellers 
select * from sales;
select pizza_name as Name,sum(quantity) as Pizza_Sold from sales 
group by Name order by Pizza_Sold desc limit 5;


-- Bottom  5 worst sellers 
select pizza_name as Name,sum(quantity) as Pizza_Sold from sales 
group by Name order by Pizza_Sold limit 5;