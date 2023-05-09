-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employees.employee_name, salary.monthly_salary
from employees inner join employee_salary on employees.id = employee_salary.employee_id 
inner join salary on employee_salary.salary_id = salary.id;


-- 2. Вывести всех работников у которых ЗП меньше 2000.
select employees.employee_name, salary.monthly_salary
from employees inner join employee_salary on employees.id = employee_salary.employee_id
inner join salary on employee_salary.salary_id = salary.id where monthly_salary < 2000;


-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select salary.id, salary.monthly_salary 
from salary left join employee_salary on employee_salary.salary_id = salary.id 
where employee_salary.id is null;


-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select salary.id, salary.monthly_salary 
from salary left join employee_salary on employee_salary.salary_id = salary.id 
where employee_salary.id is null and salary.monthly_salary < 2000;


-- 5. Найти всех работников кому не начислена ЗП.
select employees.id, employees.employee_name, salary.monthly_salary 
from employees left join employee_salary on employees.id = employee_salary.employee_id 
			   left join salary on employee_salary.salary_id = salary.id
where salary.monthly_salary is null
order by employees.id;


-- 6. Вывести всех работников с названиями их должности.
select employees.employee_name, roles.role_name 
from employees left join roles_employee on employees.id = roles_employee.employee_id 
			   left join roles on roles_employee.role_id = roles.id;

			  
-- 7. Вывести имена и должность только Java разработчиков.
select employees.employee_name, roles.role_name 
from employees left join roles_employee on employees.id = roles_employee.employee_id 
			   left join roles on roles_employee.role_id = roles.id 
where roles.role_name like '%Java developer';


-- 8. Вывести имена и должность только Python разработчиков.
select employees.employee_name, roles.role_name 
from employees left join roles_employee on employees.id = roles_employee.employee_id 
			   left join roles on roles_employee.role_id = roles.id 
where roles.role_name like '%Python developer';


-- 9. Вывести имена и должность всех QA инженеров.
select employees.employee_name, roles.role_name 
from employees left join roles_employee on employees.id = roles_employee.employee_id 
			   left join roles on roles_employee.role_id = roles.id 
where role_name like '%QA%';


-- 10. Вывести имена и должность ручных QA инженеров.
select employees.employee_name, roles.role_name 
from employees left join roles_employee on employees.id = roles_employee.employee_id 
			   left join roles on roles_employee.role_id = roles.id 
where role_name like '%Manual QA%';


-- 11. Вывести имена и должность автоматизаторов QA
select employees.employee_name, roles.role_name 
from employees left join roles_employee on employees.id = roles_employee.employee_id 
			   left join roles on roles_employee.role_id = roles.id 
where role_name like '%Automation QA%';


-- 12. Вывести имена и зарплаты Junior специалистов
select employees.employee_name, salary.monthly_salary, roles.role_name  
from salary left join employee_salary on salary.id = employee_salary.salary_id 
			left join employees on employee_salary.employee_id = employees.id 
			left join roles_employee on employees.id = roles_employee.employee_id 
			left join roles on roles_employee.role_id = roles.id 
where roles.role_name like '%Junior%';


-- 13. Вывести имена и зарплаты Middle специалистов
select employees.employee_name, salary.monthly_salary, roles.role_name  
from salary left join employee_salary on salary.id = employee_salary.salary_id 
			left join employees on employee_salary.employee_id = employees.id 
			left join roles_employee on employees.id = roles_employee.employee_id 
			left join roles on roles_employee.role_id = roles.id 
where roles.role_name like '%Middle%';


-- 14. Вывести имена и зарплаты Senior специалистов
select employees.employee_name, salary.monthly_salary, roles.role_name  
from salary left join employee_salary on salary.id = employee_salary.salary_id 
			left join employees on employee_salary.employee_id = employees.id 
			left join roles_employee on employees.id = roles_employee.employee_id 
			left join roles on roles_employee.role_id = roles.id 
where roles.role_name like '%Senior%';


-- 15. Вывести зарплаты Java разработчиков
select salary.monthly_salary, roles.role_name  
from salary left join employee_salary on salary.id = employee_salary.salary_id 
			left join employees on employee_salary.employee_id = employees.id 
			left join roles_employee on employees.id = roles_employee.employee_id 
			left join roles on roles_employee.role_id = roles.id 
where roles.role_name like '%Java developer%';


