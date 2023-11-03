DROP PROCEDURE IF EXISTS CreateAndFillOrder;
DELIMITER //
CREATE PROCEDURE CreateAndFillOrder (
	IN p_order_id VARCHAR(15),
	IN p_customer_id VARCHAR(15),
	IN p_product_id VARCHAR(15),
	IN p_quantity INT UNSIGNED
)
BEGIN
	-- 你的事务操作
END;
//
DELIMITER ;