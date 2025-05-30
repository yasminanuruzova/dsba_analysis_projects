SELECT * FROM dept_manager;
SELECT * FROM employees;
#1. Выведите список всех менеджеров, а именно их emp_no, имена/фамилии, номер департамента, который они курируют, и дату найма в компанию. 
#(именно менеджером, то есть подсказка dept_manager)
SELECT e.emp_no, e.first_name, e.last_name, d.dept_no, E.hire_date
FROM employees e JOIN dept_manager d
ON d.emp_no = e.emp_no;

#2. Существует ли сотрудник по фамилии Markovitch, который когда-то был менеджером департамента. Может быть таких сотрудников несколько? 
#(именно менеджером, то есть подсказка dept_manager)
SELECT e.emp_no, e.first_name, e.last_name, d.dept_no, e.hire_date
FROM employees e JOIN dept_manager d
ON d.emp_no = e.emp_no
WHERE e.last_name = 'Markovitch'; #в данной таблице только один менеджер Markovitch, но сотрудников с таким именем несколько 

#3. Вывести список сотрудников, имена/фамилии, дату найма, должность в компании, у которых имя начинается на М, а фамилия заканчивается на H.
SELECT  e.first_name, e.last_name, e.hire_date, a.title
FROM employees e JOIN titles a
ON A.emp_no = e.emp_no
WHERE first_name LIKE 'M%' AND last_name LIKE '%N';

#4. Создайте временную таблицу на основе salaries, где у вас будет emp_no и его/ее максимальная и минимальная зарплата за весь период работы в компании.
DROP TEMPORARY TABLE IF EXISTS salaries_2;
CREATE TEMPORARY TABLE salaries_2 
SELECT emp_no, MAX(salary) as max_salary, MIN(salary) as min_salary FROM salaries GROUP BY emp_no;
#Далее сделайте JOIN используя эту временную таблицу и таблицу employees чтобы получить список сотрудников, их имена/фамилии, и их мин/макс зарплат.
SELECT e.first_name, e.last_name, s.max_salary, s.min_salary FROM employees e INNER JOIN salaries_2 s ON e.emp_no = s.emp_no;

SELECT * FROM salaries_2;
DROP TEMPORARY TABLE IF EXISTS salaries_2;







