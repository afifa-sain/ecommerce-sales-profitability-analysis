CREATE TABLE orders (
    row_id INTEGER,
    order_id VARCHAR(20),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(20),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country_region VARCHAR(100),
    city VARCHAR(100),
    state_province VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    product_id VARCHAR(30),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name TEXT,
    sales NUMERIC(12,2),
    quantity INTEGER,
    discount NUMERIC(5,2),
    profit NUMERIC(12,2),
    shipping_days INTEGER,
    order_year INTEGER,
    order_month VARCHAR(20)
);

SELECT count (*) 
FROM Orders;

Select * 
from Orders 
limit 10;

"Q1"
Select sum(sales) as Total_sales 
from Orders;

"Q2"
Select sum(Profit) as Total_profit 
from Orders;

"Q3"
Select sum(quantity) as Total_quantity
from Orders;

"Q4"
Select count (distinct order_id ) as Total_number_of_orders
from Orders;

"Q5"
Select count (distinct customer_id ) as Number_of_customers
from Orders;

"Q6"
Select  avg(sales) as Average_sales_per_order
from orders;

"Q7"
Select avg (profit) as Average_profit
from Orders;

"Q8"
Select category, sum(sales) as Total_sales_by_category
from Orders
group by category;

"Q9"
Select category, sum(profit) as Total_profit_by_category
from Orders
group by category;

"Q10"
Select Region, sum(sales) as Sales_by_region
from orders
group by region;

"Q11"
select region, sum(profit) as profit_by_region
from Orders
group by region;

"Q12"
Select segment, sum(sales) as Sales_by_segment
from Orders
group by segment;

"Q13"
Select segment, sum(profit) as Profit_by_segment
from Orders
group by segment;

"Q14"
Select sub_category, sum(sales) as Sales_by_sub_category
from Orders
group by sub_category;

"Q15"
Select sub_category, sum(profit) as Profit_by_sub_category
from Orders
group by sub_category;

"Q16"
select product_name, sum(sales) as Top_product_by_sales
from orders
group by product_name
order by  Top_product_by_sales desc
limit 10;

"Q17"
select product_name, sum(profit) as Top_product_by_profit
from orders
group by product_name
order by  Top_product_by_profit desc
limit 10;

"Q18"
select product_name, sum(profit) as Bottom_product_by_profit
from orders
group by product_name
order by  Bottom_product_by_profit asc
limit 10;

"Q19"
select customer_name, sum(sales) as Top_customers_by_sales
from orders
group by customer_name
order by  Top_customers_by_sales desc
limit 10;

"Q20"
select customer_name, sum(profit) as Top_customers_by_profit
from orders
group by customer_name
order by  Top_customers_by_profit desc
limit 10;

"Q21"
Select order_id, sales, profit,
case
when profit>0 then 'Profitable'
when profit<0 then 'Loss'
else 'Break-even'
end as Profit_status
from orders;

"Q22"
select order_id, sales, discount,
case
when discount=0 then 'No Discount'
when discount>0 and discount<=0.20 then 'Low Discount'
when discount>0.20 and discount<=0.50 then 'Medium Discount'
else 'High Discount'
end as discount_classification
from orders;

"Q23"
select order_id, order_date, ship_date,shipping_days,
case
when shipping_days<=2 then 'Fast'
when shipping_days>2 and shipping_days<=4 then 'standard'
else 'Slow'
end as Shipping_performance
from orders;

"Q24"
select product_name, sum(sales) as total_sales, sum(profit) as total_profit
from orders
group by product_name
having sum(sales)>10000 and sum(profit)<0;

"Q25"
select category, sum(sales) as total_sales,
sum(profit) as total_profit, 
(sum(profit) / sum(sales) ) * 100 as profit_margin 
from orders
group by category;

"Q26"
select region, sum(sales) as total_sales,
sum(profit) as total_profit, 
(sum(profit) / sum(sales) ) * 100 as profit_margin 
from orders
group by region;

