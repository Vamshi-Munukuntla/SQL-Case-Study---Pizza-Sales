/*
=========================================================================
				 SECTION 1: Executive Summary Metrics
=========================================================================
*/

--1. What is the total revenue generated from all pizza sales?
select
	round(sum(price*quantity)/1000,2) as revenue_in_thousands
from order_details od
join orders o
on od.order_id = o.order_id
join pizzas p
on p.pizza_id = od.pizza_id;

-- Total Revenue: 817.86K dollars 

-----------------------------------------------------------------------------------

-- 2. How many unique orders have been placed?
select
	count(distinct order_id) as  total_orders
from order_details;

-- Total Orders: 21,350 

-----------------------------------------------------------------------------------

-- 3. What is the average order value (AOV)?

select 
	round(sum(price*quantity),2) as total_revenue,
	count(distinct od.order_id) as total_orders,
	round(sum(price*quantity)/ count(distinct od.order_id), 2)as avg_order_value
from order_details od
join orders o
on od.order_id = o.order_id
join pizzas p
on p.pizza_id = od.pizza_id

-- Avg Order Value: $38.31

-----------------------------------------------------------------------------------

-- 4. How many pizzas did we sell?

select
	sum(quantity) as total_pizzas_sold
from order_details;

-----------------------------------------------------------------------------------

-- 5. What is the most popular pizza?


select 
	top 1
	name,
	size,
	sum(quantity) as pizza_count
from order_details od
join orders o
on od.order_id = o.order_id
join pizzas p
on p.pizza_id = od.pizza_id 
join pizza_types pt
on p.pizza_type_id = pt.pizza_type_id
group by name, size
order by pizza_count desc


-- Popular Pizza: The Big Meat Pizza (S), 
-- pizzas sold : 1914

-----------------------------------------------------------------------------------

-- 6. What is the most popular pizza size?

with popular_size as (
select
	top 1
	size,
	sum(quantity) as pizza_count
from order_details od
join orders o
on od.order_id = o.order_id
join pizzas p
on od.pizza_id = p.pizza_id
group by size
order by pizza_count desc

)

select 
	size
from popular_size


