SELECT*
FROM employee_salary;

SELECT occupation, AVG(salary)
FROM employee_salary
GROUP BY occupation, salary;

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender;

SELECT*
FROM employee_demographics
ORDER BY age DESC;

SELECT*
FROM employee_salary
ORDER BY salary DESC;

SELECT*
FROM employee_demographics
ORDER BY gender,age DESC;