"Q27"
select
case
when discount=0 then 'No Discount'
when discount>0 and discount<=0.20 then 'Low Discount'
when discount>0.20 and discount<=0.50 then 'Medium Discount'
else 'High Discount'
end as discount_level,
sum(sales) as total_sales,
sum(profit) as total_profit,
avg(profit) as average_profit
from orders
group by
case
when discount=0 then 'No Discount'
when discount>0 and discount<=0.20 then 'Low Discount'
when discount>0.20 and discount<=0.50 then 'Medium Discount'
else 'High Discount'
end;

"Q28"
select order_year, sum(sales) as total_sales 
from orders 
group by order_year;

"Q29"
select order_year, sum(profit) as total_profit
from orders 
group by order_year;

"Q30"
select order_year, sum(sales) as total_sales,
sum(profit) as total_profit
from orders 
group by order_year;

"Q31"
with ranked_products as (
select category,product_name, sum(sales) as total_sales,
rank()over
(partition by category 
order by sum(sales) desc) as top_products 
from orders
group by category, product_name)
select category, product_name, total_sales,top_products
from ranked_products
where top_products<= 3;

"Q32"
with ranked_customer as (
select region,customer_name, sum(sales) as total_sales,
rank()over
(partition by region 
order by sum(sales) desc) as top_customers
from orders
group by region, customer_name)
select region, customer_name, total_sales,top_customers
from ranked_customer
where top_customers<= 3;

"Q33"
select order_year, order_month, sum(sales) as total_sales
from orders
group by order_year,order_month
order by order_year , to_date (order_month, 'month') asc;

"Q34"
select order_year, order_month, sum(profit) as total_profit
from orders
group by order_year,order_month
order by order_year , to_date (order_month, 'month') asc;

"Q35"
select order_year, order_month, sum(sales) as total_sales,
lag(sum(sales)) over (order by order_year, to_date (order_month, 'month')) as previous_month_sales,
round(
((sum(sales)-lag(sum(sales))over(order by order_year, to_date (order_month, 'month')))/
nullif(
lag(sum(sales))over(order by order_year, to_date (order_month, 'month')),0))*100,2) as MOM_growth_percent
from orders
group by order_year,order_month
order by order_year , to_date (order_month, 'month') asc;

"Q36"
select order_year, order_month, sum(sales) as total_sales,
sum(sum(sales)) over (partition by order_year order by to_date(order_month,'month')) as cumulative_sales
from orders
group by order_year,order_month
order by order_year, to_date(order_month,'month') asc;

"Q37"
select product_name, sum(sales) as total_sales,
rank()over
(order by sum(sales) desc) as products_rank
from orders
group by  product_name;

"Q38"
select customer_name,sum(sales) as total_sales,
round(sum(sales)*100/sum(sum(sales)) over(),2) as customer_revenue_contribution
from orders
group by customer_name
order by total_sales desc;

"Q39"
select category, sum(sales) as total_sales,
sum(profit) as total_profit 
from orders
group by category
order by total_sales desc;

"Q40"
select product_name, sum(profit) as total_profit
from orders
group by product_name 
having sum(profit)<0
order by total_profit asc;

"Q41"
select region, sum(sales) as total_sales,
sum(profit) as total_profit,
(sum(profit) / nullif(sum(sales),0 )) * 100 as profit_margin 
from orders
group by region
order by total_sales desc;

"Q42"
select discount, sum(sales) as total_sales,
sum(profit) as total_profit,
(sum(profit)/nullif(sum(sales),0)) * 100 as profit_margin
from orders 
group by discount
order by discount desc;

"Q43"
select segment,  sum(sales) as total_sales,
sum(profit) as total_profit,
(sum(profit)/nullif(sum(sales),0)) * 100 as profit_margin
from orders 
group by segment
order by total_profit desc;

"Q44"
select ship_mode,count(distinct(order_id)) as no_of_orders, 
sum(sales) as total_sales,
sum(profit) as total_profit,
avg(shipping_days) as average_shipping_days
from orders 
group by ship_mode
order by no_of_orders desc;

"Q45"
select state_province, sum(profit) as total_profit,
rank()over(
order by sum(profit) asc) as rank_of_loss_making_states
from orders
group by state_province
having sum(profit)<0;