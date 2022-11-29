CREATE TABLE employees (
  id_empl  INTEGER PRIMARY KEY, 
  fio CHAR(25),
  birth_date DATE,   
  begin_date DATE,
  position CHAR(15),
  level CHAR(10),
  salary REAL,
  id_depart INTEGER,
  rights BOOL
);

CREATE TABLE department (
  id_depart  INTEGER PRIMARY KEY,
  name CHAR(20),
  lider CHAR(20),   
  count INTEGER
);

CREATE TABLE estimate (
  id_empl INTEGER PRIMARY KEY,
  num_quarter  INTEGER,
  mark  CHAR
);

INSERT INTO employees
  VALUES (1001, 'Иванов Иван Иванович', '1980-01-20', '2020-01-10', 'Начальник', 'lead', 200000.00, 1, TRUE);
INSERT INTO employees
VALUES (1002, 'Петров Петр Петрович', '1985-02-12', '2020-02-15', 'Водитель' , 'middle', 150000.00, 1, TRUE);
INSERT INTO employees
VALUES (1003, 'Семенов Семен Семенович', '1984-03-09', '2019-06-11', 'Бухгалтер', 'senior', 180000.00, 1, FALSE);
INSERT INTO employees
  VALUES (2001, 'Сивков Иван Петрович', '1982-10-21', '2018-01-03', 'Начальник', 'lead', 220000.00, 2, TRUE);
INSERT INTO employees
VALUES (2002, 'Кузнецов Петр Иванович', '1985-02-12', '2021-05-15', 'Программист' , 'middle', 190000.00, 2, FALSE);

SELECT * FROM employees;

INSERT INTO department VALUES (1, 'Бухгалтерия', 'Иванов Иван Иванович', 3);
INSERT INTO department VALUES (2, 'IT отдел', 'Сивков Иван Петрович', 2);

SELECT * FROM department;

INSERT INTO estimate VALUES (1001, 1, 'A');
INSERT INTO estimate VALUES (1001, 2, 'B');
INSERT INTO estimate VALUES (1001, 3, 'A');
INSERT INTO estimate VALUES (1001, 4, 'A');
INSERT INTO estimate VALUES (2001, 1, 'C');
INSERT INTO estimate VALUES (2001, 2, 'D');
INSERT INTO estimate VALUES (2001, 3, 'B');
INSERT INTO estimate VALUES (2001, 4, 'A');
INSERT INTO estimate VALUES (2002, 1, 'E');
INSERT INTO estimate VALUES (2002, 2, 'E');

SELECT * FROM estimate;

INSERT INTO department
  VALUES (3, 'Анализ данных', 'Орлов Иван Иванович', 3);

INSERT INTO employees
  VALUES (3001, 'Орлов Иван Иванович', '1981-02-22', '2022-11-09', 'Начальник', 'lead', 250000.00, 3, TRUE);
INSERT INTO employees
VALUES (3002, 'Соколов Петр Петрович', '1979-07-17', '2022-09-18', 'Аналитик' , 'middle', 200000.00, 3, FALSE);
INSERT INTO employees
VALUES (3003, 'Воробьев Семен Семенович', '1985-06-19','2022-10-19', 'Инженер данных', 'senior', 225000.00, 3, FALSE);

SELECT * FROM employees;

/*  Уникальный номер сотрудника, его ФИО и стаж работы – для всех сотрудников компании  */

SELECT id_empl, fio, (CURRENT_DATE - begin_date) AS career FROM employees;

/*  Уникальный номер сотрудника, его ФИО и стаж работы – только первых 3-х сотрудников  */

SELECT id_empl, fio, (CURRENT_DATE - begin_date) AS career FROM employees ORDER BY id_empl DESC LIMIT 3;

/*  Уникальный номер сотрудников – водителей  */

SELECT  id_empl FROM employees WHERE position = 'Водитель';

/*  Выведите номера сотрудников, которые хотя бы за 1 квартал получили оценку D или E  */

SELECT  DISTINCT id_empl FROM estimate WHERE mark in ('D', 'E');

/*  Выведите самую высокую зарплату в компании  */

SELECT  MAX(salary) AS MAX_SALARY FROM employees; 



