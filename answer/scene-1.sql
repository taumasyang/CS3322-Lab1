DROP PROCEDURE IF EXISTS EvaluateDiscountedSales;
DELIMITER //
CREATE PROCEDURE EvaluateDiscountedSales (
	p_date_1 DATE,
	p_date_2 DATE,
	p_price_threshold INT,
	p_cost_threshold INT,
	p_city_1 VARCHAR(255),
	p_city_2 VARCHAR(255),
	p_manufacturer_1 VARCHAR(255),
	p_manufacturer_2 VARCHAR(255)
)
BEGIN
	-- Declarations
	DECLARE done BOOLEAN DEFAULT FALSE;
	DECLARE cid VARCHAR(15);
	DECLARE cur CURSOR FOR SELECT id FROM Customer;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	-- Create tables
	DROP TABLE IF EXISTS BigCustomer;
	DROP TABLE IF EXISTS NormalCustomer;
	CREATE TABLE BigCustomer (
		id VARCHAR(15) NOT NULL,
		cname VARCHAR(255),
		total_cost INT,
		discount DOUBLE
	);
	CREATE TABLE NormalCustomer (
		cname VARCHAR(255),
		total_cost INT
	);
	-- Look for big customers and their discount rate
	INSERT INTO BigCustomer (id, cname, discount)
	WITH RankedCost AS (
		SELECT
			Customer.id,
			Customer.cname,
			SUM(Product.price * ProductOrder.quantity) AS cost,
			RANK() OVER ( ORDER BY
				Customer.credit DESC,
				SUM(Product.price * ProductOrder.quantity) DESC
			) overall_rank
		FROM ProductOrder JOIN (Customer, Product)
			ON (ProductOrder.customer_id = Customer.id
			AND ProductOrder.product_id = Product.id)
		WHERE ProductOrder.create_date <= p_date_1
			AND Product.price > p_price_threshold
			AND Customer.city NOT IN (p_city_1, p_city_2)
		GROUP BY Customer.id
		HAVING cost > p_cost_threshold
	)
	SELECT id, cname, 0.9 FROM RankedCost WHERE overall_rank <= 10
	UNION
	SELECT id, cname, 0.95 FROM RankedCost WHERE overall_rank > 10;
	INSERT INTO BigCustomer (id, cname, discount)
		SELECT id, cname, 1 FROM Customer
		WHERE id NOT IN (SELECT id FROM BigCustomer);
	-- Calculate discounted cost
	DROP TABLE IF EXISTS RecentOrders;
	CREATE TEMPORARY TABLE RecentOrders
		SELECT
			customer_id,
			SUM(cost * IFNULL(discount, 1)) AS discounted
		FROM (
			SELECT
				customer_id,
				product_id,
				IF (manufacturer IN (p_manufacturer_1, p_manufacturer_2), 1,
					CASE
						WHEN COUNT(*) >= 3 AND SUM(price * quantity) >= 6000 THEN 0.9
						WHEN COUNT(*) >= 2 AND SUM(price * quantity) >= 3000 THEN 0.95
						WHEN COUNT(*) >= 1 AND SUM(price * quantity) >= 1000 THEN 0.98
						ELSE 1
					END
				) AS discount
			FROM ProductOrder JOIN Product ON product_id = Product.id
			WHERE create_date <= p_date_1
			GROUP BY customer_id, product_id
		) AS AccumulatedDiscount NATURAL RIGHT JOIN (
			SELECT
				customer_id,
				product_id,
				SUM(price * quantity) AS cost
			FROM ProductOrder JOIN Product ON product_id = Product.id
			WHERE create_date >= p_date_2
			GROUP BY customer_id, product_id
		) AS RecentCost
		GROUP BY customer_id;
	-- Apply big customer discount
	OPEN cur;
	looper: LOOP
		FETCH cur INTO cid;
		IF done THEN LEAVE looper; END IF;
		UPDATE BigCustomer SET total_cost =
			FLOOR((SELECT discounted FROM RecentOrders WHERE customer_id = cid) * discount)
		WHERE id = cid;
	END LOOP;
	CLOSE cur;
	DROP TABLE RecentOrders;
	INSERT INTO NormalCustomer
		SELECT cname, total_cost FROM BigCustomer
		WHERE discount = 1;
	DELETE FROM BigCustomer WHERE discount = 1;
	ALTER TABLE BigCustomer DROP COLUMN id, DROP COLUMN discount;
END //
DELIMITER ;
-- Reference:
-- https://dev.mysql.com/doc/refman/8.2/en/with.html
-- https://dev.mysql.com/doc/refman/8.2/en/insert-select.html
-- https://dev.mysql.com/doc/refman/8.2/en/flow-control-functions.html
-- https://dev.mysql.com/doc/refman/8.2/en/cursors.html