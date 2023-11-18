CREATE USER 'SalesManager'@'localhost' IDENTIFIED BY '123456';
GRANT ALL ON OrderAudit TO 'SalesManager'@'localhost' WITH GRANT OPTION;
-- References:
-- https://dev.mysql.com/doc/refman/8.2/en/create-user.html
-- https://dev.mysql.com/doc/refman/8.2/en/grant.html
