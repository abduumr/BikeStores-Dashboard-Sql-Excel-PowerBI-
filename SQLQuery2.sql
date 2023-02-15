SELECT a.order_id ,
	  (b.first_name+ ' ' + b.last_name) As Customers ,
	  b.city,
	  b.state,
	  a.order_date ,
	  SUM(c.quantity) As total_Units,
	  SUM (c.quantity*c.list_price) As revenue ,
	  d.product_name,
	  e.category_name,
	  f.store_name,
	 (g.first_name+ ' ' + g.last_name) As Sales_rep ,
	 h.brand_name
FROM sales.orders a
JOIN sales.customers b
ON a.customer_id = b.customer_id 
JOIN sales.order_items c
ON a.order_id = c.order_id
JOIN production.products d
ON c.product_id = d.product_id
JOIN production.categories e
ON d.category_id = e.category_id
JOIN sales.stores f
ON a.store_id = f.store_id
JOIN sales.staffs g
ON a.staff_id = g.staff_id
JOIN production.brands h
ON d.brand_id = h.brand_id
GROUP by a.order_id ,
		 b.first_name+ ' ' + b.last_name ,
		 b.city,
		 b.state,
		 a.order_date, 
		 d.product_name,
		 e.category_name,
		 f.store_name,
		 g.first_name+ ' ' + g.last_name,
		 h.brand_name
