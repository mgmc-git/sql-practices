USE employees;

SELECT 
    emp_no,
    first_name,
    last_name,
    CASE gender
        WHEN 'M' THEN 'Male'
        ELSE 'Female'
    END AS gender
FROM
    employees;


/* Example CASE statement with NULL/NOT NULL */

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    CASE
        WHEN dm.emp_no IS NOT NULL THEN 'Manager'
        ELSE 'Employee'
    END AS is_manager
FROM
    employees e
        LEFT JOIN
    dept_manager dm ON dm.emp_no = e.emp_no
WHERE
    e.emp_no > 109990;
    
    
/* Using IF (which only works with one condition) */

SELECT
	e.emp_no,
    e.first_name,
    e.last_name,
	IF(gender = 'M', 'Male', 'Female') AS gender
FROM
	employees;