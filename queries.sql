select
    e.first_name || ' ' || e.last_name as seller,
    TRIM(TO_CHAR(s.sale_date,'day')) as day_of_week,
    FLOOR(SUM(p.price * s.quantity)) as income
from sales s
join employees e ON s.sales_person_id = e.employee_id
join products p ON s.product_id = p.product_id
group by
    e.first_name,
    e.last_name,
    e.employee_id,
    TRIM(TO_CHAR(s.sale_date,'day')),
    EXTRACT(ISODOW FROM s.sale_date)
order by
    EXTRACT(ISODOW FROM s.sale_date),
    seller ASC;

WITH first_sale_dates AS (
select
    s.customer_id,
    MIN(s.sale_date::date) AS first_sale_date
from sales s
JOIN products p ON s.product_id = p.product_id
where p.price = 0
and s.sale_date IS NOT NULL
group by s.customer_id
),
first_sales AS (
select DISTINCT ON (fsd.customer_id)
    fsd.customer_id,
    fsd.first_sale_date,
    s.sales_person_id
from first_sale_dates fsd
JOIN sales s on fsd.customer_id = s.customer_id 
and fsd.first_sale_date = s.sale_date::date
order by fsd.customer_id, s.sales_id
)
select
     CONCAT(c.first_name, ' ', c.last_name) AS customer,
     fs.first_sale_date AS sale_date,
     CONCAT(e.first_name, ' ', e.last_name) AS seller
from first_sales fs
JOIN customers c ON fs.customer_id = c.customer_id
JOIN employees e ON fs.sales_person_id = e.employee_id
order by c.customer_id;

select COUNT(distinct customer_id) as customer_count 
from customers;

select 
case 
when age between 16 and 25 then '16-25'
when age between 26 and 40 then '26-40'
when age >= 41 then '40+'
end as age_category,
COUNT(*) as age_count 
from customers 
where age is not null 
and age >= 16 
group by age_category 
order by age_category;

select 
  TO_CHAR(s.sale_date, 'YYYY-MM') as selling_month,
  COUNT(DISTINCT s.customer_id) as total_customers,
  FLOOR(SUM(p.price * s.quantity)) as income 
from sales s  
join products p on s.product_id=p.product_id 
group by TO_CHAR(s.sale_date, 'YYYY-MM') 
order by selling_month asc;

select
    CONCAT(e.first_name, ' ', e.last_name) AS seller,
    COUNT(s.sales_id) AS operations,
    TRUNC(SUM(s.quantity * p.price))::BIGINT AS income
from sales s
JOIN employees e ON s.sales_person_id = e.employee_id
JOIN products p ON s.product_id = p.product_id
group by e.employee_id, e.first_name, e.last_name
order by income DESC
LIMIT 10;

WITH
  sales_revenue AS (
select s.sales_person_id, p.price * s.quantity AS deal_revenue
from sales s
JOIN products p ON s.product_id = p.product_id
  ),
  seller_avg AS (
select
      e.employee_id,
      CONCAT(e.first_name, ' ', e.last_name) AS seller,
      FLOOR(AVG(sr.deal_revenue)) AS average_income
from employees e
JOIN sales_revenue sr ON e.employee_id = sr.sales_person_id
group by e.employee_id, e.first_name, e.last_name
  ),
  global_avg AS (
select FLOOR(AVG(deal_revenue)) AS avg_all
from sales_revenue
  )
select sa.seller, sa.average_income
from seller_avg sa
CROSS JOIN global_avg ga
where sa.average_income < ga.avg_all
order by sa.average_income asc;






