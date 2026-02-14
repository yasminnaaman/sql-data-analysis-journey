SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
    
SELECT dem.employee_id,age,occupation
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
    
    
-- outer joins
SELECT *
FROM employee_demographics AS dem
LEFT OUTER join employee_salary AS sal
	ON dem.employee_id= sal.employee_id;

SELECT dem.employee_id,dem.first_name,occupation
FROM employee_demographics AS dem
LEFT OUTER join employee_salary AS sal
	ON dem.employee_id= sal.employee_id;

SELECT*
FROM employee_demographics AS dem
RIGHT JOIN employee_salary AS sal
	ON dem.employee_id= sal.employee_id;

SELECT sal.employee_id,sal.first_name,age
FROM employee_demographics AS dem
RIGHT JOIN employee_salary AS sal
		on dem.employee_id= sal.employee_id;
        

-- Self joins
SELECT * 
FROM employee_salary;


SELECT *
FROM employee_salary AS emp1
Join employee_salary AS emp2
	ON (emp1.employee_id + 1)= emp2.employee_id;
;
