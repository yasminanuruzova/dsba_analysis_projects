#1. Найдите количество сотрудников мужского пола (M) и женского пола (F) и выведите записи в порядке убывания по количеству сотрудников.
SELECT gender, COUNT(*) AS count_gender FROM employees
GROUP BY gender ORDER BY count_gender DESC;

#2. Найдите среднюю зарплату в разрезе должностей сотрудников (title), округлите эти средние зарплаты до 2 знаков после запятой и выведите записи в порядке убывания.
SELECT t.emp_no, t.title, ROUND(AVG(s.salary), 2) AS avg_salary FROM salaries s 
JOIN titles t ON s.emp_no = t.emp_no 
GROUP BY t.emp_no, t.title ORDER BY avg_salary DESC;

#3. Вывести месяцы (от 1 до 12), и количество нанятых сотрудников в эти месяцы.
SELECT MONTH(hire_date) AS months, COUNT(hire_date) AS emp_qty 
FROM employees GROUP BY months ORDER BY months;

#4.  Сформируйте запрос, который соединяет employees, dept_emp, departments и titles, чтобы показать имена и фамилии сотрудников, названия их отделов и их текущие должности 
#(именно текущие должности, то есть фильтр по таблице titles, столбец to_date).
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name, t.title FROM employees e 
JOIN dept_emp de ON e.emp_no = de.emp_no 
JOIN departments d ON de.dept_no = d.dept_no
JOIN titles t ON t.emp_no = e.emp_no
WHERE t.to_date = '9999-01-01' ORDER BY e.emp_no;

#5. Используйте Self JOIN в таблице employees, чтобы найти пары сотрудников с одинаковыми фамилиями. Отобразите их имена и фамилии.
SELECT a.first_name, a.last_name, b.first_name, b.last_name 
FROM employees a JOIN employees b ON a.last_name = b.last_name
AND a.emp_no <> b.emp_no;




















