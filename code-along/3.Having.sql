-- Active: 1734535741995@@127.0.0.1@3306@parks_and_recreation

-- WHERE runs before groupby, so if filtering after aggr use HAVING --
SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%Director%'
GROUP BY occupation

SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%Director%'
GROUP BY occupation
HAVING AVG(salary) > 50000