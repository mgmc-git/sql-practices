USE employees;

DELIMITER $$
CREATE PROCEDURE average_salary()
BEGIN
SELECT 
    AVG(salary) as average_salary
FROM
    salaries;
END$$

DELIMITER ;

CALL employees.average_salary();