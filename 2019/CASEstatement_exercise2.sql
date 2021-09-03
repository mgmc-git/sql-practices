USE employees;

SELECT 
    dm.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS salary_difference,
    CASE
        WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'Salary raise was higher than 30000'
        ELSE 'Salary raise NOT higher than 30000'
    END AS raise_amount
FROM
    dept_manager dm
        JOIN
    employees e ON dm.emp_no = e.emp_no
        JOIN
    salaries s ON dm.emp_no = s.emp_no
GROUP BY dm.emp_no
ORDER BY dm.emp_no;


/* Similar, with more than one condition */

SELECT 
    dm.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS salary_difference,
    CASE
        WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'Salary was raised by more than 30000'
        WHEN MAX(s.salary) - MIN(s.salary) BETWEEN 20000 AND 30000 THEN 'Salary was raised by more than 20000 but less than 30000'
        ELSE 'Salary was raised by less than 20000'
    END AS salary_increase
FROM
    dept_manager dm
        JOIN
    employees e ON dm.emp_no = e.emp_no
        JOIN
    salaries s ON dm.emp_no = s.emp_no
GROUP BY dm.emp_no
ORDER BY dm.emp_no;