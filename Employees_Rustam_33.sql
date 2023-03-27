/*	SQL_DDL
 *	Первая часть
 *
 *	Таблица employees
 *	1) Создать таблицу employees
	- id. serial,  primary key,
	- employee_name. Varchar(50), not null
	2) Наполнить таблицу employee 70 строками.
*/

create table employees(
	id serial primary key,
	employee_name varchar(50) not null
);

insert into employees(employee_name) values
('Milton'), ('Joseph'), ('Clifton'), ('Leslie'), ('Esmond'), ('Peter'),
('Michael'), ('Peregrine'), ('Peter'), ('Malcolm'), ('George'), ('Valentine'),
('Michael'), ('Edwin'), ('Ethan'), ('Oldas'), ('David'), ('Russell'), ('Donald'),
('Wesley'), ('Claude'), ('William'), ('Henry'), ('George'), ('Michael'), ('Peter'),
('Christopher'), ('Matthew'), ('Jonathan'), ('Colin'), ('Ronald'), ('Homer'),
('Jeremiah'), ('Corey'), ('Oliver'), ('Joshua'), ('Osborne'), ('Joseph'), ('Jessie'),
('Michael'), ('William'), ('Charles'), ('Joseph'), ('Peter'), ('Trevor'), ('Gilbert'),
('Kelly'), ('Christopher'), ('Eric'), ('Ethane'), ('Roland'), ('Jeremiah'), ('Flor'),
('David'), ('Peter'), ('Charles'), ('Daniel'), ('Oliver'), ('Christopher'), ('Jack'),
('John'), ('Simon'), ('James'), ('Matthew'), ('Nicholas'), ('Eugene'), ('Christian'),
('Anthony'), ('Matthew'), ('Peter');

select * from employees;
======================================

/*Таблица salary

1) Создать таблицу salary
- id. Serial  primary key,
- monthly_salary. Int, not null
2) Наполнить таблицу salary 15 строками:
	- 1000
	- 1100
	- 1200
	- 1300
	- 1400
	- 1500
	- 1600
	- 1700
	- 1800
	- 1900
	- 2000
	- 2100
	- 2200
	- 2300
	- 2400
	- 2500
*/
create table salary(
	id serial primary key,
	monthly_salary int not null
);

insert into salary(monthly_salary)
values  (1000),
		(1100),
		(1200),
		(1300),
		(1400),
		(1500),
		(1600),
		(1700),
		(1800),
		(1900),
		(2000),
		(2100),
		(2200),
		(2300),
		(2400),
		(2500);

select * from salary;
=========================================================

/*Таблица employee_salary

1) Создать таблицу employee_salary
- id. Serial  primary key,
- employee_id. Int, not null, unique
- salary_id. Int, not null
2) Наполнить таблицу employee_salary 40 строками:
- в 10 строк из 40 вставить несуществующие employee_id*/

create table employee_salary(
	id serial primary key,
	employee_id int unique not null,
	salary_id int not null
);

insert into employee_salary (employee_id, salary_id) values 
/*	((random()*(41)), (random()*(41)));*/
	(1, (random()*(17-1)+1)), (2, (random()*(17-1)+1)), (3, (random()*(17-1)+1)), (4, (random()*(17-1)+1)), (5, (random()*(17-1)+1)),
	(6, (random()*(17-1)+1)), (7, (random()*(17-1)+1)), (8, (random()*(17-1)+1)), (9, (random()*(17-1)+1)), (10, (random()*(17-1)+1)),
	(11, (random()*(17-1)+1)), (12, (random()*(17-1)+1)), (13, (random()*(17-1)+1)), (14, (random()*(17-1)+1)), (15, (random()*(17-1)+1)),
	(16, (random()*(17-1)+1)), (17, (random()*(17-1)+1)), (18, (random()*(17-1)+1)), (19, (random()*(17-1)+1)), (20, (random()*(17-1)+1)),
	(21, (random()*(17-1)+1)), (22, (random()*(17-1)+1)), (23, (random()*(17-1)+1)), (24, (random()*(17-1)+1)), (25, (random()*(17-1)+1)),
	(26, (random()*(17-1)+1)), (27, (random()*(17-1)+1)), (28, (random()*(17-1)+1)), (29, (random()*(17-1)+1)), (30, (random()*(17-1)+1)),
	(71, (random()*(17-1)+1)), (72, (random()*(17-1)+1)), (73, (random()*(17-1)+1)), (74, (random()*(17-1)+1)), (75, (random()*(17-1)+1)),
	(76, (random()*(17-1)+1)), (77, (random()*(17-1)+1)), (78, (random()*(17-1)+1)), (79, (random()*(17-1)+1)), (80, (random()*(17-1)+1));
	
	
select * from employee_salary;
=========================================================

