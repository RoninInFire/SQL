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


-- 10. Вывести имена и должность ручных QA инженеров.


-- 11. Вывести имена и должность автоматизаторов QA


-- 12. Вывести имена и зарплаты Junior специалистов


-- 13. Вывести имена и зарплаты Middle специалистов


-- 14. Вывести имена и зарплаты Senior специалистов


-- 15. Вывести зарплаты Java разработчиков


-- 16. Вывести зарплаты Python разработчиков


-- 17. Вывести имена и зарплаты Junior Python разработчиков


-- 18. Вывести имена и зарплаты Middle JS разработчиков


-- 19. Вывести имена и зарплаты Senior Java разработчиков


-- 20. Вывести зарплаты Junior QA инженеров


-- 21. Вывести среднюю зарплату всех Junior специалистов


-- 22. Вывести сумму зарплат JS разработчиков


-- 23. Вывести минимальную ЗП QA инженеров


-- 24. Вывести максимальную ЗП QA инженеров


-- 25. Вывести количество QA инженеров


-- 26. Вывести количество Middle специалистов.


-- 27. Вывести количество разработчиков


-- 28. Вывести фонд (сумму) зарплаты разработчиков.


-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию


-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300


-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300


-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
