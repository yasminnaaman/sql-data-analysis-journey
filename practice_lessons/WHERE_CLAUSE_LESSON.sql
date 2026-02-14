SELECT *
FROM employee_salary
WHERE first_name='Andy';

SELECT *
FROM employee_salary
WHERE salary > 50000;

SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01';

SELECT *
FROM employee_demographics
WHERE birth_date >'1985-01-01'
AND gender ='female';

SELECT *
FROM employee_demographics
WHERE birth_date >'1985-01-01'
OR gender ='female';

SELECT *
FROM employee_demographics
WHERE (birth_date LIKE '1985%')
AND gender ='male';

SELECT *
FROM employee_demographics
WHERE (birth_date LIKE '19__-__-__')
AND gender ='female';