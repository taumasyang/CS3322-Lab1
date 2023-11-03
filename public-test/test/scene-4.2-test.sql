SELECT c1.res AS "CHECK num of priv of SalesManager", c2.res AS "CHECK num of priv of Alice"
FROM
(
    SELECT 
        IF(COUNT(*)=12, "PASS", "FAIL") AS res
    FROM information_schema.TABLE_PRIVILEGES WHERE TABLE_SCHEMA = DATABASE() AND GRANTEE="'SalesManager'@'localhost'" AND IS_GRANTABLE="YES"
) AS c1,
(
    SELECT 
        IF(COUNT(*)=1, "PASS", "FAIL") AS res
    FROM information_schema.TABLE_PRIVILEGES WHERE TABLE_SCHEMA = DATABASE() AND GRANTEE="'Alice'@'localhost'" AND IS_GRANTABLE="NO"
) AS c2;