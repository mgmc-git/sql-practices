/* create a VIEW to visualize only the period encompassing the last contract of each employee */

CREATE OR REPLACE VIEW v_dept_emp_latest_date AS
    SELECT 
        emp_no, MAX(from_date) AS from_date, MAX(to_date) AS to_date
    FROM
        dept_emp
    GROUP BY emp_no;
    

/* create a VIEW that will extract the average salary of all managers registered in the database. 
Round this value to the nearest cent. */

CREATE OR REPLACE VIEW v_manager_salary_avg AS
SELECT 
    ROUND(AVG(salary), 2) AS average_manager_salary
FROM
    salaries
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            dept_manager);
            
/* same, using JOIN alternative */

CREATE OR REPLACE VIEW v_manager_salary_avg AS
SELECT 
    ROUND(AVG(salary), 2) AS average_manager_salary
FROM
    salaries s
        JOIN
    dept_manager dm
WHERE
    s.emp_no = dm.emp_no;