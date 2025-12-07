select
    e.first_name || ' ' || e.last_name as seller,
    TRIM(TO_CHAR(s.sale_date, 'day')) as day_of_week,
    FLOOR(SUM(p.price * s.quantity)) as income
from sales as s
inner join employees as e on s.sales_person_id = e.employee_id
inner join products as p on s.product_id = p.product_id
group by
    e.first_name,
    e.last_name,
    e.employee_id,
    TRIM(TO_CHAR(s.sale_date, 'day')),
    EXTRACT(isodow from s.sale_date)
order by
    EXTRACT(isodow from s.sale_date),
    seller asc;

with first_sale_dates as (
    select
        s.customer_id,
        min(s.sale_date::date) as first_sale_date
    from sales as s
    inner join products as p on s.product_id = p.product_id
    where
        p.price = 0
        and s.sale_date is not null
    group by s.customer_id
),

first_sales as (
    select distinct on (fsd.customer_id)
        fsd.customer_id,
        fsd.first_sale_date,
        s.sales_person_id
    from first_sale_dates as fsd
    inner join sales as s
        on
            fsd.customer_id = s.customer_id
            and fsd.first_sale_date = s.sale_date::date
    order by fsd.customer_id, s.sales_id
)

select
    fs.first_sale_date as sale_date,
    concat(c.first_name, ' ', c.last_name) as customer,
    concat(e.first_name, ' ', e.last_name) as seller
from first_sales as fs
inner join customers as c on fs.customer_id = c.customer_id
inner join employees as e on fs.sales_person_id = e.employee_id
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
where
    age is not null
    and age >= 16
group by age_category
order by age_category;

select
    TO_CHAR(s.sale_date, 'YYYY-MM') as selling_month,
    COUNT(distinct s.customer_id) as total_customers,
    FLOOR(SUM(p.price * s.quantity)) as income
from sales as s
inner join products as p on s.product_id = p.product_id
group by TO_CHAR(s.sale_date, 'YYYY-MM')
order by selling_month asc;

select
    TRUNC(SUM(s.quantity * p.price))::BIGINT as income,
    CONCAT(e.first_name, ' ', e.last_name) as seller,
    COUNT(s.sales_id) as operations
from sales as s
inner join employees as e on s.sales_person_id = e.employee_id
inner join products as p on s.product_id = p.product_id
group by e.employee_id, e.first_name, e.last_name
order by income desc
limit 10;

with
sales_revenue as (
    select
        s.sales_person_id,
        p.price * s.quantity as deal_revenue
    from sales as s
    inner join products as p on s.product_id = p.product_id
),

seller_avg as (
    select
        e.employee_id,
        concat(e.first_name, ' ', e.last_name) as seller,
        floor(avg(sr.deal_revenue)) as average_income
    from employees as e
    inner join sales_revenue as sr on e.employee_id = sr.sales_person_id
    group by e.employee_id, e.first_name, e.last_name
),

global_avg as (
    select floor(avg(deal_revenue)) as avg_all
    from sales_revenue
)

select
    sa.seller,
    sa.average_income
from seller_avg as sa
cross join global_avg as ga
where sa.average_income < ga.avg_all
order by sa.average_income asc;







