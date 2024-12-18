-- Active: 1734535741995@@127.0.0.1@3306@parks_and_recreation

-- Default UNION logic is applying DISTINCT (No Duplicates) --
SELECT first_name, last_name
FROM employee_demographics
UNION
SELECT first_name, last_name
FROM employee_salary

-- Default UNION ALL (Duplicates) --
SELECT first_name, last_name
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary


SELECT first_name, last_name, 'old man' AS label
FROM employee_demographics
WHERE age > 40 And gender = 'Male'
UNION
SELECT first_name, last_name, 'old Lady' AS label
FROM employee_demographics
WHERE age > 40  And gender = 'Female'
UNION
SELECT first_name, last_name, 'Highly paid' AS label
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name