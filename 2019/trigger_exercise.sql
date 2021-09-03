/* Create a trigger that checks if the hire date of an employee is higher than the current date. 
If true, set this date to be the current date. Format the output (YY-MM-DD) */

USE employees;

DELIMITER $$

CREATE TRIGGER emp_current_date
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
	IF NEW.hire_date > DATE_FORMAT(SYSDATE(), '%y-%m-%d') THEN
		SET NEW.hire_date = DATE_FORMAT(SYSDATE(), '%y-%m-%d');
	END IF;
END$$

DELIMITER ;

INSERT employees VALUES('999904', '1970-01-31', 'John', 'Johnson', 'M', '2025-01-01');

SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC
LIMIT 5;

COMMIT;
