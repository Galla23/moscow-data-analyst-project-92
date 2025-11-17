INSERT INTO "with first_sales as (
-- находим самую раннюю покупку для каждого покупателя 
select customer_id,
  MIN(sale_date) as first_sale_date 
from sales 
group by customer_id 
),
first_promo_sales as (
-- отбираем первые покупки, которые были акционными цена=0
select s.customer_id,
   s.sale_date,
   s.sales_person_id 
from sales s 
join first_sales fs 
on s.customer_id=fs.customer_id 
and s.sale_date=fs.first_sale_date --первая покупка
join products p 
on s.product_id=p.product_id 
where p.price = 0       -- акционный товар
)
--итоговый результат с именами
select 
   c.first_name || ' ' || c.last_name as customer,
   fps.sale_date,
   e.first_name || ' ' || e.last_name as seller 
from first_promo_sales fps 
join customers c 
  on fps.customer_id=c.customer_id 
join employees e 
  on fps.sales_person_id=e.employee_id 
  order by c.customer_id asc" (customer,sale_date,seller) VALUES
	 ('Cristina Xu','1992-09-21','Abraham Bennet'),
	 ('Cristina Xu','1992-09-21','Abraham Bennet'),
	 ('Cristina Xu','1992-09-21','Abraham Bennet'),
	 ('Cristina Xu','1992-09-21','Abraham Bennet'),
	 ('Cristina Xu','1992-09-21','Abraham Bennet'),
	 ('Cristina Xu','1992-09-21','Abraham Bennet'),
	 ('Cristina Xu','1992-09-21','Abraham Bennet'),
	 ('Cristina Xu','1992-09-21','Abraham Bennet'),
	 ('Cristina Xu','1992-09-21','Abraham Bennet'),
	 ('Cristina Xu','1992-09-21','Abraham Bennet');
INSERT INTO "with first_sales as (
-- находим самую раннюю покупку для каждого покупателя 
select customer_id,
  MIN(sale_date) as first_sale_date 
from sales 
group by customer_id 
),
first_promo_sales as (
-- отбираем первые покупки, которые были акционными цена=0
select s.customer_id,
   s.sale_date,
   s.sales_person_id 
from sales s 
join first_sales fs 
on s.customer_id=fs.customer_id 
and s.sale_date=fs.first_sale_date --первая покупка
join products p 
on s.product_id=p.product_id 
where p.price = 0       -- акционный товар
)
--итоговый результат с именами
select 
   c.first_name || ' ' || c.last_name as customer,
   fps.sale_date,
   e.first_name || ' ' || e.last_name as seller 
from first_promo_sales fps 
join customers c 
  on fps.customer_id=c.customer_id 
join employees e 
  on fps.sales_person_id=e.employee_id 
  order by c.customer_id asc" (customer,sale_date,seller) VALUES
	 ('Cristina Xu','1992-09-21','Abraham Bennet'),
	 ('Cristina Xu','1992-09-21','Abraham Bennet'),
	 ('Cristina Xu','1992-09-21','Abraham Bennet'),
	 ('Jacob Martinez','1992-09-21','Michael O''Leary'),
	 ('Jacob Martinez','1992-09-21','Michael O''Leary'),
	 ('Jacob Martinez','1992-09-21','Michael O''Leary'),
	 ('Jacob Martinez','1992-09-21','Michael O''Leary'),
	 ('Jacob Martinez','1992-09-21','Michael O''Leary'),
	 ('Jacob Martinez','1992-09-21','Michael O''Leary'),
	 ('Jacob Martinez','1992-09-21','Michael O''Leary');
INSERT INTO "with first_sales as (
-- находим самую раннюю покупку для каждого покупателя 
select customer_id,
  MIN(sale_date) as first_sale_date 
from sales 
group by customer_id 
),
first_promo_sales as (
-- отбираем первые покупки, которые были акционными цена=0
select s.customer_id,
   s.sale_date,
   s.sales_person_id 
from sales s 
join first_sales fs 
on s.customer_id=fs.customer_id 
and s.sale_date=fs.first_sale_date --первая покупка
join products p 
on s.product_id=p.product_id 
where p.price = 0       -- акционный товар
)
--итоговый результат с именами
select 
   c.first_name || ' ' || c.last_name as customer,
   fps.sale_date,
   e.first_name || ' ' || e.last_name as seller 
from first_promo_sales fps 
join customers c 
  on fps.customer_id=c.customer_id 
join employees e 
  on fps.sales_person_id=e.employee_id 
  order by c.customer_id asc" (customer,sale_date,seller) VALUES
	 ('Jacob Martinez','1992-09-21','Michael O''Leary'),
	 ('Jacob Martinez','1992-09-21','Michael O''Leary'),
	 ('Jared Gray','1992-09-22','Dirk Stringer'),
	 ('Kaitlyn Allen','1992-09-21','Dirk Stringer'),
	 ('Kaitlyn Allen','1992-09-21','Dirk Stringer'),
	 ('Kaitlyn Allen','1992-09-21','Dirk Stringer'),
	 ('Kaitlyn Allen','1992-09-21','Dirk Stringer'),
	 ('Kaitlyn Allen','1992-09-21','Dirk Stringer'),
	 ('Kaitlyn Allen','1992-09-21','Dirk Stringer'),
	 ('Kaitlyn Allen','1992-09-21','Dirk Stringer');
