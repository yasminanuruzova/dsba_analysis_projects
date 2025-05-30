#1. Найдите всех сотрудников, которые работали как минимум в 2 департаментах. Вывести их имя и фамилию. Показать записи в порядке возрастания.
SELECT first_name, last_name FROM employees WHERE emp_no IN (  SELECT emp_no
FROM dept_emp GROUP BY emp_no
HAVING COUNT(dept_no) >= 2);

#2. Вывести имя, фамилию и зарплату самого высокооплачиваемого сотрудника.    
SELECT e.first_name, e.last_name, s.salary FROM employees e 
JOIN salaries s ON e.emp_no = s.emp_no 
WHERE salary IN 
( SELECT MAX(salary) FROM salaries); 

    
#3. Создайте запрос, который выбирает названия всех отделов, в которых работает более 100 сотрудников.
SELECT dept_name
FROM departments
WHERE dept_no IN (
SELECT dept_no FROM dept_emp
GROUP BY dept_no
HAVING COUNT(emp_no) > 100);

#4. Напишите запрос, который находит имена и фамилии всех сотрудников, которые никогда не были менеджерами.
SELECT first_name, last_name FROM employees WHERE emp_no IN 
( SELECT emp_no from dept_emp WHERE dept_no <> 'd006'); 

#5. Создайте запрос, который для каждого отдела выводит сотрудников, получающих наибольшую зарплату в этом отделе.
SELECT d.dept_no, de.dept_name, e.first_name, e.last_name, s.salary
FROM departments de
JOIN dept_emp d ON de.dept_no = d.dept_no
JOIN employees e ON d.emp_no = e.emp_no
JOIN salaries s ON e.emp_no = s.emp_no
WHERE salary IN (
SELECT salary FROM salaries GROUP BY salary HAVING MAX(salary));


#6. Напишите запрос, который выбирает названия отделов, где средняя зарплата выше общей средней зарплаты по компании.
CREATE TEMPORARY TABLE salaries_2 SELECT * FROM salaries; #создание временной таблицы для сравнения средних зарплат отдела и компании
DROP TEMPORARY TABLE salaries_2;

SELECT de.dept_name, AVG(s.salary) AS avg_dept_salary
FROM departments de
JOIN dept_emp d ON de.dept_no = d.dept_no
JOIN salaries_2 s ON d.emp_no = s.emp_no
GROUP BY de.dept_name
HAVING AVG(s.salary) > 
	(SELECT AVG(salary)
    FROM salaries);







