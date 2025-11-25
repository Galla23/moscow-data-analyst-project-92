INSERT INTO "SELECT
    CONCAT(e.first_name, ' ', e.last_name) AS seller,
    COUNT(s.sales_id) AS operations,
    CAST(SUM(s.quantity * p.price) AS BIGINT) AS income
FROM sales s
JOIN employees e ON s.sales_person_id = e.employee_id
JOIN products p ON s.product_id = p.product_id
GROUP BY e.employee_id, e.first_name, e.last_name
ORDER BY income DESC
LIMIT 10" (seller,operations,income) VALUES
	 ('Dirk Stringer',4192,4925137932),
	 ('Michel DeFrance',4688,3260240834),
	 ('Albert Ringer',4695,2700327941),
	 ('Heather McBadden',4139,1873192319),
	 ('Innes del Castillo',4674,1762202128),
	 ('Abraham Bennet',9460,1617501170),
	 ('Dean Straight',4195,1256032202),
	 ('Livia Karsen',2564,1056902109),
	 ('Sheryl Hunter',4686,1056767863),
	 ('Michael O''Leary',5757,927500460);
