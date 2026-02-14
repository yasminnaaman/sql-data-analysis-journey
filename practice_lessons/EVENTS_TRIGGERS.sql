SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

DELIMITER $$
CREATE trigger employee_salary_insert
    AFTER INSERT ON employee_salary
    FOR EACH ROW
    BEGIN
    INSERT INTO employee_demographics(employee_id,first_name, last_name) 
    VALUES(NEW.employee_id, NEW.first_name, NEW.last_name);
    END $$
    DELIMITER ;
    
    INSERT INTO employee_salary(employee_id, first_name, last_name, occupation, salary, dept_id)
    VALUES (13, 'Yasmin', 'Naaman', 'Data scientist', '1000000', 2);
    
    -- EVENTS
    DELIMITER $$
    Create event retiree_deletion
    ON SCHEDULE EVERY 1 MONTH
    DO
    BEGIN
    DELETE 
    FROM employee_demographics
    where age>= 50;
    end $$
    DELIMITER ;