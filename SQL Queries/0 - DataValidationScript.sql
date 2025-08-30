CREATE DATABASE sales;

USE sales;

select * from order_details;
select * from orders;
select * from pizzas;
select * from pizza_types;


select count(*) from order_details; --48,620
select count(*) from orders; -- 21350
select count(*) from pizzas; -- 96
select count(*) from pizza_types; -- 32

