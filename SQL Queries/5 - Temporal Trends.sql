/*
=========================================================================
					SECTION 5. Temporal Trends
=========================================================================
*/

-- 13. At what times of day do most orders occur?

select
	DATEPART(HOUR, time) as hour,
	count(distinct od.order_id) as orders_count,
	sum(quantity) as pizza_count
from order_details od
join orders o
on od.order_id = o.order_id
join pizzas p
on p.pizza_id = od.pizza_id
join pizza_types pt
on pt.pizza_type_id = p.pizza_type_id 
group by DATEPART(HOUR, time)
order by hour;

-- 14. Which day of the week generate the highest revenue?

select 
	datepart(weekday, date) as daynum,
	datename(weekday, date) as dayname,
	round(sum(od.quantity * price)/1000,2) as total_revenue_per_day_in_thousands
from order_details od
join orders o
on od.order_id = o.order_id
join pizzas p
on p.pizza_id = od.pizza_id
join pizza_types pt
on pt.pizza_type_id = p.pizza_type_id
group by datename(weekday, date), datepart(weekday, date)
order by datepart(weekday, date);