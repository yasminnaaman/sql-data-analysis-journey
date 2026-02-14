SELECT dem.first_name, dem.last_name, gender, 
AVG(salary) OVER(PARTITION BY gender) avg_salary
FROM employee_demographics dem
JOIN employee_salary sal
ON dem.employee_id= sal.employee_id;

SELECT dem.first_name, dem.last_name, gender, 
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) rolling_total
FROM employee_demographics dem
JOIN employee_salary sal
ON dem.employee_id= sal.employee_id;

SELECT dem.first_name, dem.last_name, gender, 
row_number() OVER(PARTITION BY gender ORDER BY salary DESC) row_num,
rank() OVER(PARTITION BY gender ORDER BY salary DESC) rank_num,
dense_rank() OVER(PARTITION BY gender ORDER BY salary DESC) dense_rank_num
FROM employee_demographics dem
JOIN employee_salary sal
ON dem.employee_id= sal.employee_id;

