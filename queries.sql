select
    e.first_name || ' ' || e.last_name AS seller,
    TO_CHAR(s.sale_date, 'day') AS day_of_week,
    FLOOR(SUM(p.price * s.quantity)) as income
from sales s
join employees e ON s.sales_person_id = e.employee_id
join products p ON s.product_id = p.product_id
group by
    e.first_name,
    e.last_name,
    e.employee_id,
    TO_CHAR(s.sale_date, 'day'),
    EXTRACT(ISODOW FROM s.sale_date)
order by
    EXTRACT(ISODOW FROM s.sale_date),
    seller ASC;


  WITH first_sale_dates AS (
  SELECT
    s.customer_id,
    MIN(s.sale_date::date) AS first_sale_date
  FROM sales s
  JOIN products p ON s.product_id = p.product_id
  WHERE p.price = 0
    AND s.sale_date IS NOT NULL
  GROUP BY s.customer_id
),
first_sales AS (
  SELECT DISTINCT ON (fsd.customer_id)
    fsd.customer_id,
    fsd.first_sale_date,
    s.sales_person_id
  FROM first_sale_dates fsd
  JOIN sales s ON
    fsd.customer_id = s.customer_id AND
    fsd.first_sale_date = s.sale_date::date
  ORDER BY fsd.customer_id, s.sales_id
)
SELECT
  CONCAT(c.first_name, ' ', c.last_name) AS customer,
  fs.first_sale_date AS sale_date,
  CONCAT(e.first_name, ' ', e.last_name) AS seller
FROM first_sales fs
JOIN customers c ON fs.customer_id = c.customer_id
JOIN employees e ON fs.sales_person_id = e.employee_id
ORDER BY c.customer_id;

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

SELECT
    CONCAT(e.first_name, ' ', e.last_name) AS seller,
    COUNT(s.sales_id) AS operations,
    TRUNC(SUM(s.quantity * p.price))::BIGINT AS income
FROM sales s
JOIN employees e ON s.sales_person_id = e.employee_id
JOIN products p ON s.product_id = p.product_id
GROUP BY e.employee_id, e.first_name, e.last_name
ORDER BY income DESC
LIMIT 10;

WITH
  sales_revenue AS (
    SELECT s.sales_person_id, p.price * s.quantity AS deal_revenue
    FROM sales s
    JOIN products p ON s.product_id = p.product_id
  ),
  seller_avg AS (
    SELECT
      e.employee_id,
      CONCAT(e.first_name, ' ', e.last_name) AS seller,
      FLOOR(AVG(sr.deal_revenue)) AS average_income
    FROM employees e
    JOIN sales_revenue sr ON e.employee_id = sr.sales_person_id
    GROUP BY e.employee_id, e.first_name, e.last_name
  ),
  global_avg AS (
    SELECT FLOOR(AVG(deal_revenue)) AS avg_all
    FROM sales_revenue
  )
SELECT sa.seller, sa.average_income
FROM seller_avg sa
CROSS JOIN global_avg ga
WHERE sa.average_income < ga.avg_all
ORDER BY sa.average_income asc;






