select * from pizza_sales

--Total_revenue of pizza_sales
Select sum(total_price) as TOTAL_REVENUE from pizza_sales

-- Avg order value
select sum(total_price) / count(distinct (order_id)) as AVG_ORDER from pizza_sales

--Total Pizza Sold

select sum(quantity) as PIZZA_SOLD from pizza_sales

--Total Orders Sold
SELECT count (distinct (order_id)) as total_orders_Sold from pizza_sales

--Average pizzas per order
SELECT cast (cast(sum(quantity) as decimal(10,2)) / 
cast (COUNT (distinct order_id) as decimal(10,2)) as decimal(10,2)) as Average_Pizza_Order from pizza_sales

--Daily trends for total orders
select DATENAME(DW, order_date) as order_day, count(distinct order_id) as Total_orders from pizza_sales group by DATENAME(DW, order_date)

--order placed on each date
select order_date, count(distinct order_id) from pizza_sales group by order_date

-- hourly trend for total orders
select order_time, count(distinct order_id) from pizza_sales group by order_time

-- monthly trend for total orders
select DATENAME(month,order_date) as Monthly_order, count(distinct order_id) as Total_orders 
from pizza_sales group by DATENAME(month,order_date)
order by Total_orders desc

-- percentage sales by pizza catageory
select pizza_category, cast(sum(total_price) as decimal(10,2)) as Total_price, 
cast(sum(total_price)*100/ (select sum(total_price) from pizza_sales) as decimal(10,2)) as Total_revenue_PCT 
from pizza_sales 
group by pizza_category

-- percentage sales by monthly_sales and pizza catageory
select DATENAME(month,order_date) as monthly_sales, pizza_category, cast(sum(total_price) as decimal(10,2)) as Total_price, 
cast(sum(total_price)*100/ (select sum(total_price) from pizza_sales) as decimal(10,2)) as Total_revenue_PCT 
from pizza_sales 
group by DATENAME(month,order_date),pizza_category 
order by monthly_sales asc

-- percentage of sales by pizza size
select pizza_size,cast(sum(total_price) as decimal(10,2)) as Total_price, 
cast(sum(total_price) *100 / (select sum(total_price) from pizza_sales) as decimal(10,2)) as PCT_pizza_size from pizza_sales 
group by pizza_size

--Max selling pizza by revenue
select top 5 pizza_name, sum(total_price) as Revenue_By_Pizza from pizza_sales
group by pizza_name
order by Revenue_By_Pizza DESC

--least selling pizza by revenue
select top 5 pizza_name, sum(total_price) as Revenue_By_Pizza from pizza_sales
group by pizza_name
order by Revenue_By_Pizza

-- Maximum Number of pizza sold by quantity
select top 5 pizza_name, sum(quantity) as SalesByQuantity from pizza_sales
group by pizza_name
order by SalesByQuantity DESC

-- Least pizza sold by quantity
select top 5 pizza_name, sum(quantity) as SalesByQuantity from pizza_sales
group by pizza_name
order by SalesByQuantity

-- Max pizza sold by Order
select top 5 pizza_name, count(distinct order_id) as SalesByOrder from pizza_sales
group by pizza_name
order by SalesByOrder desc

-- Least pizza sold by Order
select top 5 pizza_name, count(distinct order_id) as SalesByOrder from pizza_sales
group by pizza_name
order by SalesByOrder

select * from pizza_sales








