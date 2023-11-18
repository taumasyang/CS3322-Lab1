DROP TRIGGER IF EXISTS LogOrderChange;
DELIMITER //
CREATE TRIGGER LogOrderChange
AFTER UPDATE ON ProductOrder
FOR EACH ROW
BEGIN
	INSERT INTO OrderAudit VALUES (
		NOW(),
		USER(),
		OLD.id,
		OLD.create_date,
		OLD.customer_id,
		OLD.product_id,
		OLD.quantity,
		OLD.is_filled,
		NEW.id,
		NEW.create_date,
		NEW.customer_id,
		NEW.product_id,
		NEW.quantity,
		NEW.is_filled
	);
END;
//
DELIMITER ;