INSERT INTO "with first_sales as (
-- находим самую раннюю покупку для каждого покупателя 
select customer_id,
  MIN(sale_date) as first_sale_date 
from sales 
group by customer_id 
),
first_promo_sales as (
-- отбираем первые покупки, которые были акционными цена=0
select s.customer_id,
   s.sale_date,
   s.sales_person_id 
from sales s 
join first_sales fs 
on s.customer_id=fs.customer_id 
and s.sale_date=fs.first_sale_date --первая покупка
join products p 
on s.product_id=p.product_id 
where p.price = 0       -- акционный товар
)
--итоговый результат с именами
select 
   c.first_name || ' ' || c.last_name as customer,
   fps.sale_date,
   e.first_name || ' ' || e.last_name as seller 
from first_promo_sales fps 
join customers c 
  on fps.customer_id=c.customer_id 
join employees e 
  on fps.sales_person_id=e.employee_id 
  order by c.customer_id asc" (customer,sale_date,seller) VALUES
	 ('Kaitlyn Allen','1992-09-21','Dirk Stringer'),
	 ('Kaitlyn Allen','1992-09-21','Dirk Stringer'),
	 ('Kaitlyn Allen','1992-09-21','Dirk Stringer'),
	 ('Kaitlyn Allen','1992-09-21','Dirk Stringer'),
	 ('Kaitlyn Allen','1992-09-21','Dirk Stringer'),
	 ('Kaitlyn Allen','1992-09-21','Dirk Stringer'),
	 ('Kaitlyn Allen','1992-09-21','Dirk Stringer'),
	 ('Karen Huang','1992-09-21','Dirk Stringer'),
	 ('Krista Gill','1992-09-22','Marjorie Green'),
	 ('Krista Gill','1992-09-22','Marjorie Green');
INSERT INTO "with first_sales as (
-- находим самую раннюю покупку для каждого покупателя 
select customer_id,
  MIN(sale_date) as first_sale_date 
from sales 
group by customer_id 
),
first_promo_sales as (
-- отбираем первые покупки, которые были акционными цена=0
select s.customer_id,
   s.sale_date,
   s.sales_person_id 
from sales s 
join first_sales fs 
on s.customer_id=fs.customer_id 
and s.sale_date=fs.first_sale_date --первая покупка
join products p 
on s.product_id=p.product_id 
where p.price = 0       -- акционный товар
)
--итоговый результат с именами
select 
   c.first_name || ' ' || c.last_name as customer,
   fps.sale_date,
   e.first_name || ' ' || e.last_name as seller 
from first_promo_sales fps 
join customers c 
  on fps.customer_id=c.customer_id 
join employees e 
  on fps.sales_person_id=e.employee_id 
  order by c.customer_id asc" (customer,sale_date,seller) VALUES
	 ('Kristen Li','1992-09-21','Michael O''Leary'),
	 ('Kristen Li','1992-09-21','Michael O''Leary'),
	 ('Kristen Li','1992-09-21','Michael O''Leary'),
	 ('Kristen Li','1992-09-21','Michael O''Leary'),
	 ('Kristen Li','1992-09-21','Michael O''Leary'),
	 ('Kristen Li','1992-09-21','Michael O''Leary'),
	 ('Kristen Li','1992-09-21','Michael O''Leary'),
	 ('Kristen Li','1992-09-21','Michael O''Leary'),
	 ('Kristen Li','1992-09-21','Michael O''Leary'),
	 ('Kristen Li','1992-09-21','Michael O''Leary');
INSERT INTO "with first_sales as (
-- находим самую раннюю покупку для каждого покупателя 
select customer_id,
  MIN(sale_date) as first_sale_date 
from sales 
group by customer_id 
),
first_promo_sales as (
-- отбираем первые покупки, которые были акционными цена=0
select s.customer_id,
   s.sale_date,
   s.sales_person_id 
from sales s 
join first_sales fs 
on s.customer_id=fs.customer_id 
and s.sale_date=fs.first_sale_date --первая покупка
join products p 
on s.product_id=p.product_id 
where p.price = 0       -- акционный товар
)
--итоговый результат с именами
select 
   c.first_name || ' ' || c.last_name as customer,
   fps.sale_date,
   e.first_name || ' ' || e.last_name as seller 
from first_promo_sales fps 
join customers c 
  on fps.customer_id=c.customer_id 
join employees e 
  on fps.sales_person_id=e.employee_id 
  order by c.customer_id asc" (customer,sale_date,seller) VALUES
	 ('Kristen Li','1992-09-21','Michael O''Leary'),
	 ('Kristen Li','1992-09-21','Michael O''Leary'),
	 ('Levi Gonzalez','1992-09-21','Marjorie Green'),
	 ('Levi Gonzalez','1992-09-21','Marjorie Green'),
	 ('Levi Gonzalez','1992-09-21','Marjorie Green'),
	 ('Levi Gonzalez','1992-09-21','Marjorie Green'),
	 ('Levi Gonzalez','1992-09-21','Marjorie Green'),
	 ('Levi Gonzalez','1992-09-21','Marjorie Green'),
	 ('Levi Gonzalez','1992-09-21','Marjorie Green'),
	 ('Levi Gonzalez','1992-09-21','Marjorie Green');
