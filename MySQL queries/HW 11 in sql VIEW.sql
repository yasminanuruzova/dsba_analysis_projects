#1. Создание простого View: Напишите SQL-запрос для создания представления (View), которое отображает имена и фамилии всех сотрудников.
CREATE VIEW name_employees AS  SELECT first_name, last_name FROM employees;
SELECT * FROM name_employees;
DROP VIEW name_employees;

#2. View с JOIN: Создайте представление, которое объединяет таблицы employees и salaries, показывая идентификатор сотрудника, его имя, фамилию и текущую зарплату.
CREATE VIEW emp_salary AS SELECT DISTINCT(e.emp_no), e.first_name, e.last_name, s.salary
FROM employees e 
JOIN salaries s ON e.emp_no = s.emp_no 
WHERE to_date = '9999-01-01';

SELECT * FROM emp_salary;
DROP VIEW emp_salary;

#3. View для агрегированных данных: Создайте представление, которое показывает среднюю зарплату по каждому отделу.
CREATE VIEW avg_salary AS SELECT d.dept_name, AVG(s.salary) AS avg_salary FROM departments d 
JOIN dept_emp de ON d.dept_no = de.dept_no 
JOIN salaries s ON de.emp_no = s.emp_no 
GROUP BY d.dept_name;

SELECT * FROM avg_salary;
DROP VIEW avg_salary;

#4. Комбинированный View с JOIN и WHERE: Создайте представление, которое отображает информацию о сотрудниках, работающих в отделе 'Sales'.
CREATE VIEW sales_emp AS SELECT de.emp_no, e.birth_date, e.first_name, e.last_name, e.gender, e.hire_date
FROM dept_emp de 
JOIN employees e ON de.emp_no = e.emp_no
WHERE dept_no = 'd007';

SELECT * FROM sales_emp;
DROP VIEW sales_emp;


















