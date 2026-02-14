SELECT * 
FROM parks_and_recreation.employee_demographics;

SELECT first_name,last_name,age
FROM parks_and_recreation.employee_demographics;

SELECT first_name, last_name,age, (age+10)*2
FROM parks_and_recreation.employee_demographics;

SELECT DISTINCT gender,last_name
FROM parks_and_recreation.employee_demographics;