=======================================================================================================================
-- Урок по Join's и Subqueries

create table phones_samsung(
	id serial primary key,
	model varchar(40),
	ram int not null,
	front_camera int,
	price int
)

create table phones_apple(
	id serial primary key,
	model varchar(40),
	ram int not null,
	front_camera int,
	price int
)

insert into phones_samsung(model, ram, front_camera, price)
values ('A50', 6, 10, 300),
	   ('A50', 8, 10, 400),
	   ('A52', 8, 16, 500),
	   ('S20', 8, 24, 1500),
	   ('S21', 8, 12, 1000),
	   ('S22', 6, 12, 1200),
	   ('A71', 6, 12, 1200),
	   ('A91', 4, 12, 1900),
	   ('A57', 8, 8, 900),
	   ('A32', 8, 4, 800),
	   ('A33', 8, 5, 750),
	   ('A43', 8, 5, 850)
	;
	
insert into phones_apple(model, ram, front_camera, price)
values ('X', 4, 16, 500),
	   ('XR', 6, 15, 600),
	   ('XS', 6, 18, 700),
	   ('11', 6, 16, 1000),
	   ('11_pro', 10, 12, 1200),
	   ('12', 6, 12, 1500),
	   ('12_pro', 16, 12, 1700),
	   ('13', 6, 24, 1600),
	   ('13_pro', 24, 8, 2000),
	   ('SE 2020', 8, 24, 600),
	   ('Mini', 8, 16, 750),
	   ('12 pro max', 8, 36, 1900)
	;

select * from phones_samsung;
select * from phones_apple;

select price from phones_apple 
where price > (1500);

select avg(price) from phones_samsung;
select price from phones_samsung where price < 1000;

select price from phones_apple 
where price < (select avg(price) from phones_samsung);

select * from phones_apple 
where price in (select price from phones_samsung where price < 1000);

select * from phones_apple 
where price not in (select price from phones_samsung where price < 1000);


select price from phones_samsung where price < 700;

select * from phones_apple 
where price > all (select price from phones_samsung where price < 700)
order by price;

select * from phones_samsung 
where price > all (select price from phones_apple where price < 700)
order by price;

select * from phones_apple 
where price > any (select price from phones_samsung where price < 700)
order by price;

select * from phones_apple 
where price <> all (select price from phones_samsung where price < 700)
order by price;

-- ANY & ALL
-- "< ANY" - меньше максимального значения;
-- "> ANY" - больше минимального значения;
-- "< ALL" - меньше минимального значения;
-- "> ALL" - больше максимального значения; 
-- "<> ANY" - ;
-- "<> ALL" - ;


=======================================================================================================================
create table City(
	id serial,
	title varchar(50)
)

create table Person(
	id serial,
	person_name varchar(50),
	city_id int
)

select * from City;

drop table Person;


insert into City(title)
values ('Berlin'),
		('Tokio'),
		('Antalya'),
		('Paris'),
		('Roma')

		
insert into Person(person_name, city_id)	
values ('Victor', 1),
		('Elena', 2),
		('Anna', 1),
		('Vadim', 3),
		('Ivan', 7),
		('Irina', 9)

-- Inner join (В inner join попадут только те записи таблиц, значения которых совпали между собой)
select * from 
Person inner join City
on Person.city_id = City.id;

select person.person_name, city.title, city.id, person.city_id from 
Person inner join City
on Person.city_id = City.id;

-- Left join (В Left join попадут записи Inner join и ОСТАТКИ записей из ЛЕВОЙ ТАБЛИЦЫ, которые не попали в Inner join)
select person.person_name, person.city_id, city.title, city.id from 
Person left join City
on Person.city_id = City.id;

-- Right join (В Right join попадут записи Inner join и ОСТАТКИ записей из ПРАВОЙ ТАБЛИЦЫ, которые не попали в Inner join)
select person.person_name, person.city_id, city.title, city.id from 
Person right join City
on Person.city_id = City.id;

-- Full outer join (В Full outer join попадут записи Inner join и ОСТАТКИ записей из ПРАВОЙ ТАБЛИЦЫ, потом ОСТАТКИ записей 
--                                                                         из ЛЕВОЙ ТАБЛИЦЫ которые не попали в Inner join)
select person.person_name, person.city_id, city.title, city.id from 
Person full outer join City
on Person.city_id = City.id;

-- Cross join (Cross join выводит каждую строку из ПРАВОЙ таблицы со всеми строками из ЛЕВОЙ таблицы)
select person.person_name, person.city_id, city.title, city.id from 
Person cross join City;
