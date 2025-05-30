SELECT * FROM employees;

#1.Вывести hire_date в годах, и количество сотрудников, которых наняли в эти года.
SELECT YEAR(hire_date), COUNT(hire_date) AS quant_emp FROM employees GROUP BY YEAR(hire_date);

#2.Вывести dept_no и рядом количество сотрудников, которые когда-либо работали в этих департаментах.
SELECT dept_no, COUNT(dept_no)  AS quant_emp FROM dept_manager GROUP BY dept_no;

#3.Вывести birth_date и количество сотрудников, которые родились в эти дни. Отфильтровать birth_date не равен 1952-02-13 и вывести только те дни, где количество сотрудников > 60. Отсортировать по убыванию (по количеству сотрудников), и далее показать только топ 20 birth_date (по количеству сотрудников). 
SELECT birth_date, COUNT(birth_date) AS quantity_emp 
FROM employees WHERE birth_date <> '1952-02-13' 
GROUP BY birth_date HAVING COUNT(birth_date) > 60 
ORDER BY COUNT(birth_date) DESC LIMIT 20;

#4.Вывести имена (которые начинается на А) и количество сотрудников с этим именем в компании.Отфильтровать имена, у которых количество сотрудников с этим именем больше 250,отсортировать по количеству сотрудников и показать только топ 10 first_name (по количеству сотрудников).
SELECT first_name, COUNT(first_name) AS quantity_emp 
FROM employees WHERE first_name LIKE 'A%'
GROUP BY first_name HAVING COUNT(first_name) > 250
ORDER BY COUNT(first_name) LIMIT 10;

#5.Создать копию таблицы employees, где имена начинается на B.Удалить строки в employees, где имена начинаются на B, далее из копии нашей таблицы вставить обратно эти строки.Удалить все строки из копии нашей таблицы, далее дропнуть эту таблицу.
CREATE TABLE employees_new AS SELECT * FROM employees WHERE first_name LIKE 'B%';
DELETE FROM employees WHERE first_name LIKE 'B%'; 
INSERT INTO employees SELECT * FROM employees_new;
 #удаление всех строк
DELETE FROM employees_new;
 #Удаление самой таблицы
DROP TABLE employees_new;











