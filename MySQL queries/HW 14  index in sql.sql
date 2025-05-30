#1
SELECT * FROM employees
WHERE last_name = 'Famili' AND hire_date > '1990-05-28';

CREATE INDEX f_hire_date
ON employees (last_name, hire_date);

#2
SELECT * FROM salaries
WHERE salary > '88000' AND to_date ='9999-01-01';

CREATE INDEX f_salary_date
ON salaries (salary, to_date);

