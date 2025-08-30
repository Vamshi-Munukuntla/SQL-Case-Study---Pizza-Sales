/*
=========================================================================
					SECTION 4: Top-Performing Pizzas
=========================================================================
*/

-- 11. Top 5 pizzas that generated the highest total revenue?

select
	top 5
	concat(name, ' (',size,')') as pizza_name,
	round(sum(price*quantity/1000),0) as total_revenue_in_thousands
from order_details od
join orders o
on od.order_id = o.order_id
join pizzas p
on p.pizza_id = od.pizza_id
join pizza_types pt
on pt.pizza_type_id = p.pizza_type_id
group by name, size
order by total_revenue_in_thousands desc;

-- 12. Top 5 pizzas that generated the highest total quantity?

select
	top 5
	concat(name, ' (',size,')') as pizza_name,
	sum(quantity) as total_quantity
from order_details od
join orders o
on od.order_id = o.order_id
join pizzas p
on p.pizza_id = od.pizza_id
join pizza_types pt
on pt.pizza_type_id = p.pizza_type_id
group by name, size
order by total_quantity desc;
