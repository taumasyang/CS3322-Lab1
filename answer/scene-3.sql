DROP TRIGGER IF EXISTS RefundAtCancel;
DELIMITER //
CREATE TRIGGER RefundAtCancel
AFTER DELETE ON ProductOrder
FOR EACH ROW
BEGIN
	IF OLD.is_filled THEN
		UPDATE Product SET stock = stock + OLD.quantity WHERE id = OLD.product_id;
		UPDATE Customer SET balance = balance + (SELECT price FROM Product WHERE id = OLD.product_id) * OLD.quantity WHERE id = OLD.customer_id;
	END IF;
END;
//
DELIMITER ;
-- References:
-- https://dev.mysql.com/doc/refman/8.2/en/if.html
-- https://dev.mysql.com/doc/refman/8.2/en/update.html
-- https://dev.mysql.com/doc/refman/8.2/en/trigger-syntax.html
