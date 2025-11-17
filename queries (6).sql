INSERT INTO "select 
  TO_CHAR(s.sale_date, 'YYYY-MM') as selling_month,
  COUNT(DISTINCT s.customer_id) as total_customers,
  FLOOR(SUM(p.price * s.quantity)) as income 
from sales s  
join products p on s.product_id=p.product_id 
group by TO_CHAR(s.sale_date, 'YYYY-MM') 
order by selling_month asc" (selling_month,total_customers,income) VALUES
	 ('1992-09',226,2618930332),
	 ('1992-10',230,8358113698),
	 ('1992-11',228,8031353737),
	 ('1992-12',229,7708189846);
