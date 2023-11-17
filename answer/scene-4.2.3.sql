SELECT * FROM OrderAudit WHERE
		old_order_id = new_order_id 
	AND old_create_date = new_create_date
	AND old_customer_id = new_customer_id
	AND old_product_id = new_product_id
	AND old_quantity != new_quantity
	AND old_is_filled = new_is_filled;
