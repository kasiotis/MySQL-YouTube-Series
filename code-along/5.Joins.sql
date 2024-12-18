-- Active: 1734535741995@@127.0.0.1@3306@parks_and_recreation

-- INNER JOIN - finds only common matches --
SELECT dem.employee_id, dem.age, sal.occupation
FROM employee_demographics dem
INNER JOIN employee_salary sal
    ON dem.employee_id = sal.employee_id


-- LEFT/RIGHT "OUTTER" JOIN - brings over values for all of the matched keys from the LEFT/RIGHT table --
SELECT *
FROM employee_demographics dem
LEFT JOIN employee_salary sal
    ON dem.employee_id = sal.employee_id

SELECT *
FROM employee_demographics dem
RIGHT JOIN employee_salary sal
    ON dem.employee_id = sal.employee_id


-- SELF JOIN - Tie the table to itself --
SELECT 
    emp1.employee_id AS emp_santa,
    emp1.first_name AS first_name_santa,
    emp1.last_name AS last_name_santa,
    emp2.employee_id AS emp_name,
    emp2.first_name AS first_name_emp,
    emp2.last_name AS last_name_emp
FROM employee_salary emp1
JOIN employee_salary emp2
    ON emp1.employee_id + 1 = emp2.employee_id


-- Joining multiple tables together --
SELECT *
FROM employee_demographics dem
INNER JOIN employee_salary sal
    ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments pd
    ON sal.dept_id = pd.department_id

SELECT *
FROM parks_departments