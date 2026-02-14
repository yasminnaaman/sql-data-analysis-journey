SELECT first_name, last_name, salary,
CASE
	when salary<50000 THEN (salary*0.05)+salary
    when salary> 50000 THEN (salary*0.07)+salary
END as pay_increase,
CASE 
	when dept_id =6 THEN (salary*0.10)+salary
END AS Bonus
FROM employee_salary;

SELECT * 
FROM employee_demographics
WHERE employee_id IN (
		SELECT employee_id
        FROM employee_salary
        WHERE dept_id=1);
        
SELECT 
    first_name, 
    last_name, 
    results.avg_salary AS average_company_salary,
    CASE 
        WHEN salary > results.avg_salary THEN 'Salary is above average'
        WHEN salary < results.avg_salary THEN 'Salary is below average'
        ELSE 'Salary is average'
    END AS result_info
FROM 
    employee_salary
JOIN
    (SELECT AVG(salary) AS avg_salary FROM employee_salary) AS results;

 

    
