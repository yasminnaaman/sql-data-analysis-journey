SELECT first_name, last_name,salary,
CASE
	WHEN salary < 50000 THEN salary*1.05
    WHEN salary > 50000 THEN salary*1.07
END AS salary_bracket,
CASE
	WHEN dept_id=6 THEN salary*.10
END AS bonus
FROM employee_salary;

SELECT sal.first_name, sal.last_name,dem.gender,
CASE
	WHEN salary < 50000 THEN salary*1.05
    WHEN salary > 50000 THEN salary*1.07
END AS salary_bracket,
CASE
	WHEN dept_id=6 THEN salary*.10
END AS bonus
FROM employee_salary AS sal
RIGHT JOIN employee_demographics AS dem
ON sal.employee_id=dem.employee_id ;

SELECT first_name, last_name, age,
CASE
	when age<=30 THEN 'young' 
    when age BETWEEN 30 and 45 THEN 'old'
END as results
FROM employee_demographics;



