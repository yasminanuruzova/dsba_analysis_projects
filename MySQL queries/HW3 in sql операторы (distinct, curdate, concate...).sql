#информация из таблицы employees
SELECT * FROM employees;

#все мужчины из таблицы employees
SELECT   * FROM employees WHERE gender = 'M';

#все сотрудники по имени Elvis
SELECT * FROM employees WHERE first_name = 'Elvis';

#уникальные/различные названия должностей
SELECT DISTINCT title FROM titles;

#все сотрудники, кто был трудоустроен в 2000 году 
SELECT * FROM employees WHERE YEAR(hire_date) = 2000;

#все сотрудники, кому больше 60 лет на данный момент
SELECT * FROM employees WHERE CURDATE() - INTERVAL 60 YEAR > birth_date;

#количество строк в таблице salaries
SELECT  COUNT(*) FROM salaries;

#количество строк в таблице salaries, где зарплата > 100.000$
SELECT COUNT(*) FROM salaries WHERE salary > 100000;