-- 16. Вывести зарплаты Python разработчиков
select salary.monthly_salary, roles.role_name  
from salary left join employee_salary on salary.id = employee_salary.salary_id 
			left join employees on employee_salary.employee_id = employees.id 
			left join roles_employee on employees.id = roles_employee.employee_id 
			left join roles on roles_employee.role_id = roles.id 
where roles.role_name like '%Python developer%';


-- 17. Вывести имена и зарплаты Junior Python разработчиков
select employees.employee_name, salary.monthly_salary, roles.role_name  
from salary left join employee_salary on salary.id = employee_salary.salary_id 
			left join employees on employee_salary.employee_id = employees.id 
			left join roles_employee on employees.id = roles_employee.employee_id 
			left join roles on roles_employee.role_id = roles.id 
where roles.role_name like '%Junior Python developer%';


-- 18. Вывести имена и зарплаты Middle JS разработчиков
select employees.employee_name, salary.monthly_salary, roles.role_name  
from salary left join employee_salary on salary.id = employee_salary.salary_id 
			left join employees on employee_salary.employee_id = employees.id 
			left join roles_employee on employees.id = roles_employee.employee_id 
			left join roles on roles_employee.role_id = roles.id 
where roles.role_name like '%Middle JavaScript developer%';


-- 19. Вывести имена и зарплаты Senior Java разработчиков
select employees.employee_name, salary.monthly_salary, roles.role_name  
from salary left join employee_salary on salary.id = employee_salary.salary_id 
			left join employees on employee_salary.employee_id = employees.id 
			left join roles_employee on employees.id = roles_employee.employee_id 
			left join roles on roles_employee.role_id = roles.id 
where roles.role_name like '%Senior Java developer%';


-- 20. Вывести зарплаты Junior QA инженеров
select salary.monthly_salary, roles.role_name  
from salary left join employee_salary on salary.id = employee_salary.salary_id 
			left join employees on employee_salary.employee_id = employees.id 
			left join roles_employee on employees.id = roles_employee.employee_id 
			left join roles on roles_employee.role_id = roles.id 
where roles.role_name like '%Junior%QA%';


-- 21. Вывести среднюю зарплату всех Junior специалистов
select avg(salary.monthly_salary) as avg_salary
from salary left join employee_salary on salary.id = employee_salary.salary_id 
			left join employees on employee_salary.employee_id = employees.id 
			left join roles_employee on employees.id = roles_employee.employee_id 
			left join roles on roles_employee.role_id = roles.id 
where roles.role_name like '%Junior%';


-- 22. Вывести сумму зарплат JS разработчиков
select sum(salary.monthly_salary) as sum_salary
from salary left join employee_salary on salary.id = employee_salary.salary_id 
			left join employees on employee_salary.employee_id = employees.id 
			left join roles_employee on employees.id = roles_employee.employee_id 
			left join roles on roles_employee.role_id = roles.id 
where roles.role_name like '%JavaScript%';


-- 23. Вывести минимальную ЗП QA инженеров
select min(salary.monthly_salary) as min_salary
from salary left join employee_salary on salary.id = employee_salary.salary_id 
			left join employees on employee_salary.employee_id = employees.id 
			left join roles_employee on employees.id = roles_employee.employee_id 
			left join roles on roles_employee.role_id = roles.id 
where roles.role_name like '%QA%';


-- 24. Вывести максимальную ЗП QA инженеров
select max(salary.monthly_salary) as max_salary
from salary left join employee_salary on salary.id = employee_salary.salary_id 
			left join employees on employee_salary.employee_id = employees.id 
			left join roles_employee on employees.id = roles_employee.employee_id 
			left join roles on roles_employee.role_id = roles.id 
where roles.role_name like '%QA%';


-- 25. Вывести количество QA инженеров
select count(roles_employee.employee_id)
from roles_employee left join roles on roles_employee.role_id = roles.id 
where roles.role_name like '%QA%';


-- 26. Вывести количество Middle специалистов.
select count(roles_employee.employee_id)
from roles_employee left join roles on roles_employee.role_id = roles.id 
where roles.role_name like '%Middle%';


-- 27. Вывести количество разработчиков
select count(roles_employee.employee_id)
from roles_employee left join roles on roles_employee.role_id = roles.id 
where roles.role_name like '%developer%';


-- 28. Вывести фонд (сумму) зарплаты разработчиков.



-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию


-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300


-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300


-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
