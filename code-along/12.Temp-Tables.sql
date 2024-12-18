-- Active: 1734535741995@@127.0.0.1@3306@parks_and_recreation

---------------- temp table from scratch --------------------

CREATE TEMPORARY TABLE temp_table (
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    favorite_movie VARCHAR(100)
)

SELECT *
FROM temp_table

INSERT INTO temp_table
VALUES('Antreas', 'Kasiotis', 'Interstellar')

SELECT *
FROM temp_table

---------------- temp table from existing data (subset) --------------------

CREATE TEMPORARY TABLE salary_over_50k
SELECT *
FROM employee_salary
WHERE salary >= 50000

SELECT *
FROM salary_over_50k