/*everything based avarage salary 
based on the avarage salary determine whether the person earns below,above or avarage salary*/

WITH CTE_example AS
(
SELECT sal.first_name,sal.last_name, salary, AVG(salary) OVER(PARTITION BY dem.gender) as avg_salary
FROM employee_salary sal
JOIN employee_demographics dem
on sal.employee_id=dem.employee_id
)
SELECT first_name,last_name, avg_salary,salary, 
CASE
when salary< avg_salary THEN 'Salary is less than avarage'
when salary> avg_salary THEN 'Salary is more than avarage'
ELSE 'salary is avarage'
END AS result_info
FROM CTE_example;