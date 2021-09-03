/* Modify the code obtained from COALESCE exercise 1 in the following way.
Aplly IFNULL() function to values from the first and second column, so that 'N/A' is displayed
whenever a department number has no value, and 'Department name not provided' is shown if there
is no value for 'dept_name'. */ 

use employees;

SELECT 
    IFNULL(dept_no, 'N/A') AS dept_no,
    IFNULL(dept_name,
            'Department name not provided') AS dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    departments_dup
ORDER BY dept_no ASC;