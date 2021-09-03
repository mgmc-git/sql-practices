/* Create a procedure called 'emp_info' that uses as parameters the first and last name of an individual, and returns their employee number */

USE employees;

DROP PROCEDURE IF EXISTS emp_info;
DELIMITER $$
CREATE PROCEDURE emp_info(IN p_firstname VARCHAR(14),IN p_lastname VARCHAR(16), OUT p_emp_no INTEGER)
BEGIN
SELECT 
    e.emp_no
INTO p_emp_no FROM
    employees e
WHERE
    e.first_name = p_firstname
        AND e.last_name = p_lastname;
END$$

DELIMITER ;

/* Create a VARIABLE, called 'v_emp_no' where you will store the output of the procedure you created in the last exercise.
call the procedure inserting the values */

SET @v_emp_no = 0;
CALL employees.emp_info('Aruna','Journel', @v_emp_no);
SELECT @v_emp_no;