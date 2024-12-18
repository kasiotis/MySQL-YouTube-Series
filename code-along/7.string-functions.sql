-- Active: 1734535741995@@127.0.0.1@3306@parks_and_recreation

SELECT LENGTH('sky')

-- LENGTH --
SELECT first_name, LENGTH(first_name)
FROM employee_demographics
ORDER BY 2

-- UPPER --
SELECT UPPER('sky')
-- LOWER --
SELECT LOWER('Sky')

-- TRIM --
SELECT TRIM('       dked       ')

SELECT LTRIM('       dked       ')

SELECT RTRIM('       dked       ')

-- String Slicing --
SELECT 
    first_name,
    LEFT(first_name,4),
    RIGHT(first_name,4),
    -- Substring(col, position, length) --
    SUBSTRING(first_name, 3, 2),
    birth_date,
    SUBSTRING(birth_date, 6, 2) AS birth_month
FROM employee_demographics


SELECT 
    first_name,
    REPLACE(first_name, 'a', 'z')
FROM employee_demographics

SELECT
    LOCATE('x', 'Alexander')

SELECT 
    first_name,
    LOCATE('An', first_name)
FROM employee_demographics

SELECT 
    first_name,
    last_name,
    CONCAT(first_name, ' ', last_name) AS full_name
FROM employee_demographics

