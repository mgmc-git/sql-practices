## 3. Your First Query ##

SELECT
    *
FROM 
    recent_grads;

## 4. Understanding Your First Query ##

SELECT * 
  FROM recent_grads;
  
select * from recent_grads;

## 6. The LIMIT Clause ##

SELECT *
FROM recent_grads
LIMIT 5;

## 7. Selecting Specific Columns ##

SELECT 
    Major,
    ShareWomen
FROM
    recent_grads;

## 8. Filtering Rows Using WHERE ##

SELECT major, sharewomen
FROM recent_grads
WHERE sharewomen < 0.5;

## 9. Expressing Multiple Filter Criteria Using 'AND' ##

SELECT major, major_category, median, ShareWomen
FROM recent_grads
WHERE ShareWomen > 0.5 and Median > 50000;

## 10. Returning One of Several Conditions With OR ##

SELECT major, median, Unemployed
FROM recent_grads
WHERE median >= 10000 OR Men > Women
LIMIT 20;

## 11. Grouping Operators with Parentheses ##

SELECT major, Major_category, ShareWomen, Unemployment_rate
FROM recent_grads
WHERE Major_category = 'Engineering' 
    AND ( ShareWomen > 0.5 OR Unemployment_rate < 0.051);

## 12. Ordering Results Using ORDER BY ##

SELECT Major, ShareWomen, Unemployment_rate
FROM recent_grads
WHERE ShareWomen > 0.3 AND Unemployment_rate < 0.1
ORDER BY ShareWomen DESC;

## 13. Practice Writing a Query ##

SELECT Major_category, Major, Unemployment_rate
FROM recent_grads
WHERE Major_category = 'Engineering' OR Major_category = 'Physical Sciences'
ORDER BY Unemployment_rate;