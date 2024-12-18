-- Active: 1734535741995@@127.0.0.1@3306@parks_and_recreation

-- Subqueries == a query within a query --


-- Use case: using a subquery to retrieve a list of values fror a different table that I want to use in WHERE function on my Main Query --
-- Main Query --
SELECT *
FROM employee_demographics
WHERE employee_id IN (
    -- SubQuery --
    SELECT employee_id
    FROM employee_salary
    WHERE dept_id = 1 -- returns a list of employee_ids of people in department 1
) -- returns all fields of demographics table where the employee_id matches the list returned by the subquery --


-- Adding a new column to our salary table that shows the total salary
-- Main Query --
SELECT 
    first_name,
    salary,
    -- start of subquery --
    (
        SELECT
            AVG(salary)
        FROM
            employee_salary
    ) as total_salary -- end of subquery --
FROM employee_salary



SELECT 
    gender,
    AVG(age) as avg_age,
    MAX(age) as max_age,
    MIN(age) as min_age,
    COUNT(age) as count_age
FROM employee_demographics
GROUP BY gender

SELECT AVG(max_age)
FROM 
(
    -- start of subquery --
    SELECT 
        gender,
        AVG(age) as avg_age,
        MAX(age) as max_age,
        MIN(age) as min_age,
        COUNT(age) as count_age
    FROM employee_demographics
    GROUP BY gender
    -- end of subquery --
) as agg_table
