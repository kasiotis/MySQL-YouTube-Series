-- Active: 1734535741995@@127.0.0.1@3306@parks_and_recreation

-- aggregating average age per gender --
SELECT gender, AVG(age)
FRom employee_demographics
GROUP BY gender

-- diff aggr functions --
SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FRom employee_demographics
GROUP BY gender

-- order by --
SELECT *
FRom employee_demographics
ORDER BY last_name