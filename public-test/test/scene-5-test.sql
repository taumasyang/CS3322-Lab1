DROP PROCEDURE IF EXISTS CheckFilled;
DELIMITER //
CREATE PROCEDURE CheckFilled(
    p_case_name TEXT, 
    p_oid VARCHAR(15),
    p_cid VARCHAR(15),
    p_pid VARCHAR(15),
    quantity INT UNSIGNED,
    p_is_filled BOOL,
    p_stock INT UNSIGNED,
    p_balance INT UNSIGNED,
    p_credit INT UNSIGNED,
    p_coupon_cnt INT UNSIGNED
    )
BEGIN
    CALL CreateAndFillOrder(
        p_oid,
        p_cid,
        p_pid,
        quantity
    );
    SELECT
        p_case_name AS "TEST CASE", 
        IF(
            (SELECT is_filled FROM ProductOrder WHERE id=p_oid) = p_is_filled
            AND (SELECT stock FROM Product WHERE id=p_pid) = p_stock
            AND (SELECT balance FROM Customer WHERE id=p_cid) = p_balance
            AND (SELECT credit FROM Customer WHERE id=p_cid) = p_credit
            AND (SELECT COUNT(*) FROM Coupon WHERE customer_id=p_cid) = p_coupon_cnt,
            "PASS", "FAIL"
        )
        AS "RESULT";
END//
DELIMITER ;

DROP TRIGGER IF EXISTS ErrorTriggerProduct;
DELIMITER //
CREATE TRIGGER ErrorTriggerCustomer
AFTER UPDATE ON Product
FOR EACH ROW
BEGIN
  IF OLD.id = 'P00000000000003' THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'An error occurred';
  END IF;
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS ErrorTriggerCoupon;
DELIMITER //
CREATE TRIGGER ErrorTriggerCoupon
AFTER DELETE ON Coupon
FOR EACH ROW
BEGIN
  IF OLD.customer_id = 'C00000000000006' THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'An error occurred';
  END IF;
END;
//
DELIMITER ;

-- Case 1: [Unfilled] low stock
CALL CheckFilled(
    "Case 1: [Unfilled] low stock", 
    'O00000000000120',
    'C00000000000005',
    'P00000000000003',
    4000,   -- Enough stock here, but an error happened
    0,
    5100,
    49700,
    700,
    3
);

-- Case 2: [Unfilled] enough stock; no coupon; insufficient balance and credit
CALL CheckFilled(
    "Case 2: [Unfilled] enough stock; no coupon; insufficient balance and credit", 
    'O00000000000121',
    'C00000000000004',
    'P00000000000006',
    990,
    0,
    10000,
    43900,
    200,
    0
);


-- Case 3: [Unfilled] enough stock; best coupon doesn't suffice; insufficient balance and credit
CALL CheckFilled(
    "Case 3: [Unfilled] enough stock; best coupon doesn't suffice; insufficient balance and credit", 
    'O00000000000122',
    'C00000000000006',
    'P00000000000007',
    3000,
    0,
    6200,   ---- Best coupon suffices, but an error happened
    38900,
    700,
    3
);


-- Case 4: [Filled] enough stock; use best coupon
CALL CheckFilled(
    "Case 4: [Filled] enough stock; use best coupon", 
    'O00000000000123',
    'C00000000000002',
    'P00000000000006',
    300,
    1,
    9700,
    86750,
    800,
    2
);


-- Case 5: [Filled] enough stock; no coupon; sufficient balance
CALL CheckFilled(
    "Case 5: [Filled] enough stock; no coupon; sufficient balance", 
    'O00000000000124',
    'C00000000000007',
    'P00000000000002',
    200,
    1,
    7700,
    78600,
    1000,
    0
);


-- Case 6: [Filled] enough stock; best coupon doesn't suffice; insufficient balance; sufficient credit
CALL CheckFilled(
    "Case 6: [Filled] enough stock; best coupon doesn't suffice; insufficient balance; sufficient credit", 
    'O00000000000125',
    'C00000000000001',
    'P00000000000004',
    85,
    1,
    9215,
    0,
    25,
    2
);