INSERT INTO "with first_sales as (
-- находим самую раннюю покупку для каждого покупателя 
select customer_id,
  MIN(sale_date) as first_sale_date 
from sales 
group by customer_id 
),
first_promo_sales as (
-- отбираем первые покупки, которые были акционными цена=0
select s.customer_id,
   s.sale_date,
   s.sales_person_id 
from sales s 
join first_sales fs 
on s.customer_id=fs.customer_id 
and s.sale_date=fs.first_sale_date --первая покупка
join products p 
on s.product_id=p.product_id 
where p.price = 0       -- акционный товар
)
--итоговый результат с именами
select 
   c.first_name || ' ' || c.last_name as customer,
   fps.sale_date,
   e.first_name || ' ' || e.last_name as seller 
from first_promo_sales fps 
join customers c 
  on fps.customer_id=c.customer_id 
join employees e 
  on fps.sales_person_id=e.employee_id 
  order by c.customer_id asc" (customer,sale_date,seller) VALUES
	 ('Levi Gonzalez','1992-09-21','Marjorie Green'),
	 ('Levi Gonzalez','1992-09-21','Marjorie Green'),
	 ('Levi Gonzalez','1992-09-21','Marjorie Green'),
	 ('Levi Gonzalez','1992-09-21','Marjorie Green'),
	 ('Levi Gonzalez','1992-09-21','Marjorie Green'),
	 ('Levi Gonzalez','1992-09-21','Marjorie Green'),
	 ('Levi Gonzalez','1992-09-21','Marjorie Green'),
	 ('Levi Gonzalez','1992-09-21','Marjorie Green'),
	 ('Levi Gonzalez','1992-09-21','Marjorie Green'),
	 ('Levi Gonzalez','1992-09-21','Marjorie Green');
INSERT INTO "with first_sales as (
-- находим самую раннюю покупку для каждого покупателя 
select customer_id,
  MIN(sale_date) as first_sale_date 
from sales 
group by customer_id 
),
first_promo_sales as (
-- отбираем первые покупки, которые были акционными цена=0
select s.customer_id,
   s.sale_date,
   s.sales_person_id 
from sales s 
join first_sales fs 
on s.customer_id=fs.customer_id 
and s.sale_date=fs.first_sale_date --первая покупка
join products p 
on s.product_id=p.product_id 
where p.price = 0       -- акционный товар
)
--итоговый результат с именами
select 
   c.first_name || ' ' || c.last_name as customer,
   fps.sale_date,
   e.first_name || ' ' || e.last_name as seller 
from first_promo_sales fps 
join customers c 
  on fps.customer_id=c.customer_id 
join employees e 
  on fps.sales_person_id=e.employee_id 
  order by c.customer_id asc" (customer,sale_date,seller) VALUES
	 ('Mario Rai','1992-09-21','Abraham Bennet'),
	 ('Mario Rai','1992-09-21','Abraham Bennet'),
	 ('Mario Rai','1992-09-21','Abraham Bennet'),
	 ('Mya Coleman','1992-09-24','Michael O''Leary'),
	 ('Olivia Bennett','1992-09-21','Michael O''Leary'),
	 ('Olivia Bennett','1992-09-21','Michael O''Leary'),
	 ('Richard Martinez','1992-09-21','Abraham Bennet'),
	 ('Richard Martinez','1992-09-21','Abraham Bennet'),
	 ('Samuel Sharma','1992-09-22','Michael O''Leary'),
	 ('Tyrone Ruiz','1992-09-21','Marjorie Green');
INSERT INTO "with first_sales as (
-- находим самую раннюю покупку для каждого покупателя 
select customer_id,
  MIN(sale_date) as first_sale_date 
from sales 
group by customer_id 
),
first_promo_sales as (
-- отбираем первые покупки, которые были акционными цена=0
select s.customer_id,
   s.sale_date,
   s.sales_person_id 
from sales s 
join first_sales fs 
on s.customer_id=fs.customer_id 
and s.sale_date=fs.first_sale_date --первая покупка
join products p 
on s.product_id=p.product_id 
where p.price = 0       -- акционный товар
)
--итоговый результат с именами
select 
   c.first_name || ' ' || c.last_name as customer,
   fps.sale_date,
   e.first_name || ' ' || e.last_name as seller 
from first_promo_sales fps 
join customers c 
  on fps.customer_id=c.customer_id 
join employees e 
  on fps.sales_person_id=e.employee_id 
  order by c.customer_id asc" (customer,sale_date,seller) VALUES
	 ('Willie Gao','1992-09-22','Michael O''Leary'),
	 ('Willie Gao','1992-09-22','Michael O''Leary');
