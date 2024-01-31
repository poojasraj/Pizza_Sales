SELECT * FROM dominos_pizza.dominos_pizza;

-- Q1: Total Revenue
select sum(total_price) as Total_Revenue
from dominos_pizza;

-- Q2: Average amount per order
select (sum(total_price)/ count(distinct order_id)) as Average_Amount
from dominos_pizza;

-- Q3: Total pizza sold
select sum(quantity) as Total_pizza_sold
from dominos_pizza;

-- Q4: Total orders placed
select count(distinct order_id) as Total_orders
from dominos_pizza;

-- Q5: Average pizza per order
select cast(cast(sum(quantity) as decimal(10,2))/
cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) 
as Average_pizza_order
from dominos_pizza;

-- Chart Requirements
-- Daily trend for total orders
select  weekday as Order_day,
count(distinct order_id) as Total_orders
from dominos_pizza
group by Order_day
order by Total_orders;

-- Monthly trend of total ordres
select Months as Monthly_orders,
count(distinct order_id) as Total_orders
from dominos_pizza
group by Monthly_orders;

-- Percentage of sales by pizza category
select pizza_category,cast(sum(total_price) as decimal(10,2)) as Total_revenue,
cast(sum(total_price)*100/(select sum(total_price) from dominos_pizza) as decimal(10,2)) as PCT
from dominos_pizza
group by pizza_category;

-- Percentage of sales by pizza size
select pizza_size,cast(sum(total_price) as decimal(10,2)) as Total_revenue,
cast(sum(total_price)*100/(select sum(total_price) from dominos_pizza) as decimal(10,2)) as PCT
from dominos_pizza
group by pizza_size;

-- Total pizza sold by category
select pizza_category, sum(quantity) as Total_pizza_sold
from dominos_pizza
group by pizza_category
order by Total_pizza_sold desc;

-- Top/Bottom 5 best sellers
-- Top 5 By Revenue
select pizza_name, sum(total_price) as Total_Revenue
from dominos_pizza
group by pizza_name
order by Total_Revenue desc
limit 5;

-- Bottom 5 by revenue
select pizza_name, sum(total_price) as Total_Revenue
from dominos_pizza
group by pizza_name
order by Total_Revenue ASC
limit 5;

-- Top 5 by quantity
select pizza_name, sum(quantity) as Total_pizza_sold
from dominos_pizza
group by pizza_name
order by Total_pizza_sold desc
limit 5;

-- Bottom 5 by quantity
select pizza_name, sum(quantity) as Total_pizza_sold
from dominos_pizza
group by pizza_name
order by Total_pizza_sold ASC
limit 5;

-- Top 5 by orders
select pizza_name, count(distinct order_id) as Total_orders
from dominos_pizza
group by pizza_name
order by Total_orders desc
limit 5;

-- Bottom 5 by orders
select pizza_name, count(distinct order_id) as Total_orders
from dominos_pizza
group by pizza_name
order by Total_orders ASC
limit 5;
