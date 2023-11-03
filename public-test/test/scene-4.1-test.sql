-- For 4.1, run this after creating trigger
UPDATE ProductOrder SET quantity=9830 WHERE id='O00000000000099';
SELECT IF(EXISTS(
    SELECT * FROM OrderAudit 
    WHERE
        operator = "root@localhost" AND
        old_order_id = "O00000000000099" AND
        old_create_date = "2014-08-12" AND
        old_customer_id = "C00000000000008" AND
        old_product_id = "P00000000000001" AND
        old_is_filled = 0 AND
        new_order_id = "O00000000000099" AND
        new_create_date = "2014-08-12" AND
        new_customer_id = "C00000000000008" AND
        new_product_id = "P00000000000001" AND 
        new_is_filled = 0 AND
        old_quantity=9840 AND 
        new_quantity=9830
    ), "PASS", "FAIL") AS "CHECK audit";

-- Create user Alice for 4.2 test
DROP USER IF EXISTS 'Alice'@'localhost';
CREATE USER 'Alice'@'localhost' IDENTIFIED BY '123456';
DROP USER IF EXISTS 'SalesManager'@'localhost';
