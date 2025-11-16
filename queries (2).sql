INSERT INTO "SELECT 
  e.first_name || ' ' || e.last_name as seller,
  COUNT(s.sales_id) as operations,
  FLOOR(SUM(p.price * s.quantity)) as income -- округление вниз
FROM sales s 
join employees e on s.sales_person_id=e.employee_id 
join products p on s.product_id=p.product_id 
group by e.employee_id, e.first_name, e.last_name 
order by income desc 
limit 10" (seller,operations,income) VALUES
	 ('Dirk Stringer',4192,4925137932),
	 ('Michel DeFrance',4688,3260240833),
	 ('Albert Ringer',4695,2700327941),
	 ('Heather McBadden',4139,1873192318),
	 ('Innes del Castillo',4674,1762202127),
	 ('Abraham Bennet',9460,1617501169),
	 ('Dean Straight',4195,1256032202),
	 ('Livia Karsen',2564,1056902108),
	 ('Sheryl Hunter',4686,1056767862),
	 ('Michael O''Leary',5757,927500459);
