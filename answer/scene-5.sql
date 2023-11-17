DROP PROCEDURE IF EXISTS CreateAndFillOrder;
DELIMITER //
CREATE PROCEDURE CreateAndFillOrder (
	IN p_order_id VARCHAR(15),
	IN p_customer_id VARCHAR(15),
	IN p_product_id VARCHAR(15),
	IN p_quantity INT UNSIGNED
)
cafo: BEGIN
	DECLARE error BOOLEAN DEFAULT FALSE;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET error = TRUE;
	INSERT INTO ProductOrder VALUES (
		p_order_id,
		CURDATE(),
		p_customer_id,
		p_product_id,
		p_quantity,
		FALSE
	);
	START TRANSACTION;
		UPDATE ProductOrder SET is_filled = TRUE WHERE id = p_order_id;
		UPDATE Product SET stock = stock - p_quantity WHERE id = p_product_id;
		IF error THEN ROLLBACK; LEAVE cafo; END IF;
	SAVEPOINT stock;
		UPDATE Customer SET balance = balance - (
			SELECT price FROM Product WHERE id = p_product_id
		) * p_quantity * (
			SELECT discount FROM Coupon
				WHERE customer_id = p_customer_id
				ORDER BY discount LIMIT 1
		) WHERE id = p_customer_id;
		DELETE FROM Coupon
			WHERE customer_id = p_customer_id
			ORDER BY discount LIMIT 1;
		IF !error THEN COMMIT; LEAVE cafo; END IF;
	ROLLBACK TO stock;
		SET error = FALSE;
		UPDATE Customer SET balance = balance - (
			SELECT price FROM Product WHERE id = p_product_id
		) * p_quantity WHERE id = p_customer_id;
		IF !error THEN COMMIT; LEAVE cafo; END IF;
	ROLLBACK TO stock;
		SET error = FALSE;
		UPDATE Customer SET credit = credit + balance - (
			SELECT price FROM Product WHERE id = p_product_id
		) * p_quantity WHERE id = p_customer_id;
		UPDATE Customer SET balance = 0 WHERE id = p_customer_id;
		IF !error THEN COMMIT; LEAVE cafo; END IF;
	ROLLBACK;
END;
//
DELIMITER ;
-- References:
-- https://dev.mysql.com/doc/refman/8.2/en/declare-handler.html
-- https://dev.mysql.com/doc/refman/8.2/en/commit.html
-- https://dev.mysql.com/doc/refman/8.2/en/savepoint.html
