/* Create a function called 'emp_info' that takes for parameters the first and last name of an employee, and returns the salary
from the newest contract of that employee */

USE employees;

DELIMITER $$
CREATE FUNCTION f_emp_info (p_first_name VARCHAR(255), p_last_name VARCHAR(255)) RETURNS DECIMAL (10,2)
BEGIN
DECLARE v_max_from_date DATE;
DECLARE v_salary DECIMAL (10,2);

SELECT 
    MAX(from_date)
INTO v_max_from_date FROM
    salaries s
        JOIN
    employees e ON s.emp_no = e.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name;
        
SELECT 
    s.salary
INTO v_salary FROM
    salaries s
        JOIN
    employees e ON e.emp_no = e.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name
        AND s.from_date = v_max_from_date
        
RETURN v_salary;
END$$

DELIMITER ;

SELECT F_EMP_INFO('Aruna', 'Journel');