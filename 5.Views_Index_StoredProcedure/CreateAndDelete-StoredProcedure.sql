
use classicmodels;
DELIMITER //
CREATE PROCEDURE findAllCustomers()
BEGIN
    SELECT * FROM customers;
END //
DELIMITER ;
select * from orders;
CALL findAllCustomers();
DELIMITER //
DROP PROCEDURE IF EXISTS findAllCustomers//
CREATE PROCEDURE findAllCustomers()
BEGIN
    SELECT * FROM customers where customerNumber = 175;
end; //
DELIMITER ;
CALL findAllCustomers();