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
	-- 你的操作
	DROP TABLE IF EXISTS BigCustomer;
	DROP TABLE IF EXISTS NormalCustomer;
	CREATE TABLE BigCustomer (
		cname VARCHAR(255),
		total_cost INT
	);
	CREATE TABLE NormalCustomer (
		cname VARCHAR(255),
		total_cost INT
	);
	-- 你的操作
END//
DELIMITER;