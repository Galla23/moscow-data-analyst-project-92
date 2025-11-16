INSERT INTO "-- Считаем выручку по каждой сделке и объединяем имя и фамилию продавца
with sales_with_seller as (
   select e.first_name || ' ' || e.last_name as seller,
          p.price * s.quantity as deal_income 
   from sales s 
   join employees e on s.sales_person_id=e.employee_id 
   join products p on s.product_id=p.product_id 
   ),
-- Считаем среднюю выручку за сделку по каждому продавцу
seller_avg as ( 
   select seller,
          FLOOR(AVG(deal_income)) as avg_income 
   from sales_with_seller 
   group by seller 
   ),
-- Считаем общую среднюю выручку за сделку по всем продавцам
global_avg as (
   select FLOOR(AVG(deal_income)) as overall_avg 
   from sales_with_seller 
   )
-- Выбираем продавцов, у которых сред.выручка < общей средней выручки
   select sa.seller, 
          sa.avg_income as average_income 
   from seller_avg sa 
   cross join global_avg ga 
   where sa.avg_income < ga.overall_avg 
   order by sa.avg_income asc" (seller,average_income) VALUES
	 ('Stearns MacFeather',46407),
	 ('Ann Dull',55090),
	 ('Morningstar Greene',88124),
	 ('Marjorie Green',109395),
	 ('Johnson White',126133),
	 ('Anne Ringer',136767),
	 ('Cheryl Carson',139818),
	 ('Reginald Blotchet-Halls',151773),
	 ('Charlene Locksley',152007),
	 ('Michael O''Leary',161108);
INSERT INTO "-- Считаем выручку по каждой сделке и объединяем имя и фамилию продавца
with sales_with_seller as (
   select e.first_name || ' ' || e.last_name as seller,
          p.price * s.quantity as deal_income 
   from sales s 
   join employees e on s.sales_person_id=e.employee_id 
   join products p on s.product_id=p.product_id 
   ),
-- Считаем среднюю выручку за сделку по каждому продавцу
seller_avg as ( 
   select seller,
          FLOOR(AVG(deal_income)) as avg_income 
   from sales_with_seller 
   group by seller 
   ),
-- Считаем общую среднюю выручку за сделку по всем продавцам
global_avg as (
   select FLOOR(AVG(deal_income)) as overall_avg 
   from sales_with_seller 
   )
-- Выбираем продавцов, у которых сред.выручка < общей средней выручки
   select sa.seller, 
          sa.avg_income as average_income 
   from seller_avg sa 
   cross join global_avg ga 
   where sa.avg_income < ga.overall_avg 
   order by sa.avg_income asc" (seller,average_income) VALUES
	 ('Burt Gringlesby',167993),
	 ('Abraham Bennet',170983),
	 ('Sylvia Panteley',179517),
	 ('Meander Smith',188075),
	 ('Sheryl Hunter',225515);
