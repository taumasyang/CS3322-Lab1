START TRANSACTION;

-- is_filled = 1
DELETE FROM ProductOrder WHERE id = 'O00000000000016';
SELECT 
    IF((SELECT balance FROM Customer WHERE id='C00000000000003')=192350, "PASS", "FAIL") AS "CHECK filled - customer balance",
    IF((SELECT stock FROM Product WHERE id='P00000000000006')=13550, "PASS", "FAIL") AS "CHECK filled - product stock";

-- is_filled = 0
DELETE FROM ProductOrder WHERE id = 'O00000000000017';
SELECT 
    IF((SELECT balance FROM Customer WHERE id='C00000000000005')=49700, "PASS", "FAIL") AS "CHECK unfilled - customer balance",
    IF((SELECT stock FROM Product WHERE id='P00000000000008')=200, "PASS", "FAIL") AS "CHECK unfilled - product stock";

ROLLBACK;
COMMIT;
