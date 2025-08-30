-- 15.	
--Which pizzas have high unit sales but low total revenue? (high sales, low revenue)
-- Which pizzas have high unit sales and high total revenue? (high sales, high revenue)
-- Which pizzas have low unit sales but low total revenue? (low sales, low revenue)
-- Which pizzas have low unit sales but high total revenue? (low sales, high revenue)


select
	*
from     FROM order_details od
    JOIN pizzas p ON od.pizza_id = p.pizza_id
    JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
    GROUP BY pt.name,size