/* Таблица roles

	1) Создать таблицу roles
	- id. Serial  primary key,
	- role_name. int, not null, unique
	2) Поменять тип столба role_name с int на varchar(30)
	3) Наполнить таблицу roles 20 строками:
	'Junior Python developer',
	'Middle Python developer',
	'Senior Python developer',
	'Junior Java developer',
	'Middle Java developer',
	'Senior Java developer',
	'Junior JavaScript developer',
	'Middle JavaScript developer',
	'Senior JavaScript developer',
	'Junior Manual QA engineer',
	'Middle Manual QA engineer',
	'Senior Manual QA engineer',
	'Project Manager',
	'Designer',
	'HR',
	'CEO',
	'Sales manager',
	'Junior Automation QA engineer',
	'Middle Automation QA engineer',
	'Senior Automation QA engineer';
*/

create table roles (
	id serial primary key,
	role_name int unique not null
);

alter table roles 
drop column role_name;

alter table roles 
add column role_name varchar (30) unique not null;

insert into roles (role_name) values
	('Junior Python developer'),
	('Middle Python developer'),
	('Senior Python developer'),
	('Junior Java developer'),
	('Middle Java developer'),
	('Senior Java developer'),
	('Junior JavaScript developer'),
	('Middle JavaScript developer'),
	('Senior JavaScript developer'),
	('Junior Manual QA engineer'),
	('Middle Manual QA engineer'),
	('Senior Manual QA engineer'),
	('Project Manager'),
	('Designer'),
	('HR'),
	('CEO'),
	('Sales manager'),
	('Junior Automation QA engineer'),
	('Middle Automation QA engineer'),
	('Senior Automation QA engineer');

select * from roles;
=========================================================
/*Таблица roles_employee

1) Создать таблицу roles_employee
- id. Serial  primary key,
- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
- role_id. Int, not null (внешний ключ для таблицы roles, поле id)
2) Наполнить таблицу roles_employee 40 строками:
*/

create table roles_employee (
	id serial primary key,
	employee_id int unique not null,
	role_id int not null,
	foreign key (employee_id) references employees(id),
	foreign key (role_id) references roles(id)
);

insert into roles_employee (employee_id, role_id) values
	(32, random()*(20-1)+1), 
	(51, random()*(20-1)+1),
	(10, random()*(20-1)+1),
	(46, random()*(20-1)+1),
	(68, random()*(20-1)+1),
	(24, random()*(20-1)+1),
	(17, random()*(20-1)+1),
	(15, random()*(20-1)+1),
	(59, random()*(20-1)+1),
	(26, random()*(20-1)+1),
	(41, random()*(20-1)+1),
	(14, random()*(20-1)+1),
	(70, random()*(20-1)+1),
	(43, random()*(20-1)+1),
	(64, random()*(20-1)+1),
	(20, random()*(20-1)+1),
	(39, random()*(20-1)+1),
	(1, random()*(20-1)+1),
	(47, random()*(20-1)+1),
	(11, random()*(20-1)+1),
	(65, random()*(20-1)+1),
	(36, random()*(20-1)+1),
	(61, random()*(20-1)+1),
	(40, random()*(20-1)+1),
	(16, random()*(20-1)+1),
	(7, random()*(20-1)+1),
	(52, random()*(20-1)+1),
	(67, random()*(20-1)+1),
	(29, random()*(20-1)+1),
	(35, random()*(20-1)+1),
	(55, random()*(20-1)+1),
	(22, random()*(20-1)+1),
	(23, random()*(20-1)+1),
	(13, random()*(20-1)+1),
	(69, random()*(20-1)+1),
	(42, random()*(20-1)+1),
	(18, random()*(20-1)+1),
	(9, random()*(20-1)+1),
	(6, random()*(20-1)+1),
	(27, random()*(20-1)+1);
	

select * from roles_employee;





==============================================================================================================================================
/*Урок по SQL_DDL*/
create table salary(
	id serial primary key,
	monthly_salary int not null
);


insert into salary(monthly_salary)
values  (300),
		(800),
		(1200),
		(1500),
		(1800),
		(2000),
		(2300),
		(2500),
		(2700),
		(3000),
		(3200);

/*Выборочное изменение значения ячейки*/
update salary 
set monthly_salary = 5000
where id = 11;

/*Удаление значения*/
delete from salary 
where id = 7;

select * from salary;

/*Удалить таблицу*/
drop table salary;


create table roles(
	id serial primary key,
	role_title varchar (50) unique not null    /* unique - в ячейках столбца "role_title" должны быть уникальные значения*/
);

insert into roles(role_title)
values  ('QA_Manual_junior'),
		('QA_Manual_middle'),
		('QA_Manual_senior'),
		('Java_developer_junior'),
		('Java_developer_middle'),
		('Java_developer_senior'),
		('Manager');

/*Добавление новой колонки*/
alter table roles 
add column parking int;
/*Изменение имени колонки*/
alter table roles 
rename column parking to taxi;
/*Удаление колонки*/
alter table roles 
drop column taxi;

select * from roles;

/*Удалить таблицу*/
drop table roles;


create table roles_salary(
	id serial primary key,
	role_id int not null,
	salary_id int not null,
	foreign key (role_id) references roles(id),
	foreign key (salary_id) references salary(id)
);


insert into roles_salary(role_id, salary_id)
values  (1,1),
		(2,2),
		(3,6),
		(4,2),
		(5,4);

select * from roles_salary;

/*Удалить таблицу*/
drop table roles_salary;