#Основы INNER JOIN: Напишите запрос, который соединяет таблицы employees и dept_emp, чтобы отобразить идентификаторы сотрудников (emp_no) и номера отделов (dept_no), в которых они работают (когда-то работали)
SELECT e.emp_no, d.* FROM dept_emp AS d INNER JOIN employees AS e 
ON d.emp_no = e.emp_no;

#2. Понимание LEFT JOIN: Создайте запрос, использующий LEFT JOIN для соединения таблиц employees и dept_manager. 
#Для каждого сотрудника отобразите его идентификатор и номер отдела, которым он управляет, если он является менеджером.
SELECT e.emp_no, a.dept_no FROM employees e LEFT JOIN dept_manager a 
ON a.emp_no = e.emp_no WHERE a.dept_no IS NOT NULL; #строки подсоединяются к левой таблице employees

#3. Применение RIGHT JOIN: Напишите запрос, который соединяет таблицы departments и dept_emp через RIGHT JOIN. Выведите название отдела и идентификатор сотрудника.
SELECT d.emp_no, b.dept_name FROM departments b RIGHT JOIN dept_emp d
ON b.dept_no = d.dept_no ; #строки подсоединяются к правой таблице dept_emp

#4. Используйте INNER JOIN для соединения таблиц employees и salaries, чтобы отобразить идентификаторы сотрудников и их среднюю зарплату.
SELECT e.emp_no, ROUND(AVG(s.salary), 1) AS average_salary FROM employees e INNER JOIN salaries s
ON e.emp_no = s.emp_no GROUP BY e.emp_no;

