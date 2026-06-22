select * from employee_salary WHERE salary > 5000;
select * from employee_salary WHERE salary >= 5000;
select * from employee_salary WHERE salary > 5000 or first_name = 'Ron';
select * from employee_demographics WHERE gender = 'male' and age > 25;
select * from employee_demographics where (first_name = 'Tom' and age =36 ) or age > 39;
select * from employee_demographics where first_name  LIKE '%ry';
select * from employee_demographics where first_name  LIKE '%o%';
select * from employee_demographics where first_name  LIKE 't__';
select * from employee_demographics where first_name  LIKE 'a%';