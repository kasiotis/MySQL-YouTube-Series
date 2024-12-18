-- Active: 1734535741995@@127.0.0.1@3306@parks_and_recreation

-- age brackets --
SELECT 
    first_name,
    last_name,
    age,
CASE
    WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 and 50 THEN 'Old'
    WHEN age >= 50 THEN "DEAD"
END as age_bracket
FROM employee_demographics


-- Pay increase and Bonus --
-- < 50000 = 5%
-- > 50000 = 7%
-- Finance = 10%
SELECT first_name, last_name, salary, dept_id,
CASE 
    WHEN salary < 50000 THEN salary * 1.05
    WHEN salary > 50000 THEN salary * 1.07
END as new_salary,
CASE 
    WHEN dept_id = 6 THEN salary * .10  
END as bonus
FROM employee_salary