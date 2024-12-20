-- Active: 1734535741995@@127.0.0.1@3306@parks_and_recreation
-- Window Functions -- The better way of doing things instead of subqueries

-- standard group by with join to get average salary--
SELECT 
    gender,
    AVG(salary) as avg_salary
FROM employee_demographics dem
JOIN employee_salary sal
    ON  dem.employee_id = sal.employee_id
GROUP BY gender -- rolls everything up to a singe row for each distinct item in the group FIELDS

-- Window function alternative for average salary --
SELECT 
    dem.first_name,
    dem.last_name,
    gender,
    AVG(salary) OVER(PARTITION BY gender) as avg_salary -- OVER() function allows as to globalize our AVG()
FROM employee_demographics dem
JOIN employee_salary sal
    ON  dem.employee_id = sal.employee_id
-- no GROUP BY needed anymore because we used the "OVER()" func


-- Window function for sum salary --
SELECT 
    dem.first_name,
    dem.last_name,
    gender,
    SUM(salary) OVER(PARTITION BY gender) as avg_salary -- OVER() function allows as to globalize our AVG()
FROM employee_demographics dem
JOIN employee_salary sal
    ON  dem.employee_id = sal.employee_id
-- no GROUP BY needed anymore because we used the "OVER()" func


-- Window function for cumsum/rolling total salary --
SELECT 
    dem.first_name,
    dem.last_name,
    gender,
    dem.age,
    sal.salary,
    SUM(salary) OVER(
            PARTITION BY gender  -- "Partition By" function allows us to segregate our operation SUM()
            ORDER BY dem.age --  ORDER BY function inside the OVER() allows as to cumulatively apply our SUM() based on the ordering FIELD
        ) as rolling_total  -- OVER() function allows as to globalize our SUM()
FROM employee_demographics dem
JOIN employee_salary sal
    ON  dem.employee_id = sal.employee_id
-- no GROUP BY needed anymore because we used the "OVER()" func

-- ROW_NUMBER() - RANK() - DENSE_RANK() --
SELECT 
    dem.employee_id,
    dem.first_name,
    dem.last_name,
    gender,
    sal.salary,
    ROW_NUMBER() OVER(
        PARTITION BY gender
        ORDER BY salary DESC
    ) as row_num, -- counting the row number based on the OVER() function 
    RANK() OVER(
        PARTITION BY gender
        ORDER BY salary DESC
    ) as rank_num, -- ranking the rows (positionaly) based on the OVER() - observe the rank for the last two (they have equal salary)
    DENSE_RANK() OVER(
        PARTITION BY gender
        ORDER BY salary DESC
    ) as dense_rank_num -- ranking the rows (numerically) based on the OVER() 
FROM employee_demographics dem
JOIN employee_salary sal
    ON  dem.employee_id = sal.employee_id