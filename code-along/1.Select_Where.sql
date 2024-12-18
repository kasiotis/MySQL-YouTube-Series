-- Active: 1734535741995@@127.0.0.1@3306@parks_and_recreation

SELECT * 
FROM employee_demographics
WHERE (first_name = 'Leslie');

-- LIKE func, "%" wildcard --
SELECT *
FROM employee_demographics
WHERE first_name LIKE '%er%'

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a%'

-- LIKE func, "__" two character wilcard --
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a__'
