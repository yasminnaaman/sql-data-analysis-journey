DELIMITER $$
CREATE PROCEDURE large_salaries(p_employee_id INT)
BEGIN
SELECT salary 
FROM employee_salary
where employee_id= p_employee_id;
SELECT age,
CASE 
when age > 50 THEN 'Should retire'
when age >= 30 THEN 'Senior workers'
Else 'young workers'
END AS result
FROM employee_demographics;
END $$
DELIMITER ;
CALL large_salaries(4);