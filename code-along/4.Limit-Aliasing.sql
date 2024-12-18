-- Active: 1734535741995@@127.0.0.1@3306@parks_and_recreation

-- using LIMIT to find the 3 oldest employees --
SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 3

-- using LIMIT to find the 3rd oldest employees --
SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 2,1


-- aliasing (AS) --
SELECT gender, AVG(age) AS avg_age
from employee_demographics
GROUP BY gender
HAVING avg_age > 40