INSERT INTO "WITH
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
ORDER BY sa.average_income asc
" (seller,average_income) VALUES
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
INSERT INTO "WITH
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
ORDER BY sa.average_income asc
" (seller,average_income) VALUES
	 ('Burt Gringlesby',167993),
	 ('Abraham Bennet',170983),
	 ('Sylvia Panteley',179517),
	 ('Meander Smith',188075),
	 ('Sheryl Hunter',225515);
