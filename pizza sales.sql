/*Database Creation*/
create database pizza_sales_db;
use pizza_sales_db;
/* Table Set-Up
   Loaded order_details table, 48620 rows
   Loaded order table, 21350 rows
   Loaded pizza_types table, 32 rows
   Loaded pizzas table, 96 rows*/

select count(*) from order_details;
select count(*) from orders;
select count(*) from pizza_types;
select count(*) from pizzas;

/* Question 1 : Join the necessary tables to find the total quantity of each pizza category ordered. */

select * from order_details limit 2;
select * from pizza_types limit 2;
select * from pizzas limit 2;
select * from orders limit 2;

with t1 as (select od.order_id, od.quantity, pz.pizza_id, pt.category
from order_details od
join pizzas as pz
on od.pizza_id = pz.pizza_id
join pizza_types as pt
on pt.pizza_type_id=pz.pizza_type_id)
select category,  
	   sum(quantity) as Total_quantity_ordered
from t1
group by 1;

/* Question 2 : Determine the distribution of orders by hour of the day.*/

select date,
	   hour(time) hour,
	   count(order_id) number_of_order
from orders
group by 1,2
order by 1,2 asc;

/* Question 3: Join relevant tables to find the category-wise distribution of pizzas.*/



