-- Active: 1734535741995@@127.0.0.1@3306@parks_and_recreation

-- CTEs - allow you to define a subquery block that you can then reference in Main Query --
-- Difference from standard subqueries: 
--    - naming, formatting, standardized approach/cleaner, can perform advanced calcs

WITH CTE_Example AS ( -- using the "WITH" keyword to define the CTE
    SELECT 
        gender, 
        AVG(salary) as avg_sal, 
        MAX(salary) as max_sal, 
        MIN(salary) as min_sal, 
        COUNT(salary) as count_sal
    FROM employee_demographics dem
    JOIN employee_salary sal
        ON dem.employee_id = sal.employee_id
    GROUP BY gender
) -- THIS CTE can only be used immidiately after being created
SELECT 
    *
FROM CTE_Example


-- Chaining CTEs together -- This Allows for operations to be performed separately and then combined - WE LIKE THIS
WITH CTE_Example AS ( -- Defining the First CTE
    SELECT 
        employee_id,
        gender,
        birth_date
    FROM employee_demographics dem
    WHERE birth_date > '1985-01-01'
), 
CTE_Example2 AS ( -- defining the Second CTE
    SELECT employee_id, salary
    FROM employee_salary
    WHERE salary > 50000
)
SELECT *
FROM CTE_Example -- referenecing the first one
JOIN CTE_Example2 -- referenecing the second one
    ON `CTE_Example`.employee_id = `CTE_Example2`.employee